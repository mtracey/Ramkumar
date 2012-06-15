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

namespace SMEPayroll.Reports
{
    public partial class CustomReportMainPage : System.Web.UI.Page
    {
        static int s = 0;
        string compid;
        string cpfceil = "", annualceil = "";
        string basicroundoffdefault = "-1";
        string roundoffdefault = "2";

        DataSet monthDs;
        DataRow[] foundRows;
        DataTable dtFilterFound;

        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        string varEmpCode = "";
        string strRepType;
        string sgroupname = "";
        protected int comp_id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            comp_id = Utility.ToInteger(Session["Compid"]);
            sgroupname = Utility.ToString(Session["GroupName"]);
            varEmpCode = Session["EmpCode"].ToString();
          
            
            lblerror.Text = "";
            SqlDataSource1.ConnectionString = Session["ConString"].ToString();
            SqlDataSource2.ConnectionString = Session["ConString"].ToString();
            SqlDataSource3.ConnectionString = Session["ConString"].ToString();
            SqlDataSource4.ConnectionString = Session["ConString"].ToString();
            SqlDataSource111.ConnectionString = Session["ConString"].ToString();
            SqlDataSource222.ConnectionString = Session["ConString"].ToString();
            SqlDataSource333.ConnectionString = Session["ConString"].ToString();
            compid = Utility.ToString(Utility.ToInteger(Session["Compid"].ToString()));
            btnCompliance.Click += new EventHandler(btnCompliance_Click);
            cmbYear.SelectedIndexChanged += new EventHandler(cmbYear_SelectedIndexChanged);

             

            if (!Page.IsPostBack)
            {
               
                cmbYear.SelectedValue = DateTime.Now.Date.Year.ToString();
                bindMonth();

                DataSet dsAllowance = new DataSet();

                string sqlAdd = "Select [desc],code  from additions_types Where code in ('v1','v2','v3','v4') and company_id=" + comp_id;
                dsAllowance = DataAccess.FetchRS(CommandType.Text, sqlAdd, null);

                if (dsAllowance != null)
                {
                    if (dsAllowance.Tables.Count > 0)
                    {
                        DataRow dr = dsAllowance.Tables[0].NewRow();
                        dr["desc"] = "All";
                        dr["code"] = "All";
                        dsAllowance.Tables[0].Rows.Add(dr);
                        radCmbTsPay.DataSource = dsAllowance;
                        radCmbTsPay.DataTextField = "desc";
                        radCmbTsPay.DataValueField = "code";
                        radCmbTsPay.DataBind();
                        //radCmbTsPay.SelectedIndex = 4;
                    }
                }


               
                if ((Utility.AllowedAction1(Session["Username"].ToString(), "Custom Reports - Employee")) == false)
                {
                    tbsEmp.Visible = false;
                    tbsComp.Tabs[tbsEmp.Index].Visible = false;
                }
                else
                {
                    tbsEmp.Visible = true;
                    tbsComp.Tabs[tbsEmp.Index].Visible = true;
                }
                if ((Utility.AllowedAction1(Session["Username"].ToString(), "Custom Reports - Payroll")) == false)
                {
                    tbsPay.Visible = false;
                    tbsComp.Tabs[tbsPay.Index].Visible = false;
                }
                else
                {
                    tbsPay.Visible = true;
                    tbsComp.Tabs[tbsPay.Index].Visible = true;
                }
                if ((Utility.AllowedAction1(Session["Username"].ToString(), "Custom Reports - Additions")) == false)
                {
                    tbsAdditions.Visible = false;
                    tbsComp.Tabs[tbsAdditions.Index].Visible = false;
                }
                else
                {
                    tbsAdditions.Visible = true;
                    tbsComp.Tabs[tbsAdditions.Index].Visible = true;
                }
                if ((Utility.AllowedAction1(Session["Username"].ToString(), "Custom Reports - Deductions")) == false)
                {
                    tbsDeductions.Visible = false;
                    tbsComp.Tabs[tbsDeductions.Index].Visible = false;
                }
                else
                {
                    tbsDeductions.Visible = true;
                    tbsComp.Tabs[tbsDeductions.Index].Visible = true;
                }
                if ((Utility.AllowedAction1(Session["Username"].ToString(), "Custom Reports - Claims")) == false)
                {
                    tbsClaims.Visible = false;
                    tbsComp.Tabs[tbsClaims.Index].Visible = false;
                }
                else
                {
                    tbsClaims.Visible = true;
                    tbsComp.Tabs[tbsClaims.Index].Visible = true;
                }
                if ((Utility.AllowedAction1(Session["Username"].ToString(), "Custom Reports - Grouping")) == false)
                {
                    tbsGroups.Visible = false;
                    tbsComp.Tabs[tbsGroups.Index].Visible = false;
                }
                else
                {
                    tbsGroups.Visible = true;
                    tbsComp.Tabs[tbsGroups.Index].Visible = true;
                }
                if ((Utility.AllowedAction1(Session["Username"].ToString(), "Custom Reports - Leaves")) == false)
                {
                    tbsLeaves.Visible = false;
                    tbsComp.Tabs[tbsLeaves.Index].Visible = false;
                }
                else
                {
                    tbsLeaves.Visible = true;
                    tbsComp.Tabs[tbsLeaves.Index].Visible = true;
                }
                if ((Utility.AllowedAction1(Session["Username"].ToString(), "Custom Reports - Timesheet")) == false)
                {
                    tbsTimesheet.Visible = false;
                    tbsComp.Tabs[tbsTimesheet.Index].Visible = false;
                }
                else
                {
                    tbsTimesheet.Visible = true;
                    tbsComp.Tabs[tbsTimesheet.Index].Visible = true;
                }
                if ((Utility.AllowedAction1(Session["Username"].ToString(), "Custom Reports - EmailTrack")) == false)
                {
                    tbsEmail.Visible = false;
                    tbsComp.Tabs[tbsEmail.Index].Visible = false;
                }
                else
                {
                    tbsEmail.Visible = true;
                    tbsComp.Tabs[tbsEmail.Index].Visible = true;
                } 
                lblStart.Text = "Month:";

                string sqlStr = "";
                sqlStr = "SELECT ALIAS_NAME ,CASE WHEN TABLE_SOURCE IS NULL THEN FIELD_NAME WHEN LEN(TABLE_SOURCE) = 0 THEN FIELD_NAME ELSE TABLE_SOURCE END AS RELATION FROM TABLEOBJATTRIB WHERE TABLEiD=1 Order By Alias_Name";
                RadGrid2.DataSource = DataAccess.FetchRS(CommandType.Text, sqlStr, null);
                RadGrid2.DataBind();

                sqlStr = "SELECT ALIAS_NAME ,CASE WHEN TABLE_SOURCE IS NULL THEN FIELD_NAME WHEN LEN(TABLE_SOURCE) = 0 THEN FIELD_NAME ELSE TABLE_SOURCE END AS RELATION FROM TABLEOBJATTRIB WHERE TABLEiD=2 Order By Alias_Name";
                //sqlStr = "SELECT ALIAS_NAME,CASE WHEN TABLE_SOURCE IS NULL THEN FIELD_NAME WHEN LEN(TABLE_SOURCE) = 0 THEN FIELD_NAME ELSE TABLE_SOURCE END AS RELATION FROM TABLEOBJATTRIB  WHERE TABLEiD=2 UNION Select 'Funds Summary' as ALIAS_NAME,'' as RELATION UNION Select 'Funds Detail' as ALIAS_NAME,'' as RELATION Order By Alias_Name";
                RadGrid4.DataSource = DataAccess.FetchRS(CommandType.Text, sqlStr, null);
                RadGrid4.DataBind();

                sqlStr = "select id, description from dbo.ViewAdditionTypesDesc  WHERE (COMPANY_ID=" + compid + " OR (isShared='YES')) and OPTIONSELECTION in ('General','Variable')  And id in (select distinct trx_type from emp_additions where status='L' And ClaimStatus='Approved')";
                RadGrid6.DataSource = DataAccess.FetchRS(CommandType.Text, sqlStr, null);
                RadGrid6.DataBind();

                sqlStr = "select Alias_Name,Case when len(Group_Source) = 0 then Alias_Name else Group_Source end as Group_Source  from dbo.TABLEOBJATTRIB  where GroupColumn=1 ";
                ddlCategory.DataSource = DataAccess.FetchRS(CommandType.Text, sqlStr, null);
                ddlCategory.DataTextField = "Alias_Name";
                ddlCategory.DataValueField = "Group_Source";
                ddlCategory.DataBind();

                ddlCategory.Items.Insert(0, "Select");

                sqlStr = "select id, description from dbo.ViewDeductions  WHERE (COMPANY_ID=" + compid + " OR (isShared='YES')) And id in (select distinct trx_type from emp_deductions where status='L') ";
                RadGrid10.DataSource = DataAccess.FetchRS(CommandType.Text, sqlStr, null);
                RadGrid10.DataBind();

                sqlStr = "select id, description from dbo.ViewAdditionTypesDesc  WHERE (COMPANY_ID=" + compid + " OR (isShared='YES')) and OPTIONSELECTION='Claim'  And id in (select distinct trx_type from emp_additions where status='L' And ClaimStatus='Approved')";
                RadGrid12.DataSource = DataAccess.FetchRS(CommandType.Text, sqlStr, null);
                RadGrid12.DataBind();
                
                //santy
                sqlStr = "select id, Category_Name description from CertificateCategory  WHERE COMPANY_ID=" + compid + " OR Company_ID='-1'";
                RadGrid17.DataSource = DataAccess.FetchRS(CommandType.Text, sqlStr, null);
                RadGrid17.DataBind();

                if (HttpContext.Current.Session["PAYTYPE"].ToString() == "0")
                {
                    sqlStr = "Select p.rowid, (P.MonthName+ ' - ' + cast(p.[Year] as varchar)) AliasMonth From Payrollmonthlydetail p inner join company c on p.paytype>=0 where company_id=" + compid + " and p.rowid in (select Distinct MonthYear from emailtrack) order by p.monthname";
                }
                else
                {
                    sqlStr = "Select p.rowid, (P.MonthName+ ' - ' + cast(p.[Year] as varchar)) AliasMonth From Payrollmonthlydetail p inner join company c on p.paytype=c.payrolltype where company_id=" + compid + " and p.rowid in (select Distinct MonthYear from emailtrack) order by p.monthname";
                }
                RadGrid15.DataSource = DataAccess.FetchRS(CommandType.Text, sqlStr, null);
                RadGrid15.DataBind();


                dlDept.Items.Add(new ListItem("- Select -", "-1"));
                dlDept.Items.Add(new ListItem("-All-", "-1"));

                ddlPayDept.Items.Insert(0, "- Select -");
                ddlPayDept.Items.Insert(1, "-All-");

                dlAdditions.Items.Insert(0, "- Select -");
                dlAdditions.Items.Insert(1, "-All-");

                dlDeptDeductions.Items.Insert(0, "- Select -");
                dlDeptDeductions.Items.Insert(1, "-All-");

                dlClaimsDept.Items.Insert(0, "- Select -");
                dlClaimsDept.Items.Insert(1, "-All-");

                //santy
                dlExpiryDept.Items.Insert(0, "- Select -");
                dlExpiryDept.Items.Insert(1, "-All-");

                dlEmailDept.Items.Insert(0, "- Select -");
                dlEmailDept.Items.Insert(1, "-All-");

                drpYear.DataSourceID = "xmldtYear";
                drpYear.DataTextField = "text";
                drpYear.DataValueField = "id";
                drpYear.DataBind();
                drpYear.Items.FindByText(System.DateTime.Today.Year.ToString()).Selected = true;

            }
            else
            {



            }



            rdVar.SelectedIndexChanged += new EventHandler(rdVar_SelectedIndexChanged);
            btnvVariance.Click += new EventHandler(btnvVariance_Click);
        }

     

   

       
        

        protected void RadGrid1_PageIndexChanged(object source, GridPageChangedEventArgs e)
        {
            RadGrid1.CurrentPageIndex = e.NewPageIndex;
            RadGrid1.DataBind();
        }

        protected void GenerateRptEmail_Click(object sender, EventArgs e)
        {
            string sqlTrns = "0";
            string sqlQuery = "";
            string strEmployee = "0";
            string sqlSelect = "";
            int grid1 = 0;
            int grid2 = 0;
            lblerror.Text = "";
            foreach (GridItem item in RadGrid14.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid1++;
                        strEmployee = strEmployee + "," + dataItem.Cells[2].Text.ToString().Trim();
                    }
                }
            }
            foreach (GridItem item in RadGrid15.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid2++;
                        // sqlSelect = sqlSelect + " " + dataItem.Cells[4].Text.ToString().Trim() + ",";
                        sqlTrns = sqlTrns + "," + dataItem.Cells[3].Text.ToString().Trim();
                    }
                }
            }

            if (grid1 > 0)
            {
                if (grid2 > 0)
                {
                    //sqlSelect = sqlSelect.Remove(sqlSelect.Length - 1, 1);
                    //sqlSelect = sqlSelect + " from Employee e1  where e1.emp_code in (" + strEmployee + ")  ORDER BY EMP_NAME";

                    if (txtDocNo.Text.ToString().Trim().Length > 0)
                    {
                        sqlSelect = "Select Docid,E.Emp_Code,E.time_card_no, isnull(E.emp_name,'')+' '+isnull(E.emp_lname,'') SentTo , EventView = Case When EventView=1 Then 'Email Payslip' Else '' End, Senton, isnull(Em.emp_name,'')+' '+isnull(Em.emp_lname,'') SentBy, [T.Status] = Case When T.Status=0 Then 'Success' Else 'Fail' End, T.Remarks From emailtrack T Inner Join Employee E On (T.Sentto = E.Emp_Code Or T.Sentto=0) Inner Join Employee Em On T.SentBy = Em.Emp_Code Where E.Emp_Code In (" + strEmployee + ") And T.MonthYear in (" + sqlTrns + ") And EventView = '" + rdOptionEmail.SelectedValue + "' and cast(t.docid as varchar) like '%" + txtDocNo.Text.ToString().Trim() + "%'";
                    }
                    else
                    {
                        sqlSelect = "Select Docid,E.Emp_Code,E.time_card_no, isnull(E.emp_name,'')+' '+isnull(E.emp_lname,'') SentTo , EventView = Case When EventView=1 Then 'Email Payslip' Else '' End, Senton, isnull(Em.emp_name,'')+' '+isnull(Em.emp_lname,'') SentBy, [T.Status] = Case When T.Status=0 Then 'Success' Else 'Fail' End, T.Remarks From emailtrack T Inner Join Employee E On (T.Sentto = E.Emp_Code Or T.Sentto=0) Inner Join Employee Em On T.SentBy = Em.Emp_Code Where E.Emp_Code In (" + strEmployee + ") And T.MonthYear in (" + sqlTrns + ") And EventView = '" + rdOptionEmail.SelectedValue + "'";
                    }
                    DataSet rptDs;
                    rptDs = DataAccess.FetchRS(CommandType.Text, sqlSelect, null);
                    Session["rptDs"] = rptDs;
                    Response.Redirect("../Reports/CustomReportNew.aspx");
                }
                else
                {
                    lblerror.Text = "Please Select Atleast One Field Name";

                }
            }
            else
            {
                lblerror.Text = "Please Select Atleast One Employee ";
            }

        }

        protected void GenerateRpt_Click(object sender, EventArgs e)
        {
            string sqlQuery = "";
            string strEmployee = "0";
            string sqlSelect = "select emp_code Emp_Code, isnull(emp_name,'')+' '+isnull(emp_lname,'') Full_Name , ";
            int grid1 = 0;
            int grid2 = 0;
            lblerror.Text = "";
            foreach (GridItem item in RadGrid1.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid1++;
                        strEmployee = strEmployee + "," + dataItem.Cells[2].Text.ToString().Trim();
                    }
                }
            }
            foreach (GridItem item in RadGrid2.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid2++;
                        if (dataItem.Cells[4].Text.ToString().Trim() != "emp_code" && dataItem.Cells[4].Text.ToString().Trim() != "emp_name")
                        {
                            if (dataItem.Cells[4].Text.ToString().Trim() == "payment_mode")
                            {
                                //sqlSelect = sqlSelect + " case  " + dataItem.Cells[4].Text.ToString().Trim() + " WHEN -1 THEN 'Cash' ELSE 'Cheque' END AS [" + dataItem.Cells[3].Text.ToString().Trim() + "],";
                                sqlSelect = sqlSelect + " " + dataItem.Cells[4].Text.ToString().Trim() + " AS [" + dataItem.Cells[3].Text.ToString().Trim() + "],";
                            }
                            else
                            {
                                sqlSelect = sqlSelect + " " + dataItem.Cells[4].Text.ToString().Trim() + " AS [" + dataItem.Cells[3].Text.ToString().Trim() + "],";
                            }
                        }
                    }
                }
            }

            if (grid1 > 0)
            {
                if (grid2 > 0)
                {
                    sqlSelect = sqlSelect.Remove(sqlSelect.Length - 1, 1);
                    sqlSelect = sqlSelect + " from Employee e1  where e1.emp_code in (" + strEmployee + ")  ORDER BY EMP_NAME";
                    DataSet rptDs;
                    rptDs = DataAccess.FetchRS(CommandType.Text, sqlSelect, null);
                    Session["rptDs"] = rptDs;
                    Response.Redirect("../Reports/CustomReportNew.aspx");
                }
                else
                {
                    lblerror.Text = "Please Select Atleast One Field Name";

                }
            }
            else
            {
                lblerror.Text = "Please Select Atleast One Employee ";
            }

        }


        protected void GeneratePayroll_Click(object sender, EventArgs e)
        {
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            string sqlQuery = "";
            string strEmployee = "0";
            string sqlSelect = "SELECT isnull(emp_name,'')+' '+isnull(emp_lname,'') as [Full_Name],DeptName as [Department],convert(nvarchar(10),start_period,103) As [Start_Period],convert(nvarchar(10),end_period,103) As [End_Period], ";
            string sqlGroup = "GROUP BY ";
            int grid1 = 0;
            int grid2 = 0; lblerror.Text = "";
            foreach (GridItem item in RadGrid3.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid1++;
                        strEmployee = strEmployee + "," + dataItem.Cells[2].Text.ToString().Trim();
                    }
                }
            }
            foreach (GridItem item in RadGrid4.MasterTableView.Items)
            {
                if (item is GridItem)
                {

                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid2++;
                        if (dataItem.Cells[4].Text.ToString().Trim() == "basic_pay" || dataItem.Cells[4].Text.ToString().Trim() == "NetPay")
                        {
                            sqlSelect = sqlSelect + "  Convert(numeric(10,2), convert(varchar(10),DecryptByAsymKey(AsymKey_ID('AsymKey')," + dataItem.Cells[4].Text.ToString().Trim() + "))) As [" + dataItem.Cells[3].Text.ToString().Trim() + "],";
                            sqlGroup = sqlGroup + " " + dataItem.Cells[4].Text.ToString().Trim() + ",";
                        }
                        else
                        {
                            //sqlSelect = sqlSelect + " " + dataItem.Cells[4].Text.ToString().Trim() + " As [" + dataItem.Cells[3].Text.ToString().Trim() + "] ,";
                            sqlSelect = sqlSelect + " " + dataItem.Cells[4].Text.ToString().Trim() + " As [" + dataItem.Cells[4].Text.ToString().Trim() + "] ,";
                            sqlGroup = sqlGroup + " " + dataItem.Cells[4].Text.ToString().Trim() + ",";
                        }
                    }
                }
            }

            if (dtp1.SelectedDate.HasValue)
            {
                if (dtp2.SelectedDate.HasValue)
                {
                    sqlSelect = sqlSelect.Remove(sqlSelect.Length - 1, 1);
                    sqlGroup = sqlGroup + "EMP_NAME,EMP_lname,DeptName,start_period,end_period ";
                    string startdate = Convert.ToDateTime(dtp1.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);
                    string enddate = Convert.ToDateTime(dtp2.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);

                    //string[] dateSplit = startdate.Split('/');
                    //startdate = dateSplit[0] + "/1/" + dateSplit[2];
                    //dateSplit = enddate.Split('/');
                    //if (dateSplit[0] == "2")
                    //{
                    //    dateSplit[1] = "28";
                    //}
                    //else if (dateSplit[0] == "4" || dateSplit[0] == "6" || dateSplit[0] == "9" || dateSplit[0] == "11")
                    //{
                    //    dateSplit[1] = "30";
                    //}
                    //else
                    //{
                    //    dateSplit[1] = "31";
                    //}
                    //enddate = dateSplit[0] + "/" + dateSplit[1] + "/" + dateSplit[2];

                    //sqlSelect = sqlSelect + " from PayRollView  where emp_code in (" + strEmployee + ")";
                    sqlSelect = sqlSelect + " from PayRollView1  where emp_code in (" + strEmployee + ")";
                    sqlSelect = sqlSelect + " and Convert(Datetime,start_period,103) between Convert(Datetime,'" + startdate + "',103) And Convert(Datetime,'" + enddate + "',103)";
                    sqlSelect = sqlSelect + " and Convert(Datetime,end_period,103) between Convert(Datetime,'" + startdate + "',103) And Convert(Datetime,'" + enddate + "',103)";
                    sqlSelect = sqlSelect + " And STATUS in ('G') ";
                    sqlSelect = sqlSelect + " " + sqlGroup + "  ORDER BY EMP_NAME,DeptName,start_period";
                    if (grid1 > 0)
                    {
                        if (grid2 > 0)
                        {
                            DataSet rptDs;
                            rptDs = DataAccess.FetchRS(CommandType.Text, sqlSelect, null);
                            Session["rptDs"] = rptDs;
                            Response.Redirect("../Reports/CustomReportNew.aspx?PageType=2");
                        }
                        else
                        {
                            lblerror.Text = "Please Select Atleast One Field Name";

                        }
                    }
                    else
                    {
                        lblerror.Text = "Please Select Atleast One Employee ";
                    }
                }

                else
                {
                    lblerror.Text = "Please Select End Month";
                }
            }
            else
            {
                lblerror.Text = "Please Select Start Month";
            }
        }


        protected void GenerateAddtions_Click(object sender, EventArgs e)
        {
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            string sqlQuery = "";
            string strEmployee = "0";
            string sqlSelect = "select ";
            string sqlTrns = "0";
            int grid1 = 0;
            int grid2 = 0; lblerror.Text = "";
            foreach (GridItem item in RadGrid5.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid1++;
                        strEmployee = strEmployee + "," + dataItem.Cells[2].Text.ToString().Trim();
                    }
                }
            }
            foreach (GridItem item in RadGrid6.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid2++;
                        // sqlSelect = sqlSelect + " " + dataItem.Cells[4].Text.ToString().Trim() + ",";
                        sqlTrns = sqlTrns + "," + dataItem.Cells[3].Text.ToString().Trim();
                    }
                }
            }
            if (RadDatePicker1.SelectedDate.HasValue)
            {
                if (RadDatePicker2.SelectedDate.HasValue)
                {
                    string startdate = Convert.ToDateTime(RadDatePicker1.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);
                    string enddate = Convert.ToDateTime(RadDatePicker2.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);


                    string sSQL = "Sp_getpivotclaimsadditions";
                    SqlParameter[] parms = new SqlParameter[7];
                    parms[0] = new SqlParameter("@empcode", strEmployee);
                    parms[1] = new SqlParameter("@trxtype", sqlTrns);
                    parms[2] = new SqlParameter("@startdate", startdate);
                    parms[3] = new SqlParameter("@enddate", enddate);
                    parms[4] = new SqlParameter("@claimtype", Utility.ToInteger(rdAdditions.SelectedItem.Value.ToString()));
                    parms[5] = new SqlParameter("@addtype", "ADD");
                    if (rdAdditions.SelectedItem.Value == "1" || rdAdditions.SelectedItem.Value == "2")
                    {
                        parms[6] = new SqlParameter("@stattype", 'L');
                    }
                    else
                    {
                        parms[6] = new SqlParameter("@stattype", 'U');
                    }


                    if (grid1 > 0)
                    {
                        if (grid2 > 0)
                        {
                            DataSet rptDs = new DataSet();
                            rptDs = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL, parms);
                            Session["rptDs"] = rptDs;
                            Response.Redirect("../Reports/CustomReportNew.aspx");

                            //if (rdDeductions.SelectedItem.Value == "1")
                            //{
                            //    DataSet rptDs = new DataSet();
                            //    rptDs = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL, parms);
                            //    Session["rptDs"] = rptDs;
                            //    Response.Redirect("../Reports/CustomReportNew.aspx");
                            //}
                            //else
                            //{
                            //    DataSet rptDs = new DataSet();
                            //    DataTable dt = Pivot(DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQL, parms), "Full_Name", "description", "Amount");
                            //    int i = 0;
                            //    foreach (DataRow dr in dt.Rows)
                            //    {
                            //        i = dr["Full_Name"].ToString().IndexOf("-");
                            //        dr["Full_Name"] = dr["Full_Name"].ToString().Substring(0, i - 1);
                            //    }
                            //    rptDs.Tables.Add(dt);
                            //    Session["rptDs"] = rptDs;
                            //    Response.Redirect("../Reports/CustomReportNew.aspx");
                        }
                        else
                        {
                            lblerror.Text = "Please Select Atleast One Field Name";

                        }
                    }
                    else
                    {
                        lblerror.Text = "Please Select Atleast One Employee ";
                    }
                }

                else
                {
                    lblerror.Text = "Please Select End Month";
                }
            }
            else
            {
                lblerror.Text = "Please Select Start Month";
            }
        }

        public static DataTable Pivot(IDataReader dataValues, string keyColumn, string pivotNameColumn, string pivotValueColumn)
        {
            DataTable tmp = new DataTable();
            DataRow r;
            string LastKey = "//dummy//";
            int i, pValIndex, pNameIndex;
            string s;
            bool FirstRow = true;
            pValIndex = dataValues.GetOrdinal(pivotValueColumn);
            pNameIndex = dataValues.GetOrdinal(pivotNameColumn);
            for (i = 0; i <= dataValues.FieldCount - 1; i++)
                if (i != pValIndex && i != pNameIndex)
                    tmp.Columns.Add(dataValues.GetName(i), dataValues.GetFieldType(i));
            r = tmp.NewRow();
            while (dataValues.Read())
            {
                if (dataValues[keyColumn].ToString() != LastKey)
                {
                    if (!FirstRow)
                        tmp.Rows.Add(r);
                    r = tmp.NewRow();
                    FirstRow = false;
                    for (i = 0; i <= dataValues.FieldCount - 3; i++)
                        r[i] = dataValues[tmp.Columns[i].ColumnName];
                    LastKey = dataValues[keyColumn].ToString();
                }

                s = dataValues[pNameIndex].ToString();
                if (!tmp.Columns.Contains(s))
                    tmp.Columns.Add(s, dataValues.GetFieldType(pValIndex));
                r[s] = dataValues[pValIndex];
            }
            tmp.Rows.Add(r);
            dataValues.Close();
            return tmp;
        }

        protected void GenerateDeductions_Click(object sender, EventArgs e)
        {
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            string sqlQuery = "";
            string strEmployee = "0";
            string sqlSelect = "select ";
            string sqlTrns = "0";
            int grid1 = 0;
            int grid2 = 0; lblerror.Text = "";
            foreach (GridItem item in RadGrid9.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid1++;
                        strEmployee = strEmployee + "," + dataItem.Cells[2].Text.ToString().Trim();
                    }
                }
            }
            foreach (GridItem item in RadGrid10.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid2++;
                        // sqlSelect = sqlSelect + " " + dataItem.Cells[4].Text.ToString().Trim() + ",";
                        sqlTrns = sqlTrns + "," + dataItem.Cells[3].Text.ToString().Trim();
                    }
                }
            }
            if (RadDatePicker5.SelectedDate.HasValue)
            {
                if (RadDatePicker6.SelectedDate.HasValue)
                {
                    string startdate = Convert.ToDateTime(RadDatePicker5.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);
                    string enddate = Convert.ToDateTime(RadDatePicker6.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);

                    string sSQL = "Sp_getpivotclaimsadditions";
                    SqlParameter[] parms = new SqlParameter[7];
                    parms[0] = new SqlParameter("@empcode", strEmployee);
                    parms[1] = new SqlParameter("@trxtype", sqlTrns);
                    parms[2] = new SqlParameter("@startdate", startdate);
                    parms[3] = new SqlParameter("@enddate", enddate);
                    parms[4] = new SqlParameter("@claimtype", Utility.ToInteger(rdDeductions.SelectedItem.Value.ToString()));
                    parms[5] = new SqlParameter("@addtype", "DED");
                    if (rdDeductions.SelectedItem.Value == "1" || rdDeductions.SelectedItem.Value == "2")
                    {
                        parms[6] = new SqlParameter("@stattype", 'L');
                    }
                    else
                    {
                        parms[6] = new SqlParameter("@stattype", 'U');
                    }
                    if (grid1 > 0)
                    {
                        if (grid2 > 0)
                        {
                            DataSet rptDs = new DataSet();
                            rptDs = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL, parms);
                            Session["rptDs"] = rptDs;
                            Response.Redirect("../Reports/CustomReportNew.aspx?PageType=22");

                            //if (rdDeductions.SelectedItem.Value == "1")
                            //{
                            //    DataSet rptDs = new DataSet();
                            //    rptDs = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL, parms);
                            //    Session["rptDs"] = rptDs;
                            //    Response.Redirect("../Reports/CustomReportNew.aspx");
                            //}
                            //else
                            //{
                            //    DataSet rptDs = new DataSet();
                            //    DataTable dt = Pivot(DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQL, parms), "Full_Name", "description", "Amount");
                            //    int i = 0;
                            //    foreach (DataRow dr in dt.Rows)
                            //    {
                            //        i = dr["Full_Name"].ToString().IndexOf("-");
                            //        dr["Full_Name"] = dr["Full_Name"].ToString().Substring(0, i - 1);
                            //    }
                            //    rptDs.Tables.Add(dt);
                            //    Session["rptDs"] = rptDs;
                            //    Response.Redirect("../Reports/CustomReportNew.aspx");
                            //}
                        }
                        else
                        {
                            lblerror.Text = "Please Select Atleast One Field Name";

                        }
                    }
                    else
                    {
                        lblerror.Text = "Please Select Atleast One Employee ";
                    }

                }
                else
                {
                    lblerror.Text = "Please Select End Month";
                }
            }
            else
            {
                lblerror.Text = "Please Select Start Month";
            }
        }
        protected void GenerateClaims_Click(object sender, EventArgs e)
        {
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            string sqlQuery = "";
            string strEmployee = "0";
            string sqlSelect = "select ";
            string sqlTrns = "0";
            int grid1 = 0;
            int grid2 = 0; lblerror.Text = "";
            foreach (GridItem item in RadGrid11.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid1++;
                        strEmployee = strEmployee + "," + dataItem.Cells[2].Text.ToString().Trim();
                    }
                }
            }
            foreach (GridItem item in RadGrid12.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid2++;
                        // sqlSelect = sqlSelect + " " + dataItem.Cells[4].Text.ToString().Trim() + ",";
                        sqlTrns = sqlTrns + "," + dataItem.Cells[3].Text.ToString().Trim();
                    }
                }
            }

            if (RadDatePicker7.SelectedDate.HasValue)
            {
                if (RadDatePicker8.SelectedDate.HasValue)
                {
                    string startdate = Convert.ToDateTime(RadDatePicker7.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);
                    string enddate = Convert.ToDateTime(RadDatePicker8.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);

                    //string[] dateSplit = startdate.Split('/');
                    //startdate = dateSplit[0] + "/1/" + dateSplit[2];
                    //dateSplit = enddate.Split('/');
                    //if (dateSplit[0] == "2")
                    //{
                    //    dateSplit[1] = "28";
                    //}
                    //else if (dateSplit[0] == "4" || dateSplit[0] == "6" || dateSplit[0] == "9" || dateSplit[0] == "11")
                    //{
                    //    dateSplit[1] = "30";
                    //}
                    //else
                    //{
                    //    dateSplit[1] = "31";
                    //}
                    //enddate = dateSplit[0] + "/" + dateSplit[1] + "/" + dateSplit[2];
                    //sqlSelect = sqlSelect.Remove(sqlSelect.Length - 1, 1);

                    string sSQL = "Sp_getpivotclaimsadditions";
                    SqlParameter[] parms = new SqlParameter[7];
                    parms[0] = new SqlParameter("@empcode", strEmployee);
                    parms[1] = new SqlParameter("@trxtype", sqlTrns);
                    parms[2] = new SqlParameter("@startdate", startdate);
                    parms[3] = new SqlParameter("@enddate", enddate);
                    parms[4] = new SqlParameter("@claimtype", Utility.ToInteger(rdAdditions.SelectedItem.Value.ToString()));
                    parms[5] = new SqlParameter("@addtype", "Claim");
                    if (rdAdditions.SelectedItem.Value == "1" || rdAdditions.SelectedItem.Value == "2")
                    {
                        parms[6] = new SqlParameter("@stattype", 'L');
                    }
                    else
                    {
                        parms[6] = new SqlParameter("@stattype", 'U');
                    }
                    if (grid1 > 0)
                    {
                        if (grid2 > 0)
                        {
                            DataSet rptDs = new DataSet();
                            rptDs = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL, parms);
                            Session["rptDs"] = rptDs;
                            Response.Redirect("../Reports/CustomReportNew.aspx");

                            //if (rdClaim.SelectedItem.Value == "1")
                            //{
                            //    DataSet rptDs = new DataSet();
                            //    rptDs = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL, parms);
                            //    Session["rptDs"] = rptDs;
                            //    Response.Redirect("../Reports/CustomReportNew.aspx");
                            //}
                            //else
                            //{
                            //    DataSet rptDs = new DataSet();
                            //    DataTable dt = Pivot(DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQL, parms), "Full_Name", "description", "Amount");
                            //    int i = 0;
                            //    foreach (DataRow dr in dt.Rows)
                            //    {
                            //        i = dr["Full_Name"].ToString().IndexOf("-");
                            //        dr["Full_Name"] = dr["Full_Name"].ToString().Substring(0, i - 1);
                            //    }
                            //    rptDs.Tables.Add(dt);
                            //    Session["rptDs"] = rptDs;
                            //    Response.Redirect("../Reports/CustomReportNew.aspx");
                            //}

                        }
                        else
                        {
                            lblerror.Text = "Please Select Atleast One Field Name";

                        }
                    }
                    else
                    {
                        lblerror.Text = "Please Select Atleast One Employee ";
                    }
                }
                else
                {
                    lblerror.Text = "Please Select End Month";
                }
            }
            else
            {
                lblerror.Text = "Please Select Start Month";
            }
        }

        protected void GenerateExpiry_Click(object sender, EventArgs e)
        {
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            string sqlQuery = "";
            string strEmployee = "0";
            string sqlSelect = "select ";
            string sqlTrns = "0";
            int grid1 = 0;
            int grid2 = 0; lblerror.Text = "";
            foreach (GridItem item in RadGrid16.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid1++;
                        strEmployee = strEmployee + "," + dataItem.Cells[2].Text.ToString().Trim();
                    }
                }
            }
            foreach (GridItem item in RadGrid17.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        grid2++;
                        // sqlSelect = sqlSelect + " " + dataItem.Cells[4].Text.ToString().Trim() + ",";
                        sqlTrns = sqlTrns + "," + dataItem.Cells[3].Text.ToString().Trim();
                    }
                }
            }

            if (RadDatePicker4.SelectedDate.HasValue)
            {
                string enddate = Convert.ToDateTime(RadDatePicker4.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);


                string sqlStr = "Select  (isnull(M.emp_name,'')+' '+isnull(M.emp_lname,'')) FullName,C.Category_Name, E.CertificateNumber,Convert(varchar,E.ExpiryDate ,103) ExpiryDate From EmployeeCertificate E Inner Join CertificateCategory C On E.CertificateCategoryID = C.ID Inner Join Employee M On E.Emp_ID=M.Emp_Code";
                sqlStr = sqlStr + " Where E.Emp_ID In (" + strEmployee + ") And C.ID in (" + sqlTrns + ") And Convert(Datetime,E.ExpiryDate,103) <= Convert(Datetime,'" + enddate.ToString() + "',103)";
                if (grid1 > 0)
                {
                    if (grid2 > 0)
                    {
                        DataSet rptDs = new DataSet();
                        rptDs = DataAccess.FetchRS(CommandType.Text, sqlStr, null);
                        Session["rptDs"] = rptDs;
                        Response.Redirect("../Reports/CustomReportNew.aspx");
                    }
                    else
                    {
                        lblerror.Text = "Please Select Atleast One Field Name";

                    }
                }
                else
                {
                    lblerror.Text = "Please Select Atleast One Employee ";
                }
            }
            else
            {
                lblerror.Text = "Please Select End Month";
            }
        }


        protected void rdOptionList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdOptionList.SelectedValue == "1")
            {
                lblname.Text = "Project Name:";
                RadComboBoxEmpPrj.Visible = false;
                drpSubProjectID.Visible = true;
                RadGrid222.Visible = true;
                RadGrid111.Visible = false;
            }
            else if (rdOptionList.SelectedValue == "2")
            {
                lblname.Text = "Employee Name:";
                RadComboBoxEmpPrj.Visible = true;
                drpSubProjectID.Visible = false;
                RadGrid222.Visible = false;
                RadGrid111.Visible = true;
            }
        }

        protected void ddlCategory_selectedIndexChanged(object sender, EventArgs e)
        {
            string sqlStr = "";
            switch (ddlCategory.SelectedValue.ToString())
            {

                case "Nationality":
                    sqlStr = " SELECT id as OptionId,Nationality As Category From " + ddlCategory.SelectedValue.ToString() + " Where ID In (Select Distinct Nationality_ID From Employee Where Company_ID="+ comp_id +")  Order By Nationality";
                    break;
                case "Country":
                    sqlStr = " SELECT id as OptionId,Country As Category From " + ddlCategory.SelectedValue.ToString() + " Where ID In (Select Distinct Country_ID From Employee Where Company_ID=" + comp_id + ")  Order By Country";
                    break;
                case "Sex":
                    sqlStr = "SELECT 'M' as OptionId,'Male'  As Category union  SELECT 'F' as OptionId,'Female'  As Category ";
                    break;
                case "Marital Status":
                    sqlStr = "SELECT 'S' as OptionId,'Single'  As Category union  SELECT 'M' as OptionId,'Married'  As Category union  SELECT 'D' as OptionId,'Divorce'  As Category  ";
                    break;
                case "Race":
                    sqlStr = " SELECT id as OptionId,Race As Category From " + ddlCategory.SelectedValue.ToString() + " Where ID In (Select Distinct Race_ID From Employee Where Company_ID=" + comp_id + ")  Order By Race";
                    break;
                case "Religion":
                    sqlStr = " SELECT id as OptionId,Religion As Category From " + ddlCategory.SelectedValue.ToString() + " Where ID In (Select Distinct Religion_ID From Employee Where Company_ID=" + comp_id + ")  Order By Religion";
                    break;
                case "Designation":
                    sqlStr = " SELECT id as OptionId,Designation As Category From " + ddlCategory.SelectedValue.ToString() + " Where ID In (Select Distinct Desig_ID From Employee Where Company_ID=" + comp_id + ")  Order By Designation";
                    break;
                case "Department":
                    sqlStr = " SELECT id as OptionId,DeptName As Category From " + ddlCategory.SelectedValue.ToString() + " Where ID In (Select Distinct Dept_ID From Employee Where Company_ID=" + comp_id + ")  Order By DeptName";
                    break;
                case "Emp_Group":
                    sqlStr = " SELECT id as OptionId,EmpGroupName As Category From " + ddlCategory.SelectedValue.ToString() + " Where ID In (Select Distinct Emp_Group_ID From Employee Where Company_ID=" + comp_id + ")  Order By EmpGroupName";
                    break;
                case "Employee Type":
                    sqlStr = " SELECT DISTINCT EMP_TYPE As Category ,EMP_TYPE As OptionId FROM EMPLOYEE WHERE EMP_TYPE IS NOT NULL  Order By Emp_Type";
                    break;
                case "Place of birth":
                    sqlStr = " SELECT Country as OptionId,Country As Category From Country " + " Where ID In (Select Distinct Country_ID From Employee Where Company_ID=" + comp_id + ")  Order By Country";
                    break;
            }

            if (sqlStr.Length > 0)
            {
                RadGrid8.DataSource = DataAccess.FetchRS(CommandType.Text, sqlStr, null);
                RadGrid8.DataBind();
                RadGrid8.Visible = true;
                RadGrid8.MasterTableView.Visible = true;
            }


        }
        protected void btnGenLeaveRep_Click(object sender, EventArgs e)
        {
            string strMessage = "";
            string sqlQuery = "";
            string strEmployee = "0";
            string sqlSelect = "select ";
            string sqlTrns1 = "0";
            string sqlTrns2 = "0";

            if (rdRepOption.SelectedItem.Value == "2")
            {

                if (Utility.ToInteger(drpMonthStart.SelectedItem.Value) > Utility.ToInteger(drpMonthEnd.SelectedItem.Value))
                {
                    strMessage = "Start Month Should be Greater than End Month.";
                }
                if (Utility.ToInteger(drpMonthStart.SelectedItem.Value) == 0 || Utility.ToInteger(drpMonthEnd.SelectedItem.Value) == 0)
                {
                    strMessage = strMessage + "<br/>" + "For Detail Report Need to select month in Start and End Month.";
                }
            }
            if (strMessage.Length <= 0)
            {
                foreach (GridItem item in RadGrid7.MasterTableView.Items)
                {
                    if (item is GridItem)
                    {
                        GridDataItem dataItem = (GridDataItem)item;
                        CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                        if (chkBox.Checked == true)
                        {
                            sqlTrns1 = sqlTrns1 + "," + dataItem.Cells[2].Text.ToString().Trim();
                        }
                    }
                }

                foreach (GridItem item in RadGrid13.MasterTableView.Items)
                {
                    if (item is GridItem)
                    {
                        GridDataItem dataItem = (GridDataItem)item;
                        CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                        if (chkBox.Checked == true)
                        {
                            sqlTrns2 = sqlTrns2 + "," + dataItem.Cells[2].Text.ToString().Trim();
                        }
                    }
                }

                string sSQL = "sp_GetLeaveSumDet";
                SqlParameter[] parms = new SqlParameter[6];
                parms[0] = new SqlParameter("@year", Utility.ToInteger(drpYear.SelectedItem.Value));
                parms[1] = new SqlParameter("@EmpID", sqlTrns1);
                parms[2] = new SqlParameter("@LeaveID", sqlTrns2);
                parms[3] = new SqlParameter("@ReportType", Utility.ToInteger(rdRepOption.SelectedItem.Value));
                parms[4] = new SqlParameter("@frommonth", Utility.ToInteger(drpMonthStart.SelectedItem.Value));
                if (rdRepOption.SelectedItem.Value == "1")
                {
                    parms[5] = new SqlParameter("@endmonth", Utility.ToInteger("-1"));
                }
                else
                {
                    parms[5] = new SqlParameter("@endmonth", Utility.ToInteger(drpMonthEnd.SelectedItem.Value));
                }
                DataSet ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                Session["rptDs"] = ds;
                Response.Redirect("../Reports/CustomReportNew.aspx?PageType=6");
            }
            else
            {
                if (strMessage.Length > 0)
                {
                    //Response.Write("<SCRIPT>alert('" + strMessage + "');</SCRIPT>");
                    ShowMessageBox(strMessage);
                    strMessage = "";
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
        protected void rdRepOption_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            if (rdRepOption.SelectedItem.Value == "1")
            {
                lblStart.Text = "Month:";
                lblEnd.Text = "End:";
                lblEnd.Visible = false;
                drpMonthEnd.Visible = false;
            }
            else
            {
                lblStart.Text = "Start:";
                lblEnd.Text = "End:";
                lblEnd.Visible = true;
                drpMonthEnd.Visible = true;
            }
        }

        protected void GenerateGrouping_Click(object sender, EventArgs e)
        {
            string sqlQuery = "";
            string strEmployee = "0";
            string sqlSelect = "select ";
            string sqlTrns = "'0'";

            foreach (GridItem item in RadGrid8.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        // sqlSelect = sqlSelect + " " + dataItem.Cells[4].Text.ToString().Trim() + ",";
                        sqlTrns = sqlTrns + ",'" + dataItem.Cells[3].Text.ToString().Trim() + "'";
                    }
                }
            }

            string sqlStr = "";
            switch (ddlCategory.SelectedValue.ToString())
            {

                case "Nationality":
                    sqlStr = " SELECT isnull(emp_name,'')+' '+isnull(emp_lname,'') Full_Name,Nationality  As Category From employee inner join Nationality on employee.Nationality_id = Nationality.id WHERE NATIONALITY_ID IN(" + sqlTrns + ") GROUP BY nATIONALITY,emp_name,EMP_LNAME";
                    break;
                case "Country":
                    sqlStr = " SELECT isnull(emp_name,'')+' '+isnull(emp_lname,'') Full_Name,Country  As Category From employee inner join Country on employee.Country_id = Country.id   WHERE Country_id IN(" + sqlTrns + ") GROUP BY Country,emp_name,EMP_LNAME";
                    break;
                case "Religion":
                    sqlStr = "SELECT isnull(emp_name,'')+' '+isnull(emp_lname,'') Full_Name,Religion As Category From employee inner join Religion on employee.Religion_id = Religion.id  WHERE Religion_id IN(" + sqlTrns + ") GROUP BY Religion,emp_name,EMP_LNAME";
                    break;
                case "Race":
                    sqlStr = "SELECT isnull(emp_name,'')+' '+isnull(emp_lname,'') Full_Name,Race As Category  From employee inner join Race on employee.race_id = Race.id  WHERE race_id IN(" + sqlTrns + ") GROUP BY Race,emp_name,EMP_LNAME";
                    break;
                case "Designation":
                    sqlStr = " SELECT isnull(emp_name,'')+' '+isnull(emp_lname,'') Full_Name,Designation.Designation As Category From employee inner join Designation on employee.Desig_id = Designation.id  WHERE Desig_id IN(" + sqlTrns + ") GROUP BY Designation.Designation,emp_name,EMP_LNAME";
                    break;
                case "Department":
                    sqlStr = " SELECT isnull(emp_name,'')+' '+isnull(emp_lname,'') Full_Name,DeptName  As Category From employee inner join Department on employee.Dept_id = Department.id  WHERE Dept_id IN(" + sqlTrns + ") GROUP BY DeptName,emp_name,EMP_LNAME";
                    break;
                case "Sex":
                    sqlTrns = sqlTrns.Replace("0,", "");
                    sqlTrns = sqlTrns.Replace("F", "'F'");
                    sqlTrns = sqlTrns.Replace("M", "'M'");

                    sqlStr = "SELECT isnull(emp_name,'')+' '+isnull(emp_lname,'') Full_Name,Case sex when 'M' Then 'Male' else 'Female' end  As Category  From employee   WHERE SEX IN(" + sqlTrns + ") GROUP BY SEX,emp_name,emp_lname,EMP_LNAME";
                    break;
                case "Marital Status":
                    sqlTrns = sqlTrns.Replace("0,", "");
                    sqlTrns = sqlTrns.Replace("S", "'S'");
                    sqlTrns = sqlTrns.Replace("M", "'M'");
                    sqlTrns = sqlTrns.Replace("D", "'D'");
                    sqlStr = "SELECT isnull(emp_name,'')+' '+isnull(emp_lname,'') Full_Name,Case Marital_Status when 'S' Then 'Single'  when 'D' then 'Divorce' else 'Married' end As Category  From employee  WHERE Marital_Status IN(" + sqlTrns + ") GROUP BY Marital_Status,emp_name,EMP_LNAME";
                    break;
                case "Emp_Group":
                    sqlStr = "SELECT isnull(emp_name,'')+' '+isnull(emp_lname,'') Full_Name,EmpgroupName As Category From employee inner join Emp_Group E on emp_group_id = e.id  WHERE emp_group_id IN(" + sqlTrns + ") GROUP BY EmpgroupName,emp_name,EMP_LNAME";
                    break;
                case "Employee Type":
                    sqlStr = "SELECT isnull(emp_name,'')+' '+isnull(emp_lname,'') Full_Name,Emp_Type As Category  From employee  WHERE emp_tYPE IN(" + sqlTrns + ") GROUP BY emp_name,EMP_LNAME,Emp_Type ";
                    break;
                case "Place of birth":
                    sqlStr = " SELECT isnull(emp_name,'')+' '+isnull(emp_lname,'') Full_Name,Place_of_birth As Category From employee  WHERE Place_of_birth IN(" + sqlTrns + ") GROUP BY emp_name,EMP_LNAME,Place_of_birth ";
                    break;

            }



            //sqlSelect = " SELECT emp_name, ";
            //sqlSelect = sqlSelect + " where e.emp_code in (" + strEmployee + ")";
            //sqlSelect = sqlSelect + " AND trx_type in (" + sqlTrns + ") and optionselection = 'Claim' AND STATUS='L' AND  month(trx_period) BETWEEN  Month('" + RadDatePicker7.SelectedDate + "') AND  Month('" + RadDatePicker8.SelectedDate + "')   and   year(trx_period) BETWEEN year('" + RadDatePicker7.SelectedDate + "') AND year('" + RadDatePicker8.SelectedDate + "')";
            //sqlSelect = sqlSelect + "GROUP BY id, description,emp_name,trx_period";
            if (sqlStr.Length > 0)
            {
                DataSet rptDs = DataAccess.FetchRS(CommandType.Text, sqlStr, null);
                Session["rptDs"] = rptDs;
                Response.Redirect("../Reports/CustomReport.aspx");
            }
        }

        protected void dlDept_selectedIndexChanged(object sender, EventArgs e)
        {
            string sqlSelect;
            DataSet empDs;
            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlDept")
            {
                if (dlDept.SelectedValue != "-2")
                {
                    if (dlDept.SelectedValue == "-1")
                        sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    else
                        sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE DEPT_ID = " + dlDept.SelectedValue + " AND COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    empDs = DataAccess.FetchRS(CommandType.Text, sqlSelect, null);
                    if (empDs.Tables[0].Rows.Count > 0)
                    {
                        RadGrid1.DataSource = empDs.Tables[0];
                        RadGrid1.DataBind();
                        if (RadGrid1.Visible == false)
                        {
                            RadGrid1.Visible = true;
                            RadGrid1.MasterTableView.Visible = true;
                        }
                    }
                }
                else
                {
                    RadGrid1.Visible = false;
                    RadGrid1.MasterTableView.Visible = false;
                }

            }

            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "ddlPayDept")
            {
                if (ddlPayDept.SelectedValue != "-2")
                {
                    //if (ddlPayDept.SelectedValue == "-1")
                    //    sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    //else
                    //    sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE DEPT_ID = " + ddlPayDept.SelectedValue + " AND COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    SqlParameter[] parms1 = new SqlParameter[4];
                    parms1[0] = new SqlParameter("@company_id", comp_id);
                    parms1[1] = new SqlParameter("@UserID", Convert.ToInt16(Session["EmpCode"].ToString()));
                    parms1[2] = new SqlParameter("@Type", "DEPART");
                    parms1[3] = new SqlParameter("@TypeID", ddlPayDept.SelectedValue.ToString());
                    empDs = DataAccess.ExecuteSPDataSet("Sp_userrighttopayroll", parms1);

                    //empDs = DataAccess.FetchRS(CommandType.Text, sqlSelect, null);
                    if (empDs.Tables[0].Rows.Count > 0)
                    {
                        RadGrid3.DataSource = empDs.Tables[0];
                        RadGrid3.DataBind();
                        if (RadGrid3.Visible == false)
                        {
                            RadGrid3.Visible = true;
                            RadGrid3.MasterTableView.Visible = true;
                        }
                    }
                }
                else
                {
                    RadGrid3.Visible = false;
                    RadGrid3.MasterTableView.Visible = false;
                }

            }

            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlAdditions")
            {
                if (dlAdditions.SelectedValue != "-2")
                {
                    //if (dlAdditions.SelectedValue == "-1")
                    //    sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    //else
                    //    sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE DEPT_ID = " + dlAdditions.SelectedValue + " AND COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    //empDs = DataAccess.FetchRS(CommandType.Text, sqlSelect, null);

                    SqlParameter[] parms1 = new SqlParameter[4];
                    parms1[0] = new SqlParameter("@company_id", comp_id);
                    parms1[1] = new SqlParameter("@UserID", Convert.ToInt16(Session["EmpCode"].ToString()));
                    parms1[2] = new SqlParameter("@Type", "DEPART");
                    parms1[3] = new SqlParameter("@TypeID", dlAdditions.SelectedValue.ToString());
                    empDs = DataAccess.ExecuteSPDataSet("Sp_userrighttopayroll", parms1);

                    if (empDs.Tables[0].Rows.Count > 0)
                    {
                        RadGrid5.DataSource = empDs.Tables[0];
                        RadGrid5.DataBind();
                        if (RadGrid5.Visible == false)
                        {
                            RadGrid5.Visible = true;
                            RadGrid5.MasterTableView.Visible = true;
                        }
                    }
                }
                else
                {
                    RadGrid5.Visible = false;
                    RadGrid5.MasterTableView.Visible = false;
                }
            }

            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlDeptDeductions")
            {
                if (dlDeptDeductions.SelectedValue != "-2")
                {
                    //if (dlDeptDeductions.SelectedValue == "-1")
                    //    sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    //else
                    //    sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE DEPT_ID = " + dlDeptDeductions.SelectedValue + " AND COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    //empDs = DataAccess.FetchRS(CommandType.Text, sqlSelect, null);
                    SqlParameter[] parms1 = new SqlParameter[4];
                    parms1[0] = new SqlParameter("@company_id", comp_id);
                    parms1[1] = new SqlParameter("@UserID", Convert.ToInt16(Session["EmpCode"].ToString()));
                    parms1[2] = new SqlParameter("@Type", "DEPART");
                    parms1[3] = new SqlParameter("@TypeID", dlDeptDeductions.SelectedValue.ToString());
                    empDs = DataAccess.ExecuteSPDataSet("Sp_userrighttopayroll", parms1);
                    if (empDs.Tables[0].Rows.Count > 0)
                    {
                        RadGrid9.DataSource = empDs.Tables[0];
                        RadGrid9.DataBind();
                        if (RadGrid9.Visible == false)
                        {
                            RadGrid9.Visible = true;
                            RadGrid9.MasterTableView.Visible = true;
                        }
                    }
                }
                else
                {
                    RadGrid9.Visible = false;
                    RadGrid9.MasterTableView.Visible = false;
                }
            }

            //santy
            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlExpiryDept")
            {
                if (dlExpiryDept.SelectedValue != "-2")
                {
                    if (dlExpiryDept.SelectedValue == "-1")
                        sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    else
                        sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE DEPT_ID = " + dlExpiryDept.SelectedValue + " AND COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    empDs = DataAccess.FetchRS(CommandType.Text, sqlSelect, null);
                    if (empDs.Tables[0].Rows.Count > 0)
                    {
                        RadGrid16.DataSource = empDs.Tables[0];
                        RadGrid16.DataBind();
                        if (RadGrid16.Visible == false)
                        {
                            RadGrid16.Visible = true;
                            RadGrid16.MasterTableView.Visible = true;
                        }
                    }
                }
                else
                {
                    RadGrid16.Visible = false;
                    RadGrid16.MasterTableView.Visible = false;
                }
            }


            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlClaimsDept")
            {
                if (dlClaimsDept.SelectedValue != "-2")
                {
                    //if (dlClaimsDept.SelectedValue == "-1")
                    //    sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    //else
                    //    sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE DEPT_ID = " + dlClaimsDept.SelectedValue + " AND COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    //empDs = DataAccess.FetchRS(CommandType.Text, sqlSelect, null);
                    SqlParameter[] parms1 = new SqlParameter[4];
                    parms1[0] = new SqlParameter("@company_id", comp_id);
                    parms1[1] = new SqlParameter("@UserID", Convert.ToInt16(Session["EmpCode"].ToString()));
                    parms1[2] = new SqlParameter("@Type", "DEPART");
                    parms1[3] = new SqlParameter("@TypeID", dlClaimsDept.SelectedValue.ToString());
                    empDs = DataAccess.ExecuteSPDataSet("Sp_userrighttopayroll", parms1);
                    if (empDs.Tables[0].Rows.Count > 0)
                    {
                        RadGrid11.DataSource = empDs.Tables[0];
                        RadGrid11.DataBind();
                        if (RadGrid11.Visible == false)
                        {
                            RadGrid11.Visible = true;
                            RadGrid11.MasterTableView.Visible = true;
                        }
                    }
                }
                else
                {
                    RadGrid11.Visible = false;
                    RadGrid11.MasterTableView.Visible = false;
                }
            }

            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlLeavesDept")
            {
                if (dlLeavesDept.SelectedValue != "-2")
                {
                    if (dlLeavesDept.SelectedValue == "-1")
                        sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    else
                        sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE DEPT_ID = " + dlLeavesDept.SelectedValue + " AND COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    empDs = DataAccess.FetchRS(CommandType.Text, sqlSelect, null);
                    if (empDs.Tables[0].Rows.Count > 0)
                    {
                        RadGrid7.DataSource = empDs.Tables[0];
                        RadGrid7.DataBind();
                        if (RadGrid7.Visible == false)
                        {
                            RadGrid7.Visible = true;
                            RadGrid7.MasterTableView.Visible = true;
                        }
                    }
                }
                else
                {
                    RadGrid7.Visible = false;
                    RadGrid7.MasterTableView.Visible = false;
                }
            }

            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlEmailDept")
            {
                if (dlEmailDept.SelectedValue != "-2")
                {
                    if (dlEmailDept.SelectedValue == "-1")
                        sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    else
                        sqlSelect = "SELECT  EMP_CODE,[NAME] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End FROM dbo.employee WHERE DEPT_ID = " + dlEmailDept.SelectedValue + " AND COMPANY_ID= " + compid + " ORDER BY EMP_NAME";
                    empDs = DataAccess.FetchRS(CommandType.Text, sqlSelect, null);
                    if (empDs.Tables[0].Rows.Count > 0)
                    {
                        RadGrid14.DataSource = empDs.Tables[0];
                        RadGrid14.DataBind();
                        if (RadGrid14.Visible == false)
                        {
                            RadGrid14.Visible = true;
                            RadGrid14.MasterTableView.Visible = true;
                        }
                    }
                }
                else
                {
                    RadGrid14.Visible = false;
                    RadGrid14.MasterTableView.Visible = false;
                }
            }

        }

        protected void dlDept_databound(object sender, EventArgs e)
        {
            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlDept")
            {
                dlDept.Items.Insert(0, new ListItem("- Select -", "-2"));
                dlDept.Items.Insert(1, new ListItem("- All Departments -", "-1"));
            }
            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "ddlPayDept")
            {
                ddlPayDept.Items.Insert(0, new ListItem("- Select -", "-2"));
                ddlPayDept.Items.Insert(1, new ListItem("- All Departments -", "-1"));
            }
            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlAdditions")
            {
                dlAdditions.Items.Insert(0, new ListItem("- Select -", "-2"));
                dlAdditions.Items.Insert(1, new ListItem("- All Departments -", "-1"));
            }
            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlDeptDeductions")
            {
                dlDeptDeductions.Items.Insert(0, new ListItem("- Select -", "-2"));
                dlDeptDeductions.Items.Insert(1, new ListItem("- All Departments -", "-1"));
            }
            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlClaimsDept")
            {
                dlClaimsDept.Items.Insert(0, new ListItem("- Select -", "-2"));
                dlClaimsDept.Items.Insert(1, new ListItem("- All Departments -", "-1"));
            }
            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlExpiryDept")
            {
                dlExpiryDept.Items.Insert(0, new ListItem("- Select -", "-2"));
                dlExpiryDept.Items.Insert(1, new ListItem("- All Departments -", "-1"));
            }
            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlLeavesDept")
            {
                dlLeavesDept.Items.Insert(0, new ListItem("- Select -", "-2"));
                dlLeavesDept.Items.Insert(1, new ListItem("- All Departments -", "-1"));
            }
            if (((System.Web.UI.WebControls.DropDownList)sender).ID == "dlEmailDept")
            {
                dlEmailDept.Items.Insert(0, new ListItem("- Select -", "-2"));
                dlEmailDept.Items.Insert(1, new ListItem("- All Departments -", "-1"));
            }
        }


        protected void RadComboBoxEmpPrj_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            RadGrid222.Visible = false;
            RadGrid111.Visible = true;
            string sSQL = "";
            DataSet ds = new DataSet();
            if (RadComboBoxEmpPrj.SelectedValue != "-1")
            {
                //r
                sSQL = "Select S.ID,S.Sub_Project_Name From Project P Inner Join SubProject S On P.ID = S.Parent_Project_ID Where S.ID IN (Select distinct ID From EmployeeAssignedToProject EA Inner Join Employee EY On EA.Emp_ID = EY.Emp_Code Where EY.Emp_Code={0})UNION select ID,Sub_Project_Name from SubProject where Sub_Project_ID in(select Distinct(terminalSN) from ACTATEK_LOGS_PROXY where userID=(select  time_card_no  from Employee  where emp_code={0}))";
                //sSQL = "Select S.ID, S.Sub_Project_Name, S.ID Child_ID, P.ID Parent_ID, P.Project_ID Parent_Project_Unique, P.Project_Name Parent_Project_Name  From Project P Inner Join SubProject S On P.ID = S.Parent_Project_ID Where S.ID IN (Select distinct ID From EmployeeAssignedToProject EA Inner Join Employee EY On EA.Emp_ID = EY.Emp_Code Where EY.Emp_Code={0})";
                sSQL = string.Format(sSQL, "'" + RadComboBoxEmpPrj.SelectedValue + "'");
                ds = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            }
            else if (RadComboBoxEmpPrj.SelectedItem.Value == "-1")
            {
                sSQL = "Select S.ID, S.Sub_Project_Name, P.ID Parent_ID, P.Project_ID Parent_Project_Unique, P.Project_Name Parent_Project_Name, S.ID Child_ID    From Project P Inner Join SubProject S On P.ID = S.Parent_Project_ID";
                //sSQL = string.Format(sSQL, Utility.ToInteger(Session["Compid"]));
                ds = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            }

            RadGrid111.DataSource = ds;
            RadGrid111.DataBind();
        }
        protected void RadComboBoxEmpPrj_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            string sqlSelectCommand = "";
            RadComboBox rd = new RadComboBox();
            rd = RadComboBoxEmpPrj;
            if (sgroupname == "Super Admin" || (Utility.AllowedAction1(Session["Username"].ToString(), "Submit Timesheet for All") == true))
            {
                sqlSelectCommand = "SELECT Emp_Code [Emp_Code], isnull(emp_name,'')+' '+isnull(emp_lname,'') [Emp_Name], Time_Card_No [Time_Card_No], ic_pp_number  [ic_pp_number] from [Employee] WHERE Len([Time_Card_No]) > 0 And StatusID=1 And (upper([Emp_Name]) LIKE + '%' + upper(@text) + '%' Or upper([ic_pp_number]) LIKE + '%' +  upper(@text) + '%' Or upper([Time_Card_No]) LIKE + '%' + @text + '%') ORDER BY [Emp_Name]";
            }
            else
            {
                sqlSelectCommand = "SELECT Emp_Code [Emp_Code], isnull(emp_name,'')+' '+isnull(emp_lname,'') [Emp_Name], Time_Card_No [Time_Card_No], ic_pp_number  [ic_pp_number] from [Employee] WHERE Len([Time_Card_No]) > 0 and emp_code='" + varEmpCode + "' And StatusID=1 And (upper([Emp_Name]) LIKE + '%' + upper(@text) + '%' Or upper([ic_pp_number]) LIKE + '%' +  upper(@text) + '%' Or upper([Time_Card_No]) LIKE + '%' + @text + '%') ORDER BY [Emp_Name]";
            }
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

                //item.Value += ":" + Time_Card_No;

                rd.Items.Add(item);

                item.DataBind();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void btnCompliance_Click(object sender, EventArgs e)
        {
            if (rdVar.SelectedValue == "CostCenter")
            {
               

                #region CostCenter


                //Get Sql Data 
                DataSet dsVariance = new DataSet();
                DataSet dsVariance1 = new DataSet();
                DataSet dsMain = new DataSet();

                SqlParameter[] parms = new SqlParameter[4];


               // for (int i = 0; i <= cmbFromMonth.Items.Count - 1; i++)
               // {
                    //@company_id=3,@month=51,@year=2011,@UserID=3
                    parms[0] = new SqlParameter("@company_id", Utility.ToInteger(Session["Compid"]));
                    //parms[1] = new SqlParameter("@month", cmbFromMonth.SelectedValue);
                    parms[1] = new SqlParameter("@month", cmbFromMonth.SelectedValue);
                    parms[2] = new SqlParameter("@year", cmbYear.SelectedValue);
                    parms[3] = new SqlParameter("@UserID", Session["EmpCode"].ToString());

                    dsVariance = DataAccess.ExecuteSPDataSet("Sp_genledger_Rpt", parms);
                    if (dsVariance.Tables[0].Rows.Count > 0)
                    {
                        dsMain = dsVariance;
                    }

                    SqlParameter[] parms1 = new SqlParameter[4];

                    parms1[0] = new SqlParameter("@company_id", Utility.ToInteger(Session["Compid"]));
                    //parms[1] = new SqlParameter("@month", cmbFromMonth.SelectedValue);
                    parms1[1] = new SqlParameter("@month", cmbToMonth.SelectedValue);
                    parms1[2] = new SqlParameter("@year", cmbYear.SelectedValue);
                    parms1[3] = new SqlParameter("@UserID", Session["EmpCode"].ToString());

                    dsVariance1 = DataAccess.ExecuteSPDataSet("Sp_genledger_Rpt", parms1);



                    if (dsMain.Tables[0].Rows.Count > 0)
                    {
                        dsMain.Merge(dsVariance1, true, MissingSchemaAction.AddWithKey);
                    }

                Session["rptDs"] = dsMain;

                if (dsMain.Tables[0].Rows.Count > 0)
                {
                    if (rdVar.SelectedValue == "CostCenter")
                    {
                        Response.Redirect("../Reports/CustomReportNew.aspx?PageType=10&SM=" + cmbFromMonth.Items[cmbFromMonth.SelectedIndex].Text + "&EM=" + cmbToMonth.Items[cmbToMonth.SelectedIndex].Text);
                    }
                    //Response.Redirect("../Reports/CustomReportNew.aspx");
                    //string sFileName = "../Reports/CustomReportNew.aspx";
                    //Response.Write("<SCRIPT language='Javascript'>window.open('" + sFileName + "');</SCRIPT>");
                }
                else
                {
                    ShowMessageBox("No Records Found");

                }
                #endregion
            }
            else if (rdVar.SelectedValue == "Employee")
            {

            

                //IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
                //string startdate = Convert.ToDateTime(RadDatePicker_From.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);
                //string enddate = Convert.ToDateTime(RadDatePicker_To.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);
                ////Response.Redirect("../Reports/CustomReportVariance_Employee.aspx?company_Id=" + comp_id + "&StartMonth=" + cmbFromMonth.SelectedItem + "&EndMonth=" + cmbToMonth.SelectedItem + "&year=" + cmbYear.SelectedValue + ""); 
                //Response.Redirect("../Reports/CustomReportVariance_Employee.aspx?company_Id=" + comp_id + "&StartDate=" + startdate + "&EndDate=" + enddate + ""); 
            }
        }



        void rdVar_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdVar.SelectedValue == "CostCenter")
            {
                cost_var.Visible = true;
                Emp_var.Visible = false;
            }
            else
            {
                cost_var.Visible = false;
                Emp_var.Visible = true;
            }
        }


        void btnvVariance_Click(object sender, EventArgs e)
        {
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            string startdate = Convert.ToDateTime(RadDatePicker_From.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);
            string enddate = Convert.ToDateTime(RadDatePicker_To.SelectedDate.Value.ToShortDateString()).ToString("dd/MM/yyyy", format);
            //Response.Redirect("../Reports/CustomReportVariance_Employee.aspx?company_Id=" + comp_id + "&StartMonth=" + cmbFromMonth.SelectedItem + "&EndMonth=" + cmbToMonth.SelectedItem + "&year=" + cmbYear.SelectedValue + ""); 
            Response.Redirect("../Reports/CustomReportVariance_Employee.aspx?company_Id=" + comp_id + "&StartDate=" + startdate + "&EndDate=" + enddate + ""); 
        }


        void cmbYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            MonthFill();
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
            parms[i++] = new SqlParameter("@PAYTYPE", Utility.ToInteger("1"));
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

            cmbFromMonth.DataSource = dtFilterFound;
            cmbFromMonth.DataTextField = "MonthName";
            cmbFromMonth.DataValueField = "RowID";
            cmbFromMonth.DataBind();

            cmbToMonth.DataSource = dtFilterFound;
            cmbToMonth.DataTextField = "MonthName";
            cmbToMonth.DataValueField = "RowID";
            cmbToMonth.DataBind();
            
        }

        protected void btnTS_Click(object sender, EventArgs e)
        {
            string strMessage = "";

            if (radDtpckTsFrom.SelectedDate == null || radDtpckTsTo.SelectedDate == null)
            {
                strMessage = strMessage + "<br/>" + "Please Enter Start Date And End Date.";
            }

            if (strMessage.Length<=0)
            {
                DataSet ds = new DataSet();

                string strStartDate = radDtpckTsFrom.SelectedDate.Value.Year + "-" + radDtpckTsFrom.SelectedDate.Value.Day + "-" + radDtpckTsFrom.SelectedDate.Value.Month;
                string strEndDate = radDtpckTsTo.SelectedDate.Value.Year + "-" + radDtpckTsTo.SelectedDate.Value.Day + "-" + radDtpckTsTo.SelectedDate.Value.Month;
                string sqlata = "";
                if (radCmbTsPay.SelectedValue == "All")
                {
                    sqlata = "select SubProject.Sub_Project_Name,sum(v1) v1,sum(v2) v2,sum(v3) v3,sum(v4) v4 From ApprovedTimeSheet Inner Join SubProject ON SubProject.ID=ApprovedTimeSheet.Sub_Project_ID";
                    sqlata = sqlata + " Where (CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) >=CONVERT(datetime,'" + strStartDate + "',103) ";
                    sqlata = sqlata + "And CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) <=CONVERT(datetime,'" + strEndDate + "',103))   ";
                    sqlata = sqlata + "Group By  SubProject.Sub_Project_Name";
                }
                else if (radCmbTsPay.SelectedValue.ToUpper() == "V1")
                {
                    sqlata = "select SubProject.Sub_Project_Name,sum(v1) v1 From ApprovedTimeSheet Inner Join SubProject ON SubProject.ID=ApprovedTimeSheet.Sub_Project_ID";
                    sqlata = sqlata + " Where (CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) >=CONVERT(datetime,'" + strStartDate + "',103) ";
                    sqlata = sqlata + "And CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) <=CONVERT(datetime,'" + strEndDate + "',103))   ";
                    sqlata = sqlata + "Group By  SubProject.Sub_Project_Name";
                
                }
                else if (radCmbTsPay.SelectedValue.ToUpper() == "V2")
                {
                    sqlata = "select SubProject.Sub_Project_Name,sum(v2) v2 From ApprovedTimeSheet Inner Join SubProject ON SubProject.ID=ApprovedTimeSheet.Sub_Project_ID";
                    sqlata = sqlata + " Where (CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) >=CONVERT(datetime,'" + strStartDate + "',103) ";
                    sqlata = sqlata + "And CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) <=CONVERT(datetime,'" + strEndDate + "',103))   ";
                    sqlata = sqlata + "Group By  SubProject.Sub_Project_Name";

                }
                else if (radCmbTsPay.SelectedValue.ToUpper() == "V3")
                {
                    sqlata = "select SubProject.Sub_Project_Name ,sum(v3) v3 From ApprovedTimeSheet Inner Join SubProject ON SubProject.ID=ApprovedTimeSheet.Sub_Project_ID";
                    sqlata = sqlata + " Where (CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) >=CONVERT(datetime,'" + strStartDate + "',103) ";
                    sqlata = sqlata + "And CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) <=CONVERT(datetime,'" + strEndDate + "',103))   ";
                    sqlata = sqlata + "Group By  SubProject.Sub_Project_Name";
                }
                else if (radCmbTsPay.SelectedValue.ToUpper() == "V4")
                {
                    sqlata = "select SubProject.Sub_Project_Name,sum(v4) v4 From ApprovedTimeSheet Inner Join SubProject ON SubProject.ID=ApprovedTimeSheet.Sub_Project_ID";
                    sqlata = sqlata + " Where (CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) >=CONVERT(datetime,'" + strStartDate + "',103) ";
                    sqlata = sqlata + "And CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) <=CONVERT(datetime,'" + strEndDate + "',103))   ";
                    sqlata = sqlata + "Group By  SubProject.Sub_Project_Name";
                }

                ds = DataAccess.FetchRS(CommandType.Text, sqlata, null);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    //Response.Redirect("../Reports/CustomReportNew_TimeSheet.aspx");
                    //Response.Redirect("../Reports/CustomReportNew.aspx");
                    //string sFileName = "../Reports/CustomReportNew.aspx";
                    //Response.Write("<SCRIPT language='Javascript'>window.open('" + sFileName + "');</SCRIPT>");

                      string strV1 = "", strV2 = "", strV3 = "", strV4 = "";
                      string strQuery = "select [desc],code from additions_types where company_id=" + comp_id + " and code in ('V1','V2','V3','V4')order by code Asc ";
                      DataSet dsQuery = new DataSet();
                      dsQuery = DataAccess.FetchRS(CommandType.Text, strQuery, null);
                      foreach (DataRow dr in dsQuery.Tables[0].Rows)
                      {
                        if (dr["code"].ToString() == "V1")
                        {
                            strV1 = dr["desc"].ToString();
                        }
                        if (dr["code"].ToString() == "V2")
                        {
                            strV2 = dr["desc"].ToString();
                        }
                        if (dr["code"].ToString() == "V3")
                        {
                            strV3 = dr["desc"].ToString();
                        }
                        if (dr["code"].ToString() == "V4")
                        {
                            strV4 = dr["desc"].ToString();
                        }
                     }
                      if (radCmbTsPay.SelectedValue == "All")
                      {
                          ds.Tables[0].Columns["v1"].ColumnName = strV1.Replace(" ","");
                          ds.Tables[0].Columns["v2"].ColumnName = strV2.Replace(" ", "");
                          ds.Tables[0].Columns["v3"].ColumnName = strV3.Replace(" ", "");
                          ds.Tables[0].Columns["v4"].ColumnName = strV4.Replace(" ", "");                         
                      }
                      if (radCmbTsPay.SelectedValue.ToUpper()  == "V2")
                      {
                          ds.Tables[0].Columns["v2"].ColumnName = strV2.Replace(" ", "");
                      }

                      if (radCmbTsPay.SelectedValue.ToUpper() == "V3")
                      {
                          ds.Tables[0].Columns["v3"].ColumnName = strV3.Replace(" ", "");
                      }

                      if (radCmbTsPay.SelectedValue.ToUpper() == "V4")
                      {
                          ds.Tables[0].Columns["v4"].Caption = strV4.Replace(" ", "");
                      }

                    Session["rptDs"] = ds;
                    Response.Redirect("../Reports/CustomReportNew.aspx?PageType=20");
                }
                else
                {
                    ShowMessageBox("No Records Found");
                    strMessage = "";
                }
            }
            else
            {
                ShowMessageBox(strMessage);
                strMessage = "";
            }

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            string strMessage = "";
            string strEmployee = "-1";
            string strprj = "-1";


            RadComboBox radcomb = new RadComboBox();
            DropDownList drp = new DropDownList();
            Telerik.Web.UI.RadDatePicker rdst = new Telerik.Web.UI.RadDatePicker();
            Telerik.Web.UI.RadDatePicker rden = new Telerik.Web.UI.RadDatePicker();
            CheckBox chk = new CheckBox();
            RadGrid rd = new RadGrid();

            if (rdOptionList.SelectedValue == "1")
            {
                rd = RadGrid222;
                strprj = drpSubProjectID.SelectedItem.Value;
            }
            else if (rdOptionList.SelectedValue == "2")
            {
                rd = RadGrid111;
                strEmployee = RadComboBoxEmpPrj.SelectedValue;
            }

            DateTime dt1 = new DateTime();
            DateTime dt2 = new DateTime();
            foreach (GridItem item in rd.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["Assigned"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        if (Request.QueryString["PageType"] == null)
                        {
                            if (rd.ID.ToString() == "RadGrid111")
                            {
                                strprj = strprj + "," + dataItem.Cells[2].Text.ToString().Trim();
                            }
                            else
                            {
                                if (dataItem.Cells[2].Text.ToString() != "&nbsp;")
                                {
                                    strEmployee = strEmployee + "," + dataItem.Cells[2].Text.ToString().Trim();
                                }
                            }
                        }
                        else
                        {
                            if (rd.ID.ToString() == "RadGrid111")
                            {
                                strprj = strprj + "," + dataItem.Cells[2].Text.ToString().Trim();
                            }
                            else
                            {
                                if (dataItem.Cells[2].Text.ToString() != "&nbsp;")
                                {
                                    strEmployee = strEmployee + "," + dataItem.Cells[2].Text.ToString().Trim();
                                }
                            }
                        }
                    }
                }
            }

            if (strprj == "-1")
            {
                strMessage = strMessage + "<br/>" + "Please Select Project.";
            }

            if (strEmployee == "-1")
            {
                strMessage = strMessage + "<br/>" + "Please Select Employee.";
            }

            if (rdFrom.SelectedDate == null || rdTo.SelectedDate == null)
            {
                strMessage = strMessage + "<br/>" + "Please Enter Start Date And End Date.";
            }
            else
            {
                dt1 = rdFrom.SelectedDate.Value;
                dt2 = rdTo.SelectedDate.Value;
            }

            if (rden.SelectedDate < rdst.SelectedDate)
            {
                strMessage = strMessage + "<br/>" + "End Date should be greater than Start Date.";
            }

            if (strMessage.Length <= 0)
            {
                int i = 0;
                SqlParameter[] parms = new SqlParameter[6];
                DataSet ds = new DataSet();
                rdst = rdFrom;
                rden = rdTo;
                string strActionMsg = "";

                if (rdOptionList.SelectedValue == "2")
                {
                    SqlParameter[] parms1 = new SqlParameter[8];
                    parms1[0] = new SqlParameter("@start_date", dt1.ToString("dd/MM/yyyy"));
                    parms1[1] = new SqlParameter("@end_date", dt2.ToString("dd/MM/yyyy"));
                    parms1[2] = new SqlParameter("@compid", comp_id);
                    parms1[3] = new SqlParameter("@isEmpty", "No");
                    parms1[4] = new SqlParameter("@empid", strEmployee);
                    parms1[5] = new SqlParameter("@subprojid", Utility.ToString(strprj));
                    parms1[6] = new SqlParameter("@sessid", "-1");
                    parms1[7] = new SqlParameter("@REPID", Utility.ToInteger(rdRepOptionTime.SelectedItem.Value));
                    ds = DataAccess.ExecuteSPDataSet("Sp_processtimesheet_rpt_New", parms1);
                }
                else
                { 
                    char sep=',';
                    string[] emp = strEmployee.Split(sep);
                    DataSet ds1 = new DataSet();
                    for (int p = 0; p <= emp.Length - 1; p++)
                    {
                        if (emp[p].ToString() != "-1")
                        {
                            SqlParameter[] parms1 = new SqlParameter[8];
                            parms1[0] = new SqlParameter("@start_date", dt1.ToString("dd/MM/yyyy"));
                            parms1[1] = new SqlParameter("@end_date", dt2.ToString("dd/MM/yyyy"));
                            parms1[2] = new SqlParameter("@compid", comp_id);
                            parms1[3] = new SqlParameter("@isEmpty", "No");
                            parms1[4] = new SqlParameter("@empid", emp[p].ToString());
                            parms1[5] = new SqlParameter("@subprojid", Utility.ToString(-1));
                            parms1[6] = new SqlParameter("@sessid", "-1");
                            parms1[7] = new SqlParameter("@REPID", Utility.ToInteger(rdRepOptionTime.SelectedItem.Value));
                            ds1 = DataAccess.ExecuteSPDataSet("Sp_processtimesheet_rpt_New", parms1);
                        }
                        if (p == 0)
                        {
                            ds = ds1;

                        }
                        else
                        {
                            ds.Merge(ds1, true);
                        }
                    }
                
                }

                //------------------------------------------------------------------------------------
                //DataSet dsnew = new DataSet();
                //string strempty="";
                //string strproject = "";

                //if (rdOptionList.SelectedValue == "1")
                //{
                //    string strprj1 = "Select sub_project_ID   from subproject Where ID=" + strprj;                 
                //    SqlDataReader dr_subproj;
                //    dr_subproj = DataAccess.ExecuteReader(CommandType.Text, strprj1, null);

                //    while (dr_subproj.Read())
                //    {
                //        strproject = Convert.ToString(dr_subproj[0].ToString());
                //    }
                //}
                //else if (rdOptionList.SelectedValue == "2")
                //{
                //    //rd = RadGrid111;
                //    //strEmployee = RadComboBoxEmpPrj.SelectedValue;

                //    string strprj1 = "Select sub_project_ID   from subproject Where ID IN (" + strprj + ")";
                //    SqlDataReader dr_subproj;
                //    dr_subproj = DataAccess.ExecuteReader(CommandType.Text, strprj1, null);

                //    //while (dr_subproj.Read())
                //    //{
                //    //    if (strproject == "")
                //    //    {

                //    //        strproject = "'" + Convert.ToString(dr_subproj[0].ToString()) + "'" ;
                //    //    }
                //    //    else
                //    //    {
                //    //        strproject = strproject + ",'" + Convert.ToString(dr_subproj[0].ToString()) + "'";
                //    //    }
                //    //}

                //    strproject = "-1";

                //    //strproject = strprj;

                //}

                
                
                //SqlParameter[] parms2 = new SqlParameter[8];
                //parms2[0] = new SqlParameter("@start_date", dt1.ToString("dd/MM/yyyy"));
                //parms2[1] = new SqlParameter("@end_date", dt2.ToString("dd/MM/yyyy"));
                //parms2[2] = new SqlParameter("@compid", compid);
                //strempty = "ALL";
                //parms2[3] = new SqlParameter("@isEmpty", strempty);
                //parms2[4] = new SqlParameter("@empid", strEmployee);
                //parms2[5] = new SqlParameter("@subprojid", Convert.ToString(strproject));
                //parms2[6] = new SqlParameter("@sessid", -3);
                //parms2[7] = new SqlParameter("@REPID", Utility.ToInteger(99));

                //if (Session["PayAssign"].ToString() == "1")
                //{
                //    dsnew = DataAccess.ExecuteSPDataSet("Sp_processtimesheetflexadv", parms2);
                //    //ds = dsnew;
                //    //foundRows = monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "'");
                //}
                //else
                //{
                //    dsnew = DataAccess.ExecuteSPDataSet("Sp_processtimesheetflexadv_Daily", parms2);
                //    //ds = dsnew;
                //}

                Session["SummaryDetail"] = Utility.ToInteger(rdRepOptionTime.SelectedItem.Value);
                Session["rptDs"] = ds;

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("../Reports/CustomReportNew_TimeSheet.aspx");
                    //Response.Redirect("../Reports/CustomReportNew.aspx");
                    //string sFileName = "../Reports/CustomReportNew.aspx";
                    //Response.Write("<SCRIPT language='Javascript'>window.open('" + sFileName + "');</SCRIPT>");
                }
                else
                {
                    ShowMessageBox("No Records Found");
                    strMessage = "";
                }
            }
            else
            {
                ShowMessageBox(strMessage);
                strMessage = "";
            }
        }



        protected void drpSubProjectID_databound(object sender, EventArgs e)
        {
            drpSubProjectID.Items.Insert(0, new ListItem("-select-", "-1"));
        }
        protected void RadGrid222_PageIndexChanged(object source, GridPageChangedEventArgs e)
        {
            RadGrid222.CurrentPageIndex = e.NewPageIndex;
            //DataSet ds = new DataSet();
            //string sSQL = "select emp_code,emp_name + ' ' + emp_lname as emp_name,(select DeptName from department where id=dept_id) Department,time_card_no,empcpftype,emp_alias,emp_type,ic_pp_number,wp_exp_date,pr_date,address,pay_frequency, payrate,postal_code,phone,hand_phone,email,time_card_no,sex,marital_status,place_of_birth,date_of_birth,education,income_taxid,termination_reason,giro_bank,giro_code,giro_branch,giro_acct_number,joining_date,probation_period,confirmation_date,termination_date,cpf_entitlement,cpf_employer,cpf_employee,employee_cpf_acct,employer_cpf_acct,emp_supervisor,ot_entitlement,payment_mode,fw_code,fw_levy,sdf_required,cdac_fund,mbmf_fund,sinda_fund,ecf_fund,cchest_fund,email_payslip,wh_tax_pct,wh_tax_amt,remarks,images,Insurance_number,insurance_expiry,CSOC_number, CSOC_expiry,passport,passport_expiry,nationality_id,country_id,religion_id,race_id,desig_id,dept_id,emp_group_id, (select empgroupname from emp_group where [id]=e.emp_group_id) empgroupname from employee e where Company_Id=" + varCompid + " ORDER BY emp_name ";
            //ds = GetDataSet(sSQL);
            RadGrid222.DataBind();
        }
        protected void RadGrid111_PageIndexChanged(object source, GridPageChangedEventArgs e)
        {
            RadGrid111.CurrentPageIndex = e.NewPageIndex;
            //DataSet ds = new DataSet();
            //string sSQL = "select emp_code,emp_name + ' ' + emp_lname as emp_name,(select DeptName from department where id=dept_id) Department,time_card_no,empcpftype,emp_alias,emp_type,ic_pp_number,wp_exp_date,pr_date,address,pay_frequency, payrate,postal_code,phone,hand_phone,email,time_card_no,sex,marital_status,place_of_birth,date_of_birth,education,income_taxid,termination_reason,giro_bank,giro_code,giro_branch,giro_acct_number,joining_date,probation_period,confirmation_date,termination_date,cpf_entitlement,cpf_employer,cpf_employee,employee_cpf_acct,employer_cpf_acct,emp_supervisor,ot_entitlement,payment_mode,fw_code,fw_levy,sdf_required,cdac_fund,mbmf_fund,sinda_fund,ecf_fund,cchest_fund,email_payslip,wh_tax_pct,wh_tax_amt,remarks,images,Insurance_number,insurance_expiry,CSOC_number, CSOC_expiry,passport,passport_expiry,nationality_id,country_id,religion_id,race_id,desig_id,dept_id,emp_group_id, (select empgroupname from emp_group where [id]=e.emp_group_id) empgroupname from employee e where Company_Id=" + varCompid + " ORDER BY emp_name ";
            //ds = GetDataSet(sSQL);
            RadGrid111.DataBind();
        }
    }
}
