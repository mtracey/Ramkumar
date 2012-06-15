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
using System.Net.Mail;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;

namespace SMEPayroll.Leaves
{
    //TODO: Guess
    public partial class PendingApproval : System.Web.UI.Page
    {
        string strMessage = "";
        StringBuilder strFailMailMsg = new StringBuilder();
        StringBuilder strPassMailMsg = new StringBuilder();
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        string s = "", varEmpName = "";
        int compid;
        DataSet dsleaves;
        string email;

        public string WorkFlowName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            varEmpName = Session["Emp_Name"].ToString();
            SqlDataSource1.ConnectionString = Session["ConString"].ToString();

            if (!IsPostBack)
            {
                if ((Utility.AllowedAction1(Session["Username"].ToString(), "Approve and Reject Leaves for all")) == false)
                {
                    TextBox1.Text = "approver";
                }
                else
                {
                    TextBox1.Text = "noapprover";
                }
                compid = Utility.ToInteger(Session["Compid"]);

                s = Session["Username"].ToString();
                string strSql = "select emp_code,isnull(emp_name,'')+' '+isnull(emp_lname,'') 'emp_name',emp_supervisor from employee where UserName='" + s + "'";
                DataSet leaveset = new DataSet();
                leaveset = getDataSet(strSql);
                lblsuper.Text = Utility.ToString(leaveset.Tables[0].Rows[0]["emp_name"]);

            }

            //UpDate Database based up on the Request Send 
            string sql = "SELECT emp_id,[status],ApproveDate,em.Leave_supervisor,[Application Date],[ApproveDate],[trx_id] from emp_leaves A INNER JOIN employee em ";
            sql = sql + " ON A.emp_id= em.emp_code  WHERE A.trx_id  IN (SELECT [trx_id]FROM [emp_leaves] a ,leave_types b ,employee c ";
            sql = sql + " WHERE a.emp_id = c.emp_code AND  leave_type = b.id AND ([status] != 'Approved') AND company_id =" + compid + " AND a.approver ='MultiLevel' )";

            DataSet leaveInfo = new DataSet();
            leaveInfo = getDataSet(sql);

            sql = "";
            sql = "Select WL.ID, 'L'+ Cast(WL.RowID as varchar(5)) RowID, WF.ID,WF.WorkFlowName,";
            sql = sql + "'FlowType'=Case When WL.FlowType=1 Then 'Payroll' When WL.FlowType=2 Then 'Leaves' ";
            sql = sql + "When WL.FlowType=2 Then 'Claims' End, PG.GroupName,WL.ACTION,WL.ExpiryDays From EmployeeWorkFlowLevel WL ";
            sql = sql + "Inner Join EmployeeWorkFlow WF On WL.WorkFlowID = WF.ID Inner Join PayrollGroup PG On WL.PayRollGroupID = PG.ID Where WF.ID=1 And ";
            sql = sql + "	WL.FlowType=2 Order By WL.RowID";

            DataSet updateInfo = new DataSet();
            updateInfo = getDataSet(sql);

            //Update BasedUp on conditions 
            //1 -Get Values in Database for Current Status ...If 1,2,3,4,5 etc then get Values Based On ROWID
            //If Open Status then consider ApplicationDate Else Consider ApproveDate
            //If ApproveDate ---Get Action Ap-(Diff(Today - AppDate)>1)Status=Satus -1 If Status =1 Then Status Approved
            //If ApplicationDate ---Get Action Ap-(Diff(Today - AppDate)>1)Status=Satus -1 If Status =1 Then Status Approved

            if (leaveInfo.Tables.Count > 0)
            {
                DateTime ExDateTime;
                string status = "";
                string Action = "";
                int ExpiDay = 0;
                int LeaveSupId = 0;
                string Rid = "";
                int trxid1 = 0;

                for (int i = 0; i <= leaveInfo.Tables[0].Rows.Count - 1; i++)
                {
                    status = leaveInfo.Tables[0].Rows[i][1].ToString();

                    trxid1 = Utility.ToInteger(leaveInfo.Tables[0].Rows[i][6].ToString());
                    //Status Open Then Get 
                    if (status == "Open")
                    {
                        ExDateTime = Convert.ToDateTime(leaveInfo.Tables[0].Rows[i][4]);
                        LeaveSupId = Utility.ToInteger(leaveInfo.Tables[0].Rows[i][3]);
                        //Get ROWID,Action,ExpiryDays based upon the LeaveSupervisor
                        for (int j = 0; j <= updateInfo.Tables[0].Rows.Count - 1; j++)
                        {
                            if (LeaveSupId.ToString() == updateInfo.Tables[0].Rows[j][0].ToString())
                            {
                                Action = updateInfo.Tables[0].Rows[j][6].ToString();
                                ExpiDay = Utility.ToInteger(updateInfo.Tables[0].Rows[j][7]);
                                Rid = updateInfo.Tables[0].Rows[j][1].ToString();
                                ExDateTime = ExDateTime.AddDays(ExpiDay);
                                break;
                            }
                        }
                    }
                    else
                    {

                        ExDateTime = Convert.ToDateTime(leaveInfo.Tables[0].Rows[i][5]);
                        Rid = "L" + leaveInfo.Tables[0].Rows[i][1];

                        for (int j = 0; j <= updateInfo.Tables[0].Rows.Count - 1; j++)
                        {
                            if (Rid.ToString() == updateInfo.Tables[0].Rows[j][1].ToString())
                            {
                                Action = updateInfo.Tables[0].Rows[j][6].ToString();
                                ExpiDay = Utility.ToInteger(updateInfo.Tables[0].Rows[j][7]);
                                ExDateTime = ExDateTime.AddDays(ExpiDay);
                                break;
                            }
                        }
                    }

                    //Check Based Upon Action and DateFifference Update Underlying Table
                    //If Action Approved ..Update For Approved Else Rejected else Deduct 1 level
                    //If Final Status is Level 1 then Make it as Approved ...
                    DateTime today = DateTime.Now.Date;

                    string finalStatusFlag = "";
                    int value = 0;

                    TimeSpan span = today.Subtract(ExDateTime.Date);
                    if (span.Days > 1)
                    {
                        if (Action == "Approved")
                        {
                            int status_1 = 0;
                            if (status == "Open")
                            {
                                if (Rid.Length > 0)
                                {

                                    status_1 = Utility.ToInteger(Rid.Substring(1, 1));
                                }
                                if (status_1 == 1)
                                {
                                    finalStatusFlag = "Approved";
                                }
                                else
                                {
                                    value = status_1 - 1;
                                    finalStatusFlag = value.ToString();
                                }
                            }
                            else
                            {
                                int status1 = Utility.ToInteger(status);
                                if (status1 == 1)
                                {
                                    finalStatusFlag = "Approved";
                                }
                                else
                                {
                                    value = status1 - 1;
                                    finalStatusFlag = value.ToString();
                                }
                            }
                        }
                        else if (Action == "Rejected")
                        {
                            finalStatusFlag = "Rejected";
                        }
                        //Update Statement For Pending records ...                    
                        string Sql = "Update emp_leaves set status='" + finalStatusFlag.ToString() + "',approver='MultiLevel',remarks='Auto Approval',ApproveDate='" + DateTime.Now.Date.Year + "-" + DateTime.Now.Date.Month + "-" + DateTime.Now.Date.Day + "' where trx_id=" + trxid1;
                        DataAccess.ExecuteStoreProc(Sql);
                    }
                }
            }

            //RadCalendarDay specialDay = new RadCalendarDay();
            //specialDay.Date = DateTime.Today;
            //specialDay.ToolTip = "Annual Leave";
            //specialDay.Repeatable = Telerik.Web.UI.Calendar.RecurringEvents.DayInMonth;
            //specialDay.TemplateID = "DateTemplate";
            //RadCalendar1.SpecialDays.Add(specialDay);

            //Check Calendar and set the query to get the Leaves Status


            //for (int i = 1; i < DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month); i++)
            //{
            //    DateTime dtcurrent = new DateTime();
            //    string currentdate =  i.ToString() + "/" + DateTime.Now.Month +  "/" +  DateTime.Now.Year; 
            //    string sqlQuery = "select isnull(b.emp_name,'')+' '+isnull(b.emp_lname,'') Name, c.Type Type, ";
            //    sqlQuery = sqlQuery + " Convert(varchar(15),Start_Date,103) FromDate,Convert(varchar(15),End_Date,103) ToDate, CONVERT(DATETIME, '" + currentdate + "', 103) LeaveDate,";
            //    sqlQuery = sqlQuery + " status from emp_leaves a,  employee b, leave_types c, emp_group d ";
            //    sqlQuery = sqlQuery + " where a.emp_id = b.emp_code  and a.leave_Type = c.id and b.Emp_Group_Id=d.id and status <>'Rejected' ";
            //    sqlQuery = sqlQuery + " AND CONVERT(DATETIME, '"+ currentdate + "', 103) BETWEEN Convert(DATETIME,Start_Date,103) AND Convert(DATETIME,End_Date,103) ";

            //    DataSet dsleaves = new DataSet();
            //    dsleaves = DataAccess.FetchRS(CommandType.Text, sqlQuery, null);
            //    string strEmpName = "";
            //    string dateSelecetd = "";
            //    string leavetype="";
            //    if (dsleaves.Tables.Count > 0)
            //    {
            //        if (dsleaves.Tables[0].Rows.Count > 0)
            //        {
            //            foreach (DataRow dr in dsleaves.Tables[0].Rows)
            //            {
            //                if(strEmpName.Length==0)
            //                {
            //                    strEmpName = dr["Name"].ToString();
            //                }else
            //                {
            //                    strEmpName = strEmpName + "\n" + dr["Name"].ToString();
            //                }
            //                dateSelecetd = dr["LeaveDate"].ToString();
            //                leavetype = dr["Type"].ToString();
            //            }
            //            RadCalendarDay specialDay = new RadCalendarDay();
            //            specialDay.Date = Convert.ToDateTime(dateSelecetd);
            //            specialDay.ToolTip = strEmpName + "\n" + leavetype + "\n" + Convert.ToDateTime(dateSelecetd).Day;
            //            specialDay.TemplateID = "DateTemplate";
            //            specialDay.ItemStyle.CssClass = "SpecialDay";
            //            RadCalendar1.SpecialDays.Add(specialDay);                       
            //        }
            //    }

            //}
        }
        protected static DataSet getDataSet(string sSQL)
        {
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            return ds;
        }
        //
        protected void remarkRadio_CheckedChanged(object sender, EventArgs e)
        {
            string remarks = txtremarks.Text;
            string ApprovalFlag = "";
            string empcode = "";
            int trxid = -1;
            btnapprove.Enabled = true;
            foreach (GridItem item in RadGrid1.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem.FindControl("CheckBox1");
                    RadioButton rad1 = (RadioButton)dataItem.FindControl("remarkRadio");
                    if (rad1.Checked == true)
                    {
                        trxid = Utility.ToInteger(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("trx_id"));
                        string type = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("type"));
                        string strRemarks = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("remarks"));
                        ApprovalFlag = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].Cells[16].Text);
                        empcode = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].Cells[17].Text);
                        //divRemarks.InnerText = strRemarks;
                        txtEmpRemarks.Value = strRemarks;

                    }
                }
            }
            //If Selected Row having Approver as Multilevel then Show Details till what level approval is done
            if (ApprovalFlag == "MultiLevel")
            {
                rowApp.Visible = true;
                //lblApprovalinfo1.InnerHtml= "MultiLevel Leaves ";

                //r
                //string strSql = "Select WL.ID,WL.RowID, WorkFlowName +' - L'+ + Cast(WL.RowID as varchar(5)) WorkFlowName ";
                string strSql = "Select WL.ID,WL.RowID, WorkFlowName ";

                strSql = strSql + "From( Select ID,WorkFlowName From EmployeeWorkFlow  Where ID IN ";
                strSql = strSql + "(Select Distinct WorkFlowID From EmployeeWorkFlowLevel Where FlowType=2) ";
                strSql = strSql + "And Company_ID=" + Utility.ToInteger(Session["Compid"]).ToString() + ") WF Inner Join EmployeeWorkFlowLevel WL ";
                strSql = strSql + "On WF.ID=WL.WorkFlowID WHERE WL.ID IN(SELECT Leave_supervisor FROM dbo.employee   WHERE emp_code=" + empcode + " ) ";
                strSql = strSql + "Order By WF.WorkFlowName, WL.RowID";

                dsleaves = new DataSet();
                dsleaves = DataAccess.FetchRS(CommandType.Text, strSql, null);
                string message = "";
                //message = "MultiLevel Leaves  Highest Approval Level :" + dsleaves.Tables[0].Rows[0][1].ToString() + "   Current Approved Level :";
                int maxApprovalleval = 0;
                int appLeveldb = 0;
                if (dsleaves.Tables.Count > 0)
                {
                    if (dsleaves.Tables[0].Rows.Count > 0)
                    {
                        maxApprovalleval = Utility.ToInteger(dsleaves.Tables[0].Rows[0][1]);

                        //r
                        WorkFlowName = Utility.ToString(dsleaves.Tables[0].Rows[0][2]);
                    }
                }

                if (maxApprovalleval != 0)
                {
                    SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.Text, "SELECT [STATUS] FROM emp_leaves WHERE trx_id=" + trxid, null);
                    int ApproveLvlcnt = 0;
                    message = "Multi Level Approval Status : <br/>";
                    while (dr1.Read())
                    {
                        if (Utility.ToString(dr1.GetValue(0)) == "Approved" || Utility.ToString(dr1.GetValue(0)) == "Open")
                        {
                            appLeveldb = maxApprovalleval;
                            ApproveLvlcnt = maxApprovalleval;
                            for (int cnt = maxApprovalleval; cnt >= 1; cnt--)
                            {
                                message = message + "[L" + cnt + ":Pending ]";
                            }
                        }
                        else
                        {
                            appLeveldb = Utility.ToInteger(dr1.GetValue(0));
                            ApproveLvlcnt = appLeveldb - 1;
                            for (int cnt = maxApprovalleval; cnt >= appLeveldb; cnt--)
                            {
                                message = message + "[L" + cnt + ":Approved ]";
                            }

                            for (int cnt = appLeveldb - 1; cnt >= 1; cnt--)
                            {
                                message = message + "[L" + cnt + ":Pending ] ";
                            }
                        }
                    }


                    string s = Session["Username"].ToString();
                    string strSql1 = "select emp_code,isnull(emp_name,'')+' '+isnull(emp_lname,'') 'emp_name',emp_supervisor from employee where UserName='" + s + "'";
                    DataSet leaveset = new DataSet();
                    leaveset = getDataSet(strSql1);
                    string employee_code = "";
                    if (leaveset.Tables.Count > 0)
                    {
                        employee_code = leaveset.Tables[0].Rows[0][0].ToString();
                    }
                    //message = message + " :::: " + appLeveldb.ToString();
                    string level;
                    level = "L" + ApproveLvlcnt;

                    //L+appLeveldb Get Approval Level And Employess Assigned To IT
                    string sql = "SELECT Ea.Emp_ID FROM PayrollGroup Pg INNER JOIN EmployeeAssignedToPayrollGroup Ea ";

                    //r
                    //sql = sql + "  ON Pg.ID=Ea.PayrollGroupID WHERE Pg.GroupName='" + level + "'";
                    sql = sql + "  ON Pg.ID=Ea.PayrollGroupID WHERE Pg.ID=(select payrollGroupid  from EmployeeWorkFlowLevel ";
                    sql = sql + "where rowid='" + ApproveLvlcnt + "'  and workflowid=(select id from EmployeeWorkFlow where workflowname='" + WorkFlowName + "' and Company_id='" + Utility.ToInteger(Session["Compid"]).ToString() + "'))";

                    //new code to get master user
                    sql = sql + "union select distinct userId from MasterCompany_User where companyid='" + Utility.ToInteger(Session["Compid"]).ToString() + "'";

                    SqlDataReader dr2 = DataAccess.ExecuteReader(CommandType.Text, sql, null);
                    System.Collections.ArrayList EmpId = new ArrayList();
                    while (dr2.Read())
                    {
                        EmpId.Add(dr2.GetValue(0));
                    }

                    //Check If Employee Logged In Having rights to Appove the leaves Or Not
                    bool ApproveRights = false;
                    foreach (object ob in EmpId)
                    {
                        if (employee_code == ob.ToString())
                        {
                            ApproveRights = true;
                        }
                    }
                    if (ApproveRights == false)
                    {
                        btnapprove.Enabled = false;
                        message = message + "<br/> (" + Session["Emp_Name"].ToString() + ") Is Not Assigned To " + level + " as Approver";
                    }
                    lblApprovalinfo1.InnerHtml = message;
                }
                else
                {
                    lblApprovalinfo1.InnerHtml = "MultiLevel Approver -Please Select WorkFlow";
                }
            }
            else
            {
                rowApp.Visible = false;
            }
        }
        protected void btnapprove_Click(object sender, EventArgs e)
        {
            string remarks = txtEmpRemarks.Value + " - " + Session["Username"].ToString() + ":" + txtremarks.Text;
            StringBuilder strSucSubmit = new StringBuilder();
            StringBuilder strFailSubmit = new StringBuilder();

            foreach (GridItem item in RadGrid1.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    // CheckBox chkBox = (CheckBox)dataItem.FindControl("CheckBox1");
                    RadioButton rad1 = (RadioButton)dataItem.FindControl("remarkRadio");
                    if (rad1.Checked == true)
                    {
                        int trxid = Utility.ToInteger(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("trx_id"));
                        string type = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("type"));
                        string emp_name = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name"));
                        string empcode = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].Cells[17].Text);
                        string sSQLCheck = "select payrollstatus, isnull(paid_leaves,0) paid_leaves, isnull(unpaid_leaves,0) unpaid_leaves from emp_leaves where trx_id = {0}";
                        sSQLCheck = string.Format(sSQLCheck, Utility.ToInteger(trxid));
                        string status = "";
                        double paid_leaves = 0;
                        double unpaid_leaves = 0;
                        SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQLCheck, null);
                        while (dr.Read())
                        {
                            status = Utility.ToString(dr.GetValue(0));
                            paid_leaves = Utility.ToDouble(dr.GetValue(1));
                            unpaid_leaves = Utility.ToDouble(dr.GetValue(2));
                        }
                        int appLevel = 0;
                        if ((status == "U") || (status == "L" && unpaid_leaves <= 0))
                        {
                            bool flagUpdatefinal = true;
                            int appLeveldb = 0;

                            string strSql = "Select WL.ID,WL.RowID,WorkFlowName +' - L'+ + Cast(WL.RowID as varchar(5)) WorkFlowName ";
                            strSql = strSql + "From( Select ID,WorkFlowName From EmployeeWorkFlow  Where ID IN ";
                            strSql = strSql + "(Select Distinct WorkFlowID From EmployeeWorkFlowLevel Where FlowType=2) ";
                            strSql = strSql + "And Company_ID=" + Utility.ToInteger(Session["Compid"]).ToString() + ") WF Inner Join EmployeeWorkFlowLevel WL ";
                            strSql = strSql + "On WF.ID=WL.WorkFlowID WHERE WL.ID IN(SELECT Leave_supervisor FROM dbo.employee   WHERE emp_code=" + empcode + " ) ";
                            strSql = strSql + "Order By WF.WorkFlowName, WL.RowID";

                            dsleaves = new DataSet();
                            dsleaves = DataAccess.FetchRS(CommandType.Text, strSql, null);

                            if (dsleaves.Tables.Count > 0)
                            {
                                if (dsleaves.Tables[0].Rows.Count > 0)
                                {
                                    flagUpdatefinal = false;
                                    int maxApprovalleval = Utility.ToInteger(dsleaves.Tables[0].Rows[0][1]);
                                    //Approved Open
                                    //If Approved and open status then appLevel =0
                                    SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.Text, "SELECT [STATUS] FROM emp_leaves Where trx_id=" + trxid, null);
                                    while (dr1.Read())
                                    {
                                        if (Utility.ToString(dr1.GetValue(0)) == "Approved" || Utility.ToString(dr1.GetValue(0)) == "Open")
                                        {
                                            appLevel = maxApprovalleval;
                                        }
                                        else
                                        {
                                            appLeveldb = Utility.ToInteger(dr1.GetValue(0));
                                            appLevel = appLeveldb - 1;
                                        }
                                    }
                                    if (appLevel == 1)
                                    {
                                        flagUpdatefinal = true;
                                    }
                                }
                            }

                            if (flagUpdatefinal)
                            {
                                string Sql = "Update emp_leaves set status='Approved',approver='" + varEmpName.Replace("'", "") + "',remarks='" + remarks + "',ApproveDate='" + DateTime.Now.Date.Year + "-" + DateTime.Now.Date.Month + "-" + DateTime.Now.Date.Day + "' where trx_id=" + trxid;
                                //string Sql2 = "";
                                //Sql2 = Sql2 + " UPDATE leaves_annual SET leave_remaining = leave_remaining -  " + paid_leaves + " WHERE emp_id = (SELECT emp_id FROM emp_leaves WHERE trx_id = " + trxid + ") AND ";
                                //Sql2 = Sql2 + " leave_year = (select year(start_date) from emp_leaves WHERE trx_id = " + trxid + " ) ";

                                try
                                {
                                    DataAccess.ExecuteStoreProc(Sql);
                                    strSucSubmit.Append("<br/>" + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name")) + "<br/>");
                                    sendemail(trxid, emp_name, "");
                                    //if (type == "Annual Leave")
                                    //{
                                    //DataAccess.ExecuteStoreProc(Sql2);
                                    //}
                                }
                                catch (Exception ex)
                                {
                                    string ErrMsg = ex.Message;
                                    if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                                    {
                                        //ErrMsg = "<font color = 'Red'>Unable to update the status.Please Try again!</font>";
                                        strFailSubmit.Append("<br/>" + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name")) + "<br/>");
                                    }
                                    else
                                    {
                                        strFailMailMsg.Append("<br/>" + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name")) + "<br/>");
                                    }
                                }
                            }
                            else
                            {
                                string Sql = "Update emp_leaves set status='" + appLevel.ToString() + "',approver='MultiLevel',remarks='" + remarks + "',ApproveDate='" + DateTime.Now.Date.Year + "-" + DateTime.Now.Date.Month + "-" + DateTime.Now.Date.Day + "' where trx_id=" + trxid;
                                //string Sql2 = "";
                                //Sql2 = Sql2 + " UPDATE leaves_annual SET leave_remaining = leave_remaining -  " + paid_leaves + " WHERE emp_id = (SELECT emp_id FROM emp_leaves WHERE trx_id = " + trxid + ") AND ";
                                //Sql2 = Sql2 + " leave_year = (select year(start_date) from emp_leaves WHERE trx_id = " + trxid + " ) ";

                                try
                                {
                                    DataAccess.ExecuteStoreProc(Sql);
                                    strSucSubmit.Append("<br/>" + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name")) + "<br/>");
                                    sendemail(trxid, emp_name, "");
                                    //Send an email to appLevel.ToString() -1  Approver 

                                    int arroverLevel = Convert.ToInt32(appLevel.ToString());
                                    if ((arroverLevel - 1) != 0)
                                    {

                                        //Get List Of All Employeees whose level is arroverLevel-1
                                        string payrollGroup = "SELECT e.email,* FROM employee e WHERE e.emp_code IN (SELECT Ea.Emp_ID FROM PayrollGroup Pg INNER JOIN EmployeeAssignedToPayrollGroup Ea  ON Pg.ID=Ea.PayrollGroupID WHERE Pg.GroupName='L" + (arroverLevel - 1) + "')";

                                        SqlDataReader dr4 = DataAccess.ExecuteReader(CommandType.Text, payrollGroup);
                                        StringBuilder strUpdateBuild = new StringBuilder();

                                        while (dr4.Read())
                                        {
                                            //string emailToSend = dr4.GetValue(0).ToString();
                                            // sendemail(trxid, emp_name, dr4.GetValue(2).ToString());

                                            email = dr4[0].ToString() + ";";
                                            strUpdateBuild.Append(email);
                                        }


                                        sendemail(trxid, emp_name, strUpdateBuild.ToString());

                                        if (appLevel == 1)
                                        {
                                            flagUpdatefinal = true;
                                        }
                                    }
                                    //if (type == "Annual Leave")
                                    //{
                                    //DataAccess.ExecuteStoreProc(Sql2);
                                    //}
                                }
                                catch (Exception ex)
                                {
                                    string ErrMsg = ex.Message;
                                    if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                                    {
                                        //ErrMsg = "<font color = 'Red'>Unable to update the status.Please Try again!</font>";
                                        strFailSubmit.Append("<br/>" + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name")) + "<br/>");
                                    }
                                    else
                                    {
                                        strFailMailMsg.Append("<br/>" + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name")) + "<br/>");
                                    }
                                }

                            }
                        }
                        else
                        {
                            Response.Write("<script language = 'Javascript'>alert('Payroll has been Processed, Action not allowed.');</script>");
                        }
                    }
                }

            }

            if (strSucSubmit.Length > 0)
            {
                ShowMessageBox("Leaves Approved Successfully for: <br/>" + strSucSubmit.ToString());
                strMessage = "";
                rowApp.Visible = false;
            }
            if (strFailSubmit.Length > 0)
            {
                ShowMessageBox("Leaves Not Approved for: <br/>" + strFailSubmit.ToString());
                strMessage = "";
            }
            if (strPassMailMsg.Length > 0)
            {
                ShowMessageBox("Email Send successfully to: <br/>" + strPassMailMsg.ToString());
                strMessage = "";
            }
            if (strFailMailMsg.Length > 0)
            {
                ShowMessageBox("Error While sending Email to: <br/>" + strFailMailMsg.ToString());
                strMessage = "";
            }

            RadGrid1.DataBind();
            txtremarks.Text = "";
        }
        protected void btnreject_Click(object sender, EventArgs e)
        {
            StringBuilder strSucSubmit = new StringBuilder();
            StringBuilder strFailSubmit = new StringBuilder();
            string remarks = txtEmpRemarks.Value + " - " + Session["Username"].ToString() + ":" + txtremarks.Text;

            foreach (GridItem item in RadGrid1.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    RadioButton rad1 = (RadioButton)dataItem.FindControl("remarkRadio");
                    if (rad1.Checked == true)
                    {
                        int trxid = Utility.ToInteger(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("trx_id"));
                        string sSQLCheck = "select payrollstatus from emp_leaves where trx_id = {0}";
                        string emp_name = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name"));
                        sSQLCheck = string.Format(sSQLCheck, Utility.ToInteger(trxid));
                        string status = "";
                        SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQLCheck, null);
                        while (dr.Read())
                        {
                            status = Utility.ToString(dr.GetValue(0));
                        }
                        if (status == "U")
                        {
                            string Sql = "Update emp_leaves set status='Rejected',approver='" + varEmpName + "',remarks='" + remarks + "' where trx_id=" + trxid;
                            try
                            {
                                DataAccess.ExecuteStoreProc(Sql);
                                strSucSubmit.Append("<br/>" + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name")) + "<br/>");
                                sendemail(trxid, emp_name, "");
                            }
                            catch (Exception ex)
                            {
                                string ErrMsg = ex.Message;
                                if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                                {
                                    //ErrMsg = "<font color = 'Red'>Unable to update the status.Please Try again!</font>";
                                    strFailSubmit.Append("<br/>" + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name")) + "<br/>");
                                }
                                else
                                {
                                    strFailMailMsg.Append("<br/>" + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name")) + "<br/>");
                                }
                            }
                        }
                        else
                        {
                            Response.Write("<script language = 'Javascript'>alert('Payroll has been Processed, Action not allowed.');</script>");
                        }
                    }
                }
            }

            if (strSucSubmit.Length > 0)
            {
                ShowMessageBox("Leaves Rejected Successfully for: <br/>" + strSucSubmit.ToString());
                strMessage = "";
            }
            if (strFailSubmit.Length > 0)
            {
                ShowMessageBox("Leaves Not Rejected for: <br/>" + strFailSubmit.ToString());
                strMessage = "";
            }
            if (strPassMailMsg.Length > 0)
            {
                ShowMessageBox("Email Send successfully to: <br/>" + strPassMailMsg.ToString());
                strMessage = "";
            }
            if (strFailMailMsg.Length > 0)
            {
                ShowMessageBox("Error While sending Email to: <br/>" + strFailMailMsg.ToString());
                strMessage = "";
            }
            RadGrid1.DataBind();
            txtremarks.Text = "";
        }
        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (((Utility.AllowedAction1(Session["Username"].ToString(), "Approve and Reject Leaves")) || (Utility.AllowedAction1(Session["Username"].ToString(), "Approve and Reject Leaves for all"))) == false)
            {
                RadGrid1.MasterTableView.GetColumn("TemplateColumn").Visible = false;
            }
        }
        protected void sendemail(int id, string emp_name, string empMultlevel)
        {
            string applicationdate = "";
            string from = "";
            string to = "";
            string SMTPserver = "";
            string SMTPUser = "";
            string SMTPPass = "";
            string status = "";
            string approver = "";
            string from_date = "";
            string to_date = "";
            string reason = "";
            string emailreq = "";
            int SMTPPORT = 25;
            string body = "";
            string cc = "";

            if (empMultlevel.Length <= 0)
            {
                string sSQLemail = "sp_send_email_status";
                SqlParameter[] parmsemail = new SqlParameter[1];
                parmsemail[0] = new SqlParameter("@trx_id", Utility.ToInteger(id));

                SqlDataReader dr3 = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQLemail, parmsemail);
                while (dr3.Read())
                {
                    from = Utility.ToString(dr3.GetValue(18));
                    to = Utility.ToString(dr3.GetValue(15));
                    SMTPserver = Utility.ToString(dr3.GetValue(5));
                    SMTPUser = Utility.ToString(dr3.GetValue(6));
                    SMTPPass = Utility.ToString(dr3.GetValue(7));
                    approver = Utility.ToString(dr3.GetValue(2));
                    status = Utility.ToString(dr3.GetValue(3));
                    applicationdate = Utility.ToString(dr3.GetValue(4));
                    from_date = Utility.ToString(dr3.GetValue(0));
                    to_date = Utility.ToString(dr3.GetValue(1));
                    reason = Utility.ToString(dr3.GetValue(16));
                    body = Utility.ToString(dr3.GetValue(10));
                    SMTPPORT = Utility.ToInteger(dr3.GetValue(12));
                    emailreq = Utility.ToString(dr3.GetValue(17)).ToLower();
                    cc = Utility.ToString(dr3.GetValue(19));
                }
            }
            else
            {
                //string sqlEmail = "SELECT CONVERT(VARCHAR(10), [start_date], 103) [start_date], CONVERT(VARCHAR(10), end_date, 103) [end_date],approver, [status], CONVERT(VARCHAR(10), [Application date], 103) [Application date],b.email_SMTP_server, b.email_username, b.email_password, b.email_sender_domain, b.email_sender_name,b.email_reply_address, b.email_reply_name, b.email_smtp_port, b.email, c.company_id, c.email,a.remarks, b.email_leavealert, b.email_sender, b.ccalert_leaves FROM   emp_leaves a ,company b ,employee c Where c.emp_name='" + emp_name + "'";
                //SqlDataReader dr4 = DataAccess.ExecuteReader(CommandType.Text, sqlEmail, null);


                string sSQLemail1 = "sp_send_email_status";
                SqlParameter[] parmsemail1 = new SqlParameter[1];
                parmsemail1[0] = new SqlParameter("@trx_id", Utility.ToInteger(id));

                SqlDataReader dr5 = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQLemail1, parmsemail1);


                //Decide To And From email :
                string aaprover1 = "";
                if (empMultlevel.Length <= 0)
                {
                    string sqlEmail1 = "SELECT c.email From employee c Where c.emp_name='" + emp_name + "'";
                    SqlDataReader dr6 = DataAccess.ExecuteReader(CommandType.Text, sqlEmail1, null);

                    while (dr6.Read())
                    {
                        aaprover1 = Utility.ToString(dr6.GetValue(0));
                    }
                }
                else
                {
                    aaprover1 = empMultlevel;
                }



                while (dr5.Read())
                {

                    from = Utility.ToString(dr5.GetValue(18));
                    to = aaprover1;
                    SMTPserver = Utility.ToString(dr5.GetValue(5));
                    SMTPUser = Utility.ToString(dr5.GetValue(6));
                    SMTPPass = Utility.ToString(dr5.GetValue(7));
                    approver = Utility.ToString(dr5.GetValue(2));
                    status = Utility.ToString(dr5.GetValue(3));
                    applicationdate = Utility.ToString(dr5.GetValue(4));
                    from_date = Utility.ToString(dr5.GetValue(0));
                    to_date = Utility.ToString(dr5.GetValue(1));
                    reason = Utility.ToString(dr5.GetValue(16)) + " Please Approve Leave";
                    body = Utility.ToString(dr5.GetValue(10));
                    SMTPPORT = Utility.ToInteger(dr5.GetValue(12));
                    emailreq = Utility.ToString(dr5.GetValue(17)).ToLower();
                    cc = Utility.ToString(dr5.GetValue(19));
                }

            }

            SMEPayroll.Model.ANBMailer oANBMailer;

            if (emailreq == "yes")
            {
                string subject = "Leave Requested On " + " " + applicationdate;

                if (empMultlevel.Length > 0)
                {
                    body = body.Replace("@approver", approver);
                    body = body.Replace("@status", status);
                    body = body.Replace("@from_date", from_date);
                    body = body.Replace("@to_date", to_date);
                    body = body.Replace("@reason", reason);

                    compid = Utility.ToInteger(Session["Compid"]);
                    oANBMailer = new SMEPayroll.Model.ANBMailer(compid);

                    oANBMailer.Subject = subject;
                    oANBMailer.MailBody = body;
                    oANBMailer.From = from;
                    oANBMailer.To = to;
                    oANBMailer.Cc = cc;
                }
                else
                {
                    body = body.Replace("@approver", approver);
                    body = body.Replace("@status", status);
                    body = body.Replace("@from_date", from_date);
                    body = body.Replace("@to_date", to_date);
                    body = body.Replace("@reason", reason);

                    compid = Utility.ToInteger(Session["Compid"]);
                    oANBMailer = new SMEPayroll.Model.ANBMailer(compid);

                    oANBMailer.Subject = subject;
                    oANBMailer.MailBody = body;
                    oANBMailer.From = from;
                    oANBMailer.To = to;
                    oANBMailer.Cc = cc;

                }

                //try
                //{
                //    string sRetVal = oANBMailer.SendMail();
                //    if (sRetVal == "")
                //        Response.Write("<Font color=green size=3> An email has been sent to " + to + "</Font> <BR />");
                //    else
                //        Response.Write("<Font color=red size=3> An error occurred: Details are as follows <BR />" + sRetVal + "</Font>");

                //}
                //catch (Exception ex)
                //{
                //    string errMsg = ex.Message;
                //}

                try
                {
                    string sRetVal = oANBMailer.SendMail();
                    if (sRetVal == "")
                    {

                        if (to.Length > 0)
                        {
                            // if (cc.Length > 0)
                            {
                                // strPassMailMsg.Append("<br/>" + emp_name);
                                strPassMailMsg.Append("<br/>" + to);
                            }
                            //else
                            //{
                            //   strPassMailMsg.Append("<br/>" + emp_name);

                            //}
                        }
                    }
                    else
                    {
                        strFailMailMsg.Append("<br/>" + to);


                    }
                }
                catch (Exception ex)
                {
                    strFailMailMsg.Append("<br/>" + emp_name);

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
            StringBuilder sbScript = new StringBuilder();
            //Java Script header            
            sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
            sbScript.Append("// Show messagebox" + Environment.NewLine);
            message = message.Replace("<br/>", "\\n").Replace("\"", "'");
            sbScript.Append(@"alert( """ + message + @""" );");
            sbScript.Append(@"</script>");
            HttpContext.Current.Response.Write(sbScript);

        }


        protected void RadCalendar1_DayRender(object sender, Telerik.Web.UI.Calendar.DayRenderEventArgs e)
        {
            //if (e.Day.Date < DateTime.Now.Date)
            //{
            //    RadCalendarDay specialDay = new RadCalendarDay();
            //    specialDay.Date = e.Day.Date;                
            //    specialDay.ToolTip = "Annual Leave";                
            //    specialDay.TemplateID = "DateTemplate";

            //    RadCalendar1.SpecialDays.Add(specialDay);
            //}
        }

    }






}


