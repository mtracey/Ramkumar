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
	/// Summary description for startup.
	/// </summary>
	public class startup : System.Web.UI.Page
	{
		protected string sHeadingColor = Constants.HEADING_COLOR;
		protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
		protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
		protected string sOddRowColor = Constants.ODD_ROW_COLOR;
		protected string sBaseColor = Constants.BASE_COLOR;

		protected ArrayList alPassportExp;
		protected ArrayList alWPExp;
		protected ArrayList alInsExp;
		protected ArrayList alCSOCExp;

		private void Page_Load(object sender, System.EventArgs e)
		{
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");           
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
	
		private void LoadPassportExpiry()
		{
			alPassportExp = new ArrayList();
			string sp_name = "sp_passportExp30days";
			SqlDataReader dr = DataAccess.ExecuteReader(CommandType.StoredProcedure,sp_name,null);
			while(dr.Read())
			{
				SMEPayroll.frames.cExpiry oExp = new cExpiry();
				oExp.FirstName = Utility.ToString(dr.GetValue(0));
				oExp.CertNo = Utility.ToString(dr.GetValue(1));
				oExp.expDate = DateTime.Parse(Utility.ToString(dr.GetValue(2))).ToString("dd/MM/yyyy");
                alPassportExp.Add(oExp);
			}
			alPassportExp = FitArraylist2Size(alPassportExp); 
		}
		private void LoadWPExpiry()
		{
			alWPExp = new ArrayList();
			string sp_name = "sp_WPExp30days";
			SqlDataReader dr = DataAccess.ExecuteReader(CommandType.StoredProcedure,sp_name,null);
			while(dr.Read())
			{
				SMEPayroll.frames.cExpiry oExp = new cExpiry();
				oExp.FirstName = Utility.ToString(dr.GetValue(0));
				oExp.CertNo = Utility.ToString(dr.GetValue(1));
				oExp.expDate = DateTime.Parse(Utility.ToString(dr.GetValue(2))).ToString("dd/MM/yyyy");
                alWPExp.Add(oExp);
			}
			alWPExp = FitArraylist2Size(alWPExp);

		}
		private void LoadInsExpiry()
		{
			alInsExp = new ArrayList();
			string sp_name = "sp_InsExp30days";
			SqlDataReader dr = DataAccess.ExecuteReader(CommandType.StoredProcedure,sp_name,null);
			while(dr.Read())
			{
				SMEPayroll.frames.cExpiry oExp = new cExpiry();
				oExp.FirstName = Utility.ToString(dr.GetValue(0));
				oExp.CertNo = Utility.ToString(dr.GetValue(1));
				oExp.expDate = DateTime.Parse(Utility.ToString(dr.GetValue(2))).ToString("dd/MM/yyyy");
				alInsExp.Add(oExp);

			}
			alInsExp = FitArraylist2Size(alInsExp);

		}
		private void LoadCSOCExpiry()
		{
			alCSOCExp = new ArrayList();
			string sp_name = "sp_CSOCExp30days";
			SqlDataReader dr = DataAccess.ExecuteReader(CommandType.StoredProcedure,sp_name,null);
			while(dr.Read())
			{
				SMEPayroll.frames.cExpiry oExp = new cExpiry();
				oExp.FirstName = Utility.ToString(dr.GetValue(0));
				oExp.CertNo = Utility.ToString(dr.GetValue(1));
				oExp.expDate = DateTime.Parse(Utility.ToString(dr.GetValue(2))).ToString("dd/MM/yyyy");
                alCSOCExp.Add(oExp);
			}
			alCSOCExp = FitArraylist2Size(alCSOCExp);
		}
		public ArrayList FitArraylist2Size(ArrayList al)
		{
            if (al.Count == 4) return al;
			int iCount = al.Count;
			for (int i = 0;i < (4 - iCount); i++)
			{
				SMEPayroll.frames.cExpiry oExp = new cExpiry();
				oExp.FirstName = "";
				oExp.CertNo = "";
				oExp.expDate = "";
				al.Add(oExp);
            }
			return al;
		}
	}
	public class cExpiry
	{
		public cExpiry()
		{
		}
		public string FirstName;
		public string CertNo;
		public string expDate;
	}

}
