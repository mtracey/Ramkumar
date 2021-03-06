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
	/// Summary description for menu.
	/// </summary>
	public class menu : System.Web.UI.Page
	{
        protected string companyname;
		protected string curtime;
        string comp_id = "", emp_code = "";
        protected bool supervisor;
		private void Page_Load(object sender, System.EventArgs e)
		{
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            companyname = Session["CompanyName"].ToString();
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
	}
}
