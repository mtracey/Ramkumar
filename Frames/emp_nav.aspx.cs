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
	/// Summary description for emp_nav.
	/// </summary>
	public class emp_nav : System.Web.UI.Page
    {
        string comp_id = "";
        protected bool approve;
        protected bool required;
    
		private void Page_Load(object sender, System.EventArgs e)
		{
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
             comp_id = Session["Compid"].ToString();
             if (!IsPostBack)
             {
                 string SQLQuery;                 
                 SQLQuery = "select timesheet_approve from company where company_id=" + comp_id;
                 SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, SQLQuery, null);
                 if (dr.Read())
                 {
                     if ((dr[0].ToString()) == "1") { approve = true; required = true; }
                     else { approve = false; required = false; }
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
