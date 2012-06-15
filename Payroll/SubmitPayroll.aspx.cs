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
using System.Drawing;
using System.IO;
using System.Text;


using System.Net;

namespace SMEPayroll.Payroll
{
    public partial class SubmitPayroll : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        //protected string strEmpBlockID = "0";
        static string empname = "";
        static int EmpCode;
        string sql = null;
        int intcnt;
        DataSet monthDs;
        DataRow[] foundRows;
        DataTable dtFilterFound;
        string sSQL = null;
        int comp_id;
        string strWF = "";
        string strEmpvisible = "";
        int month_exact;
        protected void Page_Load(object sender, EventArgs e)
        {
            /* To disable Grid filtering options  */
            Telerik.Web.UI.GridFilterMenu menu = RadGrid1.FilterMenu;
            int i = 0;
            AjaxPro.Utility.RegisterTypeForAjax(typeof(SubmitPayroll));

            dataexportmessage.Visible = false;
            while (i < menu.Items.Count)
            {
                menu.Items.RemoveAt(i);
            }

            //btnsubapprove.Attributes.Add("onclick", "this.disabled=true;" );
            //Page.ClientScript.GetPostBackEventReference(btnsubapprove, "");


            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            SqlDataSource1.ConnectionString = Constants.CONNECTION_STRING;
            SqlDataSource3.ConnectionString = Constants.CONNECTION_STRING;

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


            empname = Session["Emp_Name"].ToString();
            EmpCode = Utility.ToInteger(Session["EmpCode"]);

            comp_id = Utility.ToInteger(Session["Compid"]);
            if (!IsPostBack)
            {

                #region Yeardropdown
                cmbYear.DataBind();
                #endregion 
                cmbYear.SelectedValue = Utility.ToString(System.DateTime.Today.Year);
                bindMonth();

                if (Session["GroupName"].ToString().ToUpper() != "SUPER ADMIN")
                {
                    if (Session["PayrollWF"] != null)
                    {
                        if (strWF == "2" && Session["PayrollWF"].ToString() != "")
                        {
                            SessionParameter empid = new SessionParameter();
                            empid.Name = "EmpPassID";
                            empid.Type = TypeCode.String;
                            empid.SessionField = "EmpPassID";

                            if (SqlDataSource1.SelectParameters.Contains(empid) == false)
                            {
                                SqlDataSource1.SelectParameters.Add(empid);
                            }
                        }
                    }
                }

            }
            SqlDataSource1.Selecting += new SqlDataSourceSelectingEventHandler(SqlDataSource1_Selecting);
           // btnsubapprove.Text = "Submit For " + cmbMonth.SelectedItem.Text;

            if (Session["processPayroll"] != null)
            {
                if ((string)Session["processPayroll"].ToString() == "0")
                {
                    //btnsubapprove.Text = "{Submit/Approve/Generate Payroll For }" + cmbMonth.SelectedItem.Text;
                    btnsubapprove.Text = "{Submit/Approve/Generate Payroll }";//+ cmbMonth.SelectedItem.Text;
                }

            }

            if (!IsPostBack)
            {
                //Method to Load grid Seting Persister
                LoadGridSettingsPersister();

            }
            RadGrid1.PreRender+=new EventHandler(RadGrid1_PreRender);
           

            //Check for WorkFlow number 2
            if (strWF == "2" && Session["PayrollWF"]!=null)
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

            //strEmpvisible = "5,127";

            if (strEmpvisible != "")
            {
                Session["EmpPassID"] = strEmpvisible;
            }
            else
            {
                Session["EmpPassID"] = "";
            }

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
                btnPayrollDetail.Visible = true;
                btnPayroll.Visible = true;
                RadGrid1.PagerStyle.Visible = true;
            }
            else
            {
                tbRecord.Visible = false;
                TabId.Visible = false;


                btndetail.Visible = false;
                btnPayrollDetail.Visible = false;
                btnPayroll.Visible = false;
                RadGrid1.PagerStyle.Visible = false;
            }
        }

        void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            //throw new Exception("The method or operation is not implemented.");
            e.Command.CommandTimeout = 1000000;
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

        protected void btnsubapprove_click(object sender, EventArgs e)
        {
            btnsubapprove.Enabled = false;
            
            bool blnisrecsel = false;
            if (Session["SubmitClickCount"] == null)
            {
                Session["SubmitClickCount"] = "0";
            }
            if (Session["SubmitClickCount"].ToString() == "0")
            {
                Session["SubmitClickCount"] = Convert.ToInt16(Session["SubmitClickCount"]) + 1;
                foreach (Telerik.Web.UI.GridItem item in RadGrid1.MasterTableView.Items)
                {
                    if (item is GridItem)
                    {
                        GridDataItem dataItem = (GridDataItem)item;
                        CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                        if (chkBox.Checked == true)
                        {
                            blnisrecsel = true;
                            int empid = Utility.ToInteger(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("Emp_Code"));
                            double NHRate = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("Hourly_Rate"));
                            double basicpay = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("Basic"));
                            double OT1Rate = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("OT1Rate"));
                            double OT2Rate = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("OT2Rate"));
                            double NH_wh = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("NHHrs"));
                            double OT1_wh = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("OT1Hrs"));
                            double OT2_wh = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("OT2Hrs"));
                            double NH_e = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("NH"));
                            double OT1_e = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("OT1"));
                            double OT2_e = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("OT2"));
                            double additions = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("TotalAdditions"));
                            double deductions = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("TotalDeductions"));
                            double Wdays = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("Days_Work"));
                            double NetPay = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("Netpay"));
                            string ot_entitlement = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("OT"));
                            double cpfAdd_Ordinary = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("CPFOrdinaryCeil"));
                            double cpfAdd_Additional = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("CPFAdditionNet"));
                            double cpfNet = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("CPFGross"));
                            double empCPF = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("EmployeeCPFAmt"));
                            double employerCPF = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("EmployerCPFAmt"));
                            double cpfAmount = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("CPFAmount"));
                            string cpf_entitlement = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("CPF"));
                            int empcpftype = Utility.ToInteger(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("EmpCPFType"));
                            double pr_years = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("PRAge"));
                            double cpf_ceiling = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("CPFCeiling"));
                            string fund_type = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("FundType"));
                            double fund_amount = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("FundAmount"));
                            double unpaid_leaves = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("UnPaidLeaves"));
                            double unpaid_leaves_amount = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("TotalUnPaid"));
                            double total_gross = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("GrossWithAddition"));
                            string pay_mode = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("Pay_Mode"));
                            string employee_giroacc = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("EmployeeGiro"));
                            string employer_giroacc = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("EmployerGiro"));
                            string giro_bank = Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("GiroBank"));

                            double fundgrossamount = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("FundGrossAmount"));
                            double sdlfundgrossamount = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("SDLFundGrossAmount"));

                            double CMOW = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("CMOW"));
                            double LYOW = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("LYOW"));
                            double CYOW = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("CYOW"));
                            double CPFAWCIL = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("CPFAWCIL"));
                            double EST_AWCIL = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("EST_AWCIL"));
                            double ACTCIL = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("ACTCIL"));
                            double AWCM = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("AWCM"));
                            double AWB4CM = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("AWB4CM"));
                            double AWCM_AWB4CM = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("AWCM_AWB4CM"));
                            double AWSUBJCPF = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("AWSUBJCPF"));
                            int SDFREQUIRED = Utility.ToInteger(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("SDF_REQUIRED"));
                            double dailyrate = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("Daily_Rate"));
                            double daysworkedrate = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("DaysWorkedRate"));

                            string status = "P";
                            int i = 0;
                            SqlParameter[] parms = new SqlParameter[54];
                            parms[i++] = new SqlParameter("@emp_id", Utility.ToInteger(empid));
                            parms[i++] = new SqlParameter("@basic_pay", Utility.ToDouble(basicpay));
                            parms[i++] = new SqlParameter("@NHRate", Utility.ToDouble(NHRate));
                            parms[i++] = new SqlParameter("@OT1Rate", Utility.ToDouble(OT1Rate));
                            parms[i++] = new SqlParameter("@OT2Rate", Utility.ToDouble(OT2Rate));
                            parms[i++] = new SqlParameter("@NH_wh", Utility.ToDouble(NH_wh));
                            parms[i++] = new SqlParameter("@OT1_wh", Utility.ToDouble(OT1_wh));
                            parms[i++] = new SqlParameter("@OT2_wh", Utility.ToDouble(OT2_wh));
                            parms[i++] = new SqlParameter("@NH_e", Utility.ToDouble(NH_e));
                            parms[i++] = new SqlParameter("@OT1_e", Utility.ToDouble(OT1_e));
                            parms[i++] = new SqlParameter("@OT2_e", Utility.ToDouble(OT2_e));
                            parms[i++] = new SqlParameter("@Wdays", Utility.ToDouble(Wdays));
                            parms[i++] = new SqlParameter("@NetPay", NetPay.ToString());
                            parms[i++] = new SqlParameter("@total_additions", Utility.ToDouble(additions));
                            parms[i++] = new SqlParameter("@total_deductions", Utility.ToDouble(deductions));
                            parms[i++] = new SqlParameter("@ot_entitlement", Utility.ToString(ot_entitlement));
                            parms[i++] = new SqlParameter("@cpfadd_ord", Utility.ToDouble(cpfAdd_Ordinary));
                            parms[i++] = new SqlParameter("@cpfadd_additional", Utility.ToDouble(cpfAdd_Additional));
                            parms[i++] = new SqlParameter("@cpf_net", Utility.ToDouble(cpfNet));
                            parms[i++] = new SqlParameter("@empCPF", Utility.ToDouble(empCPF));
                            parms[i++] = new SqlParameter("@employerCPF", Utility.ToDouble(employerCPF));
                            parms[i++] = new SqlParameter("@cpfAmount", Utility.ToDouble(cpfAmount));
                            parms[i++] = new SqlParameter("@cpfEntitlement", Utility.ToString(cpf_entitlement));
                            parms[i++] = new SqlParameter("@empCpfType", Utility.ToDouble(empcpftype));
                            parms[i++] = new SqlParameter("@pr_years", Utility.ToDouble(pr_years));
                            parms[i++] = new SqlParameter("@cpf_ceiling", Utility.ToDouble(cpf_ceiling));
                            parms[i++] = new SqlParameter("@fund_type", Utility.ToString(fund_type));
                            parms[i++] = new SqlParameter("@fund_amount", Utility.ToDouble(fund_amount));
                            parms[i++] = new SqlParameter("@status", Utility.ToString(status));
                            parms[i++] = new SqlParameter("@month", Utility.ToInteger(cmbMonth.SelectedValue));
                            parms[i++] = new SqlParameter("@year", Utility.ToInteger(cmbYear.SelectedValue));
                            parms[i++] = new SqlParameter("@unpaid_leaves", Utility.ToDouble(unpaid_leaves));
                            parms[i++] = new SqlParameter("@unpaid_leaves_amount", Utility.ToDouble(unpaid_leaves_amount));
                            parms[i++] = new SqlParameter("@total_gross", Utility.ToDouble(total_gross));
                            parms[i++] = new SqlParameter("@pay_mode", Utility.ToString(pay_mode));
                            parms[i++] = new SqlParameter("@employee_giroacc", Utility.ToString(employee_giroacc));
                            parms[i++] = new SqlParameter("@employer_giroacc", Utility.ToString(employer_giroacc));
                            parms[i++] = new SqlParameter("@giro_bank", Utility.ToString(giro_bank));
                            parms[i++] = new SqlParameter("@submitted_by", Utility.ToString(EmpCode));
                            parms[i++] = new SqlParameter("@fundgrossamount", Utility.ToDouble(fundgrossamount));
                            parms[i++] = new SqlParameter("@sdlfundgrossamount", Utility.ToDouble(sdlfundgrossamount));
                            parms[i++] = new SqlParameter("@CMOW", Utility.ToDouble(CMOW));
                            parms[i++] = new SqlParameter("@LYOW", Utility.ToDouble(LYOW));
                            parms[i++] = new SqlParameter("@CYOW", Utility.ToDouble(CYOW));
                            parms[i++] = new SqlParameter("@CPFAWCIL", Utility.ToDouble(CPFAWCIL));
                            parms[i++] = new SqlParameter("@EST_AWCIL", Utility.ToDouble(EST_AWCIL));
                            parms[i++] = new SqlParameter("@ACTCIL", Utility.ToDouble(ACTCIL));
                            parms[i++] = new SqlParameter("@AWCM", Utility.ToDouble(AWCM));
                            parms[i++] = new SqlParameter("@AWB4CM", Utility.ToDouble(AWB4CM));
                            parms[i++] = new SqlParameter("@AWCM_AWB4CM", Utility.ToDouble(AWCM_AWB4CM));
                            parms[i++] = new SqlParameter("@AWCPF", Utility.ToDouble(AWSUBJCPF));
                            parms[i++] = new SqlParameter("@sdfrequired", Utility.ToInteger(SDFREQUIRED));
                            parms[i++] = new SqlParameter("@dailyrate", Utility.ToDouble(dailyrate));
                            parms[i++] = new SqlParameter("@daysworkedrate", Utility.ToDouble(daysworkedrate));

                            sSQL = "sp_payroll_add";
                            try
                            {

                                if (Session["processPayroll"] == null)
                                {
                                    DataAccess.ExecuteStoreProc(sSQL, parms);
                                }

                                if (Session["processPayroll"] != null)
                                {

                                    if ((string)Session["processPayroll"].ToString() == "1")
                                    {
                                        DataAccess.ExecuteStoreProc(sSQL, parms);
                                    }

                                    //Process the Payroll For Selected Employee As Submit/Approve/Generate
                                    if ((string)Session["processPayroll"].ToString() == "0")
                                    {
                                        DataAccess.ExecuteStoreProc(sSQL, parms);

                                        DataSet ds = new DataSet();
                                        SqlParameter[] param1 = new SqlParameter[5];
                                        param1[0] = new SqlParameter("@company_id", Utility.ToInteger(Session["compid"]));
                                        param1[1] = new SqlParameter("@month", Utility.ToInteger(cmbMonth.SelectedValue));
                                        param1[2] = new SqlParameter("@year", Utility.ToInteger(cmbYear.SelectedValue));
                                        param1[3] = new SqlParameter("@UserID", Utility.ToInteger(empid));
                                        param1[4] = new SqlParameter("@Status", "P");
                                        ds = DataAccess.FetchRS(CommandType.StoredProcedure, "sp_ApprovePayRoll", param1);

                                        if (ds.Tables.Count > 0)
                                        {
                                            foreach (DataRow dr in ds.Tables[0].Rows)
                                            {
                                                //exec sp_payroll_Update @trx_id=4671,@trxdate=N'30/01/2012 11:01:01',@status=N'A'
                                                SqlParameter[] param2 = new SqlParameter[3];
                                                int c = 0;
                                                param2[c++] = new SqlParameter("@trx_id", Utility.ToInteger(dr["trx_id"].ToString()));
                                                param2[c++] = new SqlParameter("@trxdate", Utility.ToString(System.DateTime.Now.Month + "/" + System.DateTime.Now.Day + "/" + System.DateTime.Now.Year));
                                                char App = 'A';
                                                param2[c++] = new SqlParameter("@status", "A");
                                                DataAccess.ExecuteStoreProc("sp_payroll_Update", param2);
                                            }
                                        }

                                        //Generate the Payroll

                                        //exec sp_ApprovePayRoll @company_id=3,@month=61,@year=2012,@UserID=88,@Status=N'A'

                                        //exec sp_payroll_Update @trx_id=4671,@status=N'G',@trxdate=N'30/01/2012 11:04:28'

                                        ds = null;

                                        SqlParameter[] param3 = new SqlParameter[5];
                                        param3[0] = new SqlParameter("@company_id", Utility.ToInteger(Session["compid"]));
                                        param3[1] = new SqlParameter("@month", Utility.ToInteger(cmbMonth.SelectedValue));
                                        param3[2] = new SqlParameter("@year", Utility.ToInteger(cmbYear.SelectedValue));
                                        param3[3] = new SqlParameter("@UserID", Utility.ToInteger(empid));
                                        param3[4] = new SqlParameter("@Status", "A");
                                        ds = DataAccess.FetchRS(CommandType.StoredProcedure, "sp_ApprovePayRoll", param3);

                                        if (ds.Tables.Count > 0)
                                        {
                                            foreach (DataRow dr in ds.Tables[0].Rows)
                                            {
                                                //exec sp_payroll_Update @trx_id=4671,@status=N'G',@trxdate=N'30/01/2012 11:04:28'
                                                SqlParameter[] param4 = new SqlParameter[3];
                                                param4[0] = new SqlParameter("trx_id", Utility.ToInteger(dr["trx_id"].ToString()));
                                                param4[1] = new SqlParameter("@trxdate", Utility.ToString(System.DateTime.Now.Month + "/" + System.DateTime.Now.Day + "/" + System.DateTime.Now.Year));
                                                char App1 = 'G';
                                                param4[2] = new SqlParameter("@status", "G");
                                                DataAccess.ExecuteStoreProc("sp_payroll_Update", param4);
                                            }
                                        }


                                    }
                                }
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
                Session["SubmitClickCount"] = "0";
                sendemail();
                RadGrid1.DataBind();

                if (blnisrecsel == false)
                {
                    ShowMessageBox("Please Select Employees to Submit Payroll");
                }

            }
        }

        protected void bindgrid(object sender, ImageClickEventArgs e)
        {
            if (strEmpvisible != "")
            {
                Session["EmpPassID"] = strEmpvisible;
            }
            else
            {
                Session["EmpPassID"] = "";
            }

            btnsubapprove.Enabled = true;
            CallBeforeMonthFill();
            SetControlDate();
            intcnt = 1;
            cmbYear.Enabled = false;
            cmbMonth.Enabled = false;
            imgbtnfetch.Enabled = false;

            deptID.Enabled = false;

            

            RadGrid1.DataBind();

            Session["ROWID"] = cmbMonth.SelectedValue.ToString();
            Session["ROWYEAR"] = cmbYear.SelectedValue.ToString();
           
        }

        protected void sendemail()
        {
            string month = "";
            int i = 0;
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            string ssql = "sp_GetPayrollMonth";// 0,2009,2
            SqlParameter[] parms = new SqlParameter[3];
            parms[i++] = new SqlParameter("@ROWID", "0");
            parms[i++] = new SqlParameter("@YEARS", 0);
            parms[i++] = new SqlParameter("@PAYTYPE", Session["PAYTYPE"].ToString());
            monthDs = DataAccess.ExecuteSPDataSet(ssql, parms);

            DataRow[] drResults = monthDs.Tables[0].Select("RowID = " + cmbMonth.SelectedValue);
            foreach (DataRow drnew in drResults)
            {
                month = drnew["Month"].ToString();
            }

            string from = "";
            string to = "";
            string SMTPserver = "";
            string SMTPUser = "";
            string SMTPPass = "";
            string approver = empname;
            string year = cmbYear.SelectedValue;
            string emailreq = "";
            int SMTPPORT = 25;
            string body = "";
            string cc = "";

            string SQL = "select email from employee where Emp_Code=" + EmpCode;
            SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, SQL, null);
            while (dr.Read())
            {
                from = Utility.ToString(dr.GetValue(0));
            }
            sSQL = "sp_submit_email1";
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = new SqlParameter("@comp_id", Utility.ToInteger(Session["compid"]));
            SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQL, parm);
            while (dr1.Read())
            {
                to = Utility.ToString(dr1.GetValue(6));
                SMTPserver = Utility.ToString(dr1.GetValue(0));
                SMTPUser = Utility.ToString(dr1.GetValue(1));
                SMTPPass = Utility.ToString(dr1.GetValue(2));
                emailreq = Utility.ToString(dr1.GetValue(5)).ToLower();
                SMTPPORT = Utility.ToInteger(dr1.GetValue(4));
                body = Utility.ToString(dr1.GetValue(3));
                cc = Utility.ToString(dr1.GetValue(8));
            }
            if (emailreq == "yes")
            {
                string subject = "Payroll for the period " + month + "/" + year;
                body = body.Replace("@month", month);
                body = body.Replace("@year", year);
                body = body.Replace("@hr", empname);

                SMEPayroll.Model.ANBMailer oANBMailer = new SMEPayroll.Model.ANBMailer(Utility.ToInteger(Session["Compid"]));

                oANBMailer.Subject = subject;
                oANBMailer.MailBody = body;
                oANBMailer.From = from;
                oANBMailer.To = to;
                oANBMailer.Cc = cc;

                try
                {
                    string sRetVal = oANBMailer.SendMail();
                    if (sRetVal == "")
                        //Response.Write("<Font color=green size=3> An email has been sent to " + to + "</Font> <BR />");
                        lblLoading.Text = "An email has been sent to " + to + "";

                    else
                        // Response.Write("<Font color=red size=3> An error occurred: Details are as follows <BR />" + sRetVal + "</Font>");
                        lblLoading.Text = "An error occurred while Email";

                }
                catch (Exception ex)
                {
                    string errMsg = ex.Message;
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //RadGrid1.DataSourceID = "SqlDataSource1";
            //if (RadGrid1.Items.Count > 0)
            //{
            //    RadGrid1.ExportSettings.ExportOnlyData = true;
            //    RadGrid1.ExportSettings.IgnorePaging = CheckBox1.Checked;
            //    RadGrid1.ExportSettings.OpenInNewWindow = true;
            //    RadGrid1.MasterTableView.ExportToExcel();
            //}
            //else
            //{
            //    dataexportmessage.Visible = true;
            //}
        }

        [AjaxPro.AjaxMethod]
        public string btndetail_Click(int monthid, int yearid)
        {
            int i = 0;
            string ssql = "sp_GetPayrollMonth";// 0,2009,2
            SqlParameter[] parms = new SqlParameter[3];
            parms[i++] = new SqlParameter("@ROWID", "0");
            parms[i++] = new SqlParameter("@YEARS", 0);
            parms[i++] = new SqlParameter("@PAYTYPE", Session["PAYTYPE"].ToString());
            monthDs = DataAccess.ExecuteSPDataSet(ssql, parms);
            DataRow[] drResults = monthDs.Tables[0].Select("RowID = " + monthid.ToString());
            string str = "";
            foreach (DataRow dr in drResults)
            {
                Session["PayStartDay"] = dr["PayStartDay"].ToString();
                Session["PayEndDay"] = dr["PayEndDay"].ToString();
                Session["PaySubStartDay"] = dr["PaySubStartDay"].ToString();
                Session["PaySubEndDay"] = dr["PaySubEndDay"].ToString();
                //Session["EmpPassID"] = dr["emp_code"].ToString();
                str = "paydetailreport.aspx?UserID=" + Session["EmpCode"].ToString() + "&Month=" + dr["Month"].ToString() + "&stdatemonth=" + Session["PayStartDay"].ToString() + "&endatemonth=" + Session["PayEndDay"].ToString() + "&stdatesubmonth=" + Session["PaySubStartDay"].ToString() + "&endatesubmonth=" + Session["PaySubEndDay"].ToString() + "&monthidintbl=" + monthid.ToString() + "&Year=" + yearid.ToString() + "&company_id=" + Session["Compid"].ToString() + "&EmpPassID=" + Session["EmpPassID"];
            }
            string popupScript = "<script language='javascript'>" + "window.open('', '" + str + "', " + "'width=1000, height=1000, menubar=yes, resizable=yes')" + "</script>";
            return str;
        }

        //[AjaxPro.AjaxMethod]
        protected void btnPayroll_Click(object sender, EventArgs e)
        {
            //int i = 0;
            //string ssql = "sp_GetPayrollMonth";// 0,2009,2
            //SqlParameter[] parms = new SqlParameter[3];
            //parms[i++] = new SqlParameter("@ROWID", "0");
            //parms[i++] = new SqlParameter("@YEARS", 0);
            //parms[i++] = new SqlParameter("@PAYTYPE", Session["PAYTYPE"].ToString());
            //monthDs = DataAccess.ExecuteSPDataSet(ssql, parms);
            //DataRow[] drResults = monthDs.Tables[0].Select("RowID = " + monthid.ToString());
            string str = "";
            string empid = "0";
            foreach (Telerik.Web.UI.GridItem item in RadGrid1.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        empid = empid + "," + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("Emp_Code"));
                    }
                }
            }


            if (empid == "0")
            {
                str = "payrolldetailreport.aspx?EmpPassID=&UserID=" + Session["EmpCode"].ToString() + "&Month=" + Session["ROWID"].ToString() + "&stdatemonth=" + Session["PayStartDay"].ToString() + "&endatemonth=" + Session["PayEndDay"].ToString() + "&stdatesubmonth=" + Session["PaySubStartDay"].ToString() + "&endatesubmonth=" + Session["PaySubEndDay"].ToString() + "&monthidintbl=" + Session["ROWID"].ToString() + "&Year=" + Session["ROWYEAR"].ToString() + "&company_id=" + Session["Compid"].ToString();
            }
            else
            {
                str = "payrolldetailreport.aspx?EmpPassID=" + empid + "&UserID=" + Session["EmpCode"].ToString() + "&Month=" + Session["ROWID"].ToString() + "&stdatemonth=" + Session["PayStartDay"].ToString() + "&endatemonth=" + Session["PayEndDay"].ToString() + "&stdatesubmonth=" + Session["PaySubStartDay"].ToString() + "&endatesubmonth=" + Session["PaySubEndDay"].ToString() + "&monthidintbl=" + Session["ROWID"].ToString() + "&Year=" + Session["ROWYEAR"].ToString() + "&company_id=" + Session["Compid"].ToString();
            }
            string popupScript = "<script language='javascript'>" + "window.open('', '" + str + "', " + "'width=1000, height=1000, menubar=yes, resizable=yes')" + "</script>";
            HttpContext.Current.Response.Write("<SCRIPT language='Javascript'>window.open('" + str + "');</SCRIPT>");

            
            //return str;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            RadGrid1.DataSourceID = "SqlDataSource1";
            if (RadGrid1.Items.Count > 0)
            {
                //RadGrid1.ExportSettings.ExportOnlyData = true;
                //RadGrid1.ExportSettings.IgnorePaging = CheckBox1.Checked;
                //RadGrid1.ExportSettings.OpenInNewWindow = true;
                //RadGrid1.MasterTableView.ExportToWord();
            }
            else
            {
                dataexportmessage.Visible = true;
            }

            //WebRequest mywebReq;
            //WebResponse mywebResp;
            //StreamReader sr;
            //string strHTML;
            //StreamWriter sw;

            //string strurl = Request.Url.ToString().Substring(0, Request.Url.ToString().LastIndexOf("/")) + "/EmployeePayReport.aspx?qsEmpID=11&qsMonth=151&qsYear=2010&st=1&en=30&stmonth=1/10/2010&endmonth=15/10/2010&monthintbl=151";
            //mywebReq = WebRequest.Create(strurl);
            //mywebResp = mywebReq.GetResponse();
            //sr = new StreamReader(mywebResp.GetResponseStream());
            //strHTML = sr.ReadToEnd();
            //sw = File.CreateText(Server.MapPath("temp.html"));
            //sw.WriteLine(strHTML);
            //sw.Close();
            //Response.WriteFile(Server.MapPath("temp.html"));



        }

        protected void RadGrid1_PreRender(object sender, EventArgs e)  
        {
            
        }  



        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            double netpay = 0;
            if (e.Item.ItemType == GridItemType.Item || e.Item.ItemType == GridItemType.AlternatingItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                System.Web.UI.WebControls.HyperLink Img = (System.Web.UI.WebControls.HyperLink)item.FindControl("Image3");
                string strMediumUrl = e.Item.Cells[37].Text;
                string strmsg = "javascript:ShowInsert('" + strMediumUrl + "');";
                Img.Attributes.Add("onclick", strmsg);
                if (e.Item.Cells[26].Text != "&nbsp;")
                {
                    netpay = Utility.ToDouble(e.Item.Cells[26].Text);
                }
                if (netpay < 0)
                {
                    e.Item.Cells[26].BackColor = Color.Red;
                }
                if (e.Item.Cells[50].Text.ToString() == "0")
                {
                    ((CheckBox)item["GridClientSelectColumn"].Controls[0]).Visible = false;
                }

               // //foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
               //// {
               //     if (strEmpvisible != "")
               //     {
               //         char char1 = ',';
               //         string[] array = strEmpvisible.Split(char1);
               //         foreach (string str in array)
               //         {
               //             if (item["Emp_Code"].Text == str)
               //             {
               //                 e.Item.Visible = true;
               //             }
               //             else
               //             {
               //                 e.Item.Visible = false;
               //             }
               //         }

               //     }
               //// }

                
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

                //if (strEmpvisible != "")
                //{
                //    Session["EmpPassID"] = strEmpvisible;
                //}
                //else
                //{
                //    Session["EmpPassID"] = "";
                //}
            }

            
        }
        [AjaxPro.AjaxMethod]
        public string btnPayrollDetail_Click(int monthid, int yearid)
        {
            int i = 0;
            string ssql = "sp_GetPayrollMonth";// 0,2009,2
            SqlParameter[] parms = new SqlParameter[3];
            parms[i++] = new SqlParameter("@ROWID", "0");
            parms[i++] = new SqlParameter("@YEARS", 0);
            parms[i++] = new SqlParameter("@PAYTYPE", Session["PAYTYPE"].ToString());
            monthDs = DataAccess.ExecuteSPDataSet(ssql, parms);
            DataRow[] drResults = monthDs.Tables[0].Select("RowID = " + monthid.ToString());
            string str = "";
            foreach (DataRow dr in drResults)
            {
                Session["PayStartDay"] = dr["PayStartDay"].ToString();
                Session["PayEndDay"] = dr["PayEndDay"].ToString();
                Session["PaySubStartDay"] = dr["PaySubStartDay"].ToString();
                Session["PaySubEndDay"] = dr["PaySubEndDay"].ToString();
                //if (strEmpvisible != "")
                //{
                //    Session["EmpPassID"] = dr["emp_code"].ToString();
                //}
                str = "payrolldetailreport_New.aspx?UserID=" + Session["EmpCode"].ToString() + "&Month=" + dr["Month"].ToString() + "&stdatemonth=" + Session["PayStartDay"].ToString() + "&endatemonth=" + Session["PayEndDay"].ToString() + "&stdatesubmonth=" + Session["PaySubStartDay"].ToString() + "&endatesubmonth=" + Session["PaySubEndDay"].ToString() + "&monthidintbl=" + monthid.ToString() + "&Year=" + yearid.ToString() + "&company_id=" + Session["Compid"].ToString();
            }
            string popupScript = "<script language='javascript'>" + "window.open('', '" + str + "', " + "'width=1000, height=1000, menubar=yes, resizable=yes')" + "</script>";
            return str;
        }
        //private void InitializeComponent()
        //{
        //    this.Init += new System.EventHandler(this.SubmitPayroll_Init);
        //    this.Load += new System.EventHandler(this.Page_Load);
        //    this.imgbtnfetch.Click += new ImageClickEventHandler(this.bindgrid);
        //    this.Button4.Click += new System.EventHandler(this.Button1_Click);
        //    this.Button5.Click += new System.EventHandler(this.Button2_Click);
        //    this.btnsubapprove.Click += new System.EventHandler(this.btnsubapprove_click);

        //}


        //Toolbar
        #region Toolbar and Exporting

        //column to hide wile export
        protected void HideGridColumnseExport()
        {
            RadGrid1.MasterTableView.GetColumn("TemplateColumn").Visible = false;
            RadGrid1.MasterTableView.GetColumn("GridClientSelectColumn").Visible = false;
            RadGrid1.MasterTableView.GetColumn("Image").Visible = false;
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
            obj1.ExportGridHeader("103", Session["CompanyName"].ToString(), Session["Emp_Name"].ToString(), e);

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
