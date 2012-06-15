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
using System.Text;

namespace SMEPayroll.Company
{
    public partial class AddCompanyNew : System.Web.UI.Page
    {
        static int s = 0;
        string compid;
        string cpfceil = "", annualceil = "";
        string basicroundoffdefault = "-1";
        string roundoffdefault = "2"; 

        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;

        protected void Page_Load(object sender, EventArgs e)
        {
            /* To disable Grid filtering options  */
            //GridFilterMenu menu = RadGrid1.FilterMenu;
            //int i = 0;

            //while (i < menu.Items.Count)
            //{
            //    menu.Items.RemoveAt(i);
            //}
            cmbpayslipformat.SelectedIndexChanged += new RadComboBoxSelectedIndexChangedEventHandler(cmbpayslipformat_SelectedIndexChanged);
            rdWorkFlow.SelectedIndexChanged += new EventHandler(rdWorkFlow_SelectedIndexChanged);            

            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            string SQL = "select monthly_cpf_ceil,annual_cpf_ceil from company where company_id=1";
            //CPF Changes
            SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, SQL, null);
            if (dr.Read())
            {
                cpfceil = dr[0].ToString();
                annualceil = dr[1].ToString();
            }
            btnLeaveFF.Click += new EventHandler(btnLeaveFF_Click);
            ////Get the changes for New CPF Table 
            //string month, year;
            //month = DateTime.Now.Month.ToString();
            //year = DateTime.Now.Year.ToString();

            //string date = "01/" + month + "/" + year;
            //string sqlcpf = "Select monthly_cpf_celi ,annual_cpf_ceil from Company_CPF_CEILING where convert(datetime,'" + date + "',103) between convert(datetime,EffectiveDateFrom,103) and convert(datetime,EffectiveDateTo,103)";

            //SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.Text, sqlcpf, null);
            //if (dr1.Read())
            //{
            //    cpfceil = dr1[0].ToString();
            //    annualceil = dr1[1].ToString();
            //}


            compid = Request.QueryString["compid"];

            if (compid != null) tbsgiro.Enabled = true;
            else tbsgiro.Enabled = false;


            if (!IsPostBack)
            {
                dropdown_binding();
                string sql = "Select * From HourTransfer";
                DataSet dsts = new DataSet();
                dsts = DataAccess.FetchRS(CommandType.Text, sql, null);
                cmbPublicHoliday.DataSource = dsts;
                cmbPublicHoliday.DataTextField = "TranferName";
                cmbPublicHoliday.DataValueField = "ID";
                cmbPublicHoliday.DataBind();

                cmbSunday.DataSource = dsts;
                cmbSunday.DataTextField = "TranferName";
                cmbSunday.DataValueField = "ID";
                cmbSunday.DataBind();

                cmbRosterNa.DataSource = dsts;
                cmbRosterNa.DataTextField = "TranferName";
                cmbRosterNa.DataValueField = "ID";
                cmbRosterNa.DataBind();

                if (rdWorkFlow.SelectedIndex == 0 || rdWorkFlow.SelectedIndex == 1)
                {
                    chkWF.Items[0].Enabled = false;
                    chkWF.Items[1].Enabled = false;
                    chkWF.Items[2].Enabled = false;
                    chkWF.Items[3].Enabled = false;
                    chkWF.Items[4].Enabled = false;
                    chkWF.Items[5].Enabled = false;
                }
                else
                {
                    chkWF.Items[0].Enabled = false;
                    chkWF.Items[1].Enabled = false;
                    chkWF.Items[2].Enabled = false;
                    chkWF.Items[3].Enabled = true;
                    chkWF.Items[4].Enabled = false;
                    chkWF.Items[5].Enabled = false;
                }

                if (compid != null)
                {
                    s = 1;
                    DataSet Compset = new DataSet();
                    //CPF Changes
                    string Str = " select company_code,company_name,phone,email,website,city,Fax,address2,postal_code,";
                    Str += "country,auth_person,designation,Address,Auth_email,cpf_ref_no,currency,no_work_days,day_hours,";
                    Str += "monthly_cpf_ceil,annual_cpf_ceil,ytd_earning,sdf_income,sdf_percent,min_sdf_contrib,email_leavealert,email_payalert,";
                    Str += " payslip_format,working_days, Payroll_Approval, Payroll_Authority,email_sender,email_SMTP_server,email_username,";
                    Str += "email_password,email_sender_domain,email_sender_name,email_reply_address,email_reply_name,email_SMTP_port,state,";
                    Str += "timesheet_approve,epayslip,leave_model,email_claim_sender_name,email_claim_reply_name,email_claimalert,";
                    Str += "company_roc,company_type,sslrequired,pwdrequired,ccmail,ccalert_claims,ccalert_leaves,day_minute,basicrnd,additionsrnd,deductionsrnd,netpayrnd,payrolltype,email_leave_delete,isTSRemarks,projectassign,SalaryGLCode,EmployeeCPFGLCode,EmployerCPFGLCode,FundAmtGLCode,SDLAmtGLCode,AccountGLCode,UnpaidLeaGLCode,TsPublicH,Sunday,NoRoster,FIFO,Rounding,SendEmail,EmpProcessor,ProcessEmail,isMaster=case when isMaster Is null then 0 else isMaster end,isMasterEmpTemp= case when isMasterEmpTemp Is null then 0 else isMasterEmpTemp end,AdvTs,LeaveFFDate,WorkFlowID,WFEMP,WFLEAVE,WFCLAIM,WFPAY,WFReport,WFTimeSheet,AppTSProcess,AppLeaveProcess,AppClaimsProcess,FOWL from company where Company_Id=" + compid + "";

                    Compset = DataAccess.FetchRS(CommandType.Text, Str, null);

                    //(D)Settings 

                    if (System.DBNull.Value != Compset.Tables[0].Rows[0]["SendEmail"]) //first time value will be null
                    {
                        if ((bool)Compset.Tables[0].Rows[0]["SendEmail"])
                        {
                            cbxEmailAlert.SelectedValue = "Yes";
                            drpEmpProc1.Visible = true;
                        }
                        else
                        {
                            cbxEmailAlert.SelectedValue = "No";
                            drpEmpProc1.Visible = false;
                        }
                    }
                    else
                    {
                        cbxEmailAlert.SelectedValue = "No";
                        drpEmpProc1.Visible = false;
                    }

                    if (System.DBNull.Value != Compset.Tables[0].Rows[0]["AdvTs"]) 
                    {
                        int val = Convert.ToInt32(Compset.Tables[0].Rows[0]["AdvTs"].ToString());

                        if (val == -1)
                        {
                            radAdvanceTs.SelectedIndex = 0;
                            Label1.Visible = false;
                            txtMinutes.Visible = false;
                        }
                        else
                        {
                            radAdvanceTs.SelectedIndex = 1;
                            txtMinutes.Text = Compset.Tables[0].Rows[0]["AdvTs"].ToString();

                            Label1.Visible = true;
                            txtMinutes.Visible = true;
                        }
                    }

                    if (System.DBNull.Value == Compset.Tables[0].Rows[0]["FOWL"] )
                    {
                        chkWL.Checked = true;
                    }
                    else if (Compset.Tables[0].Rows[0]["FOWL"].ToString() == "1")
                    {
                        chkWL.Checked = true;
                    }
                    else if (Compset.Tables[0].Rows[0]["FOWL"].ToString() == "0")
                    {
                        chkWL.Checked = false;
                    }
                        
                    if (System.DBNull.Value != Compset.Tables[0].Rows[0]["EmpProcessor"]) //first time value will be null
                    {
                        if ((bool)Compset.Tables[0].Rows[0]["EmpProcessor"])
                        {
                            drpEmpProc1.SelectedValue = "Processer";
                            txtProcesserEmail.Visible = true;
                            txtProcesserEmail.Text = (string)Compset.Tables[0].Rows[0]["ProcessEmail"];
                        }
                        else
                        {
                            txtProcesserEmail.Visible = false;
                            drpEmpProc1.SelectedValue = "Employee";
                        }

                    }
                    else
                    {
                        txtProcesserEmail.Visible = false;
                        drpEmpProc1.SelectedValue = "Employee";
                    }
                    //Leaves LeaveFFDate
                    if (Compset.Tables[0].Rows[0]["LeaveFFDate"] != System.DBNull.Value)
                    {
                        //{}
                        if (Compset.Tables[0].Rows[0]["LeaveFFDate"].ToString() != "{}")
                        {
                            radLFort.SelectedDate = Convert.ToDateTime(Compset.Tables[0].Rows[0]["LeaveFFDate"]);
                            if (radLFort.SelectedDate.Value.Year == DateTime.Now.Year)
                            {
                                int val = DateTime.Now.Date.CompareTo(radLFort.SelectedDate.Value.Date);
                                if (val>=0)
                                {
                                    btnLeaveFF.Enabled = true;
                                }

                            }
                        }
                    }
                    //Changes for Work Flow...
                    if (Compset.Tables[0].Rows[0]["WorkFlowID"] == System.DBNull.Value)
                    {
                            rdWorkFlow.SelectedIndex = 0;
                    }
                    else
                    {
                        if (Compset.Tables[0].Rows[0]["WorkFlowID"].ToString() == "-1")
                        {
                            rdWorkFlow.SelectedIndex = 0;
                        }

                        if (Compset.Tables[0].Rows[0]["WorkFlowID"].ToString() == "1")
                        {
                            rdWorkFlow.SelectedIndex = 1;
                        }

                        if (Compset.Tables[0].Rows[0]["WorkFlowID"].ToString() == "2")
                        {
                            rdWorkFlow.SelectedIndex = 2;
                        }
                    }

                    //Changes for Work Flow...
                    if (Compset.Tables[0].Rows[0]["WFEMP"] == System.DBNull.Value)
                    {
                        chkWF.Items[0].Selected = false;
                    }
                    else
                    {
                        if (Compset.Tables[0].Rows[0]["WFEMP"].ToString() == "1")
                            chkWF.Items[0].Selected = true;                        
                    }

                    //Changes for Work Flow...
                    if (Compset.Tables[0].Rows[0]["WFLEAVE"] == System.DBNull.Value)
                    {
                        chkWF.Items[1].Selected = false;
                    }
                    else
                    {
                        if (Compset.Tables[0].Rows[0]["WFLEAVE"].ToString() == "1")
                            chkWF.Items[1].Selected = true;
                    }


                    //Changes for Work Flow...
                    if (Compset.Tables[0].Rows[0]["WFCLAIM"] == System.DBNull.Value)
                    {
                        chkWF.Items[2].Selected = false;
                    }
                    else
                    {
                        if (Compset.Tables[0].Rows[0]["WFCLAIM"].ToString() == "1")
                            chkWF.Items[2].Selected = true;
                    }

                    if (Compset.Tables[0].Rows[0]["WFPAY"] == System.DBNull.Value)
                    {
                        chkWF.Items[3].Selected = false;
                    }
                    else
                    {
                        if (Compset.Tables[0].Rows[0]["WFPAY"].ToString() == "1")
                            chkWF.Items[3].Selected = true;
                    }


                    if (Compset.Tables[0].Rows[0]["WFReport"] == System.DBNull.Value)
                    {
                        chkWF.Items[4].Selected = false;
                    }
                    else
                    {
                        if (Compset.Tables[0].Rows[0]["WFReport"].ToString() == "1")
                            chkWF.Items[4].Selected = true;
                    }

                    if (Compset.Tables[0].Rows[0]["WFTimeSheet"] == System.DBNull.Value)
                    {
                        chkWF.Items[5].Selected = false;
                    }
                    else
                    {
                        if (Compset.Tables[0].Rows[0]["WFTimeSheet"].ToString() == "1")
                            chkWF.Items[5].Selected = true;
                    }

                    //Changes for Approval Process
                    if (Compset.Tables[0].Rows[0]["AppTSProcess"] == System.DBNull.Value || Compset.Tables[0].Rows[0]["AppTSProcess"].ToString() == "1")
                    {
                        //chkWF.Items[5].Selected = false;
                        radListPayrollApp.SelectedIndex = 0;
                    }
                    else
                    {
                        if (Compset.Tables[0].Rows[0]["AppTSProcess"].ToString() == "0")
                            radListPayrollApp.SelectedIndex = 1;
                    }

                    if (Compset.Tables[0].Rows[0]["AppLeaveProcess"] == System.DBNull.Value || Compset.Tables[0].Rows[0]["AppLeaveProcess"].ToString() == "1")
                    {
                        //chkWF.Items[5].Selected = false;
                        radListLeaveApp.SelectedIndex = 0;
                    }
                    else
                    {
                        if (Compset.Tables[0].Rows[0]["AppLeaveProcess"].ToString() == "0")
                            radListLeaveApp.SelectedIndex = 1;
                    }
                    
                    if (Compset.Tables[0].Rows[0]["AppClaimsProcess"] == System.DBNull.Value || Compset.Tables[0].Rows[0]["AppClaimsProcess"].ToString() == "1")
                    {
                        //chkWF.Items[5].Selected = false;
                        radListClaimApp.SelectedIndex = 0;
                    }
                    else
                    {
                        if (Compset.Tables[0].Rows[0]["AppClaimsProcess"].ToString() == "0")
                            radListClaimApp.SelectedIndex = 1;
                    }
                    

                    txtCompCode.Text = Utility.ToString(Compset.Tables[0].Rows[0]["company_code"]);
                    txtCompName.Text = Utility.ToString(Compset.Tables[0].Rows[0]["company_name"]);
                    txtCompemail.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email"]);
                    txtCompfax.Value = Utility.ToString(Compset.Tables[0].Rows[0]["Fax"]);
                    txtCompcity.Value = Utility.ToString(Compset.Tables[0].Rows[0]["city"]);
                    txtCompperson.Value = Utility.ToString(Compset.Tables[0].Rows[0]["auth_person"]);
                    txtCompPhone.Value = Utility.ToString(Compset.Tables[0].Rows[0]["phone"]);
                    txtauth_emai.Value = Utility.ToString(Compset.Tables[0].Rows[0]["Auth_email"]);
                    txtcompaddress.Text = Utility.ToString(Compset.Tables[0].Rows[0]["Address"]);
                    txtCompstate.Value = Utility.ToString(Compset.Tables[0].Rows[0]["state"]);
                    //CPF Changes

                    ////Get the changes for New CPF Table 
                    string month, year;
                    month = DateTime.Now.Month.ToString();
                    year = DateTime.Now.Year.ToString();

                    string date = "01/" + month + "/" + year;
                    string sqlcpf = "Select monthly_cpf_celi ,annual_cpf_ceil from Company_CPF_CEILING where convert(datetime,'" + date + "',103) between convert(datetime,EffectiveDateFrom,103) and convert(datetime,EffectiveDateTo,103)";

                    SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.Text, sqlcpf, null);
                    if (dr1.Read())
                    {
                        cpfceil = dr1[0].ToString();
                        annualceil = dr1[1].ToString();
                    }
                    txtmonthly_cpf_ceil.Value = Utility.ToString(cpfceil);

                    //txtmonthly_cpf_ceil.Value = Utility.ToString(Compset.Tables[0].Rows[0]["monthly_cpf_ceil"]);
                    txtwebsite.Value = Utility.ToString(Compset.Tables[0].Rows[0]["website"]);
                    //txtannual_cpf_ceil.Value = Utility.ToString(Compset.Tables[0].Rows[0]["annual_cpf_ceil"]);

                    txtannual_cpf_ceil.Value = Utility.ToString(annualceil);

                    cmbCountry.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["country"]);
                    txtdesign.Value = Utility.ToString(Compset.Tables[0].Rows[0]["designation"]);
                    txtcompany_roc.Text = Utility.ToString(Compset.Tables[0].Rows[0]["company_roc"]);
                    drpcompany_type.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["company_type"]);
                    cmbpayslipformat.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["payslip_format"]);
                    rdtimesheet.Value = Utility.ToString(Compset.Tables[0].Rows[0]["timesheet_approve"]);
                    RdApproval.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["Payroll_Approval"]);
                    cmbworkingdays.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["no_work_days"]);
                    txthrs_day.Value = Utility.ToString(Compset.Tables[0].Rows[0]["day_hours"]);
                    txtmin_day.Value = Utility.ToString(Compset.Tables[0].Rows[0]["day_minute"]);

                    txtemailsender_address.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email_sender"]);
                    txtemailuser.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email_username"]);
                    txtemail_replyaddress.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email_reply_address"]);
                    txtemail_replyname.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email_reply_name"]);
                    txtemail_leavedel.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email_leave_delete"]);
                    txtemailpwd.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email_password"]);
                    txtemail_sendername.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email_sender_name"]);
                    txtemailsender_domain.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email_sender_domain"]);
                    txtsmtpserver.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email_SMTP_server"]);
                    txtsmtpport.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email_SMTP_port"]);

                    txtpostalcode.Text = Utility.ToString(Compset.Tables[0].Rows[0]["postal_code"]);
                    txtcompaddress2.Text = Utility.ToString(Compset.Tables[0].Rows[0]["address2"]);

                    cmbemailleave.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["email_leavealert"]);
                    cmbemailpay.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["email_payalert"]);
                    cmbEmailPaySlip.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["epayslip"]);
                    cmbLeaveModel.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["leave_model"]);
                    txtclaim_sendername.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email_claim_sender_name"]);
                    txtemailclaim_replyname.Value = Utility.ToString(Compset.Tables[0].Rows[0]["email_claim_reply_name"]);
                    cmbclaim.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["email_claimalert"]);
                    ddlssl.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["sslrequired"]);
                    cmbEPayPwd.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["pwdrequired"]);
                    txtccmail.Value = Utility.ToString(Compset.Tables[0].Rows[0]["ccmail"]);
                    cmbccclaim.Value = Utility.ToString(Compset.Tables[0].Rows[0]["ccalert_claims"]);
                    cmbccleave.Value = Utility.ToString(Compset.Tables[0].Rows[0]["ccalert_leaves"]);
                    cmbLeaveRoundoff.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["basicrnd"]);
                    cmbAdditionsRoundoff.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["additionsrnd"]);
                    cmbDeductionsRoundoff.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["deductionsrnd"]);
                    cmbNetPayRoundoff.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["netpayrnd"]);
                    cmbPayrollType.SelectedValue = Convert.ToString(Compset.Tables[0].Rows[0]["payrolltype"].ToString());
                    cmbAssignType.SelectedValue = Convert.ToString(Compset.Tables[0].Rows[0]["projectassign"].ToString());

                    txtSalaryGL.Value = Utility.ToString(Compset.Tables[0].Rows[0]["SalaryGLCode"]);
                    txtEmpCPFGL.Value = Utility.ToString(Compset.Tables[0].Rows[0]["EmployeeCPFGLCode"]);
                    txtEmpyCPFGL.Value = Utility.ToString(Compset.Tables[0].Rows[0]["EmployerCPFGLCode"]);
                    txtFundGL.Value = Utility.ToString(Compset.Tables[0].Rows[0]["FundAmtGLCode"]);
                    txtSDLGL.Value = Utility.ToString(Compset.Tables[0].Rows[0]["SDLAmtGLCode"]);
                    txtacccompGL.Value = Utility.ToString(Compset.Tables[0].Rows[0]["AccountGLCode"]);
                    txtunpaidGL.Value = Utility.ToString(Compset.Tables[0].Rows[0]["UnpaidLeaGLCode"]);

                    //DropDownbox
                    cmbPublicHoliday.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["TsPublicH"]);
                    cmbSunday.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["Sunday"]);
                    cmbRosterNa.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["NoRoster"]);

                    cmbIsMaster.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["isMaster"]);
                    cmbtempEmp.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["isMasterEmpTemp"]);


                    if (Utility.ToString(Compset.Tables[0].Rows[0]["FIFO"]) == "1")
                    {
                        chkFiFo.SelectedValue = "FIFO";
                    }
                    cmbRound.SelectedValue = Utility.ToString(Compset.Tables[0].Rows[0]["Rounding"]);

                    //TsPublicH,Sunday,NoRoster,FIFO,Rounding

                    if (Compset.Tables[0].Rows[0]["isTSRemarks"] != null)
                    {
                        if ((bool)Compset.Tables[0].Rows[0]["isTSRemarks"] == true)
                        {
                            rdtsremarks.Value = "1";
                        }
                        else
                        {
                            rdtsremarks.Value = "0";
                        }
                    }
                    //Get Data For Payslip format etc

                    string strQuery = "Select * from [Report_Settings] Where COMPANYID=" + compid;

                    SqlDataReader dr2;

                    dr2 = DataAccess.ExecuteReader(CommandType.Text, strQuery, null);

                    if (cmbpayslipformat.SelectedValue == "7")
                    {
                        tblPaySlipSetup1.Visible = true;
                    }

                    while (dr2.Read())
                    {
                        if (dr2["NAME"].ToString() == "-1")
                        {
                            radPayNameYesNo.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayNameYesNo.SelectedIndex = 0;
                            txtPayName.Text = dr2["NAME"].ToString();
                        }

                        if (dr2["IDNO"].ToString() == "-1")
                        {
                            radPayIDNOYesNo.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayIDNOYesNo.SelectedIndex = 0;
                            txtPayIDNO.Text = dr2["IDNO"].ToString();
                        }

                        if (dr2["SALFORMONTH"].ToString() == "-1")
                        {
                            radPaySalMonthYesNo.SelectedIndex = 1;
                        }
                        else
                        {
                            radPaySalMonthYesNo.SelectedIndex = 0;
                            txtPaySALMONTH.Text = dr2["SALFORMONTH"].ToString();
                        }

                        if (dr2["YEAR"].ToString() == "-1")
                        {
                            radPayYear.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayYear.SelectedIndex = 0;
                            txtPayYEAR.Text = dr2["YEAR"].ToString();
                        }

                        if (dr2["EARNINGS"].ToString() == "-1")
                        {
                            radPayEarnings.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayEarnings.SelectedIndex = 0;
                            txtPayEARNINGS.Text = dr2["EARNINGS"].ToString();
                        }

                        if (dr2["DEDUCTIONS"].ToString() == "-1")
                        {
                            radPayDeductions.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayDeductions.SelectedIndex = 0;
                            txtPayDEDUCTIONS.Text = dr2["DEDUCTIONS"].ToString();
                        }

                        if (dr2["TOTALGROSS"].ToString() == "-1")
                        {
                            radPayTotalGross.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayTotalGross.SelectedIndex = 0;
                            txtPayTOTALGROSS.Text = dr2["TOTALGROSS"].ToString();
                        }

                        if (dr2["CPFGROSS"].ToString() == "-1")
                        {
                            radPayCpfGross.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayCpfGross.SelectedIndex = 0;
                            txtPayCpfGross.Text = dr2["CPFGROSS"].ToString();
                        }

                        if (dr2["EMPLOYERCPF"].ToString() == "-1")
                        {
                            radPayEmployerCpf.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayEmployerCpf.SelectedIndex = 0;
                            txtPayEMPLOYERCPF.Text = dr2["EMPLOYERCPF"].ToString();
                        }

                        if (dr2["TOTALDEDUCTION"].ToString() == "-1")
                        {
                            radPayTotalDeduction.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayTotalDeduction.SelectedIndex = 0;
                            txtPayTOTALDEDUCTION.Text = dr2["TOTALDEDUCTION"].ToString();
                        }

                        if (dr2["NETPAYMENT"].ToString() == "-1")
                        {
                            radPayNETPAYMENT.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayNETPAYMENT.SelectedIndex = 0;
                            txtPayNETPAYMENT.Text = dr2["NETPAYMENT"].ToString();
                        }

                        if (dr2["YEARTODATE"].ToString() == "-1")
                        {
                            radPayYEARTODATE.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayYEARTODATE.SelectedIndex = 0;
                            txtPayYEARTODATE.Text = dr2["YEARTODATE"].ToString();
                        }

                        if (dr2["YEATODATEEMPLOYERCPF"].ToString() == "-1")
                        {
                            radPayYEATODATEEMPLOYERCPF.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayYEATODATEEMPLOYERCPF.SelectedIndex = 0;
                            txtPayYEATODATEEMPLOYERCPF.Text = dr2["YEATODATEEMPLOYERCPF"].ToString();
                        }

                        if (dr2["LOGOMGT"].ToString() == "1")
                        {
                            radPayLOGOMGT.SelectedIndex = 0;
                        }
                        if (dr2["LOGOMGT"].ToString() == "2")
                        {
                            radPayLOGOMGT.SelectedIndex = 1;
                        }
                        if (dr2["LOGOMGT"].ToString() == "3")
                        {
                            radPayLOGOMGT.SelectedIndex = 2;
                        }

                        if (dr2["LOGOMGT"].ToString() == "4")
                        {
                            radPayLOGOMGT.SelectedIndex = 3;
                        }
                        ////////////////////////////////////////////////////////////
                        if (dr2["LEAVEDETAILS"].ToString() == "1")
                        {
                            radPayLEAVEDETAILS.SelectedIndex = 0;
                        }
                        if (dr2["LEAVEDETAILS"].ToString() == "2")
                        {
                            radPayLEAVEDETAILS.SelectedIndex = 1;
                        }
                        ////////////////////////////////////////////////////////////
                            if (dr2["ADDITIONSDETAILS"].ToString() == "1")
                            {
                                radPayEARNINGDETAILS.SelectedIndex = 0;
                            }
                            if (dr2["ADDITIONSDETAILS"].ToString() == "2")
                            {
                                radPayEARNINGDETAILS.SelectedIndex = 1;
                            }
                            if (dr2["ADDITIONSDETAILS"].ToString() == "3")
                            {
                                radPayEARNINGDETAILS.SelectedIndex = 2;
                            }
                        ////////////////////////////////////////////////////////////
                        if (dr2["DEPTNAME"].ToString() == "-1")
                        {
                            radPayDEPTNAME.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayDEPTNAME.SelectedIndex = 0;
                            txtPayDepartmentName.Text = dr2["DEPTNAME"].ToString();
                        }

                        if (dr2["TRADE"].ToString() == "-1")
                        {
                            radPayTrade.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayTrade.SelectedIndex = 0;
                            txtPayTrade.Text = dr2["TRADE"].ToString();
                        }

                        if (dr2["DESIGNATION"].ToString() == "-1")
                        {
                            radPayDesignation.SelectedIndex = 1;
                        }
                        else
                        {
                            radPayDesignation.SelectedIndex = 0;
                            txtPayDesignation.Text = dr2["DESIGNATION"].ToString();
                        }                    
                    }
                }
                else
                {
                    s = 0;
                    //CPF Changes
                    txtmonthly_cpf_ceil.Value = cpfceil;
                    txtannual_cpf_ceil.Value = annualceil;
                    cmbLeaveRoundoff.SelectedValue = basicroundoffdefault;
                    cmbAdditionsRoundoff.SelectedValue = roundoffdefault;
                    cmbDeductionsRoundoff.SelectedValue = roundoffdefault;
                    cmbNetPayRoundoff.SelectedValue = roundoffdefault;
                }

            }
        }

        void cmbpayslipformat_SelectedIndexChanged(object o, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if (cmbpayslipformat.SelectedValue == "7")
            {
                tblPaySlipSetup1.Visible = true;
            }
            else
            {
                tblPaySlipSetup1.Visible = false;
            }
        }

        void rdWorkFlow_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdWorkFlow.SelectedIndex == 0 || rdWorkFlow.SelectedIndex == 1)
            {
                chkWF.Items[0].Enabled = false;
                chkWF.Items[1].Enabled = false;
                chkWF.Items[2].Enabled = false;
                chkWF.Items[3].Enabled = false;
                chkWF.Items[4].Enabled = false;
                chkWF.Items[5].Enabled = false;
            }
            else
            {
                chkWF.Items[0].Enabled = false;
                chkWF.Items[1].Enabled = false;
                chkWF.Items[2].Enabled = false;
                chkWF.Items[3].Enabled = true;
                chkWF.Items[4].Enabled = false;
                chkWF.Items[5].Enabled = false;
            }
        }

        void btnLeaveFF_Click(object sender, EventArgs e)
        {
            try
            {
                //Get First Leaves (Last Year Leaves )
                string strLeaves = "select LY_Leaves_Bal,Emp_ID from employeeleavesallowed where Leave_Type=8 AND Leave_year=" + DateTime.Now.Year;

                SqlDataReader dr;
                dr = DataAccess.ExecuteReader(CommandType.Text, strLeaves, null);

                string empcode = "";

                while (dr.Read())
                {
                    int emp_code = 0;
                    double lastYearLeaves = 0;
                    emp_code = Convert.ToInt32(dr["Emp_ID"].ToString());
                    lastYearLeaves = Convert.ToDouble(dr["LY_Leaves_Bal"].ToString());
                    //Call SP To get The Details exec sp_GetEmployeeLeavePolicy @empid=321,@year=2012,@applydateon='Apr  4 2012 12:00:00:000AM',@filter=-1

                    DataSet ds_leave = new DataSet();
                    //string sSQL = "SELECT [id], [type] FROM [leave_types] WHERE id IN (select leave_type from EmployeeLeavesAllowed where ";
                    //sSQL += " emp_ID = {0} And leave_year = {1})";
                    //sSQL = string.Format(sSQL, Utility.ToInteger(drpname.SelectedValue), Utility.ToInteger(cmbLeaveYear.SelectedValue));
                    //ds_leave = getDataSet(sSQL);
                    string sSQL = "sp_GetEmployeeLeavePolicy";
                    SqlParameter[] parms = new SqlParameter[4];
                    parms[0] = new SqlParameter("@empid", Utility.ToInteger(emp_code));
                    parms[1] = new SqlParameter("@year", Utility.ToString(DateTime.Now.Year));
                    parms[2] = new SqlParameter("@applydateon", Convert.ToDateTime(DateTime.Now));
                    parms[3] = new SqlParameter("@filter", -1);
                    ds_leave = DataAccess.ExecuteSPDataSet(sSQL, parms);

                    //Get Employess Which are already Transfered in next year leaves table "leaves_forefited_New"
                    string strEmpFor = "select emp_code from leaves_forefited_New Where Year=" + Utility.ToInteger(DateTime.Now.Year) + " AND Company_Id=" + Convert.ToInt32(compid);
                    SqlDataReader dr11;

                    dr11 = DataAccess.ExecuteReader(CommandType.Text, strEmpFor, null);
                  

                    bool exists = false;
                    while (dr11.Read())
                    {
                        if (dr11[0].ToString() == emp_code.ToString())
                        {
                            exists = true;
                            break;
                        }
                    }

                    if (exists == false)
                    {
                        //Leaves Taken Annually
                        double leaves_anaualTaken = 0;
                        if (ds_leave != null)
                        {
                            if (ds_leave.Tables.Count > 0)
                            {
                                if (ds_leave.Tables[0].Rows[0]["TYPE"].ToString() == "Annual Leave")
                                {
                                    if (ds_leave.Tables[0].Rows[0]["totalleavestaken"] != null)
                                    {
                                        leaves_anaualTaken = Convert.ToDouble(ds_leave.Tables[0].Rows[0]["totalleavestaken"].ToString());
                                    }
                                }

                                if (leaves_anaualTaken < lastYearLeaves)
                                {
                                    double leavesUpdate = lastYearLeaves - leaves_anaualTaken;
                                    //Make Leaves Zero for all employess in this company...
                                    string sqlUpdate = "Update employeeleavesallowed SET LY_Leaves_Bal =" + leavesUpdate + "  FROM employeeleavesallowed ";
                                    sqlUpdate = sqlUpdate + " WHERE  LEave_Type = 8  and leave_year=" + DateTime.Now.Year + "  and Emp_Id=" + emp_code;
                                    int cnt = DataAccess.ExecuteNonQuery(sqlUpdate, null);
                                    //Insert into new Table
                                    if (cnt > 0)
                                    {
                                        //LeaveType
                                        //Year
                                        //Company_Id
                                        //lastYearLeaves
                                        //leaves_anaualTaken
                                        //emp_code
                                        string insert = "INSERT INTO leaves_forefited_New(LeaveType,Year,Company_Id,lastYearLeaves,leaves_anaualTaken,emp_code) VALUES (8," + DateTime.Now.Year + "," + Convert.ToInt32(Request.QueryString["compid"].ToString()) + "," + lastYearLeaves + "," + leaves_anaualTaken + "," + emp_code + ")";
                                        int cnt1 = DataAccess.ExecuteNonQuery(insert, null);
                                        if (empcode == "")
                                        {
                                            empcode = emp_code.ToString();
                                        }
                                        else
                                        {
                                            empcode = empcode + "," + emp_code.ToString();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                string msg = "";
                if (empcode.Length > 0)
                {
                    msg = "Leaves forfeited  for EmpCode " + empcode + " Employees";
                }
                else
                {
                    msg = "Leaves Already forfeited ";
                }
                ShowMessageBox(msg);
            }
            catch (Exception ex)
            {
                ShowMessageBox(ex.Message.ToString());
            }
        }



        private DataSet CompanyDetails
        {
            get
            {
                string sSQL = "";
                DataSet ds = new DataSet();
                if (compid == null)
                {
                    sSQL = "SELECT  b.[desc], b.id,b.[code], b.[bank_code] ,[bank_branch], a.[id] giroid,[value_date],[giro_acc_name], [bank_accountno], a.company_bankcode, a.[company_id],a.[approvercode],a.[operatorcode] FROM [Girobanks] a, bank b WHERE a.bank_id=b.id  and a.Temp ='" + Session.SessionID + "'";
                }
                else
                {
                    sSQL = "SELECT  b.[desc], b.id,b.[code], b.[bank_code], [bank_branch], a.[id] giroid,[value_date],[giro_acc_name], [bank_accountno], a.company_bankcode, a.[company_id], a.[approvercode],a.[operatorcode] FROM [Girobanks] a, bank b WHERE a.bank_id=b.id and a.[company_id] =" + compid;
                }
                ds = ds = DataAccess.FetchRS(CommandType.Text, sSQL, null); ;
                return ds;
            }
        }

        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            this.RadGrid1.DataSource = this.CompanyDetails;
        }

        protected void RadGrid1_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {

            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
            object id = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["giroid"];
            string giroid = id.ToString();
            string bankbranch = (userControl.FindControl("txtbranch") as TextBox).Text;
            string bankaccno = (userControl.FindControl("txtbankaccno") as TextBox).Text;
            string bankaccname = (userControl.FindControl("txtgiroaccountname") as TextBox).Text;
            string compbankcode = (userControl.FindControl("compbankcode") as TextBox).Text;
            string valuedate = (userControl.FindControl("txtvaluedate") as TextBox).Text;
            string approvercode = (userControl.FindControl("txtapprover") as TextBox).Text;
            string operatorcode = (userControl.FindControl("txtoperator") as TextBox).Text;

            string sSQL = "update girobanks set bank_branch='" + bankbranch + "',value_date='" + valuedate + "',company_bankcode='" + compbankcode + "',bank_accountno='" + bankaccno + "',giro_acc_name='" + bankaccname + "', approvercode='" + approvercode + "',operatorcode='" + operatorcode + "' where company_id=" + compid + " and  id=" + giroid;

            int retVal = DataAccess.ExecuteStoreProc(sSQL);
            if (retVal == 1)
            {
                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Information updated successfully"));
            }

            else
            {
                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to update the record"));
            }

        }

        protected void RadGrid1_InsertCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;

            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);

            string bankname = (userControl.FindControl("drpbankname") as DropDownList).SelectedItem.Value;
            string bankbranch = (userControl.FindControl("txtbranch") as TextBox).Text;
            string bankaccno = (userControl.FindControl("txtbankaccno") as TextBox).Text;
            string bankaccname = (userControl.FindControl("txtgiroaccountname") as TextBox).Text;
            string compbankcode = (userControl.FindControl("compbankcode") as TextBox).Text;
            string valuedate = (userControl.FindControl("txtvaluedate") as TextBox).Text;
            string approvercode = (userControl.FindControl("txtapprover") as TextBox).Text;
            string operatorcode = (userControl.FindControl("txtoperator") as TextBox).Text;

            string sSQL = "";
            sSQL = "Insert into girobanks (bank_id, bank_branch, bank_accountno,giro_acc_name,company_id,value_date,company_bankcode, approvercode, operatorcode)";
            sSQL = sSQL + " Values(" + bankname + ", '" + bankbranch + "', '" + bankaccno + "','" + bankaccname + "', " + compid + ",'" + valuedate + "','" + compbankcode + "','" + approvercode + "','" + operatorcode + "')";
            try
            {
                int retVal = DataAccess.ExecuteStoreProc(sSQL);
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
            RadGrid1.Rebind();
        }



        protected void dropdown_binding()
        {
            DataSet ds_country = new DataSet();
            string SQL = "select Id Country_ID , Country from country order by 1";
            ds_country = DataAccess.FetchRS(CommandType.Text, SQL, null);
            cmbCountry.DataSource = ds_country.Tables[0];
            cmbCountry.DataTextField = ds_country.Tables[0].Columns["Country"].ColumnName.ToString();
            cmbCountry.DataValueField = ds_country.Tables[0].Columns["Country_ID"].ColumnName.ToString();


            cmbCountry.DataBind();

        }



        protected void RadGrid2_PreRender(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
            }
        }

        private static DataSet GetDataSet(string query)
        {
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, query, null);
            return ds;
        }

        private DataSet UserDetails
        {
            get
            {
                string sSQL = "";
                DataSet ds = new DataSet();
                if (compid == null)
                {
                    sSQL = "select a.emp_code,isnull(a.emp_name,'')+' '+isnull(a.emp_lname,'')  emp_name, a.UserName, a.Password,b.GroupID,b.GroupName,c.Status,c.StatusId, a.Email from employee a Inner Join UserGroups b on a.groupid  = b.groupid And a.company_id = b.company_id Inner Join UserStatus c on a.statusid = c.statusid Where a.Company_ID=0 order by emp_name";
                }
                else
                    sSQL = "select a.emp_code,isnull(a.emp_name,'')+' '+isnull(a.emp_lname,'')  emp_name, a.UserName, a.Password,b.GroupID,b.GroupName,c.Status,c.StatusId, a.Email from employee a Inner Join UserGroups b on a.groupid  = b.groupid And a.company_id = b.company_id Inner Join UserStatus c on a.statusid = c.statusid Where a.Company_ID=" + compid + " order by emp_name";
                ds = GetDataSet(sSQL);
                return ds;
            }
        }

        protected void RadGrid2_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            this.RadGrid2.DataSource = this.UserDetails;
        }

        protected void RadGrid2_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
            object id = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["UserName"];
            object emp_code = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["emp_code"];
            string User = id.ToString();
            string sSQL = "sp_user_update";
            string password = (userControl.FindControl("txtpwd") as TextBox).Text;
            string passwordenc = encrypt.SyEncrypt(password).ToString();

            string conpwd = (userControl.FindControl("txtconpwd") as TextBox).Text;
            if (password == "")
                passwordenc = "";

            string email = (userControl.FindControl("txtEmail") as TextBox).Text;
            string status = (userControl.FindControl("drpUserStatus") as DropDownList).SelectedItem.Value;
            string group = (userControl.FindControl("drpUserGrp") as DropDownList).SelectedItem.Value;
            string groupname = (userControl.FindControl("drpUserGrp") as DropDownList).SelectedItem.Text;
            int i = 0;
            SqlParameter[] parms = new SqlParameter[5];
            parms[i++] = new SqlParameter("@UserName", Utility.ToString(User));
            parms[i++] = new SqlParameter("@Password", Utility.ToString(passwordenc));
            parms[i++] = new SqlParameter("@GroupId", Utility.ToInteger(group));
            parms[i++] = new SqlParameter("@StatusId", Utility.ToInteger(status));
            parms[i++] = new SqlParameter("@Email", Utility.ToString(email));
            i = 0;
            SqlParameter[] param = new SqlParameter[2];
            param[i++] = new SqlParameter("@CompanyID", Utility.ToInteger(compid));
            param[i++] = new SqlParameter("@EmployeeID", Utility.ToString(emp_code));
            int retVal = 0;
            string sSQL1 = "sp_CheckSuperAdminCount";
            int returnval = Convert.ToInt32(DataAccess.ExecuteSPScalar(sSQL1, param));

            if (returnval == 1 && (status == "2" || status == "3" || status == "4")) // ONE SuperAdmin 
            {
                if (groupname == "Super Admin")
                {
                    RadGrid2.Controls.Add(new LiteralControl("<font color = 'Red'>User record cannot be updated. <br/> There should be atleast ONE active SuperAdmin in the system."));
                }
                else
                {
                    retVal = DataAccess.ExecuteStoreProc(sSQL, parms);
                    RadGrid2.Controls.Add(new LiteralControl("<font color = 'Red'>User record has been updated."));
                }
            }
            else
            {
                if (returnval == 1 && groupname.ToUpper() != "SUPER ADMIN")
                {
                    RadGrid2.Controls.Add(new LiteralControl("<font color = 'Red'>User record cannot be updated. <br/> There should be atleast ONE active SuperAdmin in the system."));
                }
                else
                {
                    retVal = DataAccess.ExecuteStoreProc(sSQL, parms);
                    RadGrid2.Controls.Add(new LiteralControl("<font color = 'Red'>User record has been updated."));
                }
            }
        }

        protected void RadGrid2_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string status = dataItem["status"].Text;
                if (status == "Active" || Session["GroupName"].ToString().ToUpper() == "SUPER ADMIN")
                {
                    dataItem["Editcolumn"].Visible = true;
                }
                else
                {
                    dataItem["Editcolumn"].Visible = false;
                }

            }

            if ((Utility.AllowedAction1(Session["Username"].ToString(), "Manage Users")) == false)
            {
                RadGrid2.MasterTableView.GetColumn("EditColumn").Visible = false;
            }
        }
        protected void RadGrid2_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            Boolean flag = false;
            ArrayList emailList = new ArrayList();
            string userId = null;
            string pwd = null;
            string empName = null;
            int comp_id = 0;
            string emailId = null;
            if (e.CommandName == "UpdateAll")
            {
                foreach (GridItem item in RadGrid2.MasterTableView.Items)
                {
                    if (item is GridItem)
                    {
                        GridDataItem dataItem = (GridDataItem)item;
                        TextBox txtbox = (TextBox)dataItem.FindControl("txtEmail");
                        string email = Utility.ToString(txtbox.Text);
                        if (email != "")
                        {
                            emailList.Add(email);
                        }

                    }
                }
                if (emailList.Count > 0)
                {
                    for (int i = 0; i < emailList.Count; i++)
                    {
                        emailId = Convert.ToString(emailList[i]);
                        string sqlquery = " select userName,password,emp_name +''+ emp_lname as EmpName  from employee where email = '" + emailId + "'  and Company_Id ='" + compid + "'";
                        DataSet ds = DataAccess.FetchRS(CommandType.Text, sqlquery, null);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            userId = Utility.ToString(ds.Tables[0].Rows[0][0].ToString());
                            pwd = encrypt.SyDecrypt(Utility.ToString(ds.Tables[0].Rows[0][1].ToString()));
                            comp_id = Utility.ToInteger(compid);
                            empName = Utility.ToString(ds.Tables[0].Rows[0][2].ToString());
                            sendemail(userId, pwd, comp_id, emailId, empName);
                        }
                    }
                }
            }
            if (e.Item is GridDataItem && e.CommandName == "SendSingleEmail")
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
                TextBox txtbox = (TextBox)dataItem.FindControl("txtEmail");
                emailId = Utility.ToString(txtbox.Text);
                comp_id = Utility.ToInteger(compid);
                userId = dataItem["UserName"].Text;
                empName = dataItem["emp_name"].Text;
                pwd = encrypt.SyDecrypt(dataItem["Password"].Text);
                if (emailId.Length > 0)
                {
                    sendemail(userId, pwd, comp_id, emailId, empName);
                }
                else
                {
                    Response.Write("<script language='javascript'> alert('Email Id Is Blank ,Please Update Email Id') </script>");
                }
            }
        }


        private DataSet CSNDetails
        {
            get
            {
                string sSQL = "";
                DataSet ds = new DataSet();
                if (compid == null)
                {
                    compid = "0";
                }
                sSQL = "select id, roc, type, srno,CSN from CPFFiles where Company_Id=" + compid;
                ds = GetDataSet(sSQL);
                return ds;
            }
        }
        protected void sendemail(string userid, string pwd, int compid, string email, string eName)
        {
            try
            {
                string from = "Administrator";
                string to = email;
                string SMTPserver = "";
                string SMTPUser = "";
                string SMTPPass = "";
                string emailreq = "";
                int SMTPPORT = 25;
                StringBuilder mailBody;

                string subject = "Password for User Id : " + userid;
                string Body = "Passport for the Account Of :" + userid;
                SMEPayroll.Model.ANBMailer oANBMailer = new SMEPayroll.Model.ANBMailer(compid);
                oANBMailer.Subject = "Login Information ";
                string MailBody = "Greetings " + eName + "; Following are your Login particulars. -##- User ID:" + userid + " -##- Password: " + pwd;
                MailBody = MailBody.Replace("-##-", Environment.NewLine);
                MailBody = MailBody.Replace("-##-", Environment.NewLine);

                oANBMailer.MailBody = MailBody;
                oANBMailer.From = from;
                oANBMailer.To = email;
                try
                {
                    string sRetVal = oANBMailer.SendMail();
                    if (sRetVal != "")
                    {

                    }
                }
                catch (Exception ex)
                {

                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void RadGrid4_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            this.RadGrid4.DataSource = this.CSNDetails;
        }



        protected void RadGrid4_InsertCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
            string company_roc = (userControl.FindControl("txtROC") as TextBox).Text.Trim();
            string company_type = (userControl.FindControl("txtType") as TextBox).Text.Trim();
            string company_srn = (userControl.FindControl("txtSlNo") as TextBox).Text.Trim();
            string csn = company_roc + "-" + company_type + "-" + company_srn;
            string sSQL = "";
            sSQL = "SELECT COUNT(CSN) FROM CPFFiles WHERE UPPER(CSN) = UPPER('" + csn + "')";
            SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQL, null);
            if (dr.Read())
            {
                if (Utility.ToInteger(dr[0].ToString()) == 0)
                {
                    sSQL = "";
                    int retVal = 0;
                    sSQL = "Insert into CPFFiles (Company_ID,ROC,Type,Srno,CSN,Created,LastModified)";
                    sSQL = sSQL + " Values(" + compid + ", '" + company_roc + "', '" + company_type + "','" + company_srn + "', '" + csn + "', getdate(), getdate()" + ")";
                    try
                    {
                        retVal = DataAccess.ExecuteStoreProc(sSQL);
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
                    RadGrid4.Rebind();
                }
                else
                {
                    RadGrid4.Controls.Add(new LiteralControl("<font color = 'Red'>CSN for the compnay already exists. Please choose a different CSN."));
                }
            }

        }

        protected void RadGrid4_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
            string csnid = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["id"]);
            string company_csn = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["CSN"]);
            string company_roc = (userControl.FindControl("txtROC") as TextBox).Text.Trim();
            string company_type = (userControl.FindControl("txtType") as TextBox).Text.Trim();
            string company_srn = (userControl.FindControl("txtSlNo") as TextBox).Text.Trim();
            string csn = company_roc + "-" + company_type + "-" + company_srn;

            string sSQL = "";
            sSQL = "SELECT COUNT(CSN) FROM CPFFiles WHERE UPPER(CSN) = UPPER('" + csn + "')" + "AND id !=" + Convert.ToInt32(csnid);
            SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQL, null);

            if (dr.Read())
            {
                if (Utility.ToInteger(dr[0].ToString()) == 0)
                {
                    sSQL = "update CPFFIles set ROC='" + company_roc + "',Type='" + company_type + "',SrNo='" + company_srn + "', CSN='" + csn + "' where id=" + csnid;
                    sSQL += ";" + "update Employee set employer_cpf_acct='" + company_roc + "-" + company_type + "-" + company_srn + "' where employer_cpf_acct = '" + company_csn + "'";
                    int retVal = DataAccess.ExecuteStoreProc(sSQL);
                    if (retVal == 1)
                    {
                        RadGrid4.Controls.Add(new LiteralControl("<font color = 'Red'>Information updated successfully"));
                    }
                    else
                    {
                        RadGrid4.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to update the record"));
                    }
                    this.RadGrid4.DataSource = this.CSNDetails;
                    RadGrid4.Rebind();
                }

                else
                {
                    RadGrid4.Controls.Add(new LiteralControl("<font color = 'Red'>CSN for the compnay already exists. Please choose a different CSN."));
                }
            }
        }

        protected void RadGrid4_DeleteCommand(object source, GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem editedItem = e.Item as GridEditableItem;
                string csnid = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["id"]);
                string company_csn = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["CSN"]);

                string SQL1 = "select count(employer_cpf_acct) from employee where employer_cpf_acct= '" + company_csn + "'";
                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, SQL1, null);
                if (dr.Read())
                {
                    if (Utility.ToInteger(dr[0].ToString()) > 0)
                    {
                        RadGrid4.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete this record.CPF is in use."));
                    }
                    else
                    {
                        string sSQL = "DELETE FROM CPFFiles where id ='{0}'";
                        sSQL = string.Format(sSQL, csnid);
                        int i = DataAccess.ExecuteStoreProc(sSQL);
                    }
                }

            }
            catch (Exception ex)
            {
                string ErrMsg = ex.Message;
                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete the User. Reason:</font> " + ErrMsg));
                e.Canceled = true;
            }
        }

        protected void txtTestEmail_Click(object sender, EventArgs e)
        {
            SMEPayroll.Model.ANBMailer oANBMailer = new SMEPayroll.Model.ANBMailer(txtsmtpserver.Value.ToString(), txtemailuser.Value.ToString(), txtemailpwd.Value, txtemailsender_address.Value.ToString(), txtemailsender_address.Value.ToString(), Utility.ToInteger(txtsmtpport.Value), ddlssl.SelectedItem.Value);

            oANBMailer.Subject = "Test Email from WebPortal";
            oANBMailer.MailBody = "This is test mail from WebPortal";
            oANBMailer.From = txtemailsender_address.Value.ToString();
            oANBMailer.To = txtemailsender_domain.Value.ToString();

            try
            {
                string sRetVal = oANBMailer.SendMail();
                if (sRetVal == "")
                    Response.Write("<script language = 'Javascript'>alert('Test Successful.');</script>");
                else
                    //Response.Write("<BR><BR><font color='red'>" + sRetVal + "</font><BR><BR>");
                    Response.Write("<script language = 'Javascript'>alert('There Problem to send email please contact adminstrator');</script>");

            }
            catch (Exception ex)
            {
                string str = ex.Message;
                Response.Write("<script language = 'Javascript'>alert('There Problem to send email please contact adminstrator.');</script>");
            }

        }

        bool EmpProc;
        string ProceserEmail;
        protected void btnsave_Click(object sender, EventArgs e)
        {
            # region insert
            if (s == 0)
            {
                string Compcode = txtCompCode.Text.Trim();
                string password1 = Compcode + "_Admin";
                string password = encrypt.SyEncrypt(password1);
                string CompName = txtCompName.Text.Trim();

                if (CompName != "" && Compcode != "")
                {
                    string CompPhone = txtCompPhone.Value;
                    string website = txtwebsite.Value;
                    string Compemail = txtCompemail.Value;
                    string Compcity = txtCompcity.Value;
                    string Compfax = txtCompfax.Value;
                    string Country = cmbCountry.SelectedValue;
                    string Compperson = txtCompperson.Value;
                    string Compstate = txtCompstate.Value;
                    string designation = txtdesign.Value;
                    string company_roc = txtcompany_roc.Text;
                    string company_type = drpcompany_type.SelectedItem.Value;
                    string compaddress = txtcompaddress.Text;
                    string auth_emai = txtauth_emai.Value;
                    string hrs_day = txthrs_day.Value;
                    string min_day = txtmin_day.Value;
                    //CPF Changes No Need to do here
                    string monthly_cpf_ceil = txtmonthly_cpf_ceil.Value;
                    string annual_cpf_ceil = txtannual_cpf_ceil.Value;

                    string varpayapproval = RdApproval.SelectedValue;
                    string no_work_days = cmbworkingdays.SelectedValue;
                    string payslipformat = cmbpayslipformat.SelectedValue;
                    string email_sender = txtemailsender_address.Value;
                    string email_username = txtemailuser.Value;
                    string email_replyaddress = txtemail_replyaddress.Value;
                    string email_replyname = txtemail_replyname.Value;
                    string email_leavedel = txtemail_leavedel.Value;
                    string email_password = txtemailpwd.Value;
                    string email_sendername = txtemail_sendername.Value;
                    string email_senderdomain = txtemailsender_domain.Value;
                    string email_smtpserver = txtsmtpserver.Value;
                    string email_smtpport = txtsmtpport.Value;
                    string timesheet = rdtimesheet.Value;
                    string tsremarks = rdtsremarks.Value;
                    string compaddress2 = txtcompaddress2.Text;
                    string postalcode = txtpostalcode.Text;
                    string email_claim_sender_name = txtclaim_sendername.Value;
                    string email_claim_reply_name = txtemailclaim_replyname.Value;
                    string sslrequired = ddlssl.SelectedValue;
                    string pwdrequired = cmbEPayPwd.SelectedValue;
                    string ccmail = txtccmail.Value;
                    string ccmailclaim = cmbccclaim.Value;
                    string ccmailleave = cmbccleave.Value;
                    string leaveroundoff = cmbLeaveRoundoff.SelectedValue;
                    string additionsroundoff = cmbAdditionsRoundoff.SelectedValue;
                    string deductionsroundoff = cmbDeductionsRoundoff.SelectedValue;
                    string netpayroundoff = cmbNetPayRoundoff.SelectedValue;
                    int payrolltype = Convert.ToInt16(cmbPayrollType.SelectedValue);
                    int projectassign = Convert.ToInt16(cmbAssignType.SelectedValue);
                    string SalaryGLCode = txtSalaryGL.Value;
                    string EmployeeCPFGLCode = txtEmpCPFGL.Value;
                    string EmployerCPFGLCode = txtEmpyCPFGL.Value;
                    string FundAmtGLCode = txtFundGL.Value;
                    string SDLAmtGLCode = txtSDLGL.Value;
                    string AccountGLCode = txtacccompGL.Value;
                    string UnpaidLeaGLCode = txtunpaidGL.Value;

                    string strPH = cmbPublicHoliday.SelectedValue.ToString();
                    string strSunday = cmbSunday.SelectedValue.ToString();
                    string strRosNa = cmbRosterNa.SelectedValue.ToString();

                    int ROund = Convert.ToInt32(cmbRound.SelectedValue.ToString());
                    int chk = 0;
                    if (chkFiFo.SelectedValue.ToString() == "FIFO")
                    {
                        chk = 1;
                    }
                    
                    int i = 0;
                    SqlParameter[] parms = new SqlParameter[86];
                    parms[i++] = new SqlParameter("@Company_Code", Utility.ToString(Compcode));
                    parms[i++] = new SqlParameter("@Company_name", Utility.ToString(CompName));
                    parms[i++] = new SqlParameter("@phone", Utility.ToInteger(CompPhone));
                    parms[i++] = new SqlParameter("@email", Utility.ToString(Compemail));
                    parms[i++] = new SqlParameter("@website", Utility.ToString(website));

                    parms[i++] = new SqlParameter("@city", Utility.ToString(Compcity));
                    parms[i++] = new SqlParameter("@Fax", Utility.ToString(Compfax));
                    parms[i++] = new SqlParameter("@country", Utility.ToInteger(Country));
                    parms[i++] = new SqlParameter("@auth_person", Utility.ToString(Compperson));
                    parms[i++] = new SqlParameter("@designation", designation);
                    parms[i++] = new SqlParameter("@company_roc", company_roc);
                    parms[i++] = new SqlParameter("@company_type", company_type);

                    parms[i++] = new SqlParameter("@Address", Utility.ToString(compaddress));
                    parms[i++] = new SqlParameter("@Auth_email", Utility.ToString(auth_emai));
                    //CPF Changes
                    parms[i++] = new SqlParameter("@monthly_cpf_ceil", Utility.ToInteger(monthly_cpf_ceil));

                    parms[i++] = new SqlParameter("@annual_cpf_ceil", Utility.ToInteger(annual_cpf_ceil));
                    parms[i++] = new SqlParameter("@payslip_format", Utility.ToString(payslipformat));

                    parms[i++] = new SqlParameter("@Payroll_Approval", Utility.ToInteger(varpayapproval));
                    parms[i++] = new SqlParameter("@no_work_days", Utility.ToDouble(no_work_days));
                    parms[i++] = new SqlParameter("@day_hours", Utility.ToDouble(hrs_day));
                    parms[i++] = new SqlParameter("@day_min", Utility.ToDouble(min_day));

                    parms[i++] = new SqlParameter("@email_sender", Utility.ToString(email_sender));
                    parms[i++] = new SqlParameter("@email_username", Utility.ToString(email_username));
                    parms[i++] = new SqlParameter("@email_reply_address", Utility.ToString(email_replyaddress));
                    parms[i++] = new SqlParameter("@email_reply_name", Utility.ToString(email_replyname));
                    parms[i++] = new SqlParameter("@email_leavedel", Utility.ToString(email_leavedel));
                    parms[i++] = new SqlParameter("@email_password", Utility.ToString(email_password));
                    parms[i++] = new SqlParameter("@email_sender_name", Utility.ToString(email_sendername));
                    parms[i++] = new SqlParameter("@email_sender_domain", Utility.ToString(email_senderdomain));
                    parms[i++] = new SqlParameter("@email_SMTP_server", Utility.ToString(email_smtpserver));
                    parms[i++] = new SqlParameter("@email_SMTP_port", Utility.ToString(email_smtpport));
                    parms[i++] = new SqlParameter("@timesheet_approve", Utility.ToInteger(timesheet));
                    parms[i++] = new SqlParameter("@SessionID", Session.SessionID);
                    parms[i++] = new SqlParameter("@state", Utility.ToString(txtCompstate.Value));
                    parms[i++] = new SqlParameter("@password", password);

                    parms[i++] = new SqlParameter("@address2", compaddress2);
                    parms[i++] = new SqlParameter("@postal_code", postalcode);

                    parms[i++] = new SqlParameter("@email_leavealert", cmbemailleave.SelectedValue);
                    parms[i++] = new SqlParameter("@email_payalert", cmbemailpay.SelectedValue);

                    parms[i++] = new SqlParameter("@epayslip", cmbEmailPaySlip.SelectedValue);
                    parms[i++] = new SqlParameter("@leave_model", Utility.ToInteger(cmbLeaveModel.SelectedValue));
                    parms[i++] = new SqlParameter("@email_claim_sender_name", Utility.ToString(email_claim_sender_name));
                    parms[i++] = new SqlParameter("@email_claim_reply_name", Utility.ToString(email_claim_reply_name));
                    parms[i++] = new SqlParameter("@email_claimalert", cmbclaim.SelectedValue);
                    parms[i++] = new SqlParameter("@sslrequired", sslrequired);
                    parms[i++] = new SqlParameter("@pwdrequired", pwdrequired);
                    parms[i++] = new SqlParameter("@ccmail", ccmail);
                    parms[i++] = new SqlParameter("@ccclaimalert", ccmailclaim);
                    parms[i++] = new SqlParameter("@ccleavealert", ccmailleave);

                    parms[i++] = new SqlParameter("@leaveroundoff", leaveroundoff);
                    parms[i++] = new SqlParameter("@additionsroundoff", additionsroundoff);
                    parms[i++] = new SqlParameter("@deductionsroundoff", deductionsroundoff);
                    parms[i++] = new SqlParameter("@netpayroundoff", netpayroundoff);
                    parms[i++] = new SqlParameter("@payrolltype", payrolltype);
                    parms[i++] = new SqlParameter("@tsremarks", Utility.ToInteger(tsremarks));
                    parms[i++] = new SqlParameter("@projectassign", Utility.ToInteger(projectassign));

                    parms[i++] = new SqlParameter("@SalaryGLCode", SalaryGLCode);
                    parms[i++] = new SqlParameter("@EmployeeCPFGLCode", EmployeeCPFGLCode);
                    parms[i++] = new SqlParameter("@EmployerCPFGLCode", EmployerCPFGLCode);
                    parms[i++] = new SqlParameter("@FundAmtGLCode", FundAmtGLCode);
                    parms[i++] = new SqlParameter("@SDLAmtGLCode", SDLAmtGLCode);
                    parms[i++] = new SqlParameter("@AccountGLCode", AccountGLCode);
                    parms[i++] = new SqlParameter("@UnpaidLeaGLCode", UnpaidLeaGLCode);

                    parms[i++] = new SqlParameter("@PublicHoliday", strPH);
                    parms[i++] = new SqlParameter("@Sunday", strSunday);
                    parms[i++] = new SqlParameter("@RosterNa", strRosNa);
                    parms[i++] = new SqlParameter("@Round", ROund);
                    parms[i++] = new SqlParameter("@FIFO", chk);

                    parms[i++] = new SqlParameter("@isMaster", cmbIsMaster.SelectedValue);
                    parms[i++] = new SqlParameter("@isMasterEmpTemp", cmbtempEmp.SelectedValue);

                    #region TimeSheet (D)Settings
                    bool SendEmail;

                    if (cbxEmailAlert.SelectedValue == "Yes")
                    {
                        SendEmail = true;
                    }
                    else
                    {
                        SendEmail = false;
                    }

                    if (drpEmpProc1.Visible)
                    {
                        if (drpEmpProc1.SelectedValue == "Employee")
                        {
                            EmpProc = false;
                            ProceserEmail = "";
                        }
                        else if (drpEmpProc1.SelectedValue == "Processer")
                        {
                            EmpProc = true;
                            ProceserEmail = txtProcesserEmail.Text;
                        }
                    }
                    else
                    {
                        EmpProc = false;
                        ProceserEmail = "";
                    }


                    // string sqlUpdate = "UPDATE [dbo].[Company] SET [SendEmail] = '" + SendEmail + "' ,[EmpProcessor] = '" + EmpProc + "'  ,[ProcessEmail] = '" + ProceserEmail + "' WHERE Company_Id='" + Utility.ToString(compid) + "'";
                    //DataAccess.FetchRS(CommandType.Text, sqlUpdate, null);


                    #endregion

                    parms[i++] = new SqlParameter("@SendEmail", SendEmail);
                    parms[i++] = new SqlParameter("@EmpProc", EmpProc);
                    parms[i++] = new SqlParameter("@ProcessEmail", ProceserEmail);

                    if (radAdvanceTs.SelectedValue == "No")
                    {
                        parms[i++] = new SqlParameter("@AdvTs", txtMinutes.Text);
                    }
                    else
                    {
                        parms[i++] = new SqlParameter("@AdvTs", -1);
                    }
                    if (radLFort.SelectedDate != null)
                    {
                        parms[i++] = new SqlParameter("@LeaveFFDate", Convert.ToDateTime(radLFort.SelectedDate));
                    }
                    else
                    {
                        parms[i++] = new SqlParameter("@LeaveFFDate", System.DBNull.Value);
                    }

                    parms[i++] = new SqlParameter("@WorkFlowID", rdWorkFlow.SelectedValue);

                    if (rdWorkFlow.SelectedValue.ToString() == "-1")
                    {
                        parms[i++] = new SqlParameter("@WFEMP", System.DBNull.Value);
                        parms[i++] = new SqlParameter("@WFLEAVE", System.DBNull.Value);
                        parms[i++] = new SqlParameter("@WFCLAIM", System.DBNull.Value);
                        parms[i++] = new SqlParameter("@WFPAY", System.DBNull.Value);
                        parms[i++] = new SqlParameter("@WFReport", System.DBNull.Value);
                        parms[i++] = new SqlParameter("@WFTimeSheet", System.DBNull.Value);
                    }
                    else
                    {
                        if(chkWF.Items[0].Selected==true)
                        {
                            parms[i++] = new SqlParameter("@WFEMP", 1);
                        }
                        else
                        {
                            parms[i++] = new SqlParameter("@WFEMP", System.DBNull.Value);                        
                        }

                        if (chkWF.Items[1].Selected == true)
                        {
                            parms[i++] = new SqlParameter("@WFLEAVE", 1);
                        }
                        else
                        {
                            parms[i++] = new SqlParameter("@WFLEAVE", System.DBNull.Value);
                        }

                        if (chkWF.Items[2].Selected == true)
                        {
                            parms[i++] = new SqlParameter("@WFCLAIM", 1);
                        }
                        else
                        {
                            parms[i++] = new SqlParameter("@WFCLAIM", System.DBNull.Value);
                        }

                        if (chkWF.Items[3].Selected == true)
                        {
                            parms[i++] = new SqlParameter("@WFPAY", 1);
                        }
                        else
                        {
                            parms[i++] = new SqlParameter("@WFPAY", System.DBNull.Value);
                        }

                        if (chkWF.Items[4].Selected == true)
                        {
                            parms[i++] = new SqlParameter("@WFReport", 1);
                        }
                        else
                        {
                            parms[i++] = new SqlParameter("@WFReport", System.DBNull.Value);
                        }

                        if (chkWF.Items[5].Selected == true)
                        {
                            parms[i++] = new SqlParameter("@WFTimeSheet", 1);
                        }
                        else
                        {
                            parms[i++] = new SqlParameter("@WFTimeSheet", System.DBNull.Value);
                        }
                    
                    }

                    //
                        if (radListPayrollApp.SelectedValue == "1")
                        {
                            parms[i++] = new SqlParameter("@AppTSProcess", 1);
                        }
                        else
                        {
                            parms[i++] = new SqlParameter("@AppTSProcess", 0);
                        }

                        if (radListLeaveApp.SelectedValue == "1")
                        {
                            parms[i++] = new SqlParameter("@AppLeaveProcess", 1);
                        }
                        else
                        {
                            parms[i++] = new SqlParameter("@AppLeaveProcess", 0);
                        }

                        if (radListClaimApp.SelectedValue == "1")
                        {
                            parms[i++] = new SqlParameter("@AppClaimsProcess", 1);
                        }
                        else
                        {
                            parms[i++] = new SqlParameter("@AppClaimsProcess", 0);
                        }

                        if (chkWL.Checked)
                        {
                            parms[i++] = new SqlParameter("@FOWL", 1);
                        }
                        else
                        {
                            parms[i++] = new SqlParameter("@FOWL", 0);
                        }

                    string sSQL = "sp_comp_add";
                    try
                    {

                        int retVal = DataAccess.ExecuteStoreProc(sSQL, parms);
                        if (retVal >= 1)
                        {
                            lblerror.ForeColor = System.Drawing.Color.Green;
                        }

                        //Insert Data in database 

                        int compayid = 0;
                        string strCompany = "Select company_id from company where company_name ='" +  Utility.ToString(CompName) + "'";
                        SqlDataReader dr ;
                        dr = DataAccess.ExecuteReader(CommandType.Text, strCompany, null);

                        while (dr.Read())
                        {
                            compayid =  Utility.ToInteger(dr[0].ToString());
                        }

                       // compayid = Utility.ToInteger(compid);
                        if (tblPaySlipSetup1.Visible)
                        {
                            //string strDeletePaslipFormat = "DELETE FROM Report_Settings WHERE COMPANYID=" + compayid + "  AND PAYSLIPFORMAT=" + cmbpayslipformat.SelectedValue;
                            //int rtval1 = DataAccess.ExecuteNonQuery(strDeletePaslipFormat, null);                      

                            string strName = "";
                            string strIdno = "";
                            string strSalForMonth="";
                            string strYear="";
                            string strEarnings="";
                            string strDeductions="";
                            string strTOTALGROSS="";
                            string strCPFGROSS="";
                            string strEMPLOYERCPF="";
                            string strTOTALDEDUCTION="";
                            string strNETPAYMENT="";
                            string strYEARTODATE="";
                            string strYEATODATEEMPLOYERCPF="";
                          
                            int logomgt = -1;
                            string strDEPTNAME = "";
                            string strTRADE = "";
                            string strDESIGNATION = "";

                            if (radPayNameYesNo.SelectedValue == "2")
                            {
                                strName = "-1";
                            }
                            else
                            {
                                strName = txtPayName.Text;
                            }

                            if (radPayIDNOYesNo.SelectedValue =="2")
                            {
                                strIdno = "-1";
                            }
                            else
                            {
                                strIdno = txtPayIDNO.Text;
                            }

                            if (radPaySalMonthYesNo.SelectedValue == "2")
                            {
                                strSalForMonth = "-1";
                            }
                            else
                            {
                                strSalForMonth = txtPaySALMONTH.Text;
                            }

                            if (radPayYear.SelectedValue == "2")
                            {
                                strYear = "-1";
                            }
                            else
                            {
                                strYear = txtPayYEAR.Text;
                            }

                            if (radPayEarnings.SelectedValue == "2")
                            {
                                strEarnings = "-1";
                            }
                            else
                            {
                                strEarnings = txtPayEARNINGS.Text;
                            }

                             if (radPayDeductions.SelectedValue == "2")
                            {
                                strDeductions = "-1";
                            }
                            else
                            {
                                strDeductions = txtPayDEDUCTIONS.Text;
                            }

                             if (radPayTotalGross.SelectedValue == "2")
                            {
                                strTOTALGROSS = "-1";
                            }
                            else
                            {
                                strTOTALGROSS = txtPayTOTALGROSS.Text;
                            }

                            if (radPayCpfGross.SelectedValue == "2")
                            {
                                strCPFGROSS = "-1";
                            }
                            else
                            {
                                strCPFGROSS= txtPayCpfGross.Text;
                            }

                             if (radPayEmployerCpf.SelectedValue == "2")
                            {
                                strEMPLOYERCPF= "-1";
                            }
                            else
                            {
                                strEMPLOYERCPF= txtPayEMPLOYERCPF.Text;
                            }

                            if(radPayTotalDeduction.SelectedValue=="2")
                            {
                                strTOTALDEDUCTION="-1";
                            }
                            else
                            {
                                strTOTALDEDUCTION=txtPayTOTALDEDUCTION.Text;
                            
                            }

                            if(radPayNETPAYMENT.SelectedValue=="2")
                            {
                                strNETPAYMENT="-1";
                            }
                            else
                            {
                                strNETPAYMENT=txtPayNETPAYMENT.Text;                            
                            }

                            if(radPayYEARTODATE.SelectedValue=="2")
                            {
                                strYEARTODATE="-1";
                            }
                            else
                            {
                                strYEARTODATE=txtPayYEARTODATE.Text;                            
                            }
                            
                            if(radPayYEATODATEEMPLOYERCPF.SelectedValue=="2")
                            {
                                strYEATODATEEMPLOYERCPF="-1";
                            }
                            else
                            {
                                strYEATODATEEMPLOYERCPF=txtPayYEATODATEEMPLOYERCPF.Text;                            
                            }

                            if (radPayLOGOMGT.SelectedValue == "1")
                            {
                                logomgt = 1;
                            }

                            if (radPayLOGOMGT.SelectedValue == "2")
                            {
                                logomgt = 2;
                            }
                            if (radPayLOGOMGT.SelectedValue == "3")
                            {
                                logomgt = 3;
                            }

                            if (radPayLOGOMGT.SelectedValue == "4")
                            {
                                logomgt = 4;
                            }

                            if (radPayDEPTNAME.SelectedValue == "2")
                            {
                                strDEPTNAME = "-1";
                            }
                            else
                            {
                                strDEPTNAME = txtPayDepartmentName .Text;
                            }

                            if (radPayTrade.SelectedValue == "2")
                            {
                                strTRADE = "-1";
                            }
                            else
                            {
                                strTRADE = txtPayTrade.Text;
                            }

                            
                            if (radPayDesignation.SelectedValue == "2")
                            {
                                strDESIGNATION = "-1";
                            }
                            else
                            {
                                strDESIGNATION = txtPayDesignation.Text;
                            }

                            string strPayleaveDetails = "";
                            string strAddDetails = "";
                            ////////////////////////////////////////////////////////////
                            if (radPayLEAVEDETAILS.SelectedValue == "1")
                            {
                                strPayleaveDetails = "1";
                            }
                            if (radPayLEAVEDETAILS.SelectedValue == "2")
                            {
                                strPayleaveDetails = "2";
                            }
                            ////////////////////////////////////////////////////////////
                            if (radPayEARNINGDETAILS.SelectedValue == "1")
                            {
                                strAddDetails = "1";
                            }
                            if (radPayEARNINGDETAILS.SelectedValue == "2")
                            {
                                strAddDetails = "2";
                            }
                            if (radPayEARNINGDETAILS.SelectedValue == "3")
                            {
                                strAddDetails = "3";
                            }
                            ////////////////////////////////////////////////////////////

                           

                            string strInsert = "INSERT INTO [Report_Settings]([PAYSLIPFORMAT],[NAME],[IDNO],[SALFORMONTH],[YEAR],[EARNINGS],[DEDUCTIONS],[TOTALGROSS],[CPFGROSS],[EMPLOYERCPF],[TOTALDEDUCTION]";
                            strInsert = strInsert + ",[NETPAYMENT],[YEARTODATE],[YEATODATEEMPLOYERCPF],[COMPANYID],[LOGOMGT],[DEPTNAME],[TRADE],[DESIGNATION],[LEAVEDETAILS],[ADDITIONSDETAILS])VALUES('" + cmbpayslipformat.SelectedValue + "','" + strName + "','" + strIdno + "','";
                            strInsert = strInsert + strSalForMonth + "','" + strYear + "','" + strEarnings + "','" + strDeductions + "','" + strTOTALGROSS + "','" + strCPFGROSS + "','" + strEMPLOYERCPF + "','" + strTOTALDEDUCTION + "','" + strNETPAYMENT + "','";
                            strInsert = strInsert + strYEARTODATE + "','" + strYEATODATEEMPLOYERCPF + "'," + compayid + "," + logomgt + ",'" + strDEPTNAME + "','" + strTRADE + "','" + strDESIGNATION + "'," + strPayleaveDetails + "," + strAddDetails + ")";

                            int data = DataAccess.ExecuteNonQuery(strInsert, null);
                        }

                    }
                    catch (Exception ex)
                    {
                        string ErrMsg = ex.Message;
                        lblerror.ForeColor = System.Drawing.Color.Red;
                        if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                        {

                            ErrMsg = "<font color = 'Red'>Username already Exist, Please Enter some other Username</font>";
                        }
                        lblerror.Text = ErrMsg;
                    }
                }
                Response.Redirect("ShowCompanies.aspx");
            }
            #endregion Insert

            #region update
            else
            {
                string Compcode = txtCompCode.Text.Trim();
                string CompName = txtCompName.Text.Trim();
                if (CompName != "" && Compcode != "")
                {

                    string CompPhone = txtCompPhone.Value;
                    string website = txtwebsite.Value;
                    string Compemail = txtCompemail.Value;
                    string Compcity = txtCompcity.Value;
                    string Compfax = txtCompfax.Value;
                    string Country = cmbCountry.SelectedValue;
                    string Compperson = txtCompperson.Value;
                    string Compstate = txtCompstate.Value;
                    string designation = txtdesign.Value;
                    string company_roc = txtcompany_roc.Text;
                    string company_type = drpcompany_type.SelectedItem.Value;
                    string compaddress = txtcompaddress.Text;
                    string auth_emai = txtauth_emai.Value;
                    string hrs_day = txthrs_day.Value;
                    string min_day = txtmin_day.Value;
                    //CPF Changes
                    string monthly_cpf_ceil = txtmonthly_cpf_ceil.Value;
                    string annual_cpf_ceil = txtannual_cpf_ceil.Value;
                    string varpayapproval = RdApproval.SelectedValue;
                    string no_work_days = cmbworkingdays.SelectedValue;
                    string payslipformat = cmbpayslipformat.SelectedValue;
                    string email_sender = txtemailsender_address.Value;
                    string email_username = txtemailuser.Value;
                    string email_replyaddress = txtemail_replyaddress.Value;
                    string email_replyname = txtemail_replyname.Value;
                    string email_leavedel = txtemail_leavedel.Value;
                    string email_password = txtemailpwd.Value;
                    string email_sendername = txtemail_sendername.Value;
                    string email_senderdomain = txtemailsender_domain.Value;
                    string email_smtpserver = txtsmtpserver.Value;
                    string email_smtpport = txtsmtpport.Value;
                    string timesheet = rdtimesheet.Value;
                    string tsremarks = rdtsremarks.Value;

                    string compaddress2 = txtcompaddress2.Text;
                    string postalcode = txtpostalcode.Text;
                    string email_claim_sender_name = txtclaim_sendername.Value;
                    string email_claim_reply_name = txtemailclaim_replyname.Value;
                    string sslrequired = ddlssl.SelectedValue;
                    string pwdrequired = cmbEPayPwd.SelectedValue;
                    string ccmail = txtccmail.Value;
                    string ccmailclaim = cmbccclaim.Value;
                    string ccmailleave = cmbccleave.Value;
                    string leaveroundoff = cmbLeaveRoundoff.SelectedValue;
                    string additionsroundoff = cmbAdditionsRoundoff.SelectedValue;
                    string deductionsroundoff = cmbDeductionsRoundoff.SelectedValue;
                    string netpayroundoff = cmbNetPayRoundoff.SelectedValue;
                    int payrolltype = Convert.ToInt16(cmbPayrollType.SelectedValue);
                    int projectassign = Convert.ToInt16(cmbAssignType.SelectedValue);

                    string SalaryGLCode = txtSalaryGL.Value;
                    string EmployeeCPFGLCode = txtEmpCPFGL.Value;
                    string EmployerCPFGLCode = txtEmpyCPFGL.Value;
                    string FundAmtGLCode = txtFundGL.Value;
                    string SDLAmtGLCode = txtSDLGL.Value;
                    string AccountGLCode = txtacccompGL.Value;
                    string UnpaidLeaGLCode = txtunpaidGL.Value;

                    string strPH = cmbPublicHoliday.SelectedValue.ToString();
                    string strSunday = cmbSunday.SelectedValue.ToString();
                    string strRosNa = cmbRosterNa.SelectedValue.ToString();

                    int ROund = Convert.ToInt32(cmbRound.SelectedValue.ToString());
                    int chk = 0;
                    if (chkFiFo.SelectedValue.ToString() == "FIFO")
                    {
                        chk = 1;
                    }


                    Session["TimeSheetApproved"] = timesheet;
                    int i = 0;
                    SqlParameter[] parms = new SqlParameter[83];
                    parms[0] = new SqlParameter("@Company_Id", Utility.ToString(compid));
                    parms[1] = new SqlParameter("@Company_Code", Utility.ToString(Compcode));
                    parms[2] = new SqlParameter("@Company_name", Utility.ToString(CompName));
                    parms[3] = new SqlParameter("@phone", Utility.ToInteger(CompPhone));
                    parms[4] = new SqlParameter("@email", Utility.ToString(Compemail));
                    parms[5] = new SqlParameter("@website", Utility.ToString(website));

                    parms[6] = new SqlParameter("@city", Utility.ToString(Compcity));
                    parms[7] = new SqlParameter("@Fax", Utility.ToString(Compfax));
                    parms[8] = new SqlParameter("@country", Utility.ToInteger(Country));
                    parms[9] = new SqlParameter("@auth_person", Utility.ToString(Compperson));
                    parms[10] = new SqlParameter("@designation", designation);
                    parms[11] = new SqlParameter("@company_roc", company_roc);
                    parms[12] = new SqlParameter("@company_type", company_type);

                    parms[13] = new SqlParameter("@Address", Utility.ToString(compaddress));
                    parms[14] = new SqlParameter("@Auth_email", Utility.ToString(auth_emai));
                    //CPF Changes No Need to Do here
                    parms[15] = new SqlParameter("@monthly_cpf_ceil", Utility.ToInteger(monthly_cpf_ceil));

                    parms[16] = new SqlParameter("@annual_cpf_ceil", Utility.ToInteger(annual_cpf_ceil));
                    parms[17] = new SqlParameter("@payslip_format", Utility.ToString(payslipformat));

                    parms[18] = new SqlParameter("@Payroll_Approval", Utility.ToInteger(varpayapproval));
                    parms[19] = new SqlParameter("@no_work_days", Utility.ToDouble(no_work_days));
                    parms[20] = new SqlParameter("@day_hours", Utility.ToDouble(hrs_day));
                    parms[21] = new SqlParameter("@day_min", Utility.ToDouble(min_day));

                    parms[22] = new SqlParameter("@email_sender", Utility.ToString(email_sender));
                    parms[23] = new SqlParameter("@email_username", Utility.ToString(email_username));
                    parms[24] = new SqlParameter("@email_reply_address", Utility.ToString(email_replyaddress));
                    parms[25] = new SqlParameter("@email_reply_name", Utility.ToString(email_replyname));
                    parms[26] = new SqlParameter("@email_leavedel", Utility.ToString(email_leavedel));
                    parms[27] = new SqlParameter("@email_password", Utility.ToString(email_password));
                    parms[28] = new SqlParameter("@email_sender_name", Utility.ToString(email_sendername));
                    parms[29] = new SqlParameter("@email_sender_domain", Utility.ToString(email_senderdomain));
                    parms[30] = new SqlParameter("@email_SMTP_server", Utility.ToString(email_smtpserver));
                    parms[31] = new SqlParameter("@email_SMTP_port", Utility.ToString(email_smtpport));
                    parms[32] = new SqlParameter("@timesheet_approve", Utility.ToInteger(timesheet));
                    parms[33] = new SqlParameter("@state", Utility.ToString(txtCompstate.Value));


                    parms[34] = new SqlParameter("@address2", compaddress2);
                    parms[35] = new SqlParameter("@postal_code", postalcode);

                    parms[36] = new SqlParameter("@email_leavealert", cmbemailleave.SelectedValue);
                    parms[37] = new SqlParameter("@email_payalert", cmbemailpay.SelectedValue);

                    parms[38] = new SqlParameter("@epayslip", cmbEmailPaySlip.SelectedValue);
                    parms[39] = new SqlParameter("@leave_model", Utility.ToInteger(cmbLeaveModel.SelectedValue));
                    parms[40] = new SqlParameter("@email_claim_sender_name", Utility.ToString(email_claim_sender_name));
                    parms[41] = new SqlParameter("@email_claim_reply_name", Utility.ToString(email_claim_reply_name));
                    parms[42] = new SqlParameter("@email_claimalert", cmbclaim.SelectedValue);
                    parms[43] = new SqlParameter("@sslrequired", sslrequired);
                    parms[44] = new SqlParameter("@pwdrequired", pwdrequired);
                    parms[45] = new SqlParameter("@ccmail", ccmail);
                    parms[46] = new SqlParameter("@ccclaimalert", ccmailclaim);
                    parms[47] = new SqlParameter("@ccleavealert", ccmailleave);

                    parms[48] = new SqlParameter("@leaveroundoff", leaveroundoff);
                    parms[49] = new SqlParameter("@additionsroundoff", additionsroundoff);
                    parms[50] = new SqlParameter("@deductionsroundoff", deductionsroundoff);
                    parms[51] = new SqlParameter("@netpayroundoff", netpayroundoff);
                    parms[52] = new SqlParameter("@payrolltype", payrolltype);
                    parms[53] = new SqlParameter("@tsremarks", Utility.ToInteger(tsremarks));
                    parms[54] = new SqlParameter("@projectassign", Utility.ToInteger(projectassign));

                    parms[55] = new SqlParameter("@SalaryGLCode", SalaryGLCode);
                    parms[56] = new SqlParameter("@EmployeeCPFGLCode", EmployeeCPFGLCode);
                    parms[57] = new SqlParameter("@EmployerCPFGLCode", EmployerCPFGLCode);
                    parms[58] = new SqlParameter("@FundAmtGLCode", FundAmtGLCode);
                    parms[59] = new SqlParameter("@SDLAmtGLCode", SDLAmtGLCode);
                    parms[60] = new SqlParameter("@AccountGLCode", AccountGLCode);
                    parms[61] = new SqlParameter("@UnpaidLeaGLCode", UnpaidLeaGLCode);

                    parms[62] = new SqlParameter("@PublicHoliday", strPH);
                    parms[63] = new SqlParameter("@Sunday", strSunday);
                    parms[64] = new SqlParameter("@RosterNa", strRosNa);
                    parms[65] = new SqlParameter("@Round", ROund);
                    parms[66] = new SqlParameter("@FIFO", chk);

                    parms[67] = new SqlParameter("@isMaster", cmbIsMaster.SelectedValue);
                    parms[68] = new SqlParameter("@isMasterEmpTemp", cmbtempEmp.SelectedValue);

                    int retVal = 0;
                    try
                    {
                        #region TimeSheet (D)Settings
                        bool SendEmail;

                        if (cbxEmailAlert.SelectedValue == "Yes")
                        {
                            SendEmail = true;
                        }
                        else
                        {
                            SendEmail = false;
                        }


                        if (drpEmpProc1.Visible)
                        {

                            if (drpEmpProc1.SelectedValue == "Employee")
                            {
                                EmpProc = false;
                                ProceserEmail = "";
                            }
                            else if (drpEmpProc1.SelectedValue == "Processer")
                            {
                                EmpProc = true;
                                ProceserEmail = txtProcesserEmail.Text;
                            }
                        }
                        else
                        {
                            drpEmpProc1.Visible = false;
                            EmpProc = false;
                            ProceserEmail = "";
                        }


                        parms[69] = new SqlParameter("@ProcessEmail", ProceserEmail);


                        //@ProcessEmai

                        if (radAdvanceTs.SelectedValue == "No")
                        {
                            parms[70] = new SqlParameter("@AdvTs", txtMinutes.Text);
                        }
                        else
                        {
                            parms[70] = new SqlParameter("@AdvTs", -1);
                        }

                        if (radLFort.SelectedDate != null)
                        {
                            //parms[i++] = new SqlParameter("@LeaveFFDate", Convert.ToDateTime(radLFort.SelectedDate));
                            parms[71] = new SqlParameter("@LeaveFFDate", Convert.ToDateTime(radLFort.SelectedDate));
                        }
                        else
                        {
                            parms[71] = new SqlParameter("@LeaveFFDate", System.DBNull.Value);
                        }

                        parms[72] = new SqlParameter("@WorkFlowID", rdWorkFlow.SelectedValue);

                        if (rdWorkFlow.SelectedValue.ToString() == "-1")
                        {
                            parms[73] = new SqlParameter("@WFEMP", System.DBNull.Value);
                            parms[74] = new SqlParameter("@WFLEAVE", System.DBNull.Value);
                            parms[75] = new SqlParameter("@WFCLAIM", System.DBNull.Value);
                            parms[76] = new SqlParameter("@WFPAY", System.DBNull.Value);
                            parms[77] = new SqlParameter("@WFReport", System.DBNull.Value);
                            parms[78] = new SqlParameter("@WFTimeSheet", System.DBNull.Value);
                        }
                        else
                        {
                            if (chkWF.Items[0].Selected == true)
                            {
                                parms[73] = new SqlParameter("@WFEMP", 1);
                            }
                            else
                            {
                                parms[73] = new SqlParameter("@WFEMP", System.DBNull.Value);
                            }

                            if (chkWF.Items[1].Selected == true)
                            {
                                parms[74] = new SqlParameter("@WFLEAVE", 1);
                            }
                            else
                            {
                                parms[74] = new SqlParameter("@WFLEAVE", System.DBNull.Value);
                            }

                            if (chkWF.Items[2].Selected == true)
                            {
                                parms[75] = new SqlParameter("@WFCLAIM", 1);
                            }
                            else
                            {
                                parms[75] = new SqlParameter("@WFCLAIM", System.DBNull.Value);
                            }

                            if (chkWF.Items[3].Selected == true)
                            {
                                parms[76] = new SqlParameter("@WFPAY", 1);
                            }
                            else
                            {
                                parms[76] = new SqlParameter("@WFPAY", System.DBNull.Value);
                            }

                            if (chkWF.Items[4].Selected == true)
                            {
                                parms[77] = new SqlParameter("@WFReport", 1);
                            }
                            else
                            {
                                parms[77] = new SqlParameter("@WFReport", System.DBNull.Value);
                            }

                            if (chkWF.Items[5].Selected == true)
                            {
                                parms[78] = new SqlParameter("@WFTimeSheet", 1);
                            }
                            else
                            {
                                parms[78] = new SqlParameter("@WFTimeSheet", System.DBNull.Value);
                            }

                        }

                        if (radListPayrollApp.SelectedValue == "1")
                        {
                            parms[79] = new SqlParameter("@AppTSProcess", 1);
                        }
                        else
                        {
                            parms[79] = new SqlParameter("@AppTSProcess",SqlDbType.Int);
                            parms[79].Value = 0;
                        }

                        if (radListLeaveApp.SelectedValue == "1")
                        {
                            parms[80] = new SqlParameter("@AppLeaveProcess", 1);
                        }
                        else
                        {
                            parms[80] = new SqlParameter("@AppLeaveProcess", 0);
                        }

                        if (radListClaimApp.SelectedValue == "1")
                        {
                            parms[81] = new SqlParameter("@AppClaimsProcess", 1);
                        }
                        else
                        {
                            parms[81] = new SqlParameter("@AppClaimsProcess", 0);
                        }

                        if (chkWL.Checked)
                        {
                            parms[82] = new SqlParameter("@FOWL", SqlDbType.Int);
                            parms[82].Value = 1;
                        }
                        else
                        {
                            parms[82] = new SqlParameter("@FOWL", SqlDbType.Int);
                            parms[82].Value = 0;
                        }

                        string sSQL = "sp_comp_update";


                        string sqlUpdate = "UPDATE [dbo].[Company] SET [SendEmail] = '" + SendEmail + "' ,[EmpProcessor] = '" + EmpProc + "'  ,[ProcessEmail] = '" + ProceserEmail + "' WHERE Company_Id='" + Utility.ToString(compid) + "'";
                        DataAccess.FetchRS(CommandType.Text, sqlUpdate, null);



                        #endregion

                        retVal = DataAccess.ExecuteStoreProc(sSQL, parms);

                        //Update changes for CompayPaySlip Format
                        int compayid = 0;
                        compayid = Utility.ToInteger(compid);
                        if (tblPaySlipSetup1.Visible)
                        {
                            string strDeletePaslipFormat = "DELETE FROM Report_Settings WHERE COMPANYID=" + compayid + "  AND PAYSLIPFORMAT=" + cmbpayslipformat.SelectedValue;
                            int rtval1 = DataAccess.ExecuteNonQuery(strDeletePaslipFormat, null);
                      

                            string strName = "";
                            string strIdno = "";
                            string strSalForMonth="";
                            string strYear="";
                            string strEarnings="";
                            string strDeductions="";
                            string strTOTALGROSS="";
                            string strCPFGROSS="";
                            string strEMPLOYERCPF="";
                            string strTOTALDEDUCTION="";
                            string strNETPAYMENT="";
                            string strYEARTODATE="";
                            string strYEATODATEEMPLOYERCPF="";
                          
                            int logomgt = -1;
                            string strDEPTNAME = "";
                            string strTRADE = "";
                            string strDESIGNATION = "";

                            if (radPayNameYesNo.SelectedValue == "2")
                            {
                                strName = "-1";
                            }
                            else
                            {
                                strName = txtPayName.Text;
                            }

                            if (radPayIDNOYesNo.SelectedValue =="2")
                            {
                                strIdno = "-1";
                            }
                            else
                            {
                                strIdno = txtPayIDNO.Text;
                            }

                            if (radPaySalMonthYesNo.SelectedValue == "2")
                            {
                                strSalForMonth = "-1";
                            }
                            else
                            {
                                strSalForMonth = txtPaySALMONTH.Text;
                            }

                            if (radPayYear.SelectedValue == "2")
                            {
                                strYear = "-1";
                            }
                            else
                            {
                                strYear = txtPayYEAR.Text;
                            }

                            if (radPayEarnings.SelectedValue == "2")
                            {
                                strEarnings = "-1";
                            }
                            else
                            {
                                strEarnings = txtPayEARNINGS.Text;
                            }

                             if (radPayDeductions.SelectedValue == "2")
                            {
                                strDeductions = "-1";
                            }
                            else
                            {
                                strDeductions = txtPayDEDUCTIONS.Text;
                            }

                             if (radPayTotalGross.SelectedValue == "2")
                            {
                                strTOTALGROSS = "-1";
                            }
                            else
                            {
                                strTOTALGROSS = txtPayTOTALGROSS.Text;
                            }

                            if (radPayCpfGross.SelectedValue == "2")
                            {
                                strCPFGROSS = "-1";
                            }
                            else
                            {
                                strCPFGROSS= txtPayCpfGross.Text;
                            }

                             if (radPayEmployerCpf.SelectedValue == "2")
                            {
                                strEMPLOYERCPF= "-1";
                            }
                            else
                            {
                                strEMPLOYERCPF= txtPayEMPLOYERCPF.Text;
                            }

                            if(radPayTotalDeduction.SelectedValue=="2")
                            {
                                strTOTALDEDUCTION="-1";
                            }
                            else
                            {
                                strTOTALDEDUCTION=txtPayTOTALDEDUCTION.Text;
                            
                            }

                            if(radPayNETPAYMENT.SelectedValue=="2")
                            {
                                strNETPAYMENT="-1";
                            }
                            else
                            {
                                strNETPAYMENT=txtPayNETPAYMENT.Text;                            
                            }

                            if(radPayYEARTODATE.SelectedValue=="2")
                            {
                                strYEARTODATE="-1";
                            }
                            else
                            {
                                strYEARTODATE=txtPayYEARTODATE.Text;                            
                            }
                            
                            if(radPayYEATODATEEMPLOYERCPF.SelectedValue=="2")
                            {
                                strYEATODATEEMPLOYERCPF="-1";
                            }
                            else
                            {
                                strYEATODATEEMPLOYERCPF=txtPayYEATODATEEMPLOYERCPF.Text;                            
                            }

                            if (radPayLOGOMGT.SelectedValue == "1")
                            {
                                logomgt = 1;
                            }

                            if (radPayLOGOMGT.SelectedValue == "2")
                            {
                                logomgt = 2;
                            }
                            if (radPayLOGOMGT.SelectedValue == "3")
                            {
                                logomgt = 3;
                            }

                            if (radPayLOGOMGT.SelectedValue == "4")
                            {
                                logomgt = 4;
                            }

                            if (radPayDEPTNAME.SelectedValue == "2")
                            {
                                strDEPTNAME = "-1";
                            }
                            else
                            {
                                strDEPTNAME = txtPayDepartmentName .Text;
                            }

                            if (radPayTrade.SelectedValue == "2")
                            {
                                strTRADE = "-1";
                            }
                            else
                            {
                                strTRADE = txtPayTrade.Text;
                            }

                            
                            if (radPayDesignation.SelectedValue == "2")
                            {
                                strDESIGNATION = "-1";
                            }
                            else
                            {
                                strDESIGNATION = txtPayDesignation.Text;
                            }


                            string strPayleaveDetails = "";
                            string strAddDetails = "";
                            ////////////////////////////////////////////////////////////
                            if (radPayLEAVEDETAILS.SelectedValue == "1")
                            {
                                strPayleaveDetails = "1";
                            }
                            if (radPayLEAVEDETAILS.SelectedValue == "2")
                            {
                                strPayleaveDetails = "2";
                            }
                            ////////////////////////////////////////////////////////////
                            if (radPayEARNINGDETAILS.SelectedValue == "1")
                            {
                                strAddDetails = "1";
                            }
                            if (radPayEARNINGDETAILS.SelectedValue == "2")
                            {
                                strAddDetails = "2";
                            }
                            if (radPayEARNINGDETAILS.SelectedValue == "3")
                            {
                                strAddDetails = "3";
                            }
                            ////////////////////////////////////////////////////////////



                            string strInsert = "INSERT INTO [Report_Settings]([PAYSLIPFORMAT],[NAME],[IDNO],[SALFORMONTH],[YEAR],[EARNINGS],[DEDUCTIONS],[TOTALGROSS],[CPFGROSS],[EMPLOYERCPF],[TOTALDEDUCTION]";
                            strInsert = strInsert + ",[NETPAYMENT],[YEARTODATE],[YEATODATEEMPLOYERCPF],[COMPANYID],[LOGOMGT],[DEPTNAME],[TRADE],[DESIGNATION],[LEAVEDETAILS],[ADDITIONSDETAILS])VALUES('" + cmbpayslipformat.SelectedValue + "','" + strName + "','" + strIdno + "','";
                            strInsert = strInsert + strSalForMonth + "','" + strYear + "','" + strEarnings + "','" + strDeductions + "','" + strTOTALGROSS + "','" + strCPFGROSS + "','" + strEMPLOYERCPF + "','" + strTOTALDEDUCTION + "','" + strNETPAYMENT + "','";
                            strInsert = strInsert + strYEARTODATE + "','" + strYEATODATEEMPLOYERCPF + "'," + compayid + "," + logomgt + ",'" + strDEPTNAME + "','" + strTRADE + "','" + strDESIGNATION + "'," + strPayleaveDetails + "," + strAddDetails + ")";
                           

                            //string strInsert = "INSERT INTO [Report_Settings]([PAYSLIPFORMAT],[NAME],[IDNO],[SALFORMONTH],[YEAR],[EARNINGS],[DEDUCTIONS],[TOTALGROSS],[CPFGROSS],[EMPLOYERCPF],[TOTALDEDUCTION]";
                            //strInsert = strInsert + ",[NETPAYMENT],[YEARTODATE],[YEATODATEEMPLOYERCPF],[COMPANYID],[LOGOMGT],[DEPTNAME],[TRADE],[DESIGNATION])VALUES('" + cmbpayslipformat.SelectedValue + "','" + strName + "','" + strIdno + "','";
                            //strInsert = strInsert + strSalForMonth + "','" + strYear + "','" + strEarnings + "','" + strDeductions + "','" + strTOTALGROSS + "','" + strCPFGROSS + "','" + strEMPLOYERCPF + "','" + strTOTALDEDUCTION + "','" + strNETPAYMENT + "','";
                            //strInsert = strInsert + strYEARTODATE + "','" + strYEATODATEEMPLOYERCPF + "'," + compayid + "," + logomgt + ",'" + strDEPTNAME + "','" + strTRADE + "','" + strDESIGNATION + "')";

                            int data = DataAccess.ExecuteNonQuery(strInsert, null);
                        }

                        //Insert New Row in database
   
                        if (retVal >= 1)
                        {
                            Utility.GetLoginOKCompRunDB(compid, Session["Username"].ToString());

                            lblerror.ForeColor = System.Drawing.Color.Green;
                            lblerror.Text = "Information updated successfully.";
                        }
                    }
                    catch (Exception ex)
                    {
                        string ErrMsg = ex.Message;
                        lblerror.ForeColor = System.Drawing.Color.Red;
                        lblerror.Text = ErrMsg;
                    }
                }
                Response.Redirect("ShowCompanies.aspx");
            }
            #endregion update
        }



        #region (d)Setting
        //checking - if check box is checked then show the dropdown to send Email
        protected void CboxSendEmail_CheckedChanged(object sender, EventArgs e)
        {
            lblEmail.Visible = false;
            if (cbxEmailAlert.SelectedValue == "Yes")
            {
                drpEmpProc1.Visible = true;
                drpEmpProc1.ClearSelection();
                //drpEmpProc1.SelectedValue = "Employee";
                //drpEmpProc1.SelectedItem.Text = "Employee";
                lbldrpEmpProc.Visible = true;
            }
            else
            {
                lbldrpEmpProc.Visible = false;
                drpEmpProc1.Visible = false;
                txtProcesserEmail.Visible = false;
            }


        }

        //IF Processer is Selected then show the textbox to get the Email address
        protected void drpEmpProc_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (drpEmpProc1.SelectedValue == "Processer")
            {
                lblEmail.Visible = true;
                txtProcesserEmail.Visible = true;
            }
            else
            {
                lblEmail.Visible = false;
                txtProcesserEmail.Visible = false;
            }
        }

        protected void radAdvanceTs_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (radAdvanceTs.SelectedValue == "No")
            {
                Label1.Visible = true;
                txtMinutes.Visible = true;
            }
            else
            {
                Label1.Visible = false;
                txtMinutes.Visible = false;
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

        #endregion


    }
}




