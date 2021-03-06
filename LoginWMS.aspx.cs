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

namespace SMEPayroll
{
    public partial class LoginWMS : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        protected void Page_Load(object sender, EventArgs e)
        {

            Label1.Text = "";
        //    SMEPayroll.BusinessRule.LoginInfo.SmeConnectionString = Constants.CONNECTION_STRING;
            if (HttpContext.Current.Session["ANBPRODUCT"] != null)
            {
                lblyear.Text = "Current Year : " + DateTime.Now.Year.ToString();
                if (!IsPostBack)
                {
                    string sSQL = "Select Company_Id, Company_Name From Company Order By Company_name";
                    Utility.FillDropDown(drpcompany, sSQL);
                }
            }
            else
            {
                Response.Write("Please Close Browser and restart browser");
                Response.End();
            }
        }
        protected void BtnLogin(object sender, EventArgs e)
        {
            if (drpcompany.SelectedIndex.ToString() == "0")
            {
                Label1.Visible = true;
                Label1.Text = "Please select the Company";

            }
            else
            {
                try
                {
                    string filePath = "";
                    string TargetDirectory = Utility.ToString(System.Configuration.ConfigurationSettings.AppSettings["TARGET_DIRECTORY"].ToString());

                    string fileCount ="";

                    if (System.IO.Directory.Exists(TargetDirectory))
                    {
                        foreach (string fileName in System.IO.Directory.GetFiles(TargetDirectory))
                        {
                            filePath = fileName;
                        }

                        if (System.IO.Directory.GetFiles(TargetDirectory).Length > 1)
                        {
                            fileCount = "2";
                        }

                        if ((filePath != "") && (fileCount == ""))
                        {
                            bool Login_OK = Utility.GetLoginOK(drpcompany.SelectedItem.Value, txtUserName.Value.ToString(), txtPwd.Value.ToString());
                            if (Login_OK == true)
                            {
                                //SMEPayroll.BusinessRule.LoginInfo.SmeUserName  = txtUserName.Value.ToString();
                                //SMEPayroll.BusinessRule.LoginInfo.SmeEmpPassword = txtPwd.Value.ToString();
                                Utility.setAllrights(txtUserName.Value.ToString(), drpcompany.SelectedItem.Value);
                                Response.Redirect("frames/default.aspx");
                            }
                            else
                            {
                                this.Label1.Visible = true;
                                Label1.Text = "Invalid Login/Inactive User Account.";
                            }
                        }
                        else if (fileCount != "2")
                        {
                            this.Label1.Visible = true;
                            Label1.Text = "License File Missing";
                        }
                        else if (fileCount == "2")
                        {
                            this.Label1.Visible = true;
                            Label1.Text = "License Files tampered.";
                        }
                    }
                    else
                    {
                        this.Label1.Visible = true;
                        Label1.Text = "License Files Path is incorrect";
                    }
                }
                catch (Exception exc)
                {
                    throw exc;                    
                }
            }
        }
    }
}
