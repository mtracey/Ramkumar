using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Telerik.Web.UI;


namespace SMEPayroll.Employee
{
    public partial class Terminate : System.Web.UI.Page
    {
        
        public int? emp_code=null;
        protected int comp_id;
        public string message;
        protected void Page_Load(object sender, EventArgs e)
        {
         comp_id = Utility.ToInteger(Session["Compid"]);
         emp_code=Convert.ToInt32(Request.QueryString["emp_code"]);
        // message = Convert.ToString(Request.QueryString["msg"]);
         message = Session["Message"].ToString(); 
        lblMessage.Text = message;


            if (!IsPostBack)
            {
                if (emp_code.HasValue)
                {
                    Leaves();
                    ItemIssue();
                    LeaveSupervisor();
                    ClaimSupervisor();
                    TimeSheetSupervisor();
                    WorkflowSupervisor();
                }
            }
        }

        private void WorkflowSupervisor()
        {
            DataSet ds_WF = new DataSet();
            ds_WF = getDataSet("select EMP_CODE, emp_name as Name from employee where emp_code in (select Emp_ID from employeeassignedtopayrollgroup where payrollgroupid=(select PayRollGroupID from EmployeeWorkFlowLevel where id=(select pay_supervisor from employee where emp_code='" + emp_code + "')))");
            gridWorkflowSup.DataSource = ds_WF.Tables[0];
            gridWorkflowSup.DataBind();
        }

        private void TimeSheetSupervisor()
        {
            DataSet ds_TS = new DataSet();
            ds_TS = getDataSet("SELECT  EMP_CODE,EMP_NAME + ' ' + EMP_LNAME AS Name FROM EMPLOYEE WHERE TERMINATION_DATE IS NULL  AND timesupervisor ='" + emp_code + "' AND COMPANY_ID ='" + comp_id + "' ORDER BY EMP_NAME");
            gridTimeSheetSup.DataSource = ds_TS.Tables[0];
            gridTimeSheetSup.DataBind();
        }

        private void ClaimSupervisor()
        {

             DataSet ds_Cl = new DataSet();
             ds_Cl = getDataSet("SELECT  EMP_CODE,EMP_NAME + ' ' + EMP_LNAME AS Name FROM EMPLOYEE WHERE TERMINATION_DATE IS NULL  AND EMP_CLSUPERVISOR ='" + emp_code + "' AND COMPANY_ID ='" + comp_id + "' ORDER BY EMP_NAME");
             gridClaimSup.DataSource = ds_Cl.Tables[0];
             gridClaimSup.DataBind();
            
        }

        private void LeaveSupervisor()
        {
            DataSet ds1 = new DataSet();
            ds1 = getDataSet("SELECT  EMP_CODE,EMP_NAME + ' ' + EMP_LNAME AS Name FROM EMPLOYEE WHERE TERMINATION_DATE IS NULL  AND EMP_SUPERVISOR ='" + emp_code + "' AND COMPANY_ID ='" + comp_id + "' ORDER BY EMP_NAME");
            gridLeaveSup.DataSource = ds1.Tables[0];
            gridLeaveSup.DataBind();
           
        }

        private void ItemIssue()
        {
            DataSet ds = new DataSet();
            ds = getDataSet("Select EI.ID, EI.ItemID, ISC.ItemName, EI.SerialNumber, EI.Quantity, EI.Remarks,EI.ItemReturn From EmployeeItemIssued EI Inner Join Item ISC On EI.ItemID = ISC.ID Where EI.Emp_ID=" + emp_code);
            gridItem.DataSource = ds.Tables[0];
            gridItem.DataBind();
        }

        private void Leaves()
        {

            string sSQL = "sp_GetEmployeeLeavePolicy";
            SqlParameter[] parms = new SqlParameter[4];
            parms[0] = new SqlParameter("@empid", Utility.ToInteger(emp_code));
            parms[1] = new SqlParameter("@year", System.DateTime.Now.Year);
            parms[2] = new SqlParameter("@applydateon", System.DateTime.Today);
            parms[3] = new SqlParameter("@filter", 0);
            DataSet ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
            gridLeave.Visible = true;
            gridLeave.DataSource = ds;
            gridLeave.MasterTableView.DataSource = ds;
            gridLeave.DataBind();
        }


        protected static DataSet getDataSet(string sSQL)
        {
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            return ds;
        }


        protected void gridLeaveSup_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = gridLeaveSup.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn") as Label;
                lbl.Text = Convert.ToString((strIndex * gridLeaveSup.PageCount) + e.Item.ItemIndex + 1);
            }
        }


        protected void gridClaimSup_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = gridClaimSup.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn") as Label;
                lbl.Text = Convert.ToString((strIndex * gridClaimSup.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void gridTimeSheetSup_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = gridTimeSheetSup.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn") as Label;
                lbl.Text = Convert.ToString((strIndex * gridTimeSheetSup.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void gridWorkflowSup_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = gridWorkflowSup.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn") as Label;
                lbl.Text = Convert.ToString((strIndex * gridWorkflowSup.PageCount) + e.Item.ItemIndex + 1);
            }
        } 

    }
}