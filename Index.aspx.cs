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
using System.Xml;

namespace SMEPayroll
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Open the XML file

            HttpContext.Current.Session.Clear();
            Session.LCID = 2057;
            XmlDocument docXML = new XmlDocument();
            docXML.Load(HttpContext.Current.Server.MapPath("~/XML/xmldata.xml"));
            XmlNodeList nodTitles = docXML.GetElementsByTagName("ANBProduct");
            for (int i = 0; i < nodTitles.Count; i++)
            {
                HttpContext.Current.Session[((XmlElement)(nodTitles[i])).GetAttribute("id")]= ((XmlElement)(nodTitles[i])).GetAttribute("text");
            }

            if ((HttpContext.Current.Session["ANBPRODUCT"].ToString() == "WMS")||(HttpContext.Current.Session["ANBPRODUCT"].ToString() == "WMSI"))
            {
                Response.Redirect("LoginWMS.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}
