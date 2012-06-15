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
using System.IO;
using System.Text;

namespace SMEPayroll.Leaves
{
    public partial class ViewAppliedLeaves : System.Web.UI.Page
    {
        string strMessage = "";
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        protected string sUserName = "", sgroupname = "";
        string Approver;

        string varEmpCode="";
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
                compid = Utility.ToInteger(Session["Compid"]);   
                varEmpCode = Session["EmpCode"].ToString();

                //new
                if (varEmpCode != "1")//if not super admin
                {
                    cmbEmployee.SelectedValue = varEmpCode;
                }
                //
                cmbYear.SelectedValue = System.DateTime.Now.Year.ToString();

                string SQLQuery;              
                SQLQuery = "select count(emp_code) from employee where company_id=" + compid + " and emp_code=" + varEmpCode + " and GroupId in(select GroupId from usergroups where company_id=" + compid + " and GroupName='Super Admin')";

                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, SQLQuery, null);
                if (dr.Read())
                {
                    if (Utility.ToInteger(dr[0].ToString()) > 0)
                    {
                        cmbEmployee.Enabled = true;
                    }
                    else
                    {
                        if (Utility.AllowedAction1(Session["Username"].ToString(), "Apply Leaves for all") == true)
                        {
                            cmbEmployee.Enabled = true;
                        }
                        else
                        {
                            cmbEmployee.Enabled = false;
                        }
                    }
                }
            }
        }
        protected void bindgrid(object sender, ImageClickEventArgs e)
        {

            RadGrid1.DataBind();
        }

        protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                string sSQL = "";
                GridEditableItem editedItem = e.Item as GridEditableItem;
                object id = Utility.ToInteger(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["trx_id"]);
                string status = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["status"]).ToUpper();
                int leave_type = Utility.ToInteger(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["leave_type"]);

                string ltype = Convert.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["type"]);
                string stdate = Convert.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["start_date"]);
                string endate = Convert.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["end_date"]);
                double paid = Convert.ToDouble(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["paid_leaves"]);
                double unpaid = Convert.ToDouble(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["unpaid_leaves"]);
                string empid = Convert.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["emp_id"]);


                if (status.ToString() == "OPEN")
                {
                }
                else
                {
                    if (leave_type == 8)
                    {
                        sSQL = "Update Leaves_annual Set Leave_Remaining = Leave_Remaining + (select distinct(e.paid_leaves) from emp_leaves e,emp_leaves_detail eld where eld.trx_id=e.trx_id and year(leave_date)=" + cmbYear.SelectedValue + " and e.leave_type=" + leave_type.ToString() + " and e.status='Approved' And e.trx_id=" + Utility.ToString(id) + ") Where Emp_Id =" + cmbEmployee.SelectedItem.Value.ToString() + " and leave_year =" + cmbYear.SelectedValue + ";";
                    }
                }

                //
                string trx_id = Utility.ToString(id);
                sendemail(ltype, empid, stdate, endate, paid, unpaid, status, trx_id);
                //

                //string sSQL = " Update Leaves_annual Set Leave_Remaining = Leave_Remaining + isnull((Select sum(Eld.Leavecnt) From Emp_Leaves El Inner Join  (Select trx_id, leavecnt=Case When Halfday_leave=0 Then 1 Else 0.5 End From emp_leaves_detail Where unpaid_leave=0 And trx_id=" + Utility.ToString(id) + " And year(Leave_Date) =" + cmbYear.SelectedValue + ") eld  On el.trx_id=eld.trx_id Where el.[Status]='Approved' And el.Leave_Type=8),0) Where Emp_Id = " + cmbEmployee.SelectedItem.Value.ToString() + " and leave_year = " + cmbYear.SelectedValue;
                sSQL = sSQL + "Delete from Emp_Leaves          where [trx_id]= " + Utility.ToString(id);
                sSQL = sSQL + ";Delete from Emp_Leaves_Detail   where [trx_id]= " + Utility.ToString(id);
                int retVal = DataAccess.ExecuteStoreProc(sSQL);
                if (retVal >= 1)
                {
                    lblMsg.Text = "Leaves Deleted Successfully.";
                }
                else
                {
                    lblMsg.Text = "Leaves Deletion Failed.";
                }

               // string trx_id = Utility.ToString(id);

                //sendemail(ltype, empid, stdate, endate, paid, unpaid, status, trx_id);
                strMessage = status + " Leave is Deleted Successfully. <br/>" + strMessage;
                if (strMessage.Length > 0)
                {
                    ShowMessageBox(strMessage);
                    strMessage = "";
                }
            }
        }

        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string enddateday = dataItem["end_date"].Text.Substring(0, 2);
                string enddatemonth = dataItem["end_date"].Text.Substring(3, 2);
                string enddateyear = dataItem["end_date"].Text.Substring(6, 4);

                sUserName = Utility.ToString(Session["Username"]);
                //SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, "SELECT GroupName FROM UserGroups ug, Employee emp WHERE emp.GroupID = ug.GroupID AND emp.UserName = '" + sUserName + "' ", null);
                //if (dr.Read())
                //{
                //    sgroupname = Utility.ToString(dr.GetValue(0));
                //}
                sgroupname = Utility.ToString(Session["GroupName"]);
                if (dataItem["status"].Text == "Approved" && sgroupname != "Super Admin")
                {
                    dataItem["DeleteColumn"].Visible = false;
                }

                if (dataItem["payrollstatus"].Text == "L" && dataItem["status"].Text == "Rejected" && sgroupname == "Super Admin")
                {
                    dataItem["DeleteColumn"].Visible = false;
                }
                if ((dataItem["payrollstatus"].Text == "L" && sgroupname == "Super Admin" && dataItem["status"].Text == "Approved"))
                {
                    dataItem["DeleteColumn"].Visible = false;
                }
            }
        }

        protected void sendemail(string leavtype, string empcode, string fromdate, string todate, double paidleaves, double unpaidleaves, string status, string trx_id)
        {
            string from = "";
            string to = "";
            string SMTPserver = "";
            string SMTPUser = "";
            string SMTPPass = "";
            int SMTPPORT = 25;
            string emp_name = "";
            //string from_date = (RadDatePicker1.DbSelectedDate.ToString().Substring(0, 10));
            //string to_date = (RadDatePicker2.DbSelectedDate.ToString().Substring(0, 10));
            string emailreq = "";
            string body = "";
            string cc = "";


            string sSQLemail = "sp_send_email";
            SqlParameter[] parmsemail = new SqlParameter[2];
            parmsemail[0] = new SqlParameter("@empcode", Utility.ToInteger(empcode));
            parmsemail[1] = new SqlParameter("@compid", Utility.ToInteger(Session["Compid"]));
            SqlDataReader dr3 = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQLemail, parmsemail);
            while (dr3.Read())
            {
                from = Utility.ToString(dr3.GetValue(15));
                to = Utility.ToString(dr3.GetValue(2));
                SMTPserver = Utility.ToString(dr3.GetValue(6));
                SMTPUser = Utility.ToString(dr3.GetValue(7));
                SMTPPass = Utility.ToString(dr3.GetValue(8));
                emp_name = Utility.ToString(dr3.GetValue(5));
                body = Utility.ToString(dr3.GetValue(18));
                SMTPPORT = Utility.ToInteger(dr3.GetValue(13));
                emailreq = Utility.ToString(dr3.GetValue(16)).ToLower();
                cc = Utility.ToString(dr3.GetValue(17));
            }
            if (emailreq == "yes")
            {
                if (to.ToString().Trim().Length <= 0)
                {
                    to = cc;
                }
                string subject = "Leave with " + status.ToString().Trim() + " status of " + emp_name.ToString().Trim() + " has been Deleted";
                //body = "Approved @leave_type of Employee @emp_name @paid_leaves Paid Leaves and @unpaid_leaves Un-Paid Leaves From @from_date to @to_date has been deleted";
                body = body.Replace("@emp_name", emp_name);
                body = body.Replace("@from_date", fromdate);
                body = body.Replace("@to_date", todate);
                body = body.Replace("@leave_type", leavtype);
                body = body.Replace("@paid_leaves", paidleaves.ToString());
                body = body.Replace("@unpaid_leaves", unpaidleaves.ToString());
                body = body.Replace("@status", status);

                SMEPayroll.Model.ANBMailer oANBMailer = new SMEPayroll.Model.ANBMailer(Utility.ToInteger(Session["Compid"]));

                oANBMailer.Subject = subject;
                oANBMailer.MailBody = body;
                oANBMailer.From = from;

                //check if MultiLevel -ram


                string sql1 = @" select approver from emp_leaves where trx_id='" + trx_id + "'";
                
                SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.Text, sql1, null);
                if (dr1.Read())
                    Approver = dr1[0].ToString();
                dr1.Close();

                if (Approver == "MultiLevel")
                {

                    string sql = @"select email from employee where Emp_code in (select Emp_ID from EmployeeAssignedToPayrollGroup where payrollgroupId=(select PayRollGroupID from EmployeeWorkFlowLevel where ID=(select Leave_supervisor from employee where emp_code=" + empcode + "))) union select email from employee where emp_code=" + empcode + "";
                    SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sql, null);
                    string email;
                    StringBuilder strUpdateBuild = new StringBuilder();
                    while (dr.Read())
                    {
                        email = dr[0].ToString() + ";";
                        strUpdateBuild.Append(email);
                    }

                    email = strUpdateBuild.ToString();
                    to = email;
                    //to = "Shashank@anbgroup.com";
                }
                //




                oANBMailer.To = to;
                oANBMailer.Cc = cc;


                try
                {
                    string sRetVal = oANBMailer.SendMail();
                    if (sRetVal == "")
                    {
                        if (to.Length > 0)
                        {
                            if (cc.Length > 0)
                            {
                                strMessage = strMessage + "<br/>" + "An email has been sent to " + to + "," + cc;
                            }
                            else
                            {
                                strMessage = strMessage + "<br/>" + "An email has been sent to " + to;
                            }
                        }
                    }
                    else
                    {
                        strMessage = strMessage + "<br/>" + "Error Occured While Sending Mail.";
                    }
                }
                catch (Exception ex)
                {
                    strMessage = strMessage + "<br/>" + "Error Occured While Sending Mail.";
                }
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

               
    }
}
