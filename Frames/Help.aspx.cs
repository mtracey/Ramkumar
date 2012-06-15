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

namespace SMEPayroll.Frames
{
    public partial class Help : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Depending up on Comment Value Retrived From XMl File DIV is shown True Or False
            string FileName = Server.MapPath("~/help/help_Config/Comments_English.xml");
            string Comment="";
            if (Page.Request.QueryString.Count > 0)
            {
                if (Page.Request.QueryString[0].ToString() != "about")
                {
                    Comment = Utility.GetComment(Page.Request.QueryString[0], FileName);
                }
                else
                {
                    Comment = Page.Request.QueryString[0].ToString();
                }
            }

            if (Comment != "")
            {
                if (Comment == "about")
                {
                    string query = "select Top 1 * from productversion order by ReleaseDate Desc";

                    DataSet ds = new DataSet();
                    ds = DataAccess.FetchRS(CommandType.Text, query, null);

                    lblMessage.Text = "about";
                    lblVersionSme.Text = ds.Tables[0].Rows[0][2].ToString();
                    lblSMEreleasedate.Text = ds.Tables[0].Rows[0][4].ToString();

                    lblVersionIras.Text = "1.0";
                    lblIrasreleasedate.Text = ds.Tables[0].Rows[0][4].ToString();

                    lblIE.Text = Request.Browser.Version.ToString();
                    lblFW.Text = Environment.Version.ToString();
                    lblOs.Text = Environment.OSVersion.VersionString.ToString();
                    lblMessage.Text = "";
                    divhelp.Visible = true;
                }
                else
                {
                    char sep = '#';
                    string[] data = Comment.Split(sep);
                    if (data.Length > 0)
                    {
                        //divContent.InnerHtml = data[0];
                        //hyperLink.Text = "HTML Help";
                        //hyperLink.NavigateUrl = data[1].Trim();
                        try
                        {
                            if (data[0].Trim() != "")
                            {
                                string url = "http://" + Request.Url.Host + ":" + Request.Url.Port + Request.Url.AbsolutePath.Replace("/frames/help.aspx", "") + "/" + data[0].Trim();
                                Response.Redirect(url, false);
                                //Server.Execute(url);
                            }
                        }
                        catch (Exception ex)
                        {
                            //Response.Redirect(Request.Url.AbsoluteUri);
                            //lblMessage.Text = "Help Not Available";
                        }
                    }
                    else
                    {

                        lblMessage.Text = "Help Not Available";
                    }
                }
            }
            else
            { 
            
                lblMessage.Text = "Help Not Available";
            }

        }

        

    }
}
