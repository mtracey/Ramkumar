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

namespace SMEPayroll.Main
{
    public partial class Home : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        string compid = "", sSQL = "", empcode = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            

                RadGrid5.ItemCreated                +=  new GridItemEventHandler    (RadGrid5_ItemCreated);
                RadGrid6.ItemCreated                +=  new GridItemEventHandler    (RadGrid6_ItemCreated);
                RadGrid1.ItemCreated                +=  new GridItemEventHandler    (RadGrid1_ItemCreated);
                RadGrid7.ItemCreated                +=  new GridItemEventHandler    (RadGrid7_ItemCreated);
                RadGrid2.ItemCreated                +=  new GridItemEventHandler    (RadGrid2_ItemCreated);
                RadGrid4.ItemCreated                +=  new GridItemEventHandler    (RadGrid4_ItemCreated);
                RadGrid3.ItemCreated                +=  new GridItemEventHandler    (RadGrid3_ItemCreated);
                RadGrid8.ItemCreated                +=  new GridItemEventHandler    (RadGrid8_ItemCreated);
                RadGrid9.ItemCreated                +=  new GridItemEventHandler    (RadGrid9_ItemCreated);
                RadGrid10.ItemCreated               += new GridItemEventHandler     (RadGrid10_ItemCreated);
                RadGrid12.ItemCreated               += new GridItemEventHandler     (RadGrid12_ItemCreated);

                Radtoolbar11.ButtonClick            +=  new RadToolBarEventHandler  (Radtoolbar11_ButtonClick);
                RadtoolbarCs.ButtonClick            +=  new RadToolBarEventHandler  (RadtoolbarCs_ButtonClick);
                RadtoolbarIN.ButtonClick            +=  new RadToolBarEventHandler  (RadtoolbarIN_ButtonClick);
                Radtoolbarprb.ButtonClick           +=  new RadToolBarEventHandler  (Radtoolbarprb_ButtonClick);
                Radtoolbarothcp.ButtonClick         +=  new RadToolBarEventHandler  (Radtoolbarothcp_ButtonClick);

                RadtoolbarYOS.ButtonClick           += new RadToolBarEventHandler   (RadtoolbarYOS_ButtonClick);
                RadtoolbarBackUp.ButtonClick        += new RadToolBarEventHandler   (RadtoolbarBackUp_ButtonClick);

            if (Request.QueryString["cid"] != null && HttpContext.Current.Session["isMaster"].ToString() == "False")
            // if (Request.QueryString["cid"] != null )
            {
                Utility.GetLoginOKCompRunDB(Request.QueryString["cid"].ToString(), "anbsysadmingroup");
            }

            if (HttpContext.Current.Session["isMaster"].ToString() == "True")
            {
                if (Request.QueryString["cid"] != null)
                {
                    //compid = Request.QueryString["cid"];
                    Utility.GetLoginOKCompRunDB(Request.QueryString["cid"].ToString(), Utility.ToString(Session["Username"]));
                }
                else
                {
                    compid = Session["Compid"].ToString();
                }
            }
            else
            {
                compid = Session["Compid"].ToString();
            }

            compid = Session["Compid"].ToString();
            empcode = Session["EmpCode"].ToString();
            int noOfDays = Convert.ToUInt16(radNoOfdays.SelectedValue);


            sSQL = "Select Top 4 EY.time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'') Name,CertificateNumber 'WP No',Emp_type [Type], Convert(varchar(15),ExpiryDate,103) 'Exp Date',datediff(dd, getdate(), ExpiryDate) [Days] from EmployeeCertificate EC  Inner Join Employee EY On EC.Emp_ID=EY.Emp_Code Inner Join CertificateCategory CC ON  EC.CertificateCategoryID = CC.ID where COLID = 6 And termination_date is null and EY.company_id= " + compid + " and datediff(dd, getdate(), ExpiryDate)<=" + noOfDays + " Order by 5";
            //sSQL = "select Top 5 isnull(emp_name,'')+' '+isnull(emp_lname,'') Name,ic_pp_number 'WP NO',emp_type Type,Convert(varchar(15),wp_exp_date,103) 'Exp Date' from employee where termination_date is null and company_id= " + compid;
            //sSQL = sSQL + " and datediff(dd, getdate(), wp_exp_date)<=31 and datediff(yy,getdate(),wp_exp_date)=0  and datediff(mm,getdate(),wp_exp_date)=0 order by 4";
            RadGrid1.DataSource = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            RadGrid1.DataBind();

            //passport 
            //sSQL = "Select Top 4 EY.time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'') Name,CertificateNumber 'PP No',Emp_type [Type], Convert(varchar(15),ExpiryDate,103) 'Exp Date',datediff(dd, getdate(), ExpiryDate) [Days] from EmployeeCertificate EC  Inner Join Employee EY On EC.Emp_ID=EY.Emp_Code Inner Join CertificateCategory CC ON  EC.CertificateCategoryID = CC.ID where COLID = 3 And termination_date is null and EY.company_id= " + compid + " and datediff(dd, getdate(), ExpiryDate)<=" + noOfDays + "  Order by 5";
           
         
            //sSQL = "select Top 5 isnull(emp_name,'')+' '+isnull(emp_lname,'') Name, passport 'PP NO', Convert(varchar(15),passport_expiry,103) 'Exp Date' from employee where termination_date is null and company_id= " + compid;
            //sSQL = sSQL + " and datediff(dd, getdate(), passport_expiry)<=31 and datediff(yy,getdate(),passport_expiry)=0  and datediff(mm,getdate(),passport_expiry)=0 order by 3";

            //new query after remainder setting in admin
            // sSQL = "Select Top 4 EY.time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'') Name,CertificateNumber 'PP No',Emp_type [Type], Convert(varchar(15),ExpiryDate,103) 'Exp Date',datediff(dd, getdate(), ExpiryDate) [Days] from EmployeeCertificate EC  Inner Join Employee EY On EC.Emp_ID=EY.Emp_Code Inner Join CertificateCategory CC ON  EC.CertificateCategoryID = CC.ID where COLID = 3 And termination_date is null and EY.company_id= " + compid + " and datediff(dd, getdate(), ExpiryDate)<=(select [Days]  from  dbo.Home_Remainder where CertificateCategoryID=EC.CertificateCategoryID AND CompanyID=" + compid + ")  Order by 5";
            sSQL = "Select Top 4 EY.time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'') Name,CertificateNumber 'PP No',Emp_type [Type], Convert(varchar(15),ExpiryDate,103) 'Exp Date',datediff(dd, getdate(), ExpiryDate) [Days] from EmployeeCertificate EC  Inner Join Employee EY On EC.Emp_ID=EY.Emp_Code Inner Join CertificateCategory CC ON  EC.CertificateCategoryID = CC.ID where COLID = 3 And termination_date is null and EY.company_id= " + compid + " and datediff(dd, getdate(), ExpiryDate)<=(select CASE WHEN COUNT(*) =0 THEN 30 else (select [Days]  from  dbo.Home_Remainder where CertificateCategoryID=EC.CertificateCategoryID AND CompanyID=" + compid + " )  END as [Days] from  dbo.Home_Remainder HH where CertificateCategoryID=EC.CertificateCategoryID AND CompanyID=" + compid + " )  Order by 5";
            

            RadGrid2.DataSource = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            RadGrid2.DataBind();

            //Insurance
            //sSQL = "Select Top 4 EY.time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'') Name,CertificateNumber 'Insu No',Emp_type [Type], Convert(varchar(15),ExpiryDate,103) 'Exp Date',datediff(dd, getdate(), ExpiryDate) [Days] from EmployeeCertificate EC  Inner Join Employee EY On EC.Emp_ID=EY.Emp_Code Inner Join CertificateCategory CC ON  EC.CertificateCategoryID = CC.COLID where CertificateCategoryID =1 And termination_date is null and EY.company_id= " + compid + " and datediff(dd, getdate(), ExpiryDate)<=" + noOfDays + "  Order by 5";
            //new query after remainder setting in admin
            sSQL = "Select Top 4 EY.time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'') Name,CertificateNumber 'Insu No',Emp_type [Type], Convert(varchar(15),ExpiryDate,103) 'Exp Date',datediff(dd, getdate(), ExpiryDate) [Days] from EmployeeCertificate EC  Inner Join Employee EY On EC.Emp_ID=EY.Emp_Code Inner Join CertificateCategory CC ON  EC.CertificateCategoryID = CC.COLID where CertificateCategoryID =1 And termination_date is null and EY.company_id= " + compid + " and datediff(dd, getdate(), ExpiryDate)<=(select [Days]  from  dbo.Home_Remainder where CertificateCategoryID=EC.CertificateCategoryID AND CompanyID=" + compid + ")  Order by 5";


            //sSQL = "select Top 5 isnull(emp_name,'')+' '+isnull(emp_lname,'') Name, Insurance_number 'Insurance NO', Convert(varchar(15),Insurance_expiry,103) 'Exp Date' from employee where termination_date is null and company_id= " + compid;
            //sSQL = sSQL + " and datediff(dd, getdate(), Insurance_expiry)<=31 and datediff(yy,getdate(),Insurance_expiry)=0  and datediff(mm,getdate(),Insurance_expiry)=0 order by 3";
            RadGrid3.DataSource = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            RadGrid3.DataBind();

            //csoc
           // sSQL = "Select Top 4 EY.time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'') Name,CertificateNumber 'CSOC No',Emp_type [Type], Convert(varchar(15),ExpiryDate,103) 'Exp Date',datediff(dd, getdate(), ExpiryDate) [Days] from EmployeeCertificate EC  Inner Join Employee EY On EC.Emp_ID=EY.Emp_Code Inner Join CertificateCategory CC ON  EC.CertificateCategoryID = CC.COLID where CertificateCategoryID =2 And termination_date is null and EY.company_id= " + compid + " and ABS(datediff(dd, getdate(), ExpiryDate))<=" + noOfDays + "  Order by 5";
        
            //sSQL = "select Top 5 isnull(emp_name,'')+' '+isnull(emp_lname,'') Name, CSOC_number 'CSOC NO', Convert(varchar(15),CSOC_expiry,103) 'Exp Date' from employee where termination_date is null and company_id= " + compid;
            //sSQL = sSQL + " and datediff(dd, getdate(), CSOC_expiry)<=31 and datediff(yy,getdate(),CSOC_expiry)=0  and datediff(mm,getdate(),CSOC_expiry)=0 order by 3";


            //new query after remainder setting in admin
            //sSQL = "Select Top 4 EY.time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'') Name,CertificateNumber 'CSOC No',Emp_type [Type], Convert(varchar(15),ExpiryDate,103) 'Exp Date',datediff(dd, getdate(), ExpiryDate) [Days] from EmployeeCertificate EC  Inner Join Employee EY On EC.Emp_ID=EY.Emp_Code Inner Join CertificateCategory CC ON  EC.CertificateCategoryID = CC.COLID where CertificateCategoryID =2 And termination_date is null and EY.company_id= " + compid + " and ABS(datediff(dd, getdate(), ExpiryDate))<=(select [Days]  from  dbo.Home_Remainder where CertificateCategoryID=EC.CertificateCategoryID AND CompanyID=" + compid + ")  Order by 5";
            sSQL = "Select Top 4 EY.time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'') Name,CertificateNumber 'CSOC No',Emp_type [Type], Convert(varchar(15),ExpiryDate,103) 'Exp Date',datediff(dd, getdate(), ExpiryDate) [Days] from EmployeeCertificate EC  Inner Join Employee EY On EC.Emp_ID=EY.Emp_Code Inner Join CertificateCategory CC ON  EC.CertificateCategoryID = CC.COLID where CertificateCategoryID =2 And termination_date is null and EY.company_id= " + compid + " and ABS(datediff(dd, getdate(), ExpiryDate))<=(select CASE WHEN COUNT(*) =0 THEN 30 else (select [Days]  from  dbo.Home_Remainder where CertificateCategoryID=EC.CertificateCategoryID AND CompanyID=" + compid + " )  END as [Days] from  dbo.Home_Remainder HH where CertificateCategoryID=EC.CertificateCategoryID AND CompanyID=" + compid + " )  Order by 5";

            RadGrid4.DataSource = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            RadGrid4.DataBind();

            //old
            //sSQL = "select Top 5 isnull(b.emp_name,'')+' '+isnull(b.emp_lname,'') Name, c.Type Type, Convert(varchar(15),Start_Date,103) FromDate, ";
            //sSQL = sSQL + " Convert(varchar(15),End_Date,103) ToDate,datediff(dd,getdate(),a.start_date) [Days] from emp_leaves a, ";
            //sSQL = sSQL + " employee b, leave_types c, emp_group d where a.emp_id = b.emp_code ";
            //sSQL = sSQL + " and a.leave_Type = c.id and b.Emp_Group_Id=d.id and a.status = 'Open' ";
            //sSQL = sSQL + " and b.termination_date is null and datediff(dd,getdate(),a.start_date) <=" + noOfDays + " and  b.emp_code  in ( select emp_code from employee where termination_date is null  ";
            //AND emp_supervisor = " + empcode + "
            //sSQL = sSQL + ")  order by 5 desc";
            //RadGrid5.DataSource = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            //RadGrid5.DataBind();

            //new 
            sSQL = "select Top 4 b.time_card_no as TimeCardNo, isnull(b.emp_name,'')+' '+isnull(b.emp_lname,'') Name, c.Type Type, Convert(varchar(15),Start_Date,103) FromDate, ";
            sSQL = sSQL + " Convert(varchar(15),End_Date,103) ToDate,datediff(dd,getdate(),a.start_date) [Days] from emp_leaves a, ";
            sSQL = sSQL + " employee b, leave_types c, emp_group d where a.emp_id = b.emp_code ";
            sSQL = sSQL + " and a.leave_Type = c.id and b.Emp_Group_Id=d.id and ";
            //a.status = 'Open' ";
            sSQL = sSQL + "status <>'Rejected' AND  status <>'Approved'";
            sSQL = sSQL + " and b.termination_date is null and datediff(dd,getdate(),a.start_date) <=" + noOfDays + " and  b.emp_code  in ( select emp_code from employee where termination_date is null and company_id = '" + compid + "'  ";
            //AND emp_supervisor = " + empcode + "
            sSQL = sSQL + ")  order by 5 desc";
            RadGrid5.DataSource = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            RadGrid5.DataBind();




            sSQL = "Select Top 4 TimeCardNo,[Name],[Start Date], [End Date], [Leave Type] From (select distinct  c.time_card_no as TimeCardNo,isnull(c.emp_name,'')+' '+isnull(c.emp_lname,'') Name, convert(varchar(15),a.start_date,103)'Start Date',";
            sSQL += "convert(varchar(15),a.end_date,103) 'End Date',d.[type] 'Leave Type',a.start_date,datediff(dd,getdate(),a.start_date) [Days] from ";
            sSQL += "emp_leaves a,emp_leaves_detail b,employee c ,leave_types d ";
            sSQL += "where b.trx_id=a.trx_id and a.emp_id=c.emp_code and a.leave_type=d.id and a.status='Approved'";
            sSQL += " and (b.leave_date >= getdate()-1  and datediff(dd,getdate(),a.start_date) <=" + noOfDays + ")";
            sSQL += " and c.termination_date is null and c.company_id=" + compid + " )  D  Order By D.start_date,[Name]";
            RadGrid6.DataSource = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            RadGrid6.DataBind();

            ////Birthday in Nex 31 days(Added By Raja)
            sSQL = "sp_calbday_details";
            SqlParameter[] parms = new SqlParameter[2];
            int i = 0;
            parms[i] = new SqlParameter("@company_id", Utility.ToInteger(compid));
            parms[1] = new SqlParameter("@no_ofDays", Utility.ToInteger(noOfDays));

            RadGrid7.DataSource = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL, parms);
            RadGrid7.DataBind();

            ////Next 30days probation expiry employees list
            sSQL = "select Top 4 time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'')  as Name,convert(varchar(20),joining_date,103) 'Date Of Join',convert(varchar(20),dateadd(month,probation_period,joining_date),103)  as 'Prob Exp Date',datediff(dd,GETDATE(),dateadd(month,probation_period,joining_date)) [Days] from employee where company_id=" + compid;
            sSQL = sSQL + " AND termination_date is null   AND datediff(dd,GETDATE(),dateadd(month,probation_period,joining_date))<=" + noOfDays + " AND  datediff(dd,GETDATE(),dateadd(month,probation_period,joining_date))>0 and probation_period<>-1 AND confirmation_date is null";
            RadGrid8.DataSource = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            RadGrid8.DataBind();

            //Other Certificates Expiring 
            //sSQL = "Select Top 4 EY.time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'') Name,CertificateNumber 'Cert No',Emp_type [Type], Convert(varchar(15),ExpiryDate,103) 'Exp Date',datediff(dd, getdate(), ExpiryDate) [Days] from EmployeeCertificate EC  Inner Join Employee EY On EC.Emp_ID=EY.Emp_Code where (CertificateCategoryID > 6 Or CertificateCategoryID =5)  And termination_date is null and company_id= " + compid + " and abs(datediff(dd, getdate(), ExpiryDate))<=" + noOfDays + " Order by 4";
            sSQL = "Select Top 4 EY.time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'') Name,CertificateNumber 'Cert No',Emp_type [Type], Convert(varchar(15),ExpiryDate,103) 'Exp Date',datediff(dd, getdate(), ExpiryDate) [Days] from EmployeeCertificate EC  Inner Join Employee EY On EC.Emp_ID=EY.Emp_Code where (CertificateCategoryID > 6 Or CertificateCategoryID =5)  And termination_date is null and company_id= " + compid + " and abs(datediff(dd, getdate(), ExpiryDate))<=(select CASE WHEN COUNT(*) =0 THEN 30 else (select [Days]  from  dbo.Home_Remainder where CertificateCategoryID=EC.CertificateCategoryID AND CompanyID=" + compid + " )  END as [Days] from  dbo.Home_Remainder HH where CertificateCategoryID=EC.CertificateCategoryID AND CompanyID=" + compid + " ) Order by 4";

            RadGrid9.DataSource = DataAccess.FetchRS(CommandType.Text, sSQL, parms);
            RadGrid9.DataBind();

            // Year Of Service 
            sSQL = "select Top 4 time_card_no as TimeCardNo, isnull(emp_name,'')+' '+isnull(emp_lname,'') as Name,convert(varchar(20),joining_date,103) 'Date Of Joining', datediff(YY,JOINING_DATE,GETDATE()) AS 'No Of Service' from employee where company_id=" + compid + " AND termination_date is null   AND datediff(YY,JOINING_DATE,GETDATE()) >= 0  AND ((Select Month(JOINING_DATE))-(Select Month(GETDATE()))) =0  AND  datediff(YY,JOINING_DATE,GETDATE())>0 Order By JOINING_DATE ";

            RadGrid10.DataSource = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            RadGrid10.DataBind();

            //***************DataBase Backup ***************
            sSQL = "";
            sSQL = "SELECT TOP 4 * FROM VIEW_GET_DATABASE_LOG_DETAILS Order by LogTime DESC";
            RadGrid12.DataSource = DataAccess.FetchRS(CommandType.Text, sSQL, parms);
            RadGrid12.DataBind();

            //To Show Number Of Days when last bacup is taken
            sSQL = "sp_GetLastDatbaseLogDay";
            DataSet ds;
            ds = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL, null);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0][0].ToString() == "0")
                    {
                        lblbkp.Text = "Last Backup Taken Today";
                    }
                    else
                    {
                        lblbkp.Text = "Last Backup Taken Before : " + ds.Tables[0].Rows[0][0].ToString() + " Days";
                    }
                }
            }
        }

       

        //Other Certificate
        #region RadGrid9
            void Radtoolbarothcp_ButtonClick(object sender, RadToolBarEventArgs e)
            {
                //determine which button was clicked

                if (e.Item.Text == "Add")
                {
                    RadGrid9.MasterTableView.InsertItem();
                }
                else if (e.Item.Text == "Excel")
                {
                    ConfigureExport6();
                    RadGrid9.MasterTableView.ExportToExcel();
                }
                else if (e.Item.Text == "Word")
                {
                    ConfigureExport6();
                    RadGrid9.MasterTableView.ExportToWord();
                }
                else if (e.Item.Text == "PDF")
                {
                    ConfigureExport6();
                    // RadGrid6.ExportSettings.Pdf.PageWidth = Unit.Parse(Utility.ToString((RadGrid6.Items[0].Cells.Count * 24)) + "mm");
                    RadGrid9.ExportSettings.OpenInNewWindow = true;
                    RadGrid9.MasterTableView.ExportToPdf();
                }
                else if (e.Item.Text == "Calender")
                {
                    // refPendingLeaves.Attributes.Add("OnClick", "window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    StringBuilder sbScript = new StringBuilder(50);
                    sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
                    sbScript.Append(@"window.open('Report.aspx?id=5&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    sbScript.Append(@"</script>");
                    Response.Write(sbScript);
                }
                
            }

            void RadGrid9_ItemCreated(object sender, GridItemEventArgs e)
            {
                        //for count in ToolBar
                        if (e.Item is GridPagerItem)
                        {
                            string item;
                            int count;
                            GridPagerItem pager = (GridPagerItem)e.Item;
                            item = pager.Paging.DataSourceCount.ToString();
                            count = pager.Paging.DataSourceCount;

                            //Finding the control inside the toolbar
                            Label label = (Label)Radtoolbarothcp.FindItemByText("Count").FindControl("Label7");
                            label.Text = "Count : " + count.ToString();
                            if (count == 0)
                            {
                                Radtoolbarothcp.Enabled = false;
                            }
                        }
                        //
                
            }
        #endregion
        //Probation Expiry
        #region RadGrid8

            void Radtoolbarprb_ButtonClick(object sender, RadToolBarEventArgs e)
            {
                //determine which button was clicked

                if (e.Item.Text == "Add")
                {
                    RadGrid8.MasterTableView.InsertItem();
                }
                else if (e.Item.Text == "Excel")
                {
                    ConfigureExport6();
                    RadGrid8.MasterTableView.ExportToExcel();
                }
                else if (e.Item.Text == "Word")
                {
                    ConfigureExport6();
                    RadGrid8.MasterTableView.ExportToWord();
                }
                else if (e.Item.Text == "PDF")
                {
                    ConfigureExport6();
                    // RadGrid6.ExportSettings.Pdf.PageWidth = Unit.Parse(Utility.ToString((RadGrid6.Items[0].Cells.Count * 24)) + "mm");
                    RadGrid8.ExportSettings.OpenInNewWindow = true;
                    RadGrid8.MasterTableView.ExportToPdf();
                }
                else if (e.Item.Text == "Calender")
                {
                    // refPendingLeaves.Attributes.Add("OnClick", "window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    StringBuilder sbScript = new StringBuilder(50);
                    sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
                    sbScript.Append(@"window.open('Report.aspx?id=9&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    sbScript.Append(@"</script>");
                    Response.Write(sbScript);
                }
            }


            void RadGrid8_ItemCreated(object sender, GridItemEventArgs e)
            {
               //for count in ToolBar
                    if (e.Item is GridPagerItem)
                    {
                        string item;
                        int count;
                        GridPagerItem pager = (GridPagerItem)e.Item;
                        item = pager.Paging.DataSourceCount.ToString();
                        count = pager.Paging.DataSourceCount;

                        //Finding the control inside the toolbar
                        Label label = (Label)Radtoolbarprb.FindItemByText("Count").FindControl("Label5");
                        label.Text = "Count : " + count.ToString();
                        if (count == 0)
                        {
                            Radtoolbarprb.Enabled = false;
                        }
                    }
                    //
            }

        #endregion
        //COSEEXP
        #region Toolbar(RadGrid4)

                void RadtoolbarCs_ButtonClick(object sender, RadToolBarEventArgs e)
                {
                    //determine which button was clicked

                    if (e.Item.Text == "Add")
                    {
                        RadGrid4.MasterTableView.InsertItem();
                    }
                    else if (e.Item.Text == "Excel")
                    {
                        ConfigureExport6();
                        RadGrid4.MasterTableView.ExportToExcel();
                    }
                    else if (e.Item.Text == "Word")
                    {
                        ConfigureExport6();
                        RadGrid4.MasterTableView.ExportToWord();
                    }
                    else if (e.Item.Text == "PDF")
                    {
                        ConfigureExport6();
                       // RadGrid6.ExportSettings.Pdf.PageWidth = Unit.Parse(Utility.ToString((RadGrid6.Items[0].Cells.Count * 24)) + "mm");
                        RadGrid4.ExportSettings.OpenInNewWindow = true;
                        RadGrid4.MasterTableView.ExportToPdf();
                    }
                    else if (e.Item.Text == "Calender")
                    {
                        // refPendingLeaves.Attributes.Add("OnClick", "window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                        StringBuilder sbScript = new StringBuilder(50);
                        sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
                        sbScript.Append(@"window.open('Report.aspx?id=3&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                        sbScript.Append(@"</script>");
                        Response.Write(sbScript);
                    }
                }

                void RadGrid4_ItemCreated(object sender, GridItemEventArgs e)
                {
                    //for count in ToolBar
                    if (e.Item is GridPagerItem)
                    {
                        string item;
                        int count;
                        GridPagerItem pager = (GridPagerItem)e.Item;
                        item = pager.Paging.DataSourceCount.ToString();
                        count = pager.Paging.DataSourceCount;

                        //Finding the control inside the toolbar
                        Label label = (Label)RadtoolbarCs.FindItemByText("Count").FindControl("Label3");
                        label.Text = "Count : " + count.ToString();
                        if (count == 0)
                        {
                            RadtoolbarCs.Enabled = false;
                        }
                    }
                    //
                }
        #endregion
        //Toolbar
        #region Toolbar(RadGrid5)


                        protected void tbRecord_ButtonClick(object sender, Telerik.Web.UI.RadToolBarEventArgs e)
                        {
                            //determine which button was clicked

                            if (e.Item.Text == "Add")
                            {
                                RadGrid5.MasterTableView.InsertItem();
                            }
                            else if (e.Item.Text == "Excel")
                            {
                                ConfigureExport();
                                RadGrid5.MasterTableView.ExportToExcel();
                            }
                            else if (e.Item.Text == "Word")
                            {
                                ConfigureExport();
                                RadGrid5.MasterTableView.ExportToWord();
                            }
                            else if (e.Item.Text == "PDF")
                            {
                                ConfigureExport();
                                RadGrid5.ExportSettings.Pdf.PageWidth = Unit.Parse(Utility.ToString((RadGrid5.Items[0].Cells.Count * 24)) + "mm");
                                RadGrid5.ExportSettings.OpenInNewWindow = true;
                                RadGrid5.MasterTableView.ExportToPdf();
                            }
                            else if (e.Item.Text == "UnGroup")
                            {
                                RadGrid5.MasterTableView.GroupByExpressions.Clear();
                                RadGrid5.Rebind();
                            }
                            else if (e.Item.Text == "Clear Sorting")
                            {
                                RadGrid5.MasterTableView.SortExpressions.Clear();
                                RadGrid5.Rebind();
                            }
                            else if (e.Item.Text == "Save Grid Changes")
                            {

                                GridSettingsPersister SavePersister = new GridSettingsPersister(RadGrid5);
                                string userpreference = SavePersister.SaveSettings();


                                //if username already exist then update
                                if (Utility.ToString(Session["Username"]) != "")
                                {
                                    string User_Grid_Page = Utility.ToString(Session["Username"]) + "_RadGrid5_" + GridSettingsPersister.GetCurrentPageName();

                                    string sSQLUser_Grid_Page = "select * from Grid_Persisting_Setting where Username_Grid_Page='" + User_Grid_Page + "'";
                                    SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQLUser_Grid_Page, null);
                                    if (dr.HasRows)
                                    {
                                        string ssqla = "UPDATE [Grid_Persisting_Setting] SET [PersistingGridSettings] ='" + userpreference + "', [date]=getdate() WHERE [Username_Grid_Page] ='" + User_Grid_Page + "'";
                                        DataAccess.FetchRS(CommandType.Text, ssqla, null);
                                        //ShowMessageBox("Grid Settings Updated Sucessfully");
                                    }
                                    else
                                    {

                                        string ssqlb = "INSERT INTO [Grid_Persisting_Setting] ([Username_Grid_Page],[PersistingGridSettings]) VALUES('" + User_Grid_Page + "','" + userpreference + "')";
                                        DataAccess.FetchRS(CommandType.Text, ssqlb, null);
                                        //ShowMessageBox("Grid Settings Saved Sucessfully");
                                    }
                                }
                            }
                            else if (e.Item.Text == "Reset to Default")
                            {
                                string User_Grid_Page1 = Utility.ToString(Session["Username"]) + "_RadGrid5_" + GridSettingsPersister.GetCurrentPageName();
                                string sSQLUser_Grid_Page1 = "select * from Grid_Persisting_Setting where Username_Grid_Page='" + User_Grid_Page1 + "'";
                                SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.Text, sSQLUser_Grid_Page1, null);
                                if (dr1.HasRows)
                                {
                                    //delete the record in the database and reset to default
                                    string sSQLUser_Grid_Page2 = "delete from [Grid_Persisting_Setting] where [Username_Grid_Page]='" + User_Grid_Page1 + "'";
                                    DataAccess.FetchRS(CommandType.Text, sSQLUser_Grid_Page2, null);
                                    RadGrid5.MasterTableView.GroupByExpressions.Clear();
                                    RadGrid5.MasterTableView.SortExpressions.Clear();
                                    RadGrid5.Rebind();
                                    Server.Transfer("SubmitPayroll.aspx");
                                }
                                else
                                {
                                    RadGrid5.MasterTableView.GroupByExpressions.Clear();
                                    RadGrid5.MasterTableView.SortExpressions.Clear();
                                    RadGrid5.Rebind();
                                }
                            }
                            else if (e.Item.Text == "Calender")
                            {
                               // refPendingLeaves.Attributes.Add("OnClick", "window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                                StringBuilder sbScript = new StringBuilder(50);
                                sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
                                sbScript.Append(@"window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                                sbScript.Append(@"</script>");
                                Response.Write(sbScript);
                            }
                        }

                        public string username, userpreference;
                        private void LoadGridSettingsPersister()
                        {

                            if (Utility.ToString(Session["Username"]) != "")
                            {
                                string User_Grid_Page = Utility.ToString(Session["Username"]) + "_RadGrid5_" + GridSettingsPersister.GetCurrentPageName();
                                string SQL = "SELECT [Username_Grid_Page],[PersistingGridSettings]FROM [Grid_Persisting_Setting] where [Username_Grid_Page]='" + User_Grid_Page + "'";
                                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, SQL, null);
                                while (dr.Read())
                                {
                                    username = Utility.ToString(dr.GetValue(0));
                                    userpreference = Utility.ToString(dr.GetValue(1));
                                }
                            }

                            string user = username;
                            GridSettingsPersister LoadPersister = new GridSettingsPersister(RadGrid5);

                            if (username == null)
                            {

                                // StatusLabel.Text = "No saved settings for this user were found!";
                            }
                            else
                            {
                                string settings = user;
                                LoadPersister.LoadSettings(userpreference);
                                RadGrid5.Rebind();
                                //StatusLabel.Text = "Settings for " + user + " were restored successfully!";
                            }
                        }

                        void RadGrid5_ItemCreated(object sender, GridItemEventArgs e)
                        {
                            //for count in ToolBar
                            if (e.Item is GridPagerItem)
                            {
                                string item;
                                int count;
                                GridPagerItem pager = (GridPagerItem)e.Item;
                                item = pager.Paging.DataSourceCount.ToString();
                                count = pager.Paging.DataSourceCount;

                                //Finding the control inside the toolbar
                                Label label = (Label)tbRecord5.FindItemByText("Count").FindControl("Label2");
                                label.Text = "Count : " + count.ToString();

                                if (count == 0)
                                {
                                    tbRecord5.Enabled = false;
                                }
                            }
                            //
                        }

       

        #endregion
        //Leaves 
        #region Toolbar(RadGrid6)

            protected void Radtoolbar1_ButtonClick(object sender, Telerik.Web.UI.RadToolBarEventArgs e)
            {
                //determine which button was clicked

                if (e.Item.Text == "Add")
                {
                    RadGrid6.MasterTableView.InsertItem();
                }
                else if (e.Item.Text == "Excel")
                {
                    ConfigureExport6();
                    RadGrid6.MasterTableView.ExportToExcel();
                }
                else if (e.Item.Text == "Word")
                {
                    ConfigureExport6();
                    RadGrid6.MasterTableView.ExportToWord();
                }
                else if (e.Item.Text == "PDF")
                {
                    ConfigureExport6();
                   // RadGrid6.ExportSettings.Pdf.PageWidth = Unit.Parse(Utility.ToString((RadGrid6.Items[0].Cells.Count * 24)) + "mm");
                    RadGrid6.ExportSettings.OpenInNewWindow = true;
                    RadGrid6.MasterTableView.ExportToPdf();
                }

                else if (e.Item.Text == "Calender")
                {
                    // refPendingLeaves.Attributes.Add("OnClick", "window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    StringBuilder sbScript = new StringBuilder(50);
                    sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
                    sbScript.Append(@"window.open('Report.aspx?id=1&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    sbScript.Append(@"</script>");
                    Response.Write(sbScript);
                }
            }

            void RadGrid6_ItemCreated(object sender, GridItemEventArgs e)
            {


                //for count in ToolBar
                if (e.Item is GridPagerItem)
                {
                    string item;
                    int count;
                    GridPagerItem pager = (GridPagerItem)e.Item;
                    item = pager.Paging.DataSourceCount.ToString();
                    count = pager.Paging.DataSourceCount;

                    //Finding the control inside the toolbar
                    Label label = (Label)Radtoolbar1.FindItemByText("Count").FindControl("Label6");
                    label.Text = "Count : " + count.ToString();
                    if (count == 0)
                    {
                        Radtoolbar1.Enabled = false;
                    }
                }
                //
            }

        #endregion
        //PassExpiry
        #region Toolbar(RadGrid1)
     
                    protected void Radtoolbar11_ButtonClick(object sender, Telerik.Web.UI.RadToolBarEventArgs e)
                    {
                        //determine which button was clicked

                        if (e.Item.Text == "Add")
                        {
                            RadGrid1.MasterTableView.InsertItem();
                        }
                        else if (e.Item.Text == "Excel")
                        {
                            ConfigureExport1();
                            RadGrid1.MasterTableView.ExportToExcel();
                        }
                        else if (e.Item.Text == "Word")
                        {
                            ConfigureExport1();
                            RadGrid1.MasterTableView.ExportToWord();
                        }
                        else if (e.Item.Text == "PDF")
                        {
                            ConfigureExport1();
                            //RadGrid1.ExportSettings.Pdf.PageWidth = Unit.Parse(Utility.ToString((RadGrid1.Items[0].Cells.Count * 24)) + "mm");
                            RadGrid1.ExportSettings.OpenInNewWindow = true;
                            RadGrid1.MasterTableView.ExportToPdf();
                        }

                        else if (e.Item.Text == "Calender")
                        {
                            // refPendingLeaves.Attributes.Add("OnClick", "window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                            StringBuilder sbScript = new StringBuilder(50);
                            sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
                            sbScript.Append(@"window.open('Report.aspx?id=2&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                            sbScript.Append(@"</script>");
                            Response.Write(sbScript);
                        }
                    }

                    void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
                    {
                        //for count in ToolBar
                        if (e.Item is GridPagerItem)
                        {
                            string item;
                            int count;
                            GridPagerItem pager = (GridPagerItem)e.Item;
                            item = pager.Paging.DataSourceCount.ToString();
                            count = pager.Paging.DataSourceCount;

                            //Finding the control inside the toolbar
                            Label label = (Label)Radtoolbar11.FindItemByText("Count").FindControl("Label1");
                            label.Text = "Count : " + count.ToString();
                            if (count == 0)
                            {
                                Radtoolbar11.Enabled = false;  
                              
                            }
                        }
                    }

                    //protected void Radtoolbar1_ButtonClick(object sender, Telerik.Web.UI.RadToolBarEventArgs e)
                    //{
                    //    //determine which button was clicked

                    //    if (e.Item.Text == "Add")
                    //    {
                    //        RadGrid1.MasterTableView.InsertItem();
                    //    }
                    //    else if (e.Item.Text == "Excel")
                    //    {
                    //        ConfigureExport1();
                    //        RadGrid1.MasterTableView.ExportToExcel();
                    //    }
                    //    else if (e.Item.Text == "Word")
                    //    {
                    //        ConfigureExport1();
                    //        RadGrid1.MasterTableView.ExportToWord();
                    //    }
                    //    else if (e.Item.Text == "PDF")
                    //    {
                    //        ConfigureExport1();
                    //        //RadGrid1.ExportSettings.Pdf.PageWidth = Unit.Parse(Utility.ToString((RadGrid1.Items[0].Cells.Count * 24)) + "mm");
                    //        RadGrid1.ExportSettings.OpenInNewWindow = true;
                    //        RadGrid1.MasterTableView.ExportToPdf();
                    //    }

                    //    else if (e.Item.Text == "Calender")
                    //    {
                    //        // refPendingLeaves.Attributes.Add("OnClick", "window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    //        StringBuilder sbScript = new StringBuilder(50);
                    //        sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
                    //        sbScript.Append(@"window.open('Report.aspx?id=2&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    //        sbScript.Append(@"</script>");
                    //        Response.Write(sbScript);
                    //    }
                    //}

        #endregion
        //Passport Exp
        #region Toolbar(RadGrid2)

        protected void Radtoolbar2_ButtonClick(object sender, Telerik.Web.UI.RadToolBarEventArgs e)
        {
            //determine which button was clicked

            if (e.Item.Text == "Add")
            {
                RadGrid2.MasterTableView.InsertItem();
            }
            else if (e.Item.Text == "Excel")
            {
                ConfigureExport2();
                RadGrid2.MasterTableView.ExportToExcel();
            }
            else if (e.Item.Text == "Word")
            {
                ConfigureExport2();
                RadGrid2.MasterTableView.ExportToWord();
            }
            else if (e.Item.Text == "PDF")
            {
                ConfigureExport2();
                RadGrid2.ExportSettings.Pdf.PageWidth = Unit.Parse(Utility.ToString((RadGrid2.Items[0].Cells.Count * 24)) + "mm");
                RadGrid2.ExportSettings.OpenInNewWindow = true;
                RadGrid2.MasterTableView.ExportToPdf();
            }

            else if (e.Item.Text == "Calender")
            {
                // refPendingLeaves.Attributes.Add("OnClick", "window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                StringBuilder sbScript = new StringBuilder(50);
                sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
                sbScript.Append(@"window.open('Report.aspx?id=7&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                sbScript.Append(@"</script>");
                Response.Write(sbScript);
            }
        }

        void RadGrid2_ItemCreated(object sender, GridItemEventArgs e)
        {
            //for count in ToolBar
            if (e.Item is GridPagerItem)
            {
                string item;
                int count;
                GridPagerItem pager = (GridPagerItem)e.Item;
                item = pager.Paging.DataSourceCount.ToString();
                count = pager.Paging.DataSourceCount;

                //Finding the control inside the toolbar
                Label label = (Label)Radtoolbar2.FindItemByText("Count").FindControl("Label2");
                label.Text = "Count : " + count.ToString();

            }
            //
        }

       

        #endregion
        //BD
        #region Toolbar(RadGrid7)

            void RadGrid7_ItemCreated(object sender, GridItemEventArgs e)
            {
                //for count in ToolBar
                if (e.Item is GridPagerItem)
                {
                    string item;
                    int count;
                    GridPagerItem pager = (GridPagerItem)e.Item;
                    item = pager.Paging.DataSourceCount.ToString();
                    count = pager.Paging.DataSourceCount;

                    //Finding the control inside the toolbar
                    Label label = (Label)RadtoolbarBD.FindItemByText("Count").FindControl("lblBd");
                    label.Text = "Count : " + count.ToString();

                }
                //
            }

            protected void Radtoolbar7_ButtonClick(object sender, Telerik.Web.UI.RadToolBarEventArgs e)
            {
                //determine which button was clicked

                if (e.Item.Text == "Add")
                {
                    RadGrid7.MasterTableView.InsertItem();
                }
                else if (e.Item.Text == "Excel")
                {
                    ConfigureExport2();
                    RadGrid7.MasterTableView.ExportToExcel();
                }
                else if (e.Item.Text == "Word")
                {
                    ConfigureExportCommon(RadGrid7);
                    RadGrid7.MasterTableView.ExportToWord();
                }
                else if (e.Item.Text == "PDF")
                {
                    ConfigureExport2();
                    RadGrid7.ExportSettings.Pdf.PageWidth = Unit.Parse(Utility.ToString((RadGrid7.Items[0].Cells.Count * 24)) + "mm");
                    RadGrid7.ExportSettings.OpenInNewWindow = true;
                    RadGrid7.MasterTableView.ExportToPdf();
                }

                else if (e.Item.Text == "Calender")
                {
                    // refPendingLeaves.Attributes.Add("OnClick", "window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    StringBuilder sbScript = new StringBuilder(50);
                    sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
                    sbScript.Append(@"window.open('Report.aspx?id=4&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    sbScript.Append(@"</script>");
                    Response.Write(sbScript);
                }
            }

        #endregion

        //YOS
        #region Toolbar(RadGrid10)

        protected void RadGrid10_ItemCreated(object sender, GridItemEventArgs e)
            {
                //for count in ToolBar
                if (e.Item is GridPagerItem)
                {
                    string item;
                    int count;
                    GridPagerItem pager = (GridPagerItem)e.Item;
                    item = pager.Paging.DataSourceCount.ToString();
                    count = pager.Paging.DataSourceCount;

                    //Finding the control inside the toolbar
                    Label label = (Label)RadtoolbarYOS.FindItemByText("Count").FindControl("LblYos");
                    label.Text = "Count : " + count.ToString();

                }
                //
            }

           protected void RadtoolbarYOS_ButtonClick(object sender, Telerik.Web.UI.RadToolBarEventArgs e)
            {
                //determine which button was clicked

                if (e.Item.Text == "Add")
                {
                    RadGrid10.MasterTableView.InsertItem();
                }
                else if (e.Item.Text == "Excel")
                {
                    ConfigureExport2();
                    RadGrid10.MasterTableView.ExportToExcel();
                }
                else if (e.Item.Text == "Word")
                {
                    ConfigureExportCommon(RadGrid7);
                    RadGrid10.MasterTableView.ExportToWord();
                }
                else if (e.Item.Text == "PDF")
                {
                    ConfigureExport2();
                    RadGrid10.ExportSettings.Pdf.PageWidth = Unit.Parse(Utility.ToString((RadGrid10.Items[0].Cells.Count * 24)) + "mm");
                    RadGrid10.ExportSettings.OpenInNewWindow = true;
                    RadGrid10.MasterTableView.ExportToPdf();
                }

                else if (e.Item.Text == "Calender")
                {
                    // refPendingLeaves.Attributes.Add("OnClick", "window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    StringBuilder sbScript = new StringBuilder(50);
                    sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
                    sbScript.Append(@"window.open('Report.aspx?id=4&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    sbScript.Append(@"</script>");
                    Response.Write(sbScript);
                }
            }

            #endregion

        //backup
       #region Toolbar(RadGrid10)

        protected void RadGrid12_ItemCreated(object sender, GridItemEventArgs e)
            {
                //for count in ToolBar
                if (e.Item is GridPagerItem)
                {
                    string item;
                    int count;
                    GridPagerItem pager = (GridPagerItem)e.Item;
                    item = pager.Paging.DataSourceCount.ToString();
                    count = pager.Paging.DataSourceCount;

                    //Finding the control inside the toolbar
                    Label label = (Label)RadtoolbarBackUp.FindItemByText("Count").FindControl("Lblbackup");
                    label.Text = "Count : " + count.ToString();

                }
                //
            }

        protected void RadtoolbarBackUp_ButtonClick(object sender, Telerik.Web.UI.RadToolBarEventArgs e)
            {
                //determine which button was clicked

                if (e.Item.Text == "Add")
                {
                    RadGrid12.MasterTableView.InsertItem();
                }
                else if (e.Item.Text == "Excel")
                {
                    ConfigureExport2();
                    RadGrid12.MasterTableView.ExportToExcel();
                }
                else if (e.Item.Text == "Word")
                {
                    ConfigureExportCommon(RadGrid7);
                    RadGrid12.MasterTableView.ExportToWord();
                }
                else if (e.Item.Text == "PDF")
                {
                    ConfigureExport2();
                    RadGrid12.ExportSettings.Pdf.PageWidth = Unit.Parse(Utility.ToString((RadGrid12.Items[0].Cells.Count * 24)) + "mm");
                    RadGrid12.ExportSettings.OpenInNewWindow = true;
                    RadGrid12.MasterTableView.ExportToPdf();
                }

                else if (e.Item.Text == "Calender")
                {
                    // refPendingLeaves.Attributes.Add("OnClick", "window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    StringBuilder sbScript = new StringBuilder(50);
                    sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
                    sbScript.Append(@"window.open('Report.aspx?id=4&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                    sbScript.Append(@"</script>");
                    Response.Write(sbScript);
                }
            }

            #endregion

        //Insurance
        #region RadGrid3

                void RadGrid3_ItemCreated(object sender, GridItemEventArgs e)
                {
                    //for count in ToolBar
                    if (e.Item is GridPagerItem)
                    {
                        string item;
                        int count;
                        GridPagerItem pager = (GridPagerItem)e.Item;
                        item = pager.Paging.DataSourceCount.ToString();
                        count = pager.Paging.DataSourceCount;

                        //Finding the control inside the toolbar
                        Label label = (Label)RadtoolbarIN.FindItemByText("Count").FindControl("Label4");
                        label.Text = "Count : " + count.ToString();
                        if (count == 0)
                        {
                            RadtoolbarIN.Enabled = false;
                        }
                    }
                }


                void RadtoolbarIN_ButtonClick(object sender, RadToolBarEventArgs e)
                {
                    //determine which button was clicked

                    if (e.Item.Text == "Add")
                    {
                        RadGrid3.MasterTableView.InsertItem();
                    }
                    else if (e.Item.Text == "Excel")
                    {
                        ConfigureExport6();
                        RadGrid3.MasterTableView.ExportToExcel();
                    }
                    else if (e.Item.Text == "Word")
                    {
                        ConfigureExport6();
                        RadGrid3.MasterTableView.ExportToWord();
                    }
                    else if (e.Item.Text == "PDF")
                    {
                        ConfigureExport6();
                        // RadGrid6.ExportSettings.Pdf.PageWidth = Unit.Parse(Utility.ToString((RadGrid6.Items[0].Cells.Count * 24)) + "mm");
                        RadGrid3.ExportSettings.OpenInNewWindow = true;
                        RadGrid3.MasterTableView.ExportToPdf();
                    }
                    else if (e.Item.Text == "Calender")
                    {
                        // refPendingLeaves.Attributes.Add("OnClick", "window.open('Report.aspx?id=6&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                        StringBuilder sbScript = new StringBuilder(50);
                        sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
                        sbScript.Append(@"window.open('Report.aspx?id=8&compid=" + compid + "','mywin','left=50,top=200,width=1200,height=600,toolbar=no,resizable=1');");
                        sbScript.Append(@"</script>");
                        Response.Write(sbScript);
                    }
                }

                //void RadGrid3_ItemCreated(object sender, GridItemEventArgs e)
                //{
                //    //for count in ToolBar
                //    if (e.Item is GridPagerItem)
                //    {
                //        string item;
                //        int count;
                //        GridPagerItem pager = (GridPagerItem)e.Item;
                //        item = pager.Paging.DataSourceCount.ToString();
                //        count = pager.Paging.DataSourceCount;

                //        //Finding the control inside the toolbar
                //        Label label = (Label)RadtoolbarIN.FindItemByText("Count").FindControl("Label4");
                //        label.Text = "Count : " + count.ToString();
                //        if (count == 0)
                //        {
                //            RadtoolbarIN.Enabled = false;
                //        }
                //    }
                //    //
                //}
#endregion
        #region ConfigureExport
        public void ConfigureExport()
        {
            //To ignore Paging,Exporting only data,
            RadGrid5.ExportSettings.ExportOnlyData = true;
            RadGrid5.ExportSettings.IgnorePaging = true;
            RadGrid5.ExportSettings.OpenInNewWindow = true;

            //To hide filter texbox
            RadGrid5.MasterTableView.AllowFilteringByColumn = true;


            //To hide the add new button
            RadGrid5.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None;

            //Column to hide
            //RadGrid5.MasterTableView.GetColumn("TemplateColumn").Visible = false;
            //RadGrid5.MasterTableView.GetColumn("GridClientSelectColumn").Visible = false;
            //RadGrid5.MasterTableView.GetColumn("Emp_Code").Visible = false;
            //RadGrid1.MasterTableView.GetColumn("Image").Visible = false;
        }

        public void ConfigureExport6()
        {
            //To ignore Paging,Exporting only data,
            RadGrid6.ExportSettings.ExportOnlyData = true;
            RadGrid6.ExportSettings.IgnorePaging = true;
            RadGrid6.ExportSettings.OpenInNewWindow = true;

            //To hide filter texbox
            RadGrid6.MasterTableView.AllowFilteringByColumn = true;


            //To hide the add new button
            RadGrid6.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None;

      
        }

        public void ConfigureExport1()
        {
            //To ignore Paging,Exporting only data,
            RadGrid1.ExportSettings.ExportOnlyData = true;
            RadGrid1.ExportSettings.IgnorePaging = true;
            RadGrid1.ExportSettings.OpenInNewWindow = true;

            //To hide filter texbox
            RadGrid1.MasterTableView.AllowFilteringByColumn = true;


            //To hide the add new button
            RadGrid1.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None;

           
        }

        public void ConfigureExport2()
        {
            //To ignore Paging,Exporting only data,
            RadGrid2.ExportSettings.ExportOnlyData = true;
            RadGrid2.ExportSettings.IgnorePaging = true;
            RadGrid2.ExportSettings.OpenInNewWindow = true;

            //To hide filter texbox
            RadGrid2.MasterTableView.AllowFilteringByColumn = true;


            //To hide the add new button
            RadGrid2.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None;
        }


        public void ConfigureExportCommon(RadGrid rd)
        {
            //To ignore Paging,Exporting only data,
            rd.ExportSettings.ExportOnlyData = true;
            rd.ExportSettings.IgnorePaging = true;
            rd.ExportSettings.OpenInNewWindow = true;

            //To hide filter texbox
            rd.MasterTableView.AllowFilteringByColumn = true;


            //To hide the add new button
            rd.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None;
        }

        #endregion


        #region Grid Exporting

        protected void RadGrid6_GridExporting(object source, GridExportingArgs e)
        {
            GridHeader("10",e);
        }

        protected void RadGrid5_GridExporting(object source, GridExportingArgs e)
        {
            GridHeader("11",e);
        }
        protected void RadGrid1_GridExporting(object source, GridExportingArgs e)
        {
            GridHeader("12", e);
        }
        protected void RadGrid2_GridExporting(object source, GridExportingArgs e)
        {
            GridHeader("13", e);
        }

        protected void RadGrid4_GridExporting(object source, GridExportingArgs e)
        {
            GridHeader("14", e);
        }
        protected void RadGrid3_GridExporting(object source, GridExportingArgs e)
        {
            GridHeader("15", e);
        }
        protected void RadGrid7_GridExporting(object source, GridExportingArgs e)
        {
            GridHeader("16", e);
        }

        protected void RadGrid8_GridExporting(object source, GridExportingArgs e)
        {
            GridHeader("17", e);
        }
        protected void RadGrid9_GridExporting(object source, GridExportingArgs e)
        {
            GridHeader("18", e);
        }
        protected void RadGrid10_GridExporting(object source, GridExportingArgs e)
        {
            GridHeader("19", e);
        }
        protected void RadGrid12_GridExporting(object source, GridExportingArgs e)
        {
            GridHeader("20", e);
        }

        #region Generic function to get header Information while Exporting Grid
        public string ReportName, Other, customHTML1, customHTML2, customHTML3;
        public bool GenerateBy;
        protected void GridHeader(string gridno, GridExportingArgs e)
        {
            #region Grab Info from DB
            string sql = "SELECT [GridNo],[ReportName],[Other],[GenerateBy] FROM [GridHeader] where GridNo='" + gridno + "'";
            SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sql, null);
            if (dr.Read())
            {
                ReportName = dr.GetString(dr.GetOrdinal("ReportName"));
                Other = dr.GetString(dr.GetOrdinal("Other"));
                GenerateBy = dr.GetBoolean(dr.GetOrdinal("GenerateBy"));
            }
            #endregion


            string customHTML = "<div width=\"100%\" style=\"text-align:center;font-size:8px;font-family:Tahoma;\">" +
                                " <table width='100%'border='0'>" +
                                    "<tr><td colspan='7'  style=\"text-align:left;font-size:12px;font-family:Tahoma;\" ><b>Company Name :</b>" + Session["CompanyName"].ToString() + "</td></tr> " +
                                    "<tr><td colspan='7'  style=\"text-align:left;font-size:12px;font-family:Tahoma;\" ><b>Report Name:</b>" + ReportName + "</td></tr> " +
                                    "<tr><td colspan='7'  style=\"text-align:left;font-size:12px;font-family:Tahoma;\" ><b>Date:</b>" + DateTime.Now.ToString("d", System.Globalization.CultureInfo.CreateSpecificCulture("en-NZ")) + "</td></tr> ";

            if (Other != "")
            {
                customHTML1 = "<tr><td colspan='7'  style=\"text-align:left;font-size:12px;font-family:Tahoma;\" ><b>Note :</b>" + Other + "</td></tr> ";
            }
            else
            {
                customHTML1 = "";
            }

            if (GenerateBy)
            {
                customHTML2 = "<tr><td colspan='7'  style=\"text-align:left;font-size:12px;font-family:Tahoma;\" ><b>Generated By :</b>" + Session["Emp_Name"].ToString() + "</td></tr> ";
            }
            else
            {
                customHTML2 = "";
            }


            customHTML3 = "</table>" +
                                "</div>";
            e.ExportOutput = e.ExportOutput.Replace("<body>", String.Format("<body>{0}", customHTML + customHTML1 + customHTML2 + customHTML3));
        }
        #endregion
        
        #endregion
       
        #region column Width for grid
        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e) 
            {     
                //if (e.Item is GridDataItem)      
                //{
                //    GridDataItem dataBoundItem = e.Item as GridDataItem; 
                //    if (dataBoundItem["Name"].Text.Length > 11) 
                //    {
                //        dataBoundItem["Name"].Text = dataBoundItem["Name"].Text.Substring(0, 11) + "...";
                //    }      
                //} 
            }
        protected void RadGrid2_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            //if (e.Item is GridDataItem)
            //{
            //    GridDataItem dataBoundItem = e.Item as GridDataItem;
            //    if (dataBoundItem["Name"].Text.Length > 9)
            //    {
            //        dataBoundItem["Name"].Text = dataBoundItem["Name"].Text.Substring(0, 9) + "...";
            //    }

            //    if (dataBoundItem["Type"].Text.Length > 6)
            //    {
            //        dataBoundItem["Type"].Text = dataBoundItem["Type"].Text.Substring(0, 6) + "...";
            //    }
                
               
            //}
        }

        protected void RadGrid3_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            //if (e.Item is GridDataItem)
            //{
            //    GridDataItem dataBoundItem = e.Item as GridDataItem;
            //    if (dataBoundItem["Name"].Text.Length > 23)
            //    {
            //        dataBoundItem["Name"].Text = dataBoundItem["Name"].Text.Substring(0, 23) + "...";
            //    }
            //}
        }

        protected void RadGrid12_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e) 
            {     
                //if (e.Item is GridDataItem)      
                //{
                //    GridDataItem dataBoundItem = e.Item as GridDataItem; 
                //    if (dataBoundItem["LogMessage"].Text.Length > 45) 
                //    {
                //        dataBoundItem["LogMessage"].Text = dataBoundItem["LogMessage"].Text.Substring(0, 45) + "...";
                //    }      
                //} 
            }
           
        #endregion

    }
}
