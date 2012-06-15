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
using System.Net.Mail;
using System.IO;
using System.Text;

namespace SMEPayroll.Leaves
{
    public partial class LeaveRequest : System.Web.UI.Page
    {
        string strfromdate = "";
        string strtoddate = "";
        string strMessage = "";
        double dblbalanceavail = 0;
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        private object _dataItem = null;
        double pdleave;
        double updleave;
        string strts;

        static string empcode = "";
        string s = "";
        static int compid;
        static  string username = "";
        public object DataItem
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

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg1.Text = "";
            Session.LCID = 2057;
            AjaxPro.Utility.RegisterTypeForAjax(typeof(LeaveRequest));

            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            string empname = Utility.ToString(Session["Emp_Name"]);
            string emp_code = Utility.ToString(Session["EmpCode"]);
             compid = Utility.ToInteger(Session["Compid"]);
             SqlDataSource2.ConnectionString = Session["ConString"].ToString();

             if (!IsPostBack)
             {
                 rdGetLeaveOnDated.DbSelectedDate = System.DateTime.Now.ToShortDateString();
                 cmbLeaveYear.SelectedValue = System.DateTime.Today.Year.ToString();
                 empcode = emp_code;
                 s = Session["Username"].ToString();

                 BindEmp();
                 FillLeaveTypeCombo();
                 drpname.Items.Insert(0, new ListItem("-select-", "0"));
                 
             }
             detailbind();

             if (Session["GroupName"].ToString().ToUpper() == "SUPER ADMIN" || (Utility.AllowedAction1(Session["Username"].ToString(), "Apply Date On") == true))
             {
                 rdGetLeaveOnDated.Enabled = true;
             }
             else
             {
                 rdGetLeaveOnDated.Enabled = false;
             }
            //Check for 
            string strcompData ="Select LeaveFFDate From Company Where Company_Id="  +compid;
            SqlDataReader dr2 = DataAccess.ExecuteReader(CommandType.Text, strcompData, null);

            while (dr2.Read())
            {
                if (dr2.GetValue(0) != System.DBNull.Value)
                {
                    DateTime dt = new DateTime();
                    dt = Convert.ToDateTime(dr2.GetValue(0).ToString());
                    int val = DateTime.Now.Date.CompareTo(dt);
                    if (val <= 0)
                    {
                        lblMsg1.Visible = true;
                        lblMsg1.Text = " Please use Your Last Year Leaves As they will be forfited as on " + Convert.ToDateTime(dr2.GetValue(0).ToString()).Date.ToString();
                    }
                }
            }
            
        }

        [AjaxPro.AjaxMethod]
        public string getLeavesValidity(string stDate, string enDate, string leaveType, bool bEnableHalfDay, string applyyear,string applyleaveon, string timesession, string username)
        {
            Session.LCID = 2057;
            if (stDate.IndexOf('-') > 0)
            {
                string[] sTemp = stDate.Split('-');
                string[] sTemp2 = enDate.Split('-');

                stDate = sTemp[2] + "/" + sTemp[1] + "/" + sTemp[0];
                enDate = sTemp2[2] + "/" + sTemp2[1] + "/" + sTemp2[0];
            }

            string retVal = "";
            string sSQL = "sp_getLeftLeaves";
            string compID = Utility.ToString(Session["Compid"]);

            SqlParameter[] parms = new SqlParameter[9];
            parms[0] = new SqlParameter("@compid", Utility.ToInteger(compID));
            parms[1] = new SqlParameter("@userName", username);
            parms[2] = new SqlParameter("@stDate", stDate);
            parms[3] = new SqlParameter("@enDate", enDate);
            parms[4] = new SqlParameter("@leave_type", Utility.ToInteger(leaveType));
            parms[5] = new SqlParameter("@applyyear", Utility.ToInteger(applyyear));
            parms[6] = new SqlParameter("@applydateon", Convert.ToDateTime(applyleaveon));
            if (bEnableHalfDay)
            {
                parms[7] = new SqlParameter("@ishalfday", Convert.ToDouble("0.5"));
                parms[8] = new SqlParameter("@timesession", timesession.ToString());
            }
            else
            {
                parms[7] = new SqlParameter("@ishalfday", Convert.ToDouble("0"));
                parms[8] = new SqlParameter("@timesession", "");
            }
            SqlDataReader dr = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQL, parms);
            string temp1 ="";
            string temp2 ="";
            string temp3 = "";
            string temp4 = "";
            while (dr.Read())
            {
                temp1 = Utility.ToString(dr.GetValue(0));
                temp2 = Utility.ToString(dr.GetValue(1));
                temp3 = Utility.ToString(dr.GetValue(2));
                temp4 = Utility.ToString(dr.GetValue(3));

                if (bEnableHalfDay)
                {

                    if (Utility.ToDouble(temp2) == 0.5)
                        temp2 = "1";

                    if (temp1 != "yes")
                    {
                        if (Utility.ToDouble(temp1) == 0.5)
                            // temp1 = "0.5";//r// issue: if there is .5 days leave and if we apply .5 days leave it is moving to unpaid leave.
                            temp1 = "0.0";
                    }

                    if (temp1 == "yes" && Utility.ToDouble(temp2) > 0)
                        temp2 = Utility.ToString(Utility.ToDouble(temp2) - 0.5);
                    else
                    {
                        if (temp1 != "yes" && temp1 != "0.5")
                            if (Utility.ToDouble(temp1) > 0)
                                temp1 = Utility.ToString(Utility.ToDouble(temp1) - 0.5);
                        if (temp1 == "")
                            temp1 = "0";
                        if (Utility.ToDouble(temp2) > 0)
                            temp2 = Utility.ToString(Utility.ToDouble(temp2) - 0.5);
                    }
                }
                double totleave = 0;
                if (temp1.ToString().ToUpper() != "NO")
                {
                    totleave = Utility.ToDouble(dr.GetValue(1));
                    if (temp1.ToString().ToUpper() == "YES")
                    {
                        pdleave = Utility.ToDouble(dr.GetValue(1));
                        updleave = 0;
                    }
                    else
                    {
                        updleave = Utility.ToDouble(dr.GetValue(0));
                        pdleave = totleave - updleave;
                    }
                }
                if (temp3.Length<=0)
                {
                    temp3="0";
                }
                if (temp4.Length <= 0)
                {
                    temp4 = "0";
                }
                retVal = temp1 + ',' + temp2 + ',' + temp3 + ',' + temp4;
            }
            
            
            return Utility.ToString(retVal);
        }

        protected static DataSet getDataSet(string sSQL)
        {
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            return ds;
        }
        private void FillLeaveTypeCombo()
        {
            DataSet ds_leave = new DataSet();
            //string sSQL = "SELECT [id], [type] FROM [leave_types] WHERE id IN (select leave_type from EmployeeLeavesAllowed where ";
            //sSQL += " emp_ID = {0} And leave_year = {1})";
            //sSQL = string.Format(sSQL, Utility.ToInteger(drpname.SelectedValue), Utility.ToInteger(cmbLeaveYear.SelectedValue));
            //ds_leave = getDataSet(sSQL);
            string sSQL = "sp_GetEmployeeLeavePolicy";
            SqlParameter[] parms = new SqlParameter[4];
            parms[0] = new SqlParameter("@empid", Utility.ToInteger(drpname.SelectedValue));
            parms[1] = new SqlParameter("@year", Utility.ToString(cmbLeaveYear.SelectedValue));
            parms[2] = new SqlParameter("@applydateon", Convert.ToDateTime(rdGetLeaveOnDated.SelectedDate.Value.ToShortDateString()));
            parms[3] = new SqlParameter("@filter", -1);
            ds_leave = DataAccess.ExecuteSPDataSet(sSQL, parms);

            drpleave.Items.Clear();
            drpleave.DataSource = ds_leave.Tables[0];
            drpleave.DataTextField = ds_leave.Tables[0].Columns["type"].ColumnName.ToString();
            drpleave.DataValueField = ds_leave.Tables[0].Columns["id"].ColumnName.ToString();
            drpleave.DataBind();
            drpleave.Items.Insert(0, new ListItem("-select-", "0"));
            drpleave.Items.FindByText("-select-").Selected = true;
        }

        protected void imgbtnsave_Click(object sender, EventArgs e)
        {
            string strapply = cmbLeaveYear.SelectedItem.Value;
            string strapplyon = rdGetLeaveOnDated.DbSelectedDate.ToString();
            string startdate = RadDatePicker1.DbSelectedDate.ToString();
            string enddate = RadDatePicker2.DbSelectedDate.ToString();
            string leavetype = drpleave.SelectedItem.Value;
            string approvername = lblsupervisor.Text;

            string code = drpname.SelectedValue;
            string timesession = ddltime.SelectedValue;
            string leaveRemarks = txtRemarks.Text.ToString().Replace("'","");
            string username = drpname.SelectedItem.Value.ToString();
            if (startdate != enddate)
            {
                timesession = "";
            }
            if (startdate == enddate)
            {
                if (chkHalfDayLeave.Checked == false)
                {
                    timesession = "";
                }
            }
            leaveRemarks = Utility.ToString(leaveRemarks);
            strts = timesession;

            string status = "Open";
            //string sSQL1 = "sp_GetLockLeaves";

            string sLeavesTemp = getLeavesValidity(Utility.ToDate(startdate), Utility.ToDate(enddate), leavetype, chkHalfDayLeave.Checked, strapply, strapplyon, timesession, username);
            char[] delimiterChars = {','};
            string[] sTemp = sLeavesTemp.Split(delimiterChars);

            double unpaid_leaves = Utility.ToDouble(sTemp[0]);
            double paid_leaves = Utility.ToDouble(sTemp[1]);
            dblbalanceavail = Convert.ToDouble(sTemp[3]) + paid_leaves;
            paid_leaves = paid_leaves - unpaid_leaves;

            //SqlParameter[] parms1 = new SqlParameter[3];
            //parms1[0] = new SqlParameter("@dtStDate",Utility.ToString(startdate));
            //parms1[1] = new SqlParameter("@dtEndDate", Utility.ToString(enddate));
            //parms1[2] = new SqlParameter("@emp_code", Utility.ToInteger(code));
            //int conLock = 0;
            //SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQL1, parms1);
            //while (dr1.Read())
            //{
            //    conLock = Utility.ToInteger(dr1.GetValue(0));
            //}
            int conLock = 0;
            if (conLock <= 0)
            {
                SqlParameter[] parms = new SqlParameter[12];
                int i = 0;
                parms[i++] = new SqlParameter("@emp_code", code);
                parms[i++] = new SqlParameter("@start_date", startdate);
                parms[i++] = new SqlParameter("@end_date", enddate);
                parms[i++] = new SqlParameter("@leave_type", Utility.ToInteger(leavetype));
                parms[i++] = new SqlParameter("@approver", approvername);
                parms[i++] = new SqlParameter("@status", status);
                parms[i++] = new SqlParameter("@paid_leaves", paid_leaves);
                parms[i++] = new SqlParameter("@unpaid_leaves", unpaid_leaves);
                if (chkHalfDayLeave.Checked)
                    parms[i++] = new SqlParameter("@half_day", Utility.ToInteger(1));
                else
                    parms[i++] = new SqlParameter("@half_day", Utility.ToInteger(0));
                parms[i++] = new SqlParameter("@timesession", timesession);

                // Adding remarks for employee Leave Request
                parms[i++] = new SqlParameter("@remarks", leaveRemarks);
                parms[i++] = new SqlParameter("@applyyear", Utility.ToInteger(cmbLeaveYear.SelectedItem.Value));

                ///* Check alread Applied Leaves */
                //string sSQLCheck = "sp_getAppliedLeaveCount";
                //SqlParameter[] parmsCheck = new SqlParameter[5];
                //parmsCheck[0] = new SqlParameter("@emp_code", Utility.ToInteger(code));
                //parmsCheck[1] = new SqlParameter("@dtStart", Utility.ToString(startdate));
                //parmsCheck[2] = new SqlParameter("@dtEnd", Utility.ToString(enddate));
                //if (chkHalfDayLeave.Checked)
                //    parmsCheck[3] = new SqlParameter("@half_day", Utility.ToInteger(1));
                //else
                //    parmsCheck[3] = new SqlParameter("@half_day", Utility.ToInteger(0));
                //parmsCheck[4] = new SqlParameter("@timesession", timesession);
                //int conLeave = 0;

                //SqlDataReader dr2 = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQLCheck, parmsCheck);

                //while (dr2.Read())
                //{
                //    conLeave = Utility.ToInteger(dr2.GetValue(0));
                //}
                int conLeave = 0;
                if (conLeave <= 0)
                {
                    //string SQL1 = "sp_checkValidLeaveRequest";
                    //SqlParameter[] parmsValidLeaveRequest = new SqlParameter[3];
                    //parmsValidLeaveRequest[0] = new SqlParameter("@emp_id", Utility.ToInteger(code));
                    //parmsValidLeaveRequest[1] = new SqlParameter("@leaverequestfromdate", Utility.ToString(startdate));
                    //parmsValidLeaveRequest[2] = new SqlParameter("@leaverequesttodate", Utility.ToString(enddate));
                    //int validleave = Convert.ToInt32(DataAccess.ExecuteSPScalar(SQL1, parmsValidLeaveRequest));
                    int validleave = 0;
                    int retVal = 0;
                    if (validleave != -100 && validleave != -1)
                    {
                        string SQL = "Sp_ApplyLeave";
                        try
                        {
                            retVal = DataAccess.ExecuteStoreProc(SQL, parms);
                            sendemail();
                            //upload document
                            DocumentUpload();
                            strMessage = "Leave Requested is Applied Successfully. <br/>" + strMessage;
                        }
                        catch (Exception ex)
                        {
                            if (retVal <= 0)
                            {
                                string ErrMsg = ex.Message;
                                if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                                {
                                    ErrMsg = "<font color = 'Red'>Leave request is not saved. Please try again.</font>";
                                    strMessage = "Leave Requested is not saved. Please try again. <br/>" + strMessage;
                                }
                            }
                            else
                            {
                                BindAllRec();
                                strMessage = "Leave Requested is Applied Successfully. <br/> Error Occured While Sending Mail.";
                            }
                        }
                        if (strMessage.Length > 0)
                        {
                            //strMessage = strMessage + "<br/>" + "Leaves Applied Successfully.";
                        }
                    }
                    else
                    {
                        //Response.Write("<script language = 'Javascript'>alert('Please verify the dates of leave application. Leave dates cannot be before the Joining date.');</script>");
                    }
                }
                else
                {
                    //Response.Write("<script language = 'Javascript'>alert('During this period Leaves have already been applied, Try some other dates.');</script>");
                }
                lblmsg.Text = "";
                if (strMessage.Length > 0)
                {
                    lblmsg.Text = strMessage;
                    ShowMessageBox(strMessage);
                    strMessage = "";
                }
                BindAllRec();
            }
            else
            {
                //Response.Write("<script language = 'Javascript'>alert('Payroll has been processed, action is not allowed.');</script>");
            }


           
        }

        string varFileName;
        protected void DocumentUpload()
        {
            try
            {
            
            //Path
            string uploadpath = "../" + "Documents" + "/" + "LeaveDoc";

            if (RadUpload1.UploadedFiles.Count != 0)
            {
                if (Directory.Exists(Server.MapPath(uploadpath)))
                {
                    //if (File.Exists(Server.MapPath(uploadpath) + @"\" + RadUpload1.UploadedFiles[0].GetName()))
                    //{
                    //    string sMsg = "File Already Exist";
                    //    sMsg = "<SCRIPT language='Javascript'>alert('" + sMsg + "');</SCRIPT>";
                    //    Response.Write(sMsg);
                    //    return;
                    //}
                    //else
                    {
                        varFileName = Server.MapPath(uploadpath) + "/" + RadUpload1.UploadedFiles[0].GetName();
                        RadUpload1.UploadedFiles[0].SaveAs(varFileName);
                        varFileName = RadUpload1.UploadedFiles[0].GetName();
                    }
                }
                else

                    Directory.CreateDirectory(Server.MapPath(uploadpath));
                varFileName = Server.MapPath(uploadpath) + "/" + RadUpload1.UploadedFiles[0].GetName();
                RadUpload1.UploadedFiles[0].SaveAs(varFileName);
                varFileName = RadUpload1.UploadedFiles[0].GetName();
            }


            string path = uploadpath + "/" + varFileName;

            if (varFileName == "")
            {
                path = "";
            }
            string sqlUpdate = "UPDATE [dbo].[emp_leaves] SET [path] ='" + path + "' where [trx_id]=(select Top 1 trx_id from emp_leaves order by trx_id desc)";
            DataAccess.FetchRS(CommandType.Text, sqlUpdate, null);
            }
            catch
            {

            }
   
        }

        protected void cmbLeaveYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindAllRec();
        }

        protected void drpname_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindAllRec();
        }
        void BindAllRec()
        {
            detailbind();
            drpleave.Items.Clear();
            FillLeaveTypeCombo();
            RadGrid1.DataBind();
        }
        protected void msgview()
        {
            lblmsg.Text = "";
            imgbtnsave.Enabled = true;

            //string strSql1 = "select e.emp_group_id,b.EmpGroupName from employee e,emp_group b where (e.emp_group_id=b.id) and  e.emp_code=" + drpname.SelectedValue;
            //string strSql2 = "select count(emp_id) cntempid from leaves_annual where emp_id = " + drpname.SelectedValue + " and leave_year > " + cmbLeaveYear.SelectedValue;
            //string strSql3 = "Select count(lal.id) cntempid from Leaves_Allowed lal left outer join leaves_annual lan  on lal.leave_year=lan.leave_year  where lal.Leave_Year = " + cmbLeaveYear.SelectedValue;
            //string strSql4 = "select * from leaves_allowed lal where lal.leave_type = 8 And lal.Leave_Year = " + cmbLeaveYear.SelectedValue;
            //string strSql5 = "select count(emp_id) cntempid from leaves_annual where emp_id = " + drpname.SelectedValue + " and leave_year = " + cmbLeaveYear.SelectedValue;
            string strSql3 = "";
            string strSql1 = "select e.emp_group_id,b.EmpGroupName from employee e,emp_group b where (e.emp_group_id=b.id) and  e.emp_code=" + drpname.SelectedValue;
            string strSql2 = "select count(emp_id) cntempid from EmployeeLeavesAllowed where emp_id = " + drpname.SelectedValue + " and leave_year > " + cmbLeaveYear.SelectedValue;
            if (Session["Leave_Model"].ToString() == "3" || Session["Leave_Model"].ToString() == "4" || Session["Leave_Model"].ToString() == "6" || Session["Leave_Model"].ToString() == "8")
            {
                if (strfromdate.ToString().Length > 0)
                {
                    strSql3 = "select count(emp_id) cntempid from YOSLeavesAllowed where emp_id = " + drpname.SelectedValue + " and (Convert(Datetime,startdate,103) >= Convert(Datetime,'" + strfromdate + "',103) And Convert(Datetime,enddate,103) >= Convert(Datetime,'" + strtoddate + "',103))";
                }
                else
                {
                    strSql3 = "select 0 cntempid ";
                }
            }
            else
            {
                strSql3 = "Select count(lal.id) cntempid from EmployeeLeavesAllowed lal left outer join leaves_annual lan  on lal.leave_year=lan.leave_year  where lal.Leave_Year = " + cmbLeaveYear.SelectedValue;
            }
            string strSql4 = "select * from EmployeeLeavesAllowed lal where lal.emp_id = " + drpname.SelectedValue + " and lal.leave_type = 8 And lal.Leave_Year = " + cmbLeaveYear.SelectedValue;
            //string strSql5 = "select count(emp_id) cntempid from EmployeeLeavesAllowed where emp_id = " + drpname.SelectedValue + " and leave_year = " + cmbLeaveYear.SelectedValue;
            string strSql6 = "select count(emp_id) cntempid from YOSLeavesAllowed yos where yos.leavesallowed > 0 And yos.emp_id = " + drpname.SelectedValue + " And yos.yosyear = " + cmbLeaveYear.SelectedValue;
            DataSet ds = new DataSet();
            //ds = getDataSet(strSql1 + ";" + strSql2 + ";" + strSql3 + ";" + strSql4 + ";" + strSql5);
            ds = getDataSet(strSql1 + ";" + strSql2 + ";" + strSql3 + ";" + strSql4 + ";" + strSql6);
            int intCnt = ds.Tables[0].Rows.Count;
            if (intCnt != 0)
            {
                string gid = Utility.ToString(ds.Tables[0].Rows[0]["emp_group_id"]);
                lblempgroup.Text = Utility.ToString(ds.Tables[0].Rows[0]["EmpGroupName"]);
            }

            intCnt = Utility.ToInteger(ds.Tables[1].Rows[0]["cntempid"]);
            if (intCnt > 0)
            {
                imgbtnsave.Enabled = false;
                lblmsg.Text = "Leave has been already transfered for the Next Year.";
                strMessage = strMessage + "<br/>" + "Leave has been already transfered for the Next Year.";
            }
            else
            {
                if (Utility.ToInteger(drpname.SelectedValue) > 0)
                {
                    if (Utility.ToInteger(ds.Tables[2].Rows[0]["cntempid"]) <= 0)
                    {
                        lblmsg.Text = "Leaves allowed has not been defined for any of the leave type with the selected year.";
                        strMessage = strMessage + "<br/>" + "Leaves allowed has not been defined for any of the leave type with the selected year.";
                        imgbtnsave.Enabled = false;
                    }
                    else
                    {
                        if (Utility.ToInteger(lblLeaveModel.Text.ToString().IndexOf("Year of Service")) >= 0)
                        {
                            if (Utility.ToInteger(ds.Tables[4].Rows[0]["cntempid"]) <= 0)
                            {
                                //lblmsg.Text = "Annual Leaves allowed has not been defined for the employee in the selected year.";
                                //strMessage = strMessage + "<br/>" + "Annual Leaves allowed has not been defined for the employee in the selected year.";
                                //imgbtnsave.Enabled = false;
                            }
                        }
                        else
                        {
                            //if (ds.Tables[3].Rows.Count <= 0)
                            //{
                            //    lblmsg.Text = "Annual Leaves allowed has not been defined for the employee in the selected year.";
                            //    strMessage = strMessage + "<br/>" + "Annual Leaves allowed has not been defined for the employee in the selected year.";
                            //    imgbtnsave.Enabled = false;
                            //}
                            //else
                            //{
                            //    if (Utility.ToInteger(ds.Tables[4].Rows[0]["cntempid"]) <= 0)
                            //    {
                            //        lblmsg.Text = "Please enter Leave remaining or Leave has not been transfered for the selected year.";
                            //        strMessage = strMessage + "<br/>" + "Please enter Leave remaining or Leave has not been transfered for the selected year.";
                            //        imgbtnsave.Enabled = false;
                            //    }
                            //}
                        }
                    }
                }
                else
                {
                    imgbtnsave.Enabled = false;
                }
            }
        }
        protected void  detailbind()
        {
            lblLeaveText.Visible = false;
            int intCnt = 0;
            string strSql = "select a.Leave_supervisor,a.emp_code,a.username, a.emp_name+' '+a.emp_lname 'emp_name',b.emp_name+' '+b.emp_lname 'emp_supervisor', Leave_Model = Case  When  c.leave_model =1 Then 'Fixed Yearly-Normal' When  c.leave_model =7 Then 'Fixed Yearly-Prorated' When  c.leave_model =2 Then 'Fixed Yearly-Prorated(Floor)' When  c.leave_model =5 Then 'Fixed Yearly-Prorated(Ceiling)' When  c.leave_model =3 Then 'Year of Service-Normal' When  c.leave_model =8 Then 'Year of Service-Prorated' When  c.leave_model =4 Then 'Year of Service-Prorated(Floor)' When  c.leave_model =6 Then 'Year of Service-Prorated(Ceiling)' END,";
            strSql += " CONVERT(VARCHAR(11), a.joining_date, 106) joining_date, CONVERT(VARCHAR(11), a.confirmation_date, 106) confirmation_date, a.wdays_per_week from employee a  ";
            strSql += " left Outer join employee b On a.emp_supervisor=b.emp_code ";
            strSql += " Left Outer Join Company c on a.company_id=c.company_id where a.emp_code= " + drpname.SelectedValue;
            DataSet leaveset = new DataSet();
            leaveset = getDataSet(strSql);
            intCnt = leaveset.Tables[0].Rows.Count;
            if (intCnt != 0)
            {
                lblsupervisor.Text = "";

                if (leaveset.Tables[0].Rows[0]["emp_supervisor"] != DBNull.Value)
                {
                    lblsupervisor.Text = Utility.ToString(leaveset.Tables[0].Rows[0]["emp_supervisor"]);
                }
                if (leaveset.Tables[0].Rows[0]["Leave_supervisor"].ToString() != "-1" )
                {
                    if (leaveset.Tables[0].Rows[0]["Leave_supervisor"].ToString() != "")
                    {
                        lblsupervisor.Text = "MultiLevel";// Utility.ToString(leaveset.Tables[0].Rows[0]["Leave_supervisor"]);
                    }
                }
                lblLeaveModel.Text = "";
                if (leaveset.Tables[0].Rows[0]["Leave_Model"] != DBNull.Value)
                {
                    lblLeaveModel.Text = Utility.ToString(leaveset.Tables[0].Rows[0]["Leave_Model"]);
                    string sSQL = "SP_GETYOS";
                    SqlParameter[] pars = new SqlParameter[2];
                    pars[0] = new SqlParameter("@empid", Utility.ToInteger(drpname.SelectedValue.ToString()));
                    pars[1] = new SqlParameter("@applydateon", Convert.ToDateTime(rdGetLeaveOnDated.SelectedDate.Value.ToShortDateString()));
                    SqlDataReader dr = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQL, pars);
                    lblLeaveText.Visible = true;
                    while (dr.Read())
                    {
                        lblLeaveText.Text = Utility.ToString(dr.GetValue(1)) + " - " + Utility.ToString(dr.GetValue(2));
                        strfromdate = Utility.ToString(dr.GetValue(1));
                        strtoddate = Utility.ToString(dr.GetValue(2));
                    }
                }

                lblJoinDate.Text = "";
                if (leaveset.Tables[0].Rows[0]["joining_date"] != DBNull.Value)
                {
                    lblJoinDate.Text = Utility.ToString(leaveset.Tables[0].Rows[0]["joining_date"]);
                }

                lblConfirm.Text = "";
                if (leaveset.Tables[0].Rows[0]["confirmation_date"] != DBNull.Value)
                {
                    lblConfirm.Text = Utility.ToString(leaveset.Tables[0].Rows[0]["confirmation_date"]);
                }

                lblWorkDays.Text = "";
                if (leaveset.Tables[0].Rows[0]["wdays_per_week"] != DBNull.Value)
                {
                    lblWorkDays.Text = Utility.ToString(leaveset.Tables[0].Rows[0]["wdays_per_week"]);
                }


                username = Utility.ToString(leaveset.Tables[0].Rows[0]["username"]);
            }
            msgview();
            if (strMessage.Length > 0)
            {
                ShowMessageBox(strMessage);
                strMessage = "";
            }
          }

        protected void sendemail()
        {
            //string sSQL = "sp_get_leavedetails";
            //SqlParameter[] pars = new SqlParameter[3];
            //pars[0] = new SqlParameter("@Username", Utility.ToInteger(drpname.SelectedValue.ToString()));
            //pars[1] = new SqlParameter("@leave_year", Utility.ToInteger(cmbLeaveYear.SelectedItem.Value));
            //pars[2] = new SqlParameter("@leave_type", Utility.ToInteger(drpleave.SelectedItem.Value));
            //SqlDataReader dr = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQL, pars);
            //double intleaveavail = 0;
            //while (dr.Read())
            //{
            //    intleaveavail = Utility.ToDouble(dr.GetValue(3));
            //}
            

            string code = drpname.SelectedValue;
            string from = "";
            string to = "";
            string SMTPserver = "";
            string SMTPUser = "";
            string SMTPPass = "";
            int SMTPPORT = 25;
            string emp_name = "";
            string from_date = (RadDatePicker1.DbSelectedDate.ToString().Substring(0, 10));
            string to_date = (RadDatePicker2.DbSelectedDate.ToString().Substring(0, 10));
            string emailreq = "";
            string body = "";
            string cc = "";


            string sSQLemail = "sp_send_email";
            SqlParameter[] parmsemail = new SqlParameter[2];
            parmsemail[0] = new SqlParameter("@empcode", Utility.ToInteger(code));
            parmsemail[1] = new SqlParameter("@compid", Utility.ToInteger(compid));
            SqlDataReader dr3 = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQLemail, parmsemail);
            while (dr3.Read())
            {
                from = Utility.ToString(dr3.GetValue(15));
                to = Utility.ToString(dr3.GetValue(2));
                SMTPserver = Utility.ToString(dr3.GetValue(6));
                SMTPUser = Utility.ToString(dr3.GetValue(7));
                SMTPPass = Utility.ToString(dr3.GetValue(8));
                emp_name = Utility.ToString(dr3.GetValue(5));
                body = Utility.ToString(dr3.GetValue(10));
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
                string subject = "Leave Request By " + " " + emp_name;
                body = body.Replace("@emp_name", emp_name);
                body = body.Replace("@from_date", from_date);
                body = body.Replace("@to_date", to_date);
                body = body.Replace("@leave_type", drpleave.SelectedItem.Text.ToString());
                body = body.Replace("@leave_balance", dblbalanceavail.ToString());
                body = body.Replace("@paid_leaves", pdleave.ToString());
                body = body.Replace("@unpaid_leaves", updleave.ToString());
                body = body.Replace("@timesession", strts.ToString());

                SMEPayroll.Model.ANBMailer oANBMailer = new SMEPayroll.Model.ANBMailer(compid);

                oANBMailer.Subject = subject;
                oANBMailer.MailBody = body;
                oANBMailer.From = from;
                //check if MultiLevel -ram
                if (lblsupervisor.Text == "MultiLevel")
                {

                    string sql = @"select email from employee where Emp_code in (select Emp_ID from EmployeeAssignedToPayrollGroup where payrollgroupId=(select PayRollGroupID from EmployeeWorkFlowLevel where ID=(select Leave_supervisor from employee where emp_code=" + code + "))) union select email from employee where emp_code=" + code + "";
                   SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sql, null);
                   string email;
                   StringBuilder strUpdateBuild = new StringBuilder();
                   while (dr.Read())
                   {
                       email = dr[0].ToString()+";";
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
                    strMessage =  strMessage + "<br/>" + "Error Occured While Sending Mail.";
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


        private void BindEmp()
        {
            DataSet ds_employee = new DataSet();
            string sSQL;
            string sgroupname = Utility.ToString(Session["GroupName"]);
            string sUserName = Utility.ToString(Session["Username"]);
            string varEmpCode = Session["EmpCode"].ToString();

            //SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, "SELECT GroupName FROM UserGroups ug, Employee emp WHERE emp.GroupID = ug.GroupID AND emp.UserName = '" + sUserName + "' ", null);
            //if (dr.Read())
            //{
            //    sgroupname = Utility.ToString(dr.GetValue(0));
            //}

            if (sgroupname == "Super Admin" || (Utility.AllowedAction1(Session["Username"].ToString(), "Apply Leaves for all") == true))
            {
                sSQL = "SELECT [emp_code], isnull([emp_name],'')+' '+isnull([emp_lname],'') 'emp_name'  FROM [employee] where termination_date is null and company_id=" + compid + " order by emp_name";
            }
            else
            {

                sSQL = "SELECT [emp_code], isnull([emp_name],'')+' '+isnull([emp_lname],'') 'emp_name'  FROM [employee] where termination_date is null and emp_code='" + varEmpCode + "' and company_id=" + compid + " order by emp_name";
            }
            ds_employee = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            drpname.DataSource = ds_employee.Tables[0];
            drpname.DataTextField = ds_employee.Tables[0].Columns["emp_name"].ColumnName.ToString();
            drpname.DataValueField = ds_employee.Tables[0].Columns["emp_code"].ColumnName.ToString();
            drpname.DataBind();

            drpname.SelectedValue = varEmpCode.ToString();
        }

        protected void rdGetLeaveOnDated_SelectedDateChanged(object sender, Telerik.WebControls.SelectedDateChangedEventArgs e)
        {
            BindAllRec();
        }

        #region Upload document
      
        #endregion

    }
}
