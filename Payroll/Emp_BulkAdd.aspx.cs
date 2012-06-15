using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using Microsoft.VisualBasic;
using System.Drawing;
using System.Data.SqlClient;
using SMEPayroll.TextTemplate;
using System.IO;
using System.Text;

using System.Data.OleDb;

namespace SMEPayroll.Payroll
{
    public partial class Emp_BulkAdd : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        protected string strstdatemdy = "";
        protected string strendatemdy = "";
        protected string strstdatedmy = "";
        protected string strendatedmy = "";
        int intcnt;
        int comp_id;
        string sSQL = "";
        string ssqle = "";
        string sql = null;
        DataSet monthDs;
        DataRow[] foundRows;
        DataTable dtFilterFound;
        //static DataSet dsFill;

        DataSet dsFill;


        string strWF = "";
        string strEmpvisible = "";

        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {

            //grid count
            GridSettingsPersister objCount = new GridSettingsPersister();
            objCount.RowCount(e, tbRecord);


            DataView view = new DataView();
            DataTable table;
            //Remove Data From Dataset
            if (strEmpvisible != "")
            {
                DataSet dsFill =(DataSet)Session["dsFill"];

                view = dsFill.Tables[0].DefaultView;                
                view.RowFilter = "Emp_Code IN(" + strEmpvisible + ")";
                table = view.ToTable();                
            }
            else
            {
                DataSet dsFill = (DataSet)Session["dsFill"];

                view = dsFill.Tables[0].DefaultView;
                table = view.ToTable();                
            }

            string strColName = "";
            if (e.Item is GridDataItem)
            {
                int i = 3;
                //foreach (DataColumn dc in dsFill.Tables[0].Columns)
                foreach (DataColumn dc in table.Columns)    
                {
                    string templateColumnName = dc.ColumnName.ToString().ToUpper();

                    if (templateColumnName != "EMP_CODE" && templateColumnName != "FULLNAME" && templateColumnName != "TIME_CARD_NO")
                    //if (templateColumnName != "EMP_CODE" && templateColumnName != "FULLNAME" && templateColumnName != "TIME_CARD_NO" && templateColumnName != "TRADE")
                    {

                        SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.Text, "Select [Desc] Title From additions_types Where ID=" + templateColumnName.ToString(), null);

                        if (dr1.Read())
                        {
                            strColName = dr1[0].ToString();
                        }
                        dr1.Close();
                    }
                    if (strColName.ToString().Length > 0)
                    {
                        TextBox textBox = new TextBox();
                        textBox.ID = "txt" + templateColumnName;
                        textBox.DataBinding += new EventHandler(textBox_DataBinding);
                        textBox.Width = Unit.Pixel(35);
                        textBox.Height = Unit.Pixel(55);
                        //if (dsFill.Tables[0].Rows[e.Item.ItemIndex][dc].ToString() != "0.00")
                        if (table.Rows[e.Item.ItemIndex][dc].ToString() != "0.00")
                        {
                           // textBox.Text = dsFill.Tables[0].Rows[e.Item.ItemIndex][dc].ToString();
                            textBox.Text = table.Rows[e.Item.ItemIndex][dc].ToString();//dsFill.Tables[0].Rows[e.Item.ItemIndex][dc].ToString();
                        }

                        //Validation to check whether there is alreadydata --change color
                        if (chkId.Checked)
                        {

                            string sSQL = "sp_bulkaddtranspose";
                            SqlParameter[] parms = new SqlParameter[4];
                            parms[0] = new SqlParameter("@compid", Utility.ToInteger(Session["Compid"]));
                            parms[1] = new SqlParameter("@monthid", Utility.ToInteger(cmbMonth.SelectedItem.Value));
                            parms[2] = new SqlParameter("@year", Utility.ToInteger(cmbYear.SelectedItem.Value));
                            parms[3] = new SqlParameter("@DeptId", deptID.SelectedValue);
                            DataSet dsFill_Exist = DataAccess.ExecuteSPDataSet(sSQL, parms);
                            string col_exist = dc.ToString();

                            DataView view1 = new DataView();
                            DataTable table1;                         
                            if (strEmpvisible != "")
                            {

                                view1 = dsFill_Exist.Tables[0].DefaultView;                                
                                view1.RowFilter = "Emp_Code IN(" + strEmpvisible + ")";
                                table1 = view1.ToTable();                              
                            }
                            else
                            {
                                view1 = dsFill_Exist.Tables[0].DefaultView;
                                table1 = view1.ToTable();                             
                            }

                            //if (dsFill_Exist.Tables[0].Rows[e.Item.ItemIndex][col_exist].ToString() != "")
                            if (e.Item.ItemIndex < table1.Rows.Count)
                            {
                                if (table1.Rows[e.Item.ItemIndex][col_exist].ToString() != "")
                                {
                                    textBox.BackColor = Color.LightYellow;
                                    //textBox.ToolTip = dsFill_Exist.Tables[0].Rows[e.Item.ItemIndex][col_exist].ToString();                                
                                    textBox.ToolTip = table1.Rows[e.Item.ItemIndex][col_exist].ToString();
                                    textBox.ForeColor = Color.Red;
                                    //textBox.BorderColor = Color.Red;
                                    //textBox.ToolTip = "Existing Value(" + dsFill_Exist.Tables[0].Rows[e.Item.ItemIndex][col_exist].ToString() + ")";
                                }
                            }

                        }
                        //
                        textBox.Attributes.Add("onkeypress", "return isNumericKeyStrokeDecimal(event);");

                        GridDataItem item = e.Item as GridDataItem;

                        string strc = "Column" + i.ToString();
                        item[strc].Controls.Add(textBox);
                        if (strColName.Length > 10)
                        {
                            this.RadGrid1.Columns[i].HeaderText = strColName.ToString().Substring(0, 10);
                        }
                        else
                        {
                            this.RadGrid1.Columns[i].HeaderText = strColName.ToString();
                        }
                        i++;
                    }
                }
            }


        }

        [AjaxPro.AjaxMethod]
        public string SetDate(string monthid)
        {
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            DataSet ds = new DataSet();
            sSQL = "sp_GetPayrollMonth";// 0,2009,2
            SqlParameter[] parms = new SqlParameter[3];
            parms[0] = new SqlParameter("@ROWID", monthid);
            parms[1] = new SqlParameter("@YEARS", 0);
            parms[2] = new SqlParameter("@PAYTYPE", Session["PAYTYPE"].ToString());

            ds = DataAccess.ExecuteSPDataSet(sSQL, parms);

            Session["PayStartDay"] = ds.Tables[0].Rows[0]["PayStartDay"].ToString();
            Session["PayEndDay"] = ds.Tables[0].Rows[0]["PayEndDay"].ToString();
            Session["PaySubStartDay"] = ds.Tables[0].Rows[0]["PaySubStartDay"].ToString();
            Session["PaySubEndDay"] = ds.Tables[0].Rows[0]["PaySubEndDay"].ToString();
            Session["PaySubStartDate"] = ds.Tables[0].Rows[0]["PaySubStartDate"].ToString();
            Session["PaySubEndDate"] = ds.Tables[0].Rows[0]["PaySubEndDate"].ToString();
            return Convert.ToDateTime(ds.Tables[0].Rows[0]["PaySubStartDate"].ToString()).ToString("MM/dd/yyyy", format) + "," + Convert.ToDateTime(ds.Tables[0].Rows[0]["PaySubEndDate"].ToString()).ToString("MM/dd/yyyy", format);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            SqlDataSource3.ConnectionString = Constants.CONNECTION_STRING;
            /* To disable Grid filtering options  */
            AjaxPro.Utility.RegisterTypeForAjax(typeof(Emp_BulkAdd));
            if (cmbMonth.Attributes["onchange"] == null) { cmbMonth.Attributes.Add("onchange", "javascript:ChangeMonth(this.value);"); }

            if (!IsPostBack)
            {
            }


            comp_id = Utility.ToInteger(Session["Compid"]);
            //RadGrid RadGrid1 = new RadGrid();
            //RadGrid1.ID = "RadGrid1";
            //this.PlaceHolder1.Controls.Add(RadGrid1);

            if (!IsPostBack)
            {
                #region Yeardropdown
                cmbYear.DataBind();
                #endregion 
                cmbYear.SelectedValue = Utility.ToString(System.DateTime.Today.Year);
                bindMonth();
               
            }



            if (!IsPostBack)
            {
                //Method to Load grid Seting Persister
                LoadGridSettingsPersister();
            }

            if (Session["strWF"] == null)
            {
                string sqlWF = "Select WorkFlowID,WFPAY,WFLEAVE,WFEMP,WFCLAIM,WFReport,WFTimeSheet from company WHERE Company_Id=" + comp_id;
                DataSet dsWF = new DataSet();
                dsWF = DataAccess.FetchRS(CommandType.Text, sqlWF, null);

                if (dsWF.Tables.Count > 0)
                {
                    if (dsWF.Tables[0].Rows.Count > 0)
                    {
                        strWF = dsWF.Tables[0].Rows[0][0].ToString();
                        Session["strWF"] = strWF;
                    }
                }
            }
            else
            {
                strWF = (string)Session["strWF"];
            }


            //Check for WorkFlow number 2
            if (strWF == "2" && Session["PayrollWF"] != null)
            {
                if (Session["PayrollWF"].ToString() == "1")
                {

                    if (Session["GroupName"].ToString().ToUpper() != "SUPER ADMIN")
                    {
                        strEmpvisible = "";
                        if (Session["dsEmpSup"] != null)
                        {
                            if (Session["dsEmpWF"] != null)
                            {
                                DataSet dstemp = new DataSet();
                                dstemp = (DataSet)Session["dsEmpWF"];
                                foreach (DataRow dr in dstemp.Tables[0].Rows)
                                {
                                    if (strEmpvisible == "")
                                    {
                                        strEmpvisible = dr["Emp_ID"].ToString();
                                    }
                                    else
                                    {
                                        strEmpvisible = strEmpvisible + "," + dr["Emp_ID"].ToString();
                                    }
                                }
                            }
                        }
                    }
                }
            }


        }



        protected void deptID_databound(object sender, EventArgs e)
        {
            deptID.Items.Insert(0, new ListItem("ALL", "-1"));
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string strUpdateDelSQL = "";
            StringBuilder strDeleteAddition = new StringBuilder();
            StringBuilder strInsertAddition = new StringBuilder();
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);

            MonthFill();

            
           try
           {
            foreach (GridItem item in this.RadGrid1.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        string strEmpCode = this.RadGrid1.Items[dataItem.ItemIndex]["Emp_Code"].Text.ToString();
                        double amount = 0;
                        strDeleteAddition.Append("(Emp_Code='" + strEmpCode + "' And BulkAddInMonth='" + Session["ROWID"].ToString() + "' And ClaimStatus like '%Approved%' ) Or ");

                        for (int i = 3; i <= 20; i++)
                        {
                            string strcol = "Column" + i.ToString();
                            if (this.RadGrid1.Items[dataItem.ItemIndex][strcol].Controls.Count > 0)
                            {

                                amount = Utility.ToDouble(((TextBox)this.RadGrid1.Items[dataItem.ItemIndex][strcol].Controls[0]).Text.ToString());
                               //if amount is null and already entered
                                double Tooltipval = Utility.ToDouble(((TextBox)this.RadGrid1.Items[dataItem.ItemIndex][strcol].Controls[0]).ToolTip.ToString());
                                if (amount == 0 && Tooltipval>0 )
                                {
                                    amount = Tooltipval;
                                }
                                //

                                if (amount > 0 )
                                {
                                    string strtype = ((TextBox)this.RadGrid1.Items[dataItem.ItemIndex][strcol].Controls[0]).ID.ToString().Replace("txt", "");
                                    strInsertAddition.Append("Insert Into Emp_Additions (trx_type,trx_amount, trx_period, emp_code, status, claimstatus, basis_arriving_payment, service_length, iras_approval, additionsforyear, BulkAddInMonth) values ('" + strtype + "'," + amount.ToString() + ",'" + Convert.ToDateTime(Session["PaySubStartDate"].ToString()).ToString("MM/dd/yyyy", format) + "','" + strEmpCode + "','U','Approved','',0,'No','" + Session["ROWYEAR"].ToString() + "','" + Session["ROWID"].ToString() + "')");
                                }
                            }
                        }
                    }
                }
            }

            //new
            //validation 
            if (strDeleteAddition.ToString().Length == 0)
            {
                ShowMessageBox("Please Select the Employees to Update");
               // RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Please Select the Employees to Update</font> "));
            }
            //

            if (strDeleteAddition.ToString().Length > 0)
            {
                strUpdateDelSQL = "Delete From Emp_Additions Where (" + strDeleteAddition + " 1=0)";
                int retVal = DataAccess.ExecuteStoreProc(strUpdateDelSQL);
            }
            if (strInsertAddition.ToString().Length > 0)
            {
                    strUpdateDelSQL = "" + strInsertAddition + "";
                    int retVal = DataAccess.ExecuteStoreProc(strUpdateDelSQL);
                    ShowMessageBox("Additions Updated Successfully");
                    //RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Additions Updated Successfully</font> "));
            }

        }
        catch (Exception err)
        {
            ShowMessageBox("Error in data " + err.Message.ToString());
        }
        }



        void BuildTable()
        {

            //Add Customers table
            //GridBoundColumn boundColumn;
            //GridClientSelectColumn checkColumn;
            //boundColumn = new GridBoundColumn();
            //boundColumn.DataField = "Emp_Code";
            //boundColumn.HeaderText = "Emp_Code";
            //boundColumn.UniqueName = "Emp_Code";
            //boundColumn.Display = false;
            //RadGrid1.MasterTableView.Columns.Add(boundColumn);

            //boundColumn = new GridBoundColumn();
            //boundColumn.DataField = "FullName";
            //boundColumn.HeaderText = "FullName";
            //boundColumn.UniqueName = "FullName";
            //boundColumn.ItemStyle.Width = Unit.Pixel(200);
            //RadGrid1.MasterTableView.Columns.Add(boundColumn);

            //boundColumn = new GridBoundColumn();
            //boundColumn.DataField = "Time_Card_No";
            //boundColumn.HeaderText = "Time_Card_No";
            //boundColumn.UniqueName = "Time_Card_No";
            //boundColumn.ItemStyle.Width = Unit.Pixel(30);
            //RadGrid1.MasterTableView.Columns.Add(boundColumn);

            dsFill = new DataSet();
            string sSQL;
            if (chkId.Checked)
            {
                sSQL = "sp_bulkaddtranspose_Temp";
            }
            else
            {
                sSQL = "sp_bulkaddtranspose";
            }
            SqlParameter[] parms = new SqlParameter[4];
            parms[0] = new SqlParameter("@compid", Utility.ToInteger(comp_id));
            parms[1] = new SqlParameter("@monthid", Utility.ToInteger(cmbMonth.SelectedItem.Value));
            parms[2] = new SqlParameter("@year", Utility.ToInteger(cmbYear.SelectedItem.Value));
            parms[3] = new SqlParameter("@DeptId", deptID.SelectedValue);
            try
            {
                dsFill = DataAccess.ExecuteSPDataSet(sSQL, parms);

                Session["dsFill"] = dsFill;

                if (dsFill.Tables[0].Rows.Count > 0)
                {
                    TabId.Visible = true;
                    tbRecord.Visible = true;
                    btnUpdate.Visible = true;
                }
                else
                {
                    TabId.Visible = false;
                    tbRecord.Visible = false;
                    btnUpdate.Visible = false;
                }
                string strColName = "";
                int i = 3;
                foreach (DataColumn dc in dsFill.Tables[0].Columns)
                {
                    string templateColumnName = dc.ColumnName.ToString().ToUpper();

                    if (templateColumnName != "EMP_CODE" && templateColumnName != "FULLNAME" && templateColumnName != "TIME_CARD_NO")
                    //if (templateColumnName != "EMP_CODE" && templateColumnName != "FULLNAME" && templateColumnName != "TIME_CARD_NO" && templateColumnName != "TRADE")
                    {

                        // SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.Text, "Select [Desc] Title From additions_types Where ID=" + templateColumnName.ToString(), null);
                        //Adding A1,A2,... in (A1)
                        SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.Text, "Select REPLACE(([Desc]+ '('+isnull(MapVariable,'')+')'),'()','') Title From additions_types A  LEFT  JOIN MapAdditions M on A.Id=M.Additions_Id  Where ID=" + templateColumnName.ToString(), null);

                        if (dr1.Read())
                        {
                            strColName = dr1[0].ToString();
                        }
                        dr1.Close();
                    }
                    if (strColName.ToString().Length > 0)
                    {
                        string strc = "Column" + i.ToString();
                        if (strColName.Length > 10)
                        {
                            // this.RadGrid1.Columns[i].HeaderText = strColName.ToString().Substring(0, 10);
                            this.RadGrid1.Columns[i].HeaderText = strColName.ToString();
                            this.RadGrid1.Columns[i].Display = true;
                        }
                        else
                        {
                            this.RadGrid1.Columns[i].HeaderText = strColName.ToString();
                            this.RadGrid1.Columns[i].Display = true;
                        }
                        i++;
                    }
                }

                //Remove Data From Dataset
                if (strEmpvisible != "")
                {
                    char strEmp = ',';
                    string[] arrayEmp = strEmpvisible.Split(strEmp);
                    string strRemoverows = "";
                    DataView view = new DataView();
                    view = dsFill.Tables[0].DefaultView;
                    //ds.Tables[0].DefaultView.RowFilter = "emp_id IN(" + strEmpvisible + ")";
                    DataSet dsnew = new DataSet();

                    //view.Table = DataSet1.Tables["Suppliers"];
                    //view.AllowDelete = true;
                    //view.AllowEdit = true;
                    // view.AllowNew = true;
                    view.RowFilter = "Emp_Code IN(" + strEmpvisible + ")";
                    DataTable table = view.ToTable();
                    // Simple-bind to a TextBox control
                    Session["EmpPassID"] = strEmpvisible;
                    this.RadGrid1.DataSource = table;
                   // RadGrid1.DataBind();
                }
                else
                {

                    this.RadGrid1.DataSource = dsFill;
                   // RadGrid1.DataBind();
                }


                //RadGrid1.DataSource = dsFill;
                //RadGrid1.DataBind();
            }
            catch (Exception ex)
            {
                string ErrMsg = ex.Message;
                lblerror.ForeColor = System.Drawing.Color.Red;
                lblerror.Text = ErrMsg;
            }

            //RadAjaxManager1.AjaxSettings.AddAjaxSetting(RadGrid1, RadGrid1);
        }
        string sSQL_sp;
        protected void RadGrid1_PageIndexChanged(object source, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            RadGrid rd = new RadGrid();
            rd = ((RadGrid)source);
            if (Utility.ToInteger(Session["s"]) == 1)
            {
                if (chkId.Checked)
                {
                    sSQL_sp = "sp_bulkaddtranspose_Temp";
                }
                else
                {
                    sSQL_sp = "sp_bulkaddtranspose";
                }

                SqlParameter[] parms = new SqlParameter[4];
                parms[0] = new SqlParameter("@compid", Utility.ToInteger(comp_id));
                parms[1] = new SqlParameter("@monthid", Utility.ToInteger(cmbMonth.SelectedItem.Value));
                parms[2] = new SqlParameter("@year", Utility.ToInteger(cmbYear.SelectedItem.Value));
                parms[3] = new SqlParameter("@DeptId", deptID.SelectedValue);

                RadGrid1.CurrentPageIndex = e.NewPageIndex;
                dsFill = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL_sp, parms);
                RadGrid1.DataSource = dsFill;
                RadGrid1.DataBind();

            }
        }

        public static void ShowMessageBox(string message)
        {
            if (!string.IsNullOrEmpty(message))
            {
                if (message.EndsWith("."))
                    message = message.Substring(0, message.Length - 1);
            }
            StringBuilder sbScript = new StringBuilder(50);
            //Java Script header            
            sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
            sbScript.Append("// Show messagebox" + Environment.NewLine);
            message = message.Replace("<br/>", "\\n").Replace("\"", "'");
            sbScript.Append(@"alert( """ + message + @""" );");
            sbScript.Append(@"</script>");
            HttpContext.Current.Response.Write(sbScript);
        }




        void ExecSp(RadGrid rd)
        {

        }
        bool output;
        protected void bindgrid(object sender, ImageClickEventArgs e)
        {
            Session["dsFill"] = ""; 

            if (chkId.Checked)
            {
                output = ExcelImport();
            }


            if (output || chkId.Checked==false)
            {


                int i = 0;
                //dsFill = new DataSet();
                //string sSQL = "sp_bulkaddtranspose";
                //SqlParameter[] parms = new SqlParameter[2];
                //parms[0] = new SqlParameter("@compid", Utility.ToInteger(comp_id));
                //parms[1] = new SqlParameter("@monthid", Utility.ToInteger(cmbMonth.SelectedItem.Value));
                //dsFill = DataAccess.ExecuteSPDataSet(sSQL, parms);


                intcnt = 1;
                cmbYear.Enabled = false;//ram
                cmbMonth.Enabled = false;
                deptID.Enabled = false;
                chkId.Enabled = false;
                FileUpload.Visible = false;
                Session["ROWID"] = cmbMonth.SelectedValue.ToString();
                Session["ROWYEAR"] = cmbYear.SelectedValue.ToString();
                BuildTable();
                RadGrid1.DataBind();
            }
        }
        #region Excel Import
        bool res;
        protected bool ExcelImport()
        {
            
            string strMsg = "";
            if (FileUpload.PostedFile != null) //Checking for valid file
            {
                string StrFileName = FileUpload.PostedFile.FileName.Substring(FileUpload.PostedFile.FileName.LastIndexOf("\\") + 1);
                string strorifilename = StrFileName;
                string StrFileType = FileUpload.PostedFile.ContentType;
                int IntFileSize = FileUpload.PostedFile.ContentLength;
                //Checking for the length of the file. If length is 0 then file is not uploaded.
                if (IntFileSize <= 0)
                {
                    strMsg = "Please Select File to be uploaded";
                    ShowMessageBox("Please Select File to be uploaded");
                    res = false;
                }

                else
                {
                    res = true;
                    int RandomNumber = 0;
                    RandomNumber = Utility.GetRandomNumberInRange(10000, 1000000);

                    string strTranID = Convert.ToString(RandomNumber);
                    string[] FileExt = StrFileName.Split('.');
                    string strExtent = "." + FileExt[FileExt.Length - 1];
                    StrFileName = FileExt[0] + strTranID;
                    string stfilepath = Server.MapPath(@"..\\Documents\\UploadAddDed\" + StrFileName + strExtent);
                    try
                    {
                        FileUpload.PostedFile.SaveAs(stfilepath);

                        string filename = StrFileName + strExtent;
                        ImportExcelTosqlServer(filename);



                    }
                    catch (Exception ex)
                    {
                        strMsg = ex.Message;
                    }
                }

            }
            lblerror.Text = strMsg;

            return res;
        }
        string col, Empcode, ICNUMBER, Empcode1;
        decimal A1,Addition;
        public void ImportExcelTosqlServer(string filename)
        {
            DataTable dt = GetDataFromExcel(filename);
            StringBuilder SqlQuery = new StringBuilder();
            SqlQuery.Append("");
            try
            {

                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    if (i > 1)//skip the first 2 column
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            col = dt.Columns[i].ToString();

                            //check whether IC number is present
                            //if yes--> get empno from that
                            //else --> check the empno directly
                            ICNUMBER = dr["IC NUMBER"].ToString();
                            if (ICNUMBER == "")
                            {
                                Empcode = dr["EMP ID"].ToString();
                            }
                            else
                            {
                                Empcode = null;
                                string sql = " select emp_code from employee where ic_pp_number='" + ICNUMBER + "'";
                                SqlDataReader dr_empcode = DataAccess.ExecuteReader(CommandType.Text, sql, null);
                                if (dr_empcode.Read())
                                {
                                    Empcode = dr_empcode["emp_code"].ToString();
                                }
                            }
                            if (Empcode == null)
                            {
                                Empcode = dr["EMP ID"].ToString();
                            }
                            //
                            

                            if (dr[dt.Columns[i].ToString()] == System.DBNull.Value)
                            {
                                A1 = 0;
                            }
                            else
                            {
                                A1 = Convert.ToDecimal(dr[dt.Columns[i].ToString()]);//A1 = dr["A1"].ToString();
                            }
                            #region converting A1 to mapped column id
                            string sql_emp = "SELECT Additions_Id FROM [MapAdditions] where Company_id='"+comp_id+"' AND  MapVariable='" + dt.Columns[i].ToString() + "'";
                            SqlDataReader dr_addit = DataAccess.ExecuteReader(CommandType.Text, sql_emp, null);
                            if (dr_addit.Read())
                            {
                                if (dr_addit["Additions_Id"] == System.DBNull.Value)
                                {
                                    Addition = 0;
                                }
                                else
                                {

                                    Addition = Convert.ToInt32(dr_addit["Additions_Id"]);
                                }

                            }
                            #endregion

                            #region Convert the (Empcode)timecardId to Emp_code
                                string sql_timecard2empcode = " select emp_code from employee where time_card_no='" + Empcode + "'";
                                SqlDataReader dr_empcode_timecard2empcode = DataAccess.ExecuteReader(CommandType.Text, sql_timecard2empcode, null);
                                if (dr_empcode_timecard2empcode.HasRows)
                                {
                                    if (dr_empcode_timecard2empcode.Read())
                                    {
                                        Empcode1 = dr_empcode_timecard2empcode["emp_code"].ToString();
                                    }
                            #endregion

                                    //if (dr_addit.HasRows && Empcode!="")//if mapped then only insert
                                    if (dr_addit.HasRows && Empcode1 != "" && Addition > 0 && A1 > 0)//if mapped then only insert
                                    {
                                        SqlQuery.Append("INSERT INTO Temp_Emp_Additions ([Emp_code],[trx_type],[trx_amount],[BulkAddInMonth]) VALUES(" + Empcode1 + ",'" + Addition + "','" + A1 + "','" + Convert.ToInt32(cmbMonth.SelectedValue) + "')");
                                    }
                                }

                        }
                    }
                }

            

           
                DataAccess.FetchRS(CommandType.Text, "delete from Temp_Emp_Additions", null);
                DataAccess.FetchRS(CommandType.Text, SqlQuery.ToString(), null);
            }
            catch (Exception e)
            {
                DataAccess.FetchRS(CommandType.Text, "delete from Temp_Emp_Additions", null);
                ShowMessageBox("Error for the Employee:"+Empcode+" Msg-"+ e.Message.ToString());
                //lblerror.Text = "Error in Data" + e.Message.ToString();
            }

        }
        //http://www.dotnetspider.com/forum/286377-Reading-excel-file-row-by-row-storing-into-database.aspx
        public DataTable GetDataFromExcel(string filename)
        {
            DataTable dt = new DataTable();
            try
            {
                //OleDbConnection oledbconn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/Book1.xls").ToString() + ";Extended Properties=Excel 8.0;");
                OleDbConnection oledbconn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/Documents/UploadAddDed/" + filename + "").ToString() + ";Extended Properties=Excel 8.0;");
                string SheetName = "Sheet1";//here enter sheet name        
                oledbconn.Open();
                OleDbCommand cmdSelect = new OleDbCommand(@"SELECT * FROM [" + SheetName + "$]", oledbconn);
                OleDbDataAdapter oledbda = new OleDbDataAdapter();
                oledbda.SelectCommand = cmdSelect;
                oledbda.Fill(dt);
                oledbconn.Close();
                oledbda = null;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            return dt;
        }


        protected void chkId_CheckedChanged(object sender, EventArgs e)
        {
            if (chkId.Checked)
            {
                FileUpload.Visible = true;
                //deptID.Visible = false;
                //Depttextid.Visible = false;
            }
            else
            {
                FileUpload.Visible = false;
                //deptID.Visible = true;
                //Depttextid.Visible = true;
            }
        }


        #endregion

        protected void cmbYear_selectedIndexChanged(object sender, EventArgs e)
        {
            Session["ROWYEAR"] = cmbYear.SelectedValue.ToString();
            bindMonth();
            Session["ROWID"] = cmbMonth.SelectedValue.ToString();
        }
        private void bindMonth()
        {
            MonthFill();
        }


        void MonthFill()
        {
            int i = 0;
            string ssql = "sp_GetPayrollMonth";// 0,2009,2
            SqlParameter[] parms = new SqlParameter[3];
            parms[i++] = new SqlParameter("@ROWID", "0");
            parms[i++] = new SqlParameter("@YEARS", 0);
            parms[i++] = new SqlParameter("@PAYTYPE", Session["PAYTYPE"].ToString());
            monthDs = DataAccess.ExecuteSPDataSet(ssql, parms);
            dtFilterFound = new DataTable();
            dtFilterFound = monthDs.Tables[0].Clone();

            if (Session["ROWID"] == null)
            {
                foundRows = monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "'");
                foreach (DataRow dr in monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "'"))
                {
                    dtFilterFound.ImportRow(dr);
                }
            }
            else
            {
                foundRows = monthDs.Tables[0].Select("YEAR = '" + Session["ROWYEAR"].ToString() + "'");
                foreach (DataRow dr in monthDs.Tables[0].Select("YEAR = '" + Session["ROWYEAR"].ToString() + "'"))
                {
                    dtFilterFound.ImportRow(dr);
                }
            }

            //if (PayrollType == 0)
            //{
            //    foundRows = monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "'");
            //    foreach (DataRow dr in monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "'"))
            //    {
            //        dtFilterFound.ImportRow(dr);
            //    }
            //}
            //else
            //{
            //    foundRows = monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "' And PAYTYPE='" + PayrollType.ToString() + "'");
            //    foreach (DataRow dr in monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "' And PAYTYPE='" + PayrollType.ToString() + "'"))
            //    {
            //        dtFilterFound.ImportRow(dr);
            //    }
            //}

            cmbMonth.DataSource = dtFilterFound;
            cmbMonth.DataTextField = "MonthName";
            cmbMonth.DataValueField = "RowID";
            cmbMonth.DataBind();
            if (Session["ROWID"] != null)
            {
                SetControlDate(Session["ROWID"].ToString());
            }
            else
            {
                SetControlDate(cmbMonth.SelectedValue);
            }
        }

        void SetControlDate(string mon)
        {
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            DataRow[] drResults = monthDs.Tables[0].Select("RowID = " + mon);
            foreach (DataRow dr in drResults)
            {
                Session["PayStartDay"] = dr["PayStartDay"].ToString();
                Session["PayEndDay"] = dr["PayEndDay"].ToString();
                Session["PaySubStartDay"] = dr["PaySubStartDay"].ToString();
                Session["PaySubEndDay"] = dr["PaySubEndDay"].ToString();
                Session["PaySubStartDate"] = dr["PaySubStartDate"].ToString();
                Session["PaySubEndDate"] = dr["PaySubEndDate"].ToString();
                strstdatemdy = Convert.ToDateTime(Session["PaySubStartDate"].ToString()).ToString("MM/dd/yyyy", format);
                strendatemdy = Convert.ToDateTime(Session["PaySubEndDate"].ToString()).ToString("MM/dd/yyyy", format);
                strstdatedmy = Convert.ToDateTime(Session["PaySubStartDate"].ToString()).ToString("dd/MM/yyyy", format);
                strendatedmy = Convert.ToDateTime(Session["PaySubEndDate"].ToString()).ToString("dd/MM/yyyy", format);
            }
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (Session["ROWID"] == null)
            {
            }
            else
            {
                if (intcnt == 1)
                {
                    cmbMonth.SelectedValue = Utility.ToString(Session["ROWID"]);
                    cmbYear.SelectedValue = Utility.ToString(Session["ROWYEAR"]);
                }
                else
                {
                    if (IsPostBack == true)
                    {
                        MonthFill();
                    }
                    cmbMonth.SelectedValue = Utility.ToString(Session["ROWID"]);
                    cmbYear.SelectedValue = Utility.ToString(Session["ROWYEAR"]);
                    SetControlDate(cmbMonth.SelectedValue);
                }
            }

        }

        public void textBox_DataBinding(object sender, EventArgs e)
        {
            TextBox t = (TextBox)sender;
            GridDataItem container = (GridDataItem)t.NamingContainer;
            t.Height = Unit.Pixel(17);
            t.Width = Unit.Pixel(70);
            t.CssClass = "txtheight";
        }

        //protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        //{
        //    int i = 0;
        //    //dsFill = new DataSet();
        //    //string sSQL = "sp_bulkaddtranspose";
        //    //SqlParameter[] parms = new SqlParameter[2];
        //    //parms[0] = new SqlParameter("@compid", Utility.ToInteger(comp_id));
        //    //parms[1] = new SqlParameter("@monthid", Utility.ToInteger(cmbMonth.SelectedItem.Value));
        //    //dsFill = DataAccess.ExecuteSPDataSet(sSQL, parms);


        //    intcnt = 1;
        //    //cmbYear.Enabled = false;
        //    //cmbMonth.Enabled = false;
        //    Session["ROWID"] = cmbMonth.SelectedValue.ToString();
        //    Session["ROWYEAR"] = cmbYear.SelectedValue.ToString();
        //    BuildTable_NeedDatasource();
        //}

        //void BuildTable_NeedDatasource()
        //{

        //    //Add Customers table
        //    //GridBoundColumn boundColumn;
        //    //GridClientSelectColumn checkColumn;
        //    //boundColumn = new GridBoundColumn();
        //    //boundColumn.DataField = "Emp_Code";
        //    //boundColumn.HeaderText = "Emp_Code";
        //    //boundColumn.UniqueName = "Emp_Code";
        //    //boundColumn.Display = false;
        //    //RadGrid1.MasterTableView.Columns.Add(boundColumn);

        //    //boundColumn = new GridBoundColumn();
        //    //boundColumn.DataField = "FullName";
        //    //boundColumn.HeaderText = "FullName";
        //    //boundColumn.UniqueName = "FullName";
        //    //boundColumn.ItemStyle.Width = Unit.Pixel(200);
        //    //RadGrid1.MasterTableView.Columns.Add(boundColumn);

        //    //boundColumn = new GridBoundColumn();
        //    //boundColumn.DataField = "Time_Card_No";
        //    //boundColumn.HeaderText = "Time_Card_No";
        //    //boundColumn.UniqueName = "Time_Card_No";
        //    //boundColumn.ItemStyle.Width = Unit.Pixel(30);
        //    //RadGrid1.MasterTableView.Columns.Add(boundColumn);

        //    dsFill = new DataSet();
        //    string sSQL = "sp_bulkaddtranspose";
        //    SqlParameter[] parms = new SqlParameter[3];
        //    parms[0] = new SqlParameter("@compid", Utility.ToInteger(comp_id));
        //    parms[1] = new SqlParameter("@monthid", Utility.ToInteger(cmbMonth.SelectedItem.Value));
        //    parms[2] = new SqlParameter("@year", Utility.ToInteger(cmbYear.SelectedItem.Value));
        //    try
        //    {
        //        dsFill = DataAccess.ExecuteSPDataSet(sSQL, parms);
        //        if (dsFill.Tables[0].Rows.Count > 0)
        //        {
        //            btnUpdate.Visible = true;
        //        }
        //        else
        //        {
        //            btnUpdate.Visible = false;
        //        }
        //        string strColName = "";
        //        int i = 3;
        //        foreach (DataColumn dc in dsFill.Tables[0].Columns)
        //        {
        //            string templateColumnName = dc.ColumnName.ToString().ToUpper();

        //            //if (templateColumnName != "EMP_CODE" && templateColumnName != "FULLNAME" && templateColumnName != "TIME_CARD_NO")
        //            if (templateColumnName != "EMP_CODE" && templateColumnName != "FULLNAME" && templateColumnName != "TIME_CARD_NO" && templateColumnName != "TRADE")
        //            {

        //                SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.Text, "Select [Desc] Title From additions_types Where ID=" + templateColumnName.ToString(), null);
        //                if (dr1.Read())
        //                {
        //                    strColName = dr1[0].ToString();
        //                }
        //                dr1.Close();
        //            }
        //            if (strColName.ToString().Length > 0)
        //            {
        //                string strc = "Column" + i.ToString();
        //                if (strColName.Length > 10)
        //                {
        //                    this.RadGrid1.Columns[i].HeaderText = strColName.ToString().Substring(0, 10);
        //                    this.RadGrid1.Columns[i].Display = true;
        //                }
        //                else
        //                {
        //                    this.RadGrid1.Columns[i].HeaderText = strColName.ToString();
        //                    this.RadGrid1.Columns[i].Display = true;
        //                }
        //                i++;
        //            }
        //        }

        //        RadGrid1.DataSource = dsFill;
        //       // RadGrid1.DataBind();
        //    }
        //    catch (Exception ex)
        //    {
        //        string ErrMsg = ex.Message;
        //        lblerror.ForeColor = System.Drawing.Color.Red;
        //        lblerror.Text = ErrMsg;
        //    }

        //    //RadAjaxManager1.AjaxSettings.AddAjaxSetting(RadGrid1, RadGrid1);
        //}


        protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            if ((e.RebindReason != GridRebindReason.InitialLoad) && (e.RebindReason != GridRebindReason.ExplicitRebind))
            {
                BuildTable();
            }
        }

        //Toolbar
        #region Toolbar and Exporting

        //column to hide wile export
        protected void HideGridColumnseExport()
        {
            RadGrid1.MasterTableView.GetColumn("GridClientSelectColumn").Visible = false;
            // RadGrid1.MasterTableView.GetColumn("EditColumn").Visible = false;
            //RadGrid1.MasterTableView.GetColumn("DeleteColumn").Visible = false;// UniqueName="DeleteColumn"
        }

        protected void tbRecord_ButtonClick(object sender, Telerik.Web.UI.RadToolBarEventArgs e)
        {
            if (e.Item.Text == "Excel" || e.Item.Text == "Word")
            {
                HideGridColumnseExport();
            }

            GridSettingsPersister obj2 = new GridSettingsPersister();
            obj2.ToolbarButtonClick(e, RadGrid1, Utility.ToString(Session["Username"]));

        }

        protected void LoadGridSettingsPersister()//call directly from page load
        {
            GridSettingsPersister obj = new GridSettingsPersister();
            obj.GrabGridSettingsPersister(Utility.ToString(Session["Username"]), RadGrid1);
        }

        protected void RadGrid1_GridExporting(object source, GridExportingArgs e)
        {
            GridSettingsPersister obj1 = new GridSettingsPersister();
            obj1.ExportGridHeader("108", Session["CompanyName"].ToString(), Session["Emp_Name"].ToString(), e);

        }

        //protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        //{
        //    GridSettingsPersister objCount = new GridSettingsPersister();
        //    objCount.RowCount(e, tbRecord);
        //}


        #endregion
        //Toolbar End



    }
}
