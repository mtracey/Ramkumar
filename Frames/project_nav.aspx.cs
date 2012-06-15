using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace SMEPayroll.frames
{
	/// <summary>
	/// Summary description for project_nav.
	/// </summary>
	public class project_nav : System.Web.UI.Page
    {
        string comp_id = "", emp_code = "";
        protected bool supervisor;
        protected System.Web.UI.WebControls.Label lblApprove;
        protected System.Web.UI.WebControls.Label lblGenerate;
        protected System.Web.UI.WebControls.Label lblPrint;
        protected System.Web.UI.WebControls.Label lblUnlock;

        private void Page_Load(object sender, System.EventArgs e)
        {
            
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            comp_id = Session["Compid"].ToString();
            emp_code = Session["EmpCode"].ToString();
            if (!IsPostBack)
            {
                string SQLQuery;
                SQLQuery = "select emp_code from employee where emp_supervisor=" + emp_code + " and company_id=" + comp_id;
                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, SQLQuery, null);
                if (dr.Read())
                {
                    if ((Utility.ToInteger(dr[0].ToString())) > 0) { supervisor = true; }
                    else { supervisor = false; }
                }
            }


            if (Session["ROWID"] != null)
            {
                DataSet monthDs;
                DataTable dtFilterFound;
                int i = 0;
                string ssql = "sp_GetPayrollMonth";// 0,2009,2
                SqlParameter[] parms = new SqlParameter[3];
                parms[i++] = new SqlParameter("@ROWID", "0");
                parms[i++] = new SqlParameter("@YEARS", 0);
                parms[i++] = new SqlParameter("@PAYTYPE", Session["PAYTYPE"].ToString());
                monthDs = DataAccess.ExecuteSPDataSet(ssql, parms);
                dtFilterFound = new DataTable();
                dtFilterFound = monthDs.Tables[0].Clone();
                DataRow[] drResults = monthDs.Tables[0].Select("RowID = " + Session["ROWID"].ToString());
                foreach (DataRow dr in drResults)
                {
                    Session["PaySubStartDate"] = dr["PaySubStartDate"].ToString();
                    Session["PaySubEndDate"] = dr["PaySubEndDate"].ToString();
                }

                string sSQLApprove =
                                    "Select isnull(Count(Emp_Code),0) CntEmpID From Employee Em " +
                                    "Inner Join  " +
                                    "( " +
                                    "	Select pd.Emp_ID Emp_ID From prepare_payroll_hdr ph " +
                                    "	Inner Join prepare_payroll_detail pd " +
                                    "	On ph.Trx_ID = pd.Trx_ID " +
                                    "	Where pd.[Status] = 'P' And " +
                                    "  (Convert(datetime,ph.start_period,103) >=Convert(datetime,'" + Session["PaySubStartDate"].ToString() + "',103) And Convert(datetime,ph.end_period,103) <= Convert(datetime,'" + Session["PaySubEndDate"].ToString() + "',103)) " +
                                    ") pd " +
                                    "On Em.Emp_Code = pd.Emp_ID " +
                                    "Where Em.Company_id = " + comp_id;

                string sSQLGenerate =
                                    ";Select isnull(Count(Emp_Code),0) CntEmpID From Employee Em " +
                                    "Inner Join  " +
                                    "( " +
                                    "	Select pd.Emp_ID Emp_ID From prepare_payroll_hdr ph " +
                                    "	Inner Join prepare_payroll_detail pd " +
                                    "	On ph.Trx_ID = pd.Trx_ID " +
                                    "	Where pd.[Status] = 'A' And " +
                                    "  (Convert(datetime,ph.start_period,103) >=Convert(datetime,'" + Session["PaySubStartDate"].ToString() + "',103) And Convert(datetime,ph.end_period,103) <= Convert(datetime,'" + Session["PaySubEndDate"].ToString() + "',103)) " +
                                    ") pd " +
                                    "On Em.Emp_Code = pd.Emp_ID " +
                                    "Where Em.Company_id = " + comp_id;

                string sSQLUnlock =
                        ";Select isnull(Count(Emp_Code),0) CntEmpID From Employee Em " +
                        "Inner Join  " +
                        "( " +
                        "	Select pd.Emp_ID Emp_ID From prepare_payroll_hdr ph " +
                        "	Inner Join prepare_payroll_detail pd " +
                        "	On ph.Trx_ID = pd.Trx_ID " +
                        "	Where pd.[Status] = 'G' And " +
                        "  (Convert(datetime,ph.start_period,103) >=Convert(datetime,'" + Session["PaySubStartDate"].ToString() + "',103) And Convert(datetime,ph.end_period,103) <= Convert(datetime,'" + Session["PaySubEndDate"].ToString() + "',103)) " +
                        ") pd " +
                        "On Em.Emp_Code = pd.Emp_ID " +
                        "Where Em.Company_id = " + comp_id;

                string sSQL = sSQLApprove + sSQLGenerate + sSQLUnlock;
                DataSet ds = new DataSet();
                ds = DataAccess.FetchRS(CommandType.Text, sSQL, null);
                if (ds != null)
                {
                    lblApprove.Text = "[" + ds.Tables[0].Rows[0][0].ToString() + "]";
                    lblGenerate.Text = "[" + ds.Tables[1].Rows[0][0].ToString() + "]";
                    lblPrint.Text = "[" + ds.Tables[2].Rows[0][0].ToString() + "]";
                    lblUnlock.Text = "[" + ds.Tables[2].Rows[0][0].ToString() + "]";
                }
            }

        }

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);
		}
		#endregion

        protected void TopLeftC1_Load(object sender, EventArgs e)
        {

        }
	}
}
