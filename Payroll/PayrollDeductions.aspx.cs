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
    public partial class PayrollDeductions : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;

        int compid;
        protected void Page_Load(object sender, EventArgs e)
        {
            compid = Utility.ToInteger(Session["Compid"]);
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            //SqlDataSource2.ConnectionString = Session["ConString"].ToString();
            if (!IsPostBack)
            {
                //DataSet ds_employee = new DataSet();
                //ds_employee = getDataSet("SELECT [emp_code], isnull([emp_name],'')+' '+isnull([emp_lname],'') 'emp_name' FROM [employee] where termination_date is null and company_id=" + compid + " order by emp_name");
                //drpemp.DataSource = ds_employee.Tables[0];
                //drpemp.DataTextField = ds_employee.Tables[0].Columns["emp_name"].ColumnName.ToString();
                //drpemp.DataValueField = ds_employee.Tables[0].Columns["emp_code"].ColumnName.ToString();
                //drpemp.DataBind();
                //string empid = Utility.ToString(DataBinder.Eval(Dataitem, "emp_code"));
                //if (empid != "")
                //    drpemp.SelectedValue = empid.ToString();
                cmbYear.SelectedValue = System.DateTime.Now.Year.ToString();
                Session["emp_code"] = "";
            }


            if (!IsPostBack)
            {
                //Method to Load grid Seting Persister
                LoadGridSettingsPersister();
            }

        }
        private object _dataItem = null;
        public object Dataitem
        {
            get
            {
                return this._dataItem;
            }
            set
            {
                this._dataItem = value;
            }
        }

        protected static DataSet getDataSet(string sSQL)
        {
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            return ds;
        }

        protected void bindgrid(object sender, ImageClickEventArgs e)
        {
            GridData();
            RadGrid1.DataBind();
        }

        private void GridData()
        {
            if (Session["emp_code"] != null)
            {
                string ssql = "sp_emppay_deduc";
                SqlParameter[] parms = new SqlParameter[3];
                parms[0] = new SqlParameter("@empcode", Session["emp_code"].ToString());
                parms[1] = new SqlParameter("@empmonth", DropDownList1.SelectedValue);
                parms[2] = new SqlParameter("@empyear", cmbYear.SelectedValue);
                RadGrid1.DataSource = DataAccess.ExecuteSPDataSet(ssql, parms);
            }
        }

        protected void RadGrid1_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {

            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
            object id = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["trx_id"];
            string TrxId = id.ToString();
            string sSQL = "sp_empdeduc_update";
            string empcode = (userControl.FindControl("drpemployee") as DropDownList).SelectedItem.Value;
            string addtype = (userControl.FindControl("drpaddtype") as DropDownList).SelectedItem.Value;
            string amount = (userControl.FindControl("txtamt") as TextBox).Text;
            DateTime transperiod1 = (DateTime)(userControl.FindControl("RadDatePicker1") as RadDatePicker).SelectedDate;
            int i = 0;
            SqlParameter[] parms = new SqlParameter[4];
            parms[i++] = new SqlParameter("@trx_id", Utility.ToString(TrxId));
            parms[i++] = new SqlParameter("@trx_amount", Utility.ToDouble(amount));
            parms[i++] = new SqlParameter("@trx_type", Utility.ToInteger(addtype));
            parms[i++] = new SqlParameter("@trx_period", Utility.ToString(transperiod1));

             /* Check Status for Lock Record */
            string sSQLCheck = "select status from emp_deductions where trx_id = {0}";
            sSQLCheck = string.Format(sSQLCheck,Utility.ToInteger(TrxId));
            string status = "";
            SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQLCheck, null);
            while (dr.Read())
            {
                status = Utility.ToString(dr.GetValue(0));
            }
            if (status == "U")
            {
                int retVal = DataAccess.ExecuteStoreProc(sSQL, parms);
                if (retVal == 1)
                { 
                    Response.Write("<script language = 'Javascript'>alert('Information Updated Successfully.');</script>");
                }
            }
            else
            {
                Response.Write("<script language = 'Javascript'>alert('Payroll has been Processed, Action not allowed.');</script>");
            }     

        }

        protected void RadGrid1_InsertCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
            string empcode = (userControl.FindControl("drpemployee") as DropDownList).SelectedItem.Value;
            string addtype = (userControl.FindControl("drpaddtype") as DropDownList).SelectedItem.Value;
            DateTime transperiod1 = (DateTime)(userControl.FindControl("RadDatePicker1") as RadDatePicker).SelectedDate;
            DateTime transperiod2 = (DateTime)(userControl.FindControl("RadDatePicker2") as RadDatePicker).SelectedDate;
            //string sSQL1 = "sp_getLockDeduction";
            //SqlParameter[] parms1 = new SqlParameter[6];
            //parms1[0] = new SqlParameter("@month1",Utility.ToInteger(transperiod1.Month));
            //parms1[1] = new SqlParameter("@month2",Utility.ToInteger(transperiod2.Month));
            //parms1[2] = new SqlParameter("@year1", Utility.ToInteger(transperiod1.Year));
            //parms1[3] = new SqlParameter("@year2", Utility.ToInteger(transperiod2.Year));
            //parms1[4] = new SqlParameter("@emp_code", Utility.ToInteger(empcode));
            //parms1[5] = new SqlParameter("@compid", compid);
            string sSQL1 = "sp_GetPayrollProcessOn";
            SqlParameter[] parms1 = new SqlParameter[3];
            parms1[0] = new SqlParameter("@empcode", Utility.ToInteger(empcode));
            parms1[1] = new SqlParameter("@compid", compid);
            parms1[2] = new SqlParameter("@trxdate", transperiod1.ToString("dd/MM/yyyy"));
            int conLock = 0;
            SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQL1, parms1);
            while (dr1.Read())
            {
                conLock = Utility.ToInteger(dr1.GetValue(0));
            }
            if (conLock <= 0)
            {
                string amount = (userControl.FindControl("txtamt") as TextBox).Text;

                int i = 0;
                SqlParameter[] parms = new SqlParameter[6];
                parms[i++] = new SqlParameter("@emp_code", Utility.ToInteger(empcode));
                parms[i++] = new SqlParameter("@trx_type", Utility.ToString(addtype));
                parms[i++] = new SqlParameter("@trx_period1", transperiod1);
                parms[i++] = new SqlParameter("@trx_period2", transperiod2);
                parms[i++] = new SqlParameter("@trx_amount", Utility.ToDouble(amount));
                parms[i++] = new SqlParameter("@compid", compid);

                string sSQL = "sp_empdeduc_add";
                try
                {
                    int retVal = DataAccess.ExecuteStoreProc(sSQL, parms);
                }
                catch (Exception ex)
                {
                    string ErrMsg = ex.Message;
                    if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                    {
                        ErrMsg = "<font color = 'Red'>Unable to add the record.Please try again.</font>";
                        RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to add record. Reason:</font> " + ErrMsg));
                        e.Canceled = true;
                    }
                }

            }
            else
            {
                Response.Write("<script language = 'Javascript'>alert('Payroll has been Processed, Action not allowed.');</script>");
            }           

        }

        protected void RadGrid1_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem editedItem = e.Item as GridEditableItem;
                string TrxId = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["trx_id"]);
                string sSQLCheck = "select status from emp_deductions where trx_id = {0}";
                sSQLCheck = string.Format(sSQLCheck,Utility.ToInteger(TrxId));
                string status = "";
                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQLCheck, null);
                while (dr.Read())
                {
                    status = Utility.ToString(dr.GetValue(0));
                }
                if (status == "U")
                {
                    string sSQL = "DELETE FROM emp_deductions where trx_id = {0}";
                    sSQL = string.Format(sSQL, TrxId);
                    int i = DataAccess.ExecuteStoreProc(sSQL);
                }
                else
                {
                    Response.Write("<script language = 'Javascript'>alert('Payroll has been Processed, Action not allowed.');</script>");
                }

            }
            catch (Exception ex)
            {
                string ErrMsg = ex.Message;
                if (ErrMsg.IndexOf("REFERENCE constraint", 1) > 0)
                    ErrMsg = "<font color = 'Red'>Record can not be deleted becuase of REFERENCE constraint. This record is called in other tables</font>";
                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete record. Reason:</font> " + ErrMsg));
                e.Canceled = true;
            }
        }

        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if ((Utility.AllowedAction1(Session["Username"].ToString(), "Manage Payroll Deductions")) == false)
            {
                RadGrid1.MasterTableView.CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.None;
                RadGrid1.MasterTableView.GetColumn("DeleteColumn").Visible = false;
                RadGrid1.MasterTableView.GetColumn("EditColumn").Visible = false;
            }

            if (e.Item.ItemType == GridItemType.Item || e.Item.ItemType == GridItemType.AlternatingItem)
            {
                GridEditableItem editedItem = e.Item as GridEditableItem;
                UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
                string TrxId = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["trx_id"]);
                string sSQLCheck = "select status from emp_deductions where trx_id = {0}";
                sSQLCheck = string.Format(sSQLCheck, Utility.ToInteger(TrxId));
                string status = "";
                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQLCheck, null);
                while (dr.Read())
                {
                    status = Utility.ToString(dr.GetValue(0));
                }
                if (status == "L")
                {
                    e.Item.Cells[10].Controls[0].Visible = false;
                    e.Item.Cells[11].Controls[0].Visible = false;
                }
                     
            }
        }

        protected void cmbYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadComboBoxPrjEmp.ClearSelection();
            //DataSet ds_employee = new DataSet();
            //ds_employee = getDataSet("SELECT [emp_code], isnull([emp_name],'')+' '+isnull([emp_lname],'') 'emp_name'  FROM [employee] where (termination_date is null or year(termination_date)='" + cmbYear.SelectedValue + "') and company_id=" + compid + " order by emp_name");
            //drpemp.DataSource = ds_employee.Tables[0];
            //drpemp.DataTextField = ds_employee.Tables[0].Columns["emp_name"].ColumnName.ToString();
            //drpemp.DataValueField = ds_employee.Tables[0].Columns["emp_code"].ColumnName.ToString();
            //drpemp.DataBind();
        }

        protected void RadComboBoxEmpPrj_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            string sqlSelectCommand = "";
            RadComboBox rd = new RadComboBox();

                RadGrid1.MasterTableView.ShowGroupFooter = true;
                rd = RadComboBoxPrjEmp;
                sqlSelectCommand = "SELECT Emp_Code [Emp_Code], isnull(emp_name,'')+' '+isnull(emp_lname,'') [Emp_Name], Time_Card_No [Time_Card_No], ic_pp_number  [ic_pp_number] from [Employee] WHERE Termination_date is null And Company_ID=" + compid + " And   Len([Time_Card_No]) >= 0 And StatusID=1 And (upper(isnull(emp_name,''))+' '+upper(isnull(emp_lname,'')) LIKE + '%' + upper(@text) + '%' Or upper([ic_pp_number]) LIKE + '%' +  upper(@text) + '%' Or upper([Time_Card_No]) LIKE + '%' + @text + '%') ORDER BY [Emp_Name]";
                //if (Utility.ToString(Session["GroupName"]) == "Super Admin")
                //{
                //    sqlSelectCommand = "SELECT Emp_Code [Emp_Code], isnull(emp_name,'')+' '+isnull(emp_lname,'') [Emp_Name], Time_Card_No [Time_Card_No], ic_pp_number  [ic_pp_number] from [Employee] WHERE Termination_date is null And Company_ID=" + compid + " And   Len([Time_Card_No]) >= 0 And StatusID=1 And (upper(isnull(emp_name,''))+' '+upper(isnull(emp_lname,'')) LIKE + '%' + upper(@text) + '%' Or upper([ic_pp_number]) LIKE + '%' +  upper(@text) + '%' Or upper([Time_Card_No]) LIKE + '%' + @text + '%') ORDER BY [Emp_Name]";
                //}
                //else
                //{
                //    sqlSelectCommand = "SELECT Emp_Code [Emp_Code], isnull(emp_name,'')+' '+isnull(emp_lname,'') [Emp_Name], Time_Card_No [Time_Card_No], ic_pp_number  [ic_pp_number] from [Employee] WHERE termination_date is null And Company_ID=" + compid + " And   Len([Time_Card_No]) >= 0 and emp_code='" + Session["EmpCode"].ToString() + "' And StatusID=1 And (upper(isnull(emp_name,''))+' '+upper(isnull(emp_lname,'')) LIKE + '%' + upper(@text) + '%' Or upper([ic_pp_number]) LIKE + '%' +  upper(@text) + '%' Or upper([Time_Card_No]) LIKE + '%' + @text + '%') ORDER BY [Emp_Name]";
                //}

            SqlDataAdapter adapter = new SqlDataAdapter(sqlSelectCommand, Constants.CONNECTION_STRING);
            adapter.SelectCommand.Parameters.AddWithValue("@text", e.Text);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            foreach (DataRow dataRow in dataTable.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();

                item.Text = Convert.ToString(dataRow["Emp_Name"]);
                item.Value = Convert.ToString(dataRow["Emp_Code"].ToString());

                string Time_Card_No = Convert.ToString(dataRow["Time_Card_No"]);
                string ic_pp_number = Convert.ToString(dataRow["ic_pp_number"]);

                item.Attributes.Add("Time_Card_No", Time_Card_No.ToString());
                item.Attributes.Add("ic_pp_number", ic_pp_number.ToString());

                rd.Items.Add(item);

                item.DataBind();
            }
        }


        protected void RadComboBoxPrjEmp_SelectedIndexChanged(object o, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            //string selectedValue = e.Value;
            Session["emp_code"] = e.Value;
        }

        protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            GridData();
        }

        //Toolbar
        #region Toolbar and Exporting

        //column to hide wile export
        protected void HideGridColumnseExport()
        {
            RadGrid1.MasterTableView.GetColumn("EditColumn").Visible = false;
            RadGrid1.MasterTableView.GetColumn("DeleteColumn").Visible = false;// UniqueName="DeleteColumn"
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
            obj1.ExportGridHeader("101", Session["CompanyName"].ToString(), Session["Emp_Name"].ToString(), e);

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
