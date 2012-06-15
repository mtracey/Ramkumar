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
using System.IO;
using System.Text;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
//using PdfSecurity;
using System.Threading;

namespace SMEPayroll.Payroll
{
    public partial class PrintPayroll : System.Web.UI.Page
    {
        public delegate void AsyncMethodCaller();
        int cntemail = 0;
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        string strphysicalpath = "";
        int randomnumber;
        SMEPayroll.Model.ANBMailer oANBMailer;
        string compid = "";
        int intcnt;
        DataSet monthDs;
        DataRow[] foundRows;
        DataTable dtFilterFound;
        string sql = null;


        StringBuilder strFailMailMsg = new StringBuilder();
        StringBuilder strPassMailMsg = new StringBuilder();
        private ReportDocument crReportDocument;
        private Database crDatabase;
        private Tables crTables;
        private CrystalDecisions.CrystalReports.Engine.Table crTable;
        private TableLogOnInfo crTableLogOnInfo;
        private ConnectionInfo crConnectionInfo = new ConnectionInfo();
        string from = "";
        string SMTPserver = "";
        string SMTPUser = "";
        string SMTPPass = "";
        string emailreq = "";
        int SMTPPORT = 25;
        string sMonth = "";
        protected string sPDFReportFile = "";
        protected string sPDFReportFile1 = "";
        int empcode;
        string month = "";
        string year = "";
        static int empid;
        String errMsg = "";
        string strstmonth = "";
        string strendmonth = "";

        string strWF = "";
        string strEmpvisible = "";


        protected void deptID_databound(object sender, EventArgs e)
        {
            deptID.Items.Insert(0, new ListItem("ALL", "-1"));
        }

        protected void CallbackMethod(IAsyncResult ar)
        {
            // Retrieve the delegate.
            AsyncMethodCaller caller = (AsyncMethodCaller)ar.AsyncState;

            // Call EndInvoke to retrieve the results.
            caller.EndInvoke(ar);
            Session["result"] = ar;
        }
        protected void GeneratePDFs()
        {
            //method that generates the PDF and stores it on the server
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            strphysicalpath = Request.PhysicalApplicationPath.ToString();
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            compid = Session["Compid"].ToString();
            dataexportmessage.Visible = false;
            if (IsePaySlipEnabled())
                Button3.Enabled = true;
            else
                Button3.Enabled = false;
            int comp_id = Utility.ToInteger(Session["Compid"]);
            SqlDataSource1.ConnectionString = Constants.CONNECTION_STRING;
            SqlDataSource3.ConnectionString = Constants.CONNECTION_STRING;
            if (!IsPostBack)
            {
                #region Yeardropdown
                cmbYear.DataBind();
                #endregion 
                randomnumber = Utility.GetRandomNumberInRange(100000, 10000000);
                hiddenrand.Value = randomnumber.ToString();
                cmbYear.SelectedValue = Utility.ToString(System.DateTime.Today.Year);
                bindMonth();
            }

            if (!IsPostBack)
            {
                //Method to Load grid Seting Persister
                LoadGridSettingsPersister();
            }

            RadGrid1.PageSizeChanged += new GridPageSizeChangedEventHandler(RadGrid1_PageSizeChanged);
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

        void RadGrid1_PageSizeChanged(object source, GridPageSizeChangedEventArgs e)
        {
            //bindGrid1();
        }

        protected void Page_PreRender(Object sender, EventArgs E)
        {
            if (RadGrid1.MasterTableView.Items.Count > 0)
            {
                tbRecord.Visible = true;
                TabId.Visible = true;
                RadGrid1.PagerStyle.Visible = true;
            }
            else
            {
                tbRecord.Visible = false;
                TabId.Visible = false;
                RadGrid1.PagerStyle.Visible = false;
            }
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
        private DataSet GenpayrollDetails
        {
            get
            {
                string sSQL = "sp_ApprovePayRoll";
                SqlParameter[] parms = new SqlParameter[6];
                parms[0] = new SqlParameter("@company_id", Utility.ToInteger(Session["Compid"]));
                parms[1] = new SqlParameter("@month", Utility.ToInteger(cmbMonth.SelectedValue));
                parms[2] = new SqlParameter("@year", Utility.ToInteger(cmbYear.SelectedValue));
                parms[3] = new SqlParameter("@UserID", Utility.ToInteger(Session["EmpCode"].ToString()));
                parms[4] = new SqlParameter("@Status", "G");
                parms[5] = new SqlParameter("@DeptId", Utility.ToInteger(deptID.SelectedValue));
                DataSet ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                return ds;
            }
        }

        //void bindGrid1()
        protected void bindGrid1(object sender, ImageClickEventArgs e)
        {
            intcnt = 1;
            cmbYear.Enabled = false;
            cmbMonth.Enabled = false;
            imgbtnfetch.Enabled = false;

            deptID.Enabled = false;

            Session["ROWID"] = cmbMonth.SelectedValue.ToString();
            Session["ROWYEAR"] = cmbYear.SelectedValue.ToString();

            DataSet ds = new DataSet();
            ds = this.GenpayrollDetails;

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
                RadGrid1.DataBind();

            }
            else
            {

                this.RadGrid1.DataSource = ds;
                RadGrid1.DataBind();
            }
            Button6.Text = "Print Selected Payslip For " + cmbMonth.SelectedItem.Text;
            Button2.Text = "Print All Payslip For " + cmbMonth.SelectedItem.Text;
            Button3.Text = "Email Selected Payslip For " + cmbMonth.SelectedItem.Text;
        
        
        }

        protected void bindgrid(object sender, ImageClickEventArgs e)
        {

            cmbYear.Enabled = false;
            cmbMonth.Enabled = false;
            imgbtnfetch.Enabled = false;
        

            DataSet ds = new DataSet();
            ds = this.GenpayrollDetails;

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
                RadGrid1.DataBind();
           
            }
            else
            {

                this.RadGrid1.DataSource = ds;
                RadGrid1.DataBind();
            }
            Button6.Text = "Print Selected Payslip For " + cmbMonth.SelectedItem.Text;
            Button2.Text = "Print All Payslip For " + cmbMonth.SelectedItem.Text;
            Button3.Text = "Email Selected Payslip For " + cmbMonth.SelectedItem.Text;
        
        }


        protected void PrintPayrollSel_Click(object sender, EventArgs e)
        {
            Session["SelFormula"] = null;
            string payslipFormat = GetPayslipFormat();
            string stremp = "";
            Session["SelFormula"] = "{sp_new_payslip_all2.EMP_CODE}=0";
            if (payslipFormat == "6")
            {
                Session["SelFormula"] = " {sp_new_payslip_Timesheet;1.EMP_CODE}=0";
                 
            }
            //Session["SelFormula_sub"] = "{Sp_getemployeeleavepolicy_Report;1.emp_id}=0";
            bool flag = false;
            string empId="";
            foreach (Telerik.Web.UI.GridItem item in RadGrid1.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        stremp = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_id"));
                        //Session["SelFormula"] = Session["SelFormula"] + " OR {sp_new_payslip_all2.EMP_CODE}=" + stremp;
                        //Session["SelFormula_sub"] = Session["SelFormula_sub"] + " OR {Sp_getemployeeleavepolicy_Report;1.emp_id}=" + stremp;
                        if (empId == "")
                        {
                            empId = stremp;
                        }
                        else
                        {
                            empId = empId + "," + stremp;
                        }
                        if (payslipFormat == "6")
                        {
                            Session["SelFormula"] = Session["SelFormula"] + " OR {sp_new_payslip_Timesheet;1.EMP_CODE}=" + stremp;
                            //{sp_new_payslip_Timesheet;1.EMP_CODE}=0
                        }
                        else
                        {
                            Session["SelFormula"] = Session["SelFormula"] + " OR {sp_new_payslip_all2.EMP_CODE}=" + stremp;
                        }
                        flag = true;
                    }
                }
            }

            if (flag == false)
            {
                lblMessage.Text = "Please Select At least one employee";

            }
            else
            {

                Session["Year_Leave"] = cmbYear.SelectedValue;
                Session["Emp_Leave"] = empid;
                Session["Company_id"] = compid;


                if (payslipFormat == "1")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all1~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
                if (payslipFormat == "2")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all2~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
                if (payslipFormat == "3")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all2~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
                // Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all3~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
                if (payslipFormat == "4")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL4~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
                if (payslipFormat == "5")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL5~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
                if (payslipFormat == "6")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL_TimeSheet_New~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
                if (payslipFormat == "7")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL1_L~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|" + empId + "~ReportType|4");


            }
        }

        protected void PrintPayroll_Click(object sender, EventArgs e)
        {
            //Session["SelFormula"] = null;
            //string payslipFormat = GetPayslipFormat();
            //if (payslipFormat == "1")
            //    Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all1~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
            //if (payslipFormat == "2")
            //    Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all2~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
            //if (payslipFormat == "3")
            //    Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all3~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
            //if (payslipFormat == "4")
            //    Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL4~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
            //if (payslipFormat == "5")
            //    Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL5~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");

            string payslipFormat = GetPayslipFormat();
            string stremp = "";
            Session["SelFormula"] = "{sp_new_payslip_all2.EMP_CODE}=0";

            if (payslipFormat == "6")
            {
                Session["SelFormula"] = "{sp_new_payslip_Timesheet;1.EMP_CODE}=0";
            }
            bool flag = false;
            foreach (Telerik.Web.UI.GridItem item in RadGrid1.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                    stremp = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_id"));

                    if (payslipFormat == "6")
                    {
                        Session["SelFormula"] = Session["SelFormula"] + " OR {sp_new_payslip_Timesheet;1.EMP_CODE}=" + stremp;
                        //{sp_new_payslip_Timesheet;1.EMP_CODE}=0
                    }
                    else
                    {
                        Session["SelFormula"] = Session["SelFormula"] + " OR {sp_new_payslip_all2.EMP_CODE}=" + stremp;
                    }
                    flag = true;
                }
            }

            Session["Year_Leave"] = cmbYear.SelectedValue;
            Session["Emp_Leave"] = empid;
            Session["Company_id"] = compid;

            if (payslipFormat == "1")
                Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all1~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
            if (payslipFormat == "2")
                Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all2~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
            if (payslipFormat == "3")
            {
                Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all2~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
                // Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all3~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
            }
            if (payslipFormat == "4")
                Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL4~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
            if (payslipFormat == "5")
                Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL5~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
            if (payslipFormat == "6")
                Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL_TimeSheet_New~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");
            if (payslipFormat == "7")    
                Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL1_L~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|" + "0" + "~ReportType|4");
        }

        protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "Print")
            {

                GridEditableItem editedItem = e.Item as GridEditableItem;
                object id = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["emp_id"];
                int empid = Utility.ToInteger(id);
                string payslipFormat = GetPayslipFormat();
                string stremp = "";
                Session["SelFormula"] = " {sp_new_payslip_all2.EMP_CODE}=" + id.ToString();
                //if (payslipFormat == "1")
                //    Response.Redirect("../Reports/PrintReport.aspx?QS=payslip1~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~empcode|" + empid);
                //if (payslipFormat == "2")
                //    Response.Redirect("../Reports/PrintReport.aspx?QS=payslip2~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~empcode|" + empid);
                //if (payslipFormat == "3")
                //    Response.Redirect("../Reports/PrintReport.aspx?QS=payslip3~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~empcode|" + empid);
                //if (payslipFormat == "4")
                //    Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP4~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~empcode|" + empid);
                //if (payslipFormat == "5")
                //    Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP5~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~empcode|" + empid);
                if (payslipFormat == "6")
                {
                    Session["SelFormula"] = "{sp_new_payslip_Timesheet;1.EMP_CODE}=" + id.ToString();
                    //{sp_new_payslip_Timesheet;1.EMP_CODE}=0
                }

                //new report for Leave
                //if (payslipFormat == "1")
                //Passing parameter value for Leave
                Session["Year_Leave"] = cmbYear.SelectedValue;
                Session["Emp_Leave"] = empid;
                Session["Company_id"] = compid;
                //Response.Redirect("../Reports/PrintReport_Leave.aspx?QS=payslip_all1_Leave~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");



                if (payslipFormat == "1")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all1~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|" + empid);
                if (payslipFormat == "2")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all2~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|" + empid);
                if (payslipFormat == "3")
                    // Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all3~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|" + empid);
                    Response.Redirect("../Reports/PrintReport.aspx?QS=payslip_all2~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|" + empid);
                if (payslipFormat == "4")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL4~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|" + empid);
                if (payslipFormat == "5")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL5~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|" + empid);
                if (payslipFormat == "6")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL_TimeSheet_New~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|" + empid);
                if (payslipFormat == "7")
                    Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL1_L~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|" + empid + "~ReportType|4");
            }
        }

        protected void RadGrid1_PageIndexChanged(object source, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            RadGrid1.CurrentPageIndex = e.NewPageIndex;
           // bindGrid1();
            //RadGrid1.DataSource = this.GenpayrollDetails;
            //RadGrid1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Session["ClickCount"] == null)
            {
                Session["ClickCount"] = "0";
            }
            if (Session["ClickCount"].ToString() == "0")
            {
                Session["ClickCount"] = Convert.ToInt16(Session["ClickCount"]) + 1;
                //CallMailMethod(1, 0);
                AsyncMethodCaller caller = new AsyncMethodCaller(CallMailMethodThread);
                IAsyncResult result = caller.BeginInvoke(new AsyncCallback(CallbackMethod), caller);
                Session["result"] = result;
            }
        }

        void CallMailMethodThread()
        {
            CallMailMethod(1, 0, 1);
        }

        private string GetPayslipFormat()
        {
            string retVal = "1";
            string sSQL = "select isnull(payslip_format,'1') from company where company_id = {0}";
            sSQL = string.Format(sSQL, Utility.ToInteger(Session["Compid"]));
            SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQL, null);
            while (dr.Read())
            {
                retVal = Utility.ToString(dr.GetValue(0));
            }
            return retVal;
        }

        private bool IsePaySlipEnabled()
        {
            string bTemp = "";
            string sSQL = "SELECT epayslip FROM company WHERE company_id=" + compid;
            System.Data.SqlClient.SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQL);
            while (dr.Read())
            {
                bTemp = Utility.ToString(dr.GetValue(0));
            }

            if (bTemp.ToUpper() == "Y")
                return true;
            else
                return false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (RadGrid1.Items.Count > 0)
            {
                RadGrid1.ExportSettings.ExportOnlyData = true;
                //RadGrid1.ExportSettings.IgnorePaging = CheckBox1.Checked;
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
            if (RadGrid1.Items.Count > 0)
            {
                RadGrid1.ExportSettings.ExportOnlyData = true;
                //RadGrid1.ExportSettings.IgnorePaging = CheckBox1.Checked;
                RadGrid1.ExportSettings.OpenInNewWindow = true;
                RadGrid1.MasterTableView.ExportToWord();
            }
            else
            {
                dataexportmessage.Visible = true;
            }
        }

        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (e.RebindReason != GridRebindReason.InitialLoad)
            {
                intcnt = 1;
                //cmbYear.Enabled = false;
                //cmbMonth.Enabled = false;
                //imgbtnfetch.Enabled = false;

                //deptID.Enabled = false;

                Session["ROWID"] = cmbMonth.SelectedValue.ToString();
                Session["ROWYEAR"] = cmbYear.SelectedValue.ToString();

                DataSet ds = new DataSet();
                ds = this.GenpayrollDetails;

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
                   // RadGrid1.DataBind();

                }
                else
                {

                    this.RadGrid1.DataSource = ds;
                    //RadGrid1.DataBind();
                }
                Button6.Text = "Print Selected Payslip For " + cmbMonth.SelectedItem.Text;
                Button2.Text = "Print All Payslip For " + cmbMonth.SelectedItem.Text;
                Button3.Text = "Email Selected Payslip For " + cmbMonth.SelectedItem.Text;
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

        private string GetPayMonth(string mth)
        {
            string retVal = "1";
            string sSQL = "select [MonthName],Convert(Varchar,PaySubStartDate,103), Convert(Varchar,PaySubEndDate,103)  from PayrollMonthlyDetail where ROWID = {0}";
            sSQL = string.Format(sSQL, Utility.ToInteger(mth));
            SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQL, null);
            while (dr.Read())
            {
                retVal = Utility.ToString(dr.GetValue(0));
                strstmonth = Utility.ToString(dr.GetValue(1));
                strendmonth = Utility.ToString(dr.GetValue(2));
            }
            return retVal;
        }


        private static DataSet GetDataSet(string query)
        {
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, query, null);
            return ds;
        }

        protected void sendemail(int empid, string name, string toemail, string strempname)
        {
            //SMEPayroll.Model.ANBMailer oANBMailer = new SMEPayroll.Model.ANBMailer(Convert.ToInt16(compid));
            string subject = "EPayslip for the period " + sMonth + "/" + year;
            string Body = "Your payroll has been processed for the month of  " + sMonth + "/" + year + " . Please find attached epayslip.";
            oANBMailer.Subject = "EPayslip for the period " + sMonth + "/" + year;
            oANBMailer.MailBody = "Your payroll has been processed for the month of  " + sMonth + "/" + year + " . Please find attached epayslip.";
            oANBMailer.From = from;
            oANBMailer.To = toemail;

            try
            {
                //((Chilkat.Email)oANBMailer).RemoveAttachmentPaths();
                oANBMailer.Attachment = name;
                string sRetVal = oANBMailer.SendMail();

                if (sRetVal == "")
                {
                    if (toemail.Length > 0)
                    {
                        //strPassMailMsg.Append("<br/>" + strempname);
                        strPassMailMsg.Append("Insert Into EmailTrack Values(" + randomnumber.ToString() + "," + cmbMonth.SelectedValue + ",1,getdate()," + Session["EmpCode"] + "," + empid + ",0,'');");
                    }
                    else
                    {
                        //strFailMailMsg.Append("<br/>" + strempname);
                        strFailMailMsg.Append("Insert Into EmailTrack Values(" + randomnumber.ToString() + "," + cmbMonth.SelectedValue + ",1,getdate()," + Session["EmpCode"] + "," + empid + ",1,'No Email ID Assigned.');");
                    }
                }
                else
                {
                    //strFailMailMsg.Append("<br/>" + strempname);
                    strFailMailMsg.Append("Insert Into EmailTrack Values(" + randomnumber.ToString() + "," + cmbMonth.SelectedValue + ",1,getdate()," + Session["EmpCode"] + "," + empid + ",2,'" + sRetVal.ToString() + "');");
                }
            }
            catch (Exception ex)
            {
                //strFailMailMsg.Append("<br/>" + strempname);
                strFailMailMsg.AppendLine("Insert Into EmailTrack Values(" + randomnumber.ToString() + "," + cmbMonth.SelectedValue + ",1,getdate()," + Session["EmpCode"] + "," + empid + ",3,'" + ex.Message + "');");
            }
            finally
            {
                oANBMailer.CleanMail();
                oANBMailer.ToName = "";
                oANBMailer.CcName = "";
                oANBMailer.FromName = "";
                //oANBMailer = null;
            }
            //}
        }

        protected void sendemailheader(int randomnumberint, int emailcount, string toemail)
        {
            //SMEPayroll.Model.ANBMailer oANBMailer = new SMEPayroll.Model.ANBMailer(Convert.ToInt16(compid));
            string subject = "EPayslip for the period " + sMonth + "/" + year;
            string Body = emailcount.ToString() + " e-Payslip sent for the month of  " + sMonth + "/" + year + ", Doc No:" + randomnumberint.ToString();
            oANBMailer.Subject = Body;
            oANBMailer.MailBody = Body;
            oANBMailer.From = from;
            oANBMailer.To = toemail;
            oANBMailer.Attachment = "";

            try
            {
                //((Chilkat.Email)oANBMailer).RemoveAttachmentPaths();
                string sRetVal = oANBMailer.SendMail();

                if (sRetVal == "")
                {
                    if (toemail.Length > 0)
                    {
                        //strPassMailMsg.Append("<br/>" + strempname);
                    }
                    else
                    {
                        //strFailMailMsg.Append("<br/>" + strempname);
                    }
                }
                else
                {
                    //strFailMailMsg.Append("<br/>" + strempname);
                }
            }
            catch (Exception ex)
            {
                //strFailMailMsg.Append("<br/>" + strempname);
                //strFailMailMsg.AppendLine("Insert Into EmailTrack Values(" + randomnumber.ToString() + "," + cmbMonth.SelectedValue + ",'Email Payslip',getdate()," + Session["EmpCode"] + "," + empid + ",3,'" + ex.Message + "');");
            }
            finally
            {
                oANBMailer.CleanMail();
                //oANBMailer = null;
            }
            //}
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


        string strpdffilein = "";
        string strpdffileou = "";
        string strpwd = "";
        protected void CallMailMethod(int iType, int empcode, int issend)
        {
            try
            {
                compid = Utility.ToString(Session["Compid"]);
                //randomnumber = Utility.GetRandomNumberInRange(100000, 10000000);
                randomnumber = Convert.ToInt32(hiddenrand.Value);
                Button3.Text = "Email Payslip, Doc No: " + randomnumber.ToString();
                //this.Button3.Attributes.Add("disabled", "true");
                string sQS = "";
                string payslipFormat = GetPayslipFormat();

                Session["Year_Leave"] = cmbYear.SelectedValue;
                Session["Emp_Leave"] = empid;
                Session["Company_id"] = compid;

                if (iType == 1)
                {
                    if (payslipFormat == "1")
                    {
                        sQS = "payslip_all1~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0";
                    }
                    if (payslipFormat == "2")
                    {
                        sQS = "payslip_all2~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0";
                    }
                    if (payslipFormat == "3")
                    {
                        sQS = "payslip_all2~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0";
                        //sQS = "payslip_all3~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0";
                    }
                    if (payslipFormat == "4")
                    {
                        sQS = "payslip_all4~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0";
                    }
                    if (payslipFormat == "5")
                    {
                        sQS = "payslip_all5~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0";
                    }

                    if (payslipFormat == "6")
                    {
                        //sQS = "payslip_all5~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0";
                        sQS = "PAYSLIP_ALL_TimeSheet_New~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0";
                    }

                    if (payslipFormat == "7")
                    {
                        sQS = "PAYSLIP_ALL1_L~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0~ReportType|4";
                    }
                    //Response.Redirect("../Reports/PrintReport.aspx?QS=PAYSLIP_ALL_TimeSheet_New~month|" + cmbMonth.SelectedValue + "~year|" + cmbYear.SelectedValue + "~compid|" + compid + "~empcode|0");

                }
                string strempemail = "";
                string strempname = "";

                empid = Utility.ToInteger(Session["EmpCode"]);

                //string sQS = Utility.ToString(Request.QueryString["QS"]);
                string[] sParams = sQS.Split('~');

                string sReportFile = strphysicalpath + @"Reports\" + sParams[0] + ".rpt";

                //if (sParams[0] == "PAYSLIP_ALL_TimeSheet_New")
                //{
                //    sReportFile = @"F:\PROJECTS\SHASHANK\SETUPCONFIGXML\XMLFILEGENRATION\WebApplication1\WebApplication1\PAYSLIP_ALL_TimeSheet_New.rpt";//SHA
                //}


                string[] sTemp3 = sParams[1].Split('|');
                string ParamName3 = "@" + sTemp3[0];
                string ParamVal3 = sTemp3[1];
                month = ParamVal3;

                string[] sTemp1 = sParams[2].Split('|');
                string ParamName1 = "@" + sTemp1[0];
                string ParamVal1 = sTemp1[1];
                year = ParamVal1;

                if (month == "1")
                    sMonth = "January";
                if (month == "2")
                    sMonth = "February";
                if (month == "3")
                    sMonth = "March";
                if (month == "4")
                    sMonth = "April";
                if (month == "5")
                    sMonth = "May";
                if (month == "6")
                    sMonth = "June";
                if (month == "7")
                    sMonth = "July";
                if (month == "8")
                    sMonth = "August";
                if (month == "9")
                    sMonth = "September";
                if (month == "10")
                    sMonth = "October";
                if (month == "11")
                    sMonth = "November";
                if (month == "12")
                    sMonth = "December";


                sMonth = GetPayMonth(month);

                DataSet ds = new DataSet();
                //string sSQL = "Select pd.emp_id, Replace(isnull(em.emp_name,'')+' '+isnull(em.emp_lname,''),'/','') emp_name, em.password,em.email,em.email_payslip From prepare_payroll_hdr ph Inner Join prepare_payroll_detail pd on ph.trx_id = pd.trx_id Inner Join Employee em on pd.emp_id = em.emp_code where pd.status ='G' And  (Convert(DateTime,ph.start_period,103) >= Convert(DateTime,'" + strstmonth + "',103)  And Convert(DateTime,ph.end_period,103) <= Convert(DateTime,'" + strendmonth + "',103)) And em.company_id='" + Session["Compid"].ToString() + "' Order By Replace(isnull(em.emp_name,'')+' '+isnull(em.emp_lname,''),'/','')";
                string sSQL = "SELECT c.email_SMTP_server, c.email_username, c.email_password, c.email_sender_domain, c.email_sender_name, c.email_reply_address, c.email_reply_name, c.email_smtp_port, c.email,   c.email_sender,c.pwdrequired FROM   company c  WHERE  c.company_id ='" + Session["Compid"].ToString() + "'";
                ds = GetDataSet(sSQL);
                string strpwdreq = "";
                strpwdreq = Utility.ToString(ds.Tables[0].Rows[0]["pwdrequired"].ToString().Trim());

                crReportDocument = new ReportDocument();
                crReportDocument.Load(sReportFile);

                crConnectionInfo.ServerName = Constants.DB_SERVER;
                crConnectionInfo.DatabaseName = Constants.DB_NAME;
                crConnectionInfo.UserID = Constants.DB_UID;
                crConnectionInfo.Password = Constants.DB_PWD;

                crDatabase = crReportDocument.Database;
                crTables = crDatabase.Tables;

                for (int i = 0; i < crTables.Count; i++)
                {
                    crTable = crTables[i];
                    crTableLogOnInfo = crTable.LogOnInfo;
                    crTableLogOnInfo.ConnectionInfo = crConnectionInfo;
                    crTable.ApplyLogOnInfo(crTableLogOnInfo);
                    crTable.Location = crTable.Name;
                }
                CrystalDecisions.Shared.DiskFileDestinationOptions dfdoReport = new CrystalDecisions.Shared.DiskFileDestinationOptions();
                crReportDocument.ExportOptions.ExportDestinationType = CrystalDecisions.Shared.ExportDestinationType.DiskFile;
                crReportDocument.ExportOptions.ExportFormatType = CrystalDecisions.Shared.ExportFormatType.PortableDocFormat;
                crReportDocument.ExportOptions.DestinationOptions = dfdoReport;

                oANBMailer = new SMEPayroll.Model.ANBMailer(Convert.ToInt16(compid));

                from = Utility.ToString(ds.Tables[0].Rows[0]["email_sender"].ToString().Trim());
                SMTPserver = Utility.ToString(ds.Tables[0].Rows[0]["email_SMTP_server"].ToString().Trim());
                SMTPUser = Utility.ToString(ds.Tables[0].Rows[0]["email_username"].ToString().Trim());
                SMTPPass = Utility.ToString(ds.Tables[0].Rows[0]["email_password"].ToString().Trim());
                SMTPPORT = Utility.ToInteger(ds.Tables[0].Rows[0]["email_smtp_port"].ToString().Trim());

                //for (int j = 0; j < ds.Tables[0].Rows.Count; j++)
                //{


                foreach (Telerik.Web.UI.GridItem item in RadGrid1.MasterTableView.Items)
                {
                    if (item is GridItem)
                    {
                        GridDataItem dataItem = (GridDataItem)item;
                        CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                        if (chkBox.Checked == true)
                        {
                            long ret;
                            strempemail = "";
                            //emailreq = Utility.ToString(ds.Tables[0].Rows[j]["email_payslip"].ToString().Trim());
                            //empcode = Utility.ToInteger(ds.Tables[0].Rows[j]["emp_id"]);
                            //strempname = Utility.ToString(ds.Tables[0].Rows[j]["emp_name"]);
                            //strempemail = Utility.ToString(ds.Tables[0].Rows[j]["email"].ToString().Trim());

                            empcode = Utility.ToInteger(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_id"));
                            if (payslipFormat != "7")
                            {
                                Session["SelFormula"] = " {sp_new_payslip_all2.EMP_CODE}=" + empcode.ToString();
                            }

                            if (payslipFormat == "6")
                            {
                                Session["SelFormula"] = " {sp_new_payslip_Timesheet;1.EMP_CODE}=" + empcode.ToString();
                                //{sp_new_payslip_Timesheet;1.EMP_CODE}=0
                            }

                            strempname = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name"));
                            emailreq = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("email_payslip"));
                            strempemail = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("email"));

                            sPDFReportFile = empcode + "-" + strempname + "-" + sMonth + year + ".pdf";
                            sParams[4] = "empcode|" + Utility.ToString(empcode);
                            CrystalDecisions.Shared.ParameterValues pv = null;
                            CrystalDecisions.Shared.ParameterDiscreteValue pdv = null;

                            strpdffilein = strphysicalpath + @"Documents\TempReports\" + sPDFReportFile;
                            strpdffileou = strphysicalpath + @"Documents\TempReports\Pwd_" + sPDFReportFile;

                            // assigning parameters.
                            for (int i = 1; i < sParams.Length; i++)
                            {
                                string[] sTemp = sParams[i].Split('|');
                                string ParamName = "@" + sTemp[0];
                                string ParamVal = sTemp[1];

                                pv = new CrystalDecisions.Shared.ParameterValues();
                                pdv = new CrystalDecisions.Shared.ParameterDiscreteValue();
                                pdv.Value = ParamVal;
                                pv.Add(pdv);
                                crReportDocument.DataDefinition.ParameterFields[ParamName].ApplyCurrentValues(pv);
                            }

                            //Setting Connection for Sub Report
                            foreach (ReportDocument subreport in crReportDocument.Subreports)
                            {
                                foreach (CrystalDecisions.CrystalReports.Engine.InternalConnectionInfo connection in subreport.DataSourceConnections)
                                {
                                    subreport.DataSourceConnections[Constants.DB_SERVER, Constants.DB_NAME].SetConnection(Constants.DB_SERVER, Constants.DB_NAME, Constants.DB_UID, Constants.DB_PWD);
                                }
                                if (subreport.Name == "Leaves")
                                {
                                    //crReportDocument.SetParameterValue("@applydateon", Convert.ToDateTime(System.DateTime.Today), "LeaveReport");
                                    crReportDocument.SetParameterValue("@month", Utility.ToInteger(63), "Leaves");
                                    crReportDocument.SetParameterValue("@year", Utility.ToInteger(2012), "Leaves");
                                    crReportDocument.SetParameterValue("@compid", Utility.ToInteger(4), "Leaves");
                                    crReportDocument.SetParameterValue("@empcode", Utility.ToInteger(0), "Leaves");
                                    crReportDocument.SetParameterValue("@ReportType", Utility.ToInteger(4), "Leaves");
                                }

                                if (subreport.Name == "ADDITIONS" || subreport.Name == "DEDUCTIONS" || subreport.Name == "TIMESHEET")
                                {

                                    // assigning parameters.
                                    for (int i = 1; i < sParams.Length; i++)
                                    {
                                        string[] sTemp = sParams[i].Split('|');
                                        string ParamName = "@" + sTemp[0];
                                        string ParamVal = sTemp[1];
                                        crReportDocument.SetParameterValue(ParamName, Utility.ToInteger(ParamVal), subreport.Name);
                                        //crReportDocument.SetParameterValue(ParamName, Utility.ToInteger(ParamVal), "DEDUCTIONS");                        
                                    }
                                    //crReportDocument.Subreports["ADDITIONS"].RecordSelectionFormula = Session["SelFormula"].ToString();
                                    //crReportDocument.Subreports["DEDUCTIONS"].RecordSelectionFormula = Session["SelFormula"].ToString();
                                }
                                //Change Paramaters for the month,year,compid,empcode,reporttype etc @ runtime

                            }



                            dfdoReport.DiskFileName = strpdffilein;
                            //dfdoReport.DiskFileName = strpdffileou;                            
                            crReportDocument.Export();

                            if (strpwdreq == "Yes")
                            {
                                // Export 2 PDF.
                                //PdfSecurity.CPdfCryptClass pdf = new PdfSecurity.CPdfCryptClass();
                                //pdf.SetCode("98988D5CC53C747D121970");
                                //string pwdenc = encrypt.SyDecrypt(Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("password")));
                                //ret = pdf.EncryptPdf(strpdffilein, ENCRYPTTYPE.EC_128, (int)(PdfSecurity.PdfSecurity.PS_ALLOWCOPY | PdfSecurity.PdfSecurity.PS_ALLOWPRINTING), "owner", pwdenc, strpdffileou);
                                //strpdffilein = strpdffileou;
                            }
                            if (issend == 1)
                            {
                                if (emailreq == "Y")
                                {
                                    if (strempemail != "")
                                    {
                                        sendemail(empcode, strpdffilein, strempemail, strempname);
                                        cntemail++;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                strFailMailMsg.AppendLine("Insert Into EmailTrack Values(" + randomnumber.ToString() + "," + cmbMonth.SelectedValue + ",1,getdate()," + Session["EmpCode"] + "," + empcode + ",4,'" + ex.Message + "');");
                //string errMsg = ex.Message;
                //Response.Write("<script language='javascript'> alert(" + errMsg + ");</script>");
            }
            finally
            {
                Session["ClickCount"] = "0";
                crReportDocument.Close();
                crReportDocument.Dispose();
                crReportDocument = null;
                //this.Button3.Attributes.Add("disabled", "false");
            }
            if (issend == 1)
            {
                if (strPassMailMsg.Length > 0)
                {
                    //ShowMessageBox("Email Send successfully to: <br/>" + strPassMailMsg.ToString());
                    int retVal = DataAccess.ExecuteStoreProc(strPassMailMsg.ToString());
                }
                if (strFailMailMsg.Length > 0)
                {
                    //ShowMessageBox("Error While sending Email to: <br/>" + strFailMailMsg.ToString());
                    int retVal = DataAccess.ExecuteStoreProc(strFailMailMsg.ToString());
                }

                //if (emailreq == "Y")
                //{
                if (Session["EmpEmail"].ToString().Length > 0)
                {
                    if (cntemail > 0)
                    {
                        sendemailheader(randomnumber, cntemail, Session["EmpEmail"].ToString());
                    }
                }
                //}
            }



            #region Delete the payslip PDF in \Documents\TempReports Folder after E-mail
            //string FilePath = strphysicalpath + @"Documents\TempReports";

            //DirectoryInfo di = new DirectoryInfo(FilePath);
            //di.Attributes = FileAttributes.Normal;

            //foreach (string fileName in System.IO.Directory.GetFiles(FilePath))
            //{
            //    System.IO.FileInfo fileInfo = new System.IO.FileInfo(fileName);
            //    fileInfo.Attributes = FileAttributes.Normal;
            //}

            //string[] filePaths = Directory.GetFiles(FilePath);
            //foreach (string filePath in filePaths)
            //{
            //    File.Delete(filePath);
            //}

            #endregion


        }

        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            //if ((e.Item.ItemType == GridItemType.Item) || (e.Item.ItemType == GridItemType.AlternatingItem))
            //{
            //    try
            //    {
            //        GridEditableItem editedItem = e.Item as GridEditableItem;
            //        string strYN = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["email_payslip"]);
            //        CheckBox chkBox = (CheckBox)editedItem["GridClientSelectColumn"].Controls[0];
            //        chkBox.Visible = false;
            //        if (strYN != null)
            //        {
            //            if (strYN == "Y")
            //            {
            //                chkBox.Visible = true;
            //            }
            //        }

            //    }
            //    catch (Exception ex)
            //    {
            //        string ErrMsg = ex.Message;
            //        if (ErrMsg.IndexOf("REFERENCE constraint", 1) > 0)
            //            ErrMsg = "<font color = 'Red'>Record can not be deleted becuase of REFERENCE constraint. This record is called in other tables</font>";
            //        RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete record. Reason:</font> " + ErrMsg));
            //        e.Canceled = true;
            //    }
            //}
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
            obj1.ExportGridHeader("106", Session["CompanyName"].ToString(), Session["Emp_Name"].ToString(), e);

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
