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
using System.Data.SqlClient;
using Telerik.Web.UI;

namespace SMEPayroll.Payroll
{
    public partial class AppliedClaims : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        protected string sUserName = "", sgroupname = "";
        string varEmpCode = "";
        int compid;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.LCID = 2057;
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            SqlDataSource1.ConnectionString = Session["ConString"].ToString();
            SqlDataSource2.ConnectionString = Session["ConString"].ToString();
            if (!IsPostBack)
            {
                #region Yeardropdown
                cmbYear.DataBind();
                #endregion 
                compid = Utility.ToInteger(Session["Compid"]);
                varEmpCode = Session["EmpCode"].ToString();
                DropDownList1.SelectedValue = varEmpCode;
                cmbYear.SelectedValue = System.DateTime.Now.Year.ToString();

                string SQLQuery;
                SQLQuery = "select count(emp_code) from employee where company_id=" + compid + " and emp_code=" + varEmpCode + " and GroupId in(select GroupId from usergroups where company_id=" + compid + " and GroupName='Super Admin')";

                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, SQLQuery, null);
                if (dr.Read())
                {
                    if (Utility.ToInteger(dr[0].ToString()) > 0)
                    {
                        DropDownList1.Enabled = true;
                    }
                    else
                    {
                        DropDownList1.Enabled = false;
                    }
                }
            }
            RadGrid1.ItemCreated += new GridItemEventHandler(RadGrid1_ItemCreated);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {
                GridEditableItem item = e.Item as GridEditableItem;
                GridTextBoxColumnEditor EmpName = (GridTextBoxColumnEditor)item.EditManager.GetColumnEditor("EmpName");
                GridTextBoxColumnEditor Department = (GridTextBoxColumnEditor)item.EditManager.GetColumnEditor("Department");
                GridTextBoxColumnEditor Amount = (GridTextBoxColumnEditor)item.EditManager.GetColumnEditor("Amount");
                GridTextBoxColumnEditor status = (GridTextBoxColumnEditor)item.EditManager.GetColumnEditor("status");
                GridTextBoxColumnEditor claimstatus = (GridTextBoxColumnEditor)item.EditManager.GetColumnEditor("claimstatus");
                GridTextBoxColumnEditor remarks = (GridTextBoxColumnEditor)item.EditManager.GetColumnEditor("remarks");
                GridTextBoxColumnEditor emp_code = (GridTextBoxColumnEditor)item.EditManager.GetColumnEditor("emp_code");

                EmpName.TextBoxControl.Enabled = false;
                Department.TextBoxControl.Enabled = false;
                Amount.TextBoxControl.Enabled = false;
                status.TextBoxControl.Enabled = false;
                claimstatus.TextBoxControl.Enabled = false;
                remarks.TextBoxControl.Enabled = false;
                emp_code.TextBoxControl.Enabled = false;
            }
        }

        protected void bindgrid(object sender, ImageClickEventArgs e)
        {
            RadGrid1.DataBind();
        }

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = e.Item as GridDataItem;

                sUserName = Utility.ToString(Session["Username"]);
                //SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, "SELECT GroupName FROM UserGroups ug, Employee emp WHERE emp.GroupID = ug.GroupID AND emp.UserName = '" + sUserName + "' ", null);
                //if (dr.Read())
                //{
                //    sgroupname = Utility.ToString(dr.GetValue(0));
                //}
                sgroupname = Utility.ToString(Session["GroupName"]);

                if (dataItem["claimstatus"].Text == "Approved" && sgroupname != "Super Admin")
                {
                    dataItem["DeleteColumn"].Visible = false;
                }


                if (dataItem["status"].Text == "L" && dataItem["claimstatus"].Text == "Rejected" && sgroupname == "Super Admin")
                {
                    dataItem["DeleteColumn"].Visible = false;
                }
                if (dataItem["status"].Text == "L" && dataItem["claimstatus"].Text == "Approved" && sgroupname == "Super Admin")
                {
                    dataItem["DeleteColumn"].Visible = false;
                }

               
                  
            }
        }

        protected void RadGrid1_UpdateCommand(object source, GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem editedItem = e.Item as GridEditableItem;
                string trxid = (editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["trx_id"]).ToString();
                string date1 = (e.Item.FindControl("txtperiod") as TextBox).Text;
                string ssqlupdate;
                ssqlupdate = "update emp_additions set trx_period='" + date1 + "' where trx_id='" + trxid + "'";
                int i = DataAccess.ExecuteStoreProc(ssqlupdate);
            }
            catch (Exception ex)
            {
                string ErrMsg = ex.Message;
                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to Update record.</font> "));
            }   

        }
    }
}
