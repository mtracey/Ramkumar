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
using System.Data.SqlClient;

namespace SMEPayroll.Payroll
{
    public partial class GenPayroll : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        int intcnt;
        DataSet monthDs;
        DataRow[] foundRows;
        DataTable dtFilterFound;
        string sql = null;        
        int j = 0;

        string strWF = "";
        string strEmpvisible = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            int comp_id = Utility.ToInteger(Session["Compid"]);
            SqlDataSource1.ConnectionString = Constants.CONNECTION_STRING;
            SqlDataSource3.ConnectionString = Constants.CONNECTION_STRING;
            if (!IsPostBack)
            {
                #region Yeardropdown
                cmbYear.DataBind();
                #endregion 
                cmbYear.SelectedValue = Utility.ToString(System.DateTime.Today.Year);
                bindMonth();
            }
            dataexportmessage.Visible = false;

            //RadGrid1.PageSizeChanged += new GridPageSizeChangedEventHandler(RadGrid1_PageSizeChanged);

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


            //filter based on Workflow2 //client-Snip
            if (strEmpvisible.Length > 0)
            {
                SqlDataSource1.FilterExpression = "emp_id  IN (" + strEmpvisible + ")";
            }
            //

        }

        void RadGrid1_PageSizeChanged(object source, GridPageSizeChangedEventArgs e)
        {
            intcnt = 1;
            cmbYear.Enabled = false;
            cmbMonth.Enabled = false;
            imgbtnfetch.Enabled = false;

            deptID.Enabled = false;

            Session["ROWID"] = cmbMonth.SelectedValue.ToString();
            Session["ROWYEAR"] = cmbYear.SelectedValue.ToString();
            //GetData();
            RadGrid1.DataBind();
            
        }

        protected void deptID_databound(object sender, EventArgs e)
        {
            deptID.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        protected void Page_PreRender(Object sender, EventArgs E)
        {
            if (RadGrid1.MasterTableView.Items.Count > 0)
            {
                tbRecord.Visible = true;
                TabId.Visible = true;

                btndetail.Visible = true;
                RadGrid1.PagerStyle.Visible = true;
            }
            else
            {
                tbRecord.Visible = false;
                TabId.Visible = false;

                btndetail.Visible = false;
                RadGrid1.PagerStyle.Visible = false;
            }
        }


        private void GetData()
        {
            cmbYear.Enabled = false;
            cmbMonth.Enabled = false;
            imgbtnfetch.Enabled = false;
            btngenerate.Text = "Generate Payroll For " + cmbMonth.SelectedItem.Text;
            string sSQL = "sp_ApprovePayRoll";
            SqlParameter[] parms = new SqlParameter[6];
            parms[0] = new SqlParameter("@company_id", Utility.ToInteger(Session["Compid"]));
            parms[1] = new SqlParameter("@month", Utility.ToInteger(cmbMonth.SelectedValue));
            parms[2] = new SqlParameter("@year", Utility.ToInteger(cmbYear.SelectedValue));
            parms[3] = new SqlParameter("@UserID", Utility.ToInteger(Session["EmpCode"].ToString()));
            parms[4] = new SqlParameter("@Status", "A");
            parms[5] = new SqlParameter("@DeptId", Utility.ToInteger(deptID.SelectedValue));
            DataSet ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
            //this.RadGrid1.DataSource = ds;

            //Remove Data From Dataset
            if (strEmpvisible != "")
            {
                char strEmp = ',';
                //string[] arrayEmp = strEmpvisible.Split(strEmp);
                //if (ds.Tables.Count > 0)
                //{
                //    foreach (DataRow dr in ds.Tables[0].Rows)
                //    {
                //        for (int i = 0; i <= arrayEmp.Length - 1; i++)
                //        {
                //            if (dr["emp_id"].ToString() != arrayEmp[i].ToString())
                //            {
                //                ds.Tables[0].Rows.Remove(dr);
                //            }
                //        }
                //    }
                //}
                DataView view = new DataView();

                view = ds.Tables[0].DefaultView;
                //ds.Tables[0].DefaultView.RowFilter = "emp_id IN(" + strEmpvisible + ")";


                //view.Table = DataSet1.Tables["Suppliers"];
                //view.AllowDelete = true;
                //view.AllowEdit = true;
                // view.AllowNew = true;
                view.RowFilter = "emp_id IN(" + strEmpvisible + ")";
                // Simple-bind to a TextBox control
                Session["EmpPassID"] = strEmpvisible;
                this.RadGrid1.DataSource = view;
                //RadGrid1.DataBind();

            }
            else
            {

                this.RadGrid1.DataSource = ds;
                //RadGrid1.DataBind();
            }

           // RadGrid1.DataBind();
        }
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

        void CallBeforeMonthFill()
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
        }
        void MonthFill()
        {
            CallBeforeMonthFill();
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

            cmbMonth.DataSource = dtFilterFound;
            cmbMonth.DataTextField = "MonthName";
            cmbMonth.DataValueField = "RowID";
            cmbMonth.DataBind();
            SetControlDate();
        }


        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if ((Utility.AllowedAction1(Session["Username"].ToString(), "Generate or Submit Payroll")) == false)
            {
                RadGrid1.MasterTableView.GetColumn("CheckBox1").Visible = false;
            }
        }        

        protected void btngenerate_Click(object sender, EventArgs e)
        {
            bool isDataBind = false;
            foreach (GridItem item in RadGrid1.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0]; 
                    if (chkBox.Checked == true)
                    {
                        j = j + 1;//validation-To Check whether atleast on checkbox is selected
                        isDataBind = true;
                        int trxid = Utility.ToInteger(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("trx_id"));
                        int i = 0;
                        string status = "G";
                        SqlParameter[] parms = new SqlParameter[3];
                        parms[i++] = new SqlParameter("@trx_id", Utility.ToInteger(trxid));
                        parms[i++] = new SqlParameter("@status", Utility.ToString(status));
                        parms[i++] = new SqlParameter("@trxdate", Utility.ToString(System.DateTime.Now));

                        string sSQL = "sp_payroll_Update";
                        try
                        {
                            DataAccess.ExecuteStoreProc(sSQL, parms);
                        }
                        catch (Exception ex)
                        {
                            string ErrMsg = ex.Message;
                            if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                            {
                                ErrMsg = "<font color = 'Red'>Unable to update the status.Please Try again!</font>";
                            }
                        }
                    }

                }
            }

            //validatiion
            if (j <= 0)
            {
                ShowMessageBox("Please Select the Employees");
            }
            //

            RadGrid1.Rebind();
            //if (isDataBind == true)
            //{
            //    GetData();
            //    RadGrid1.DataBind();
               
            //}
        }


        public static void ShowMessageBox(string message)
        {
            if (!string.IsNullOrEmpty(message))
            {
                if (message.EndsWith("."))
                    message = message.Substring(0, message.Length - 1);
            }
            System.Text.StringBuilder sbScript = new System.Text.StringBuilder(50);
            //Java Script header            
            sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
            sbScript.Append("// Show messagebox" + Environment.NewLine);
            message = message.Replace("<br/>", "\\n").Replace("\"", "'");
            sbScript.Append(@"alert( """ + message + @""" );");
            sbScript.Append(@"</script>");
            HttpContext.Current.Response.Write(sbScript);
        }

        protected void bindgrid(object sender, ImageClickEventArgs e)
        {
            intcnt = 1;
            cmbYear.Enabled = false;
            cmbMonth.Enabled = false;
            imgbtnfetch.Enabled = false;

            deptID.Enabled = false;

            Session["ROWID"] = cmbMonth.SelectedValue.ToString();
            Session["ROWYEAR"] = cmbYear.SelectedValue.ToString();
            //GetData();
            RadGrid1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GetData();
            RadGrid1.DataBind();
            if (RadGrid1.Items.Count > 0)
            {
                RadGrid1.ExportSettings.ExportOnlyData = true;
               // RadGrid1.ExportSettings.IgnorePaging = CheckBox1.Checked;
                RadGrid1.ExportSettings.OpenInNewWindow = true;
                RadGrid1.MasterTableView.ExportToExcel();
            }
            else
            {
                dataexportmessage.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GetData();
            RadGrid1.DataBind();
            if (RadGrid1.Items.Count > 0)
            {
                RadGrid1.ExportSettings.ExportOnlyData = true;
               // RadGrid1.ExportSettings.IgnorePaging = CheckBox1.Checked;
                RadGrid1.ExportSettings.OpenInNewWindow = true;
                RadGrid1.MasterTableView.ExportToWord();
            }
            else
            {
                dataexportmessage.Visible = true;
            }
        }

        protected void RadGrid1_PageIndexChanged(object source, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            RadGrid1.CurrentPageIndex = e.NewPageIndex;
            //GetData();
            RadGrid1.DataBind();
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
                    CallBeforeMonthFill();
                }
                else
                {
                    if (IsPostBack == true)
                    {
                        MonthFill();
                    }
                    cmbMonth.SelectedValue = Utility.ToString(Session["ROWID"]);
                    cmbYear.SelectedValue = Utility.ToString(Session["ROWYEAR"]);
                }
                SetControlDate();
            }


        }


        void SetControlDate()
        {
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            DataRow[] drResults = monthDs.Tables[0].Select("RowID = " + cmbMonth.SelectedValue);
            foreach (DataRow dr in drResults)
            {
                Session["PayStartDay"] = dr["PayStartDay"].ToString();
                Session["PayEndDay"] = dr["PayEndDay"].ToString();
                Session["PaySubStartDay"] = dr["PaySubStartDay"].ToString();
                Session["PaySubEndDay"] = dr["PaySubEndDay"].ToString();
                Session["PaySubStartDate"] = dr["PaySubStartDate"].ToString();
                Session["PaySubEndDate"] = dr["PaySubEndDate"].ToString();
            }
        }


        protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            if (e.RebindReason != GridRebindReason.InitialLoad)
            {
                GetData();
            }
        }


        //Toolbar
        #region Toolbar and Exporting

        //column to hide wile export
        protected void HideGridColumnseExport()
        {
            RadGrid1.MasterTableView.GetColumn("TemplateColumn").Visible = false;
            RadGrid1.MasterTableView.GetColumn("GridClientSelectColumn").Visible = false;
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
            obj1.ExportGridHeader("105", Session["CompanyName"].ToString(), Session["Emp_Name"].ToString(), e);

        }

        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {
            GridSettingsPersister objCount = new GridSettingsPersister();
            objCount.RowCount(e, tbRecord);
        }


        #endregion
        //Toolbar End

    }
}
