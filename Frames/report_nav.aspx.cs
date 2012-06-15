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

namespace SMEPayroll.frames
{
	/// <summary>
	/// Summary description for report_nav.
	/// </summary>
	public class report_nav : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            HtmlInputText txtinput = new HtmlInputText();
            txtinput.ID = "txtMsg";
            txtinput.Value = "V";
            txtinput.Style.Value = "WIDTH: 0px; HEIGHT: 0px";
            //txtinput.Style.Add("height", "0"); // = "height:0;width:0";
            
            this.Page.Controls.Add(txtinput);

            if (Session["Maintain"] != null)
            {
                int daysDiff = (int)Session["Maintain"];
                if (daysDiff < 0)
                {
                    Session["Maintain"] = daysDiff;
                    txtinput.Value= "I";
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
