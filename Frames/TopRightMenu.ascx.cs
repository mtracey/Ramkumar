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
using System.Xml;
namespace SMEPayroll.Frames
{
    public partial class TopRightMenu : System.Web.UI.UserControl
    {
        string comp_id;
        string sUserName;
        public string menuUrl = "";
        public string menuLeftUrl = "";
        public static int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
   
            //To Show Image Collapsible 
            //Depending up on Comment Value Retrived From XMl File DIV is shown True Or False
            //Shashank K Code Added On Date 11/02/2010
            //Can Add Code To Pickup A Language For Localization.


            //Ram
            //if we add new menu then increase the count //if (menu1.Items.Count == 11) for logout menu


            txtBox1.Text = "";
            string FileName = Server.MapPath("~/help/help_Config/Comments_English.xml");
            string PagePath = ((System.Web.UI.TemplateControl)(this.Page)).AppRelativeVirtualPath;
            char sep = '/';
            string[] PageName = PagePath.Split(sep);
            string Comment = "";
            if (PageName.Length > 0)
            {
                Comment = Utility.GetComment(PageName[2], FileName);
                txtBox1.Text = PageName[2];
            }
            if (Comment != "")
            {
                ////Button1.Visible = true;
                //TestID.Visible = true;
                ////msgId.Visible = true;
                //sep = ':';
                ////string[] CommentText = Comment.Split(sep);
                //TestID.InnerHtml = Comment;
                ////divComments.InnerText = CommentText[0];
            }
            comp_id = Session["Compid"].ToString();
            sUserName = Utility.ToString(Session["Username"]);
            DataSet MenuHeaderDs;

            MenuHeaderDs = MenuHeaderDetails;

            //r
            #region Hide approve payroll and generate payroll - if it is not required
            if ((string)Session["processPayroll"].ToString() == "0")//hide the approve and generate links
            {
                MenuHeaderDs = CheckApproveGenerateLinkNeeded(MenuHeaderDs);
            }
            #endregion

            int j = 0;

            ArrayList rightIds = new ArrayList();
            for (int i = 0; i < MenuHeaderDs.Tables[0].Rows.Count; i++)
            {

                int rightId = Convert.ToInt16(MenuHeaderDs.Tables[0].Rows[i]["RightID"].ToString());
                if (rightIds.Count == 0)
                {
                    rightIds.Insert(j, rightId);
                    j = j + 1;
                }
                else if (rightId != (int)rightIds[j - 1])
                {
                    rightIds.Insert(j, rightId);
                    j = j + 1;
                }
            }
            DataRow[] dr = null;
            RadMenu menu = new RadMenu();
            menu.ID = "RadMenu1";
            menu.Style.Value = "float: none; left: 0px; top: 0px;Width:100%;background-image: url(../Frames/Images/TOOLBAR/backsTop.jpg)";
            menu.Skin = "Office2007";
            
            //HtmlButton btnClick1 = new HtmlButton();            
            //btnClick1.ID = "btnClick1";
            //btnClick1.InnerHtml = "CliclMe";
            //btnClick1.Style.Value = "float: none; left: 10000px; top: 100px;Width:50px;Height:50px;";
            //btnClick1.Attributes.Add("onclick", "javascript:OpenWindow();return false;");


            //r
            //#region Home menu in the First
            if (menu.GetAllItems().Count != 0)
            {
                foreach (RadMenuItem item in menu.GetAllItems())
                {
                    if (item.Text != "Home")
                    {
                        RadMenuItem Home = new RadMenuItem("Home");
                        Home.NavigateUrl = "../main/home.aspx";
                        menu.Items.Add(Home);
                    }
                }
            }
            else
            {
                RadMenuItem Home = new RadMenuItem("Home");
                Home.NavigateUrl = "../main/home.aspx";
                menu.Items.Add(Home);
            }
            //#endregion
            




            RadMenuItem item1;
            RadMenuItem subIt1 = null;
            //RadMenuItem subIt2 = null;
            for (int alist = 0; alist < rightIds.Count; alist++)
            {
                int myRightId = Convert.ToInt16(rightIds[alist]);
                dr = MenuHeaderDs.Tables[0].Select("RightId = " + myRightId);

                string menuName = dr[0].ItemArray[1].ToString();
                

                item1 = new RadMenuItem(menuName); 
               //new in this version check for update
                
                    item1.GroupSettings.Width = 200;

                    for (int k = 0; k < dr.Length; k++)
                    {
                        string subMenuHead = "";
                        string subMenuName = dr[k].ItemArray[2].ToString();
                        subMenuHead = GetMenuHeading(subMenuName.ToLower());
                        if (subMenuName != "CLAIMS CAPPING")
                        {
                            string menuStyle = GetMenuStyle(subMenuName.ToLower());
                            //string menuStyle = "trainer";
                            subIt1 = new RadMenuItem(subMenuHead);
                            if ((k + 1) % 2 != 0)
                            {
                                subIt1.CssClass = "support-firstColumn " + menuStyle;
                            }
                            else
                            {
                                subIt1.CssClass = "support-secondColumn " + menuStyle;
                            }
                            item1.Items.Add(subIt1);
                            if ((dr.Length % 2 == 1) && (k + 1 == dr.Length))
                            {
                                //subIt2 = new RadMenuItem(" ");
                                //subIt2.CssClass = "support-secondColumn empty";
                                //item1.Items.Add(subIt2);
                            }
                        }                       
                    }

                    if (menuName.ToUpper() == "Invoice".ToUpper() && Session["ANBPRODUCT"].ToString() == "WMSI")
                    {
                        menu.Items.Add(item1);
                    }
                    else if (menuName.ToUpper() == "Invoice".ToUpper() && Session["ANBPRODUCT"].ToString() != "WMSI")
                    {


                    }
                    else
                    {
                        menu.Items.Add(item1);
                    }
                    
            }
            
            string ismaster = "";
            string sql1 = "select isMaster From Company Where Company_ID=1";
            SqlDataReader drne = DataAccess.ExecuteReader(CommandType.Text, sql1, null);
            if (drne.Read())
            {
                ismaster = drne[0].ToString();
                if (ismaster == "True")
                {

                    if (HttpContext.Current.Session["CurrentCompany"].ToString() == "1" && HttpContext.Current.Session["isMaster"].ToString() != "True")
                    //if (HttpContext.Current.Session["CurrentCompany"].ToString() == "1")
                    {
                        if (Session["GroupName"].ToString().ToUpper() == "SUPER ADMIN")
                        {
                            item1 = new RadMenuItem(HttpContext.Current.Session["CompanyName"].ToString());
                            item1.GroupSettings.Width = 400;

                            string sSQL = "SELECT Company_ID, Company_Name From Company";
                            System.Data.SqlClient.SqlDataReader datare = DataAccess.ExecuteReader(CommandType.Text, sSQL, null);
                            int kk = 0;
                            while (datare.Read())
                            {

                                subIt1 = new RadMenuItem(datare.GetValue(1).ToString());
                                subIt1.Value = datare.GetValue(0).ToString();
                                item1.Items.Add(subIt1);
                                if ((kk + 1) % 2 != 0)
                                {
                                    subIt1.CssClass = "support-firstColumn viewemployees";
                                }
                                else
                                {
                                    subIt1.CssClass = "support-secondColumn viewemployees";
                                }
                                kk++;
                            }
                            if (kk > 20)
                            {
                                item1.GroupSettings.Height = kk * 100;
                            }
                            menu.Items.Add(item1);

                        } 
                    }
                    if (HttpContext.Current.Session["isMaster"].ToString() == "True")
                    {

                        item1 = new RadMenuItem(HttpContext.Current.Session["CompanyName"].ToString());
                        item1.GroupSettings.Width = 400;
                        //EmpCode
                        string sSQL = "SELECT Company_ID, Company_Name From Company WHERE Company_Id IN (SELECT  CompanyId FROM MasterCompany_User WHERE UserID=" + Session["EmpCode"].ToString() + ")";

                        

                        System.Data.SqlClient.SqlDataReader datare = DataAccess.ExecuteReader(CommandType.Text, sSQL, null);
                        int kk = 0;
                        while (datare.Read())
                        {

                            subIt1 = new RadMenuItem(datare.GetValue(1).ToString());
                            subIt1.Value = datare.GetValue(0).ToString();
                            item1.Items.Add(subIt1);
                            if ((kk + 1) % 2 != 0)
                            {
                                subIt1.CssClass = "support-firstColumn viewemployees";
                            }
                            else
                            {
                                subIt1.CssClass = "support-secondColumn viewemployees";
                            }
                            kk++;
                        }
                        if (kk > 20)
                        {
                            item1.GroupSettings.Height = kk * 100;
                        }
                        menu.Items.Add(item1);
                    }
                }
            }

            string msg;
            double ver = getInternetExplorerVersion();
            if (ver > 0.0)
            {
                if (ver >= 7.0)
                {
                    //msg = "You're using a recent version of Internet Explorer.";
                    //MenuPanel.Controls.Add(btnClick1);
                    MenuPanel.Controls.Add(menu);
                    
                    RadMenu menu1 = (RadMenu)MenuPanel.FindControl("RadMenu1");
                    foreach (RadMenuItem item in menu1.GetAllItems())
                    {
                        if (item.Level > 0)
                        {
                            LinkButton lb = new LinkButton();
                            lb.Text = item.Text;
                            lb.CssClass = "test";
                            string strMnuHead = item.Text;

                            if (strMnuHead.Trim().ToUpper() == "help on this page".ToUpper() ||
                               strMnuHead.Trim().ToUpper() == "user guide".ToUpper() ||
                               strMnuHead.Trim().ToUpper() == "about".ToUpper() ||
                                strMnuHead.Trim().ToUpper() == "new in this version".ToUpper() ||
                                strMnuHead.Trim().ToUpper() == "license information".ToUpper()
                                )
                            {

                            }
                            else
                            {
                                if (item.Value.ToString().Length > 0)
                                {
                                    menuUrl = "../main/home.aspx?cid=" + item.Value.ToString() + "__../frames/right.aspx";
                                    //menuUrl = "/SMEPayroll/main/home.aspx__../frames/right.aspx";
                                }
                                else
                                {
                                    menuUrl = GetMenuURL(strMnuHead) + "__" + GetLeftMenuURL(strMnuHead);
                                }
                            
                            }
                            //License Information
                            if (strMnuHead.Trim().ToUpper() == "help on this page".ToUpper() ||
                               strMnuHead.Trim().ToUpper() == "user guide".ToUpper() ||
                               strMnuHead.Trim().ToUpper() == "About".ToUpper() ||
                                strMnuHead.Trim().ToUpper() == "new in this version".ToUpper() ||
                                strMnuHead.Trim().ToUpper() == "license information".ToUpper()
                                )
                            {
                                //LinkButton lb1 = new LinkButton();
                                //lb1.Text = "Help";
                                //lb1.CssClass = "support-firstColumn viewemployees";

                                if (strMnuHead.Trim().ToUpper() == "Help on this page".ToUpper())
                                {
                                    lb.Attributes.Add("onclick", "javascript:return OpenWindow();");
                                }
                                else if (strMnuHead.Trim().ToUpper() == "license information".ToUpper())                                
                                {
                                    lb.Attributes.Add("onclick", "javascript:return OpenWindowLic();");
                                }
                                else if (strMnuHead.Trim().ToUpper() == "user guide".ToUpper())
                                {
                                    lb.Attributes.Add("onclick", "javascript:return OpenWindowUG();");
                                }
                                else if (strMnuHead.Trim().ToUpper() == "about".ToUpper())
                                {
                                    lb.Attributes.Add("onclick", "javascript:return OpenWindowAbout();");
                                }
                                else if (strMnuHead.Trim().ToUpper() == "new in this version".ToUpper())
                                {
                                    //Response.Redirect("http://www.smepayroll.com/download.htm");
                                    lb.Attributes.Add("onclick", "javascript:return OpenWindowUG();");
                                }
                                lb.Attributes.Add("onmouseover", "Hover(this);");
                                lb.Attributes.Add("onmouseout", "MouseOut(this);");
                                item.Controls.Add(lb);
                            }
                            else
                            {
                                lb.Attributes.Add("onclick", "javascript:return " + "myUrl('" + menuUrl + "');return  false;");
                                lb.Attributes.Add("onmouseover", "Hover(this);");
                                lb.Attributes.Add("onmouseout", "MouseOut(this);");
                                item.Controls.Add(lb);
                            }
                        }
                    }


                    //r
                    #region logout menu in the last
                    if (!IsPostBack)
                    {
                        if (menu1.Items.Count <= 11)
                        {
                            RadMenuItem logout = new RadMenuItem("Logout");
                            logout.NavigateUrl = "../Index.aspx";
                            menu1.Items.Add(logout);
                        }
                    }
                    #endregion
                    

                    menu1.DataBind();
                }
                else
                {
                    //msg = "You should upgrade your copy of Internet Explorer.";
                }
            }
            else
            {
                //msg = "You're not using Internet Explorer.";
            }
        }

       

        private float getInternetExplorerVersion()
        {
            // Returns the version of Internet Explorer or a -1
            // (indicating the use of another browser).
            float rv = -1;
            if (Session["IEVersion"] == null)
            {
                System.Web.HttpBrowserCapabilities browser = Request.Browser;
                if (browser.Browser == "IE")
                    rv = (float)(browser.MajorVersion + browser.MinorVersion);
            }
            else
            {
                rv = (float)(Session["IEVersion"]);
            }
            return rv;
        }

        private DataSet MenuHeaderDetails
        {
            get
            {
                string sSQL = "";
                SqlParameter[] parms;
                parms = new SqlParameter[4];
                DataSet MenuHeaderDs = new DataSet();
                sSQL = "Sp_RightsMenuHeader";
                parms[0] = new SqlParameter("@adminId", sUserName);
                parms[1] = new SqlParameter("@comp_id", comp_id);
                parms[2] = new SqlParameter("@ANBPRODUCT", HttpContext.Current.Session["ANBPRODUCT"].ToString());
                if (HttpContext.Current.Session["isMaster"].ToString()=="True")
                {
                    parms[3] = new SqlParameter("@MasterComp", "1");
                }
                else
                {
                    parms[3] = new SqlParameter("@MasterComp", "0");
                }

                MenuHeaderDs = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL, parms);
                //if (Cache["DS"] == null)
                //{
                //    MenuHeaderDs = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL, parms);
                //    Cache["DS"] = MenuHeaderDs;
                //}
                //else
                //{
                //    MenuHeaderDs =  (DataSet)Cache["DS"];
                //}
                
                return MenuHeaderDs;
            }
        }
        private string GetMenuHeading(string HeadingName)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("~/XML/xmldata.xml"));
            XmlNode MenuHead;
            try
            {
                MenuHead = xmlDoc.SelectSingleNode("SMEPayroll/Rights/Right[@id='" + HeadingName.ToString().Trim() + "']");
                HeadingName = MenuHead.Attributes[1].Value.ToString();
            }
            catch (Exception ex)
            {
                HeadingName = "err";
            }
            return HeadingName;
        }
        private string GetMenuURL(string HeadingName)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("~/XML/xmldata.xml"));
            XmlNode MenuHead;
            string menuURl = "";
            try
            {
                MenuHead = xmlDoc.SelectSingleNode("SMEPayroll/Rights/Right[@MenuText='" + HeadingName.ToString().Trim() + "']");
                 menuURl = MenuHead.Attributes[3].Value.ToString();
            }
            catch (Exception ex)
            {
                menuURl = "err";
            }
            return menuURl;
        }
        private string GetLeftMenuURL(string HeadingName)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("~/XML/xmldata.xml"));
            XmlNode MenuHead;
            string menuURl = "";
            try
            {
                MenuHead = xmlDoc.SelectSingleNode("SMEPayroll/Rights/Right[@MenuText='" + HeadingName.ToString().Trim() + "']");
                 menuURl = MenuHead.Attributes[4].Value.ToString();
            }
            catch (Exception ex)
            {
                menuURl = "err";
            }
            return menuURl;
        }
        private string GetMenuStyle(string HeadingName)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("~/XML/xmldata.xml"));
            XmlNode MenuHead;
            try
            {
                //MenuHead = xmlDoc.SelectSingleNode("SMEPayroll/Rights/Right[@id='" + HeadingName.ToString().Trim() + "']");
                //HeadingName = MenuHead.Attributes[2].Value.ToString();
                HeadingName=HeadingName.ToString().Replace(" ", "").ToString().ToLower();
                if (HeadingName == "0")
                {
                    HeadingName = "trainer";
                }
            }
            catch (Exception ex)
            {
                HeadingName = "0";
            }
            return HeadingName;
        }

        //r
        //remove  Approve and generate row from dataset when it is not needed
        protected DataSet CheckApproveGenerateLinkNeeded(DataSet ds_dt)
        {
            for (int i = ds_dt.Tables[0].Rows.Count - 1; i >= 0; i--) 
            {
                DataRow dr = ds_dt.Tables[0].Rows[i];
                if (dr["RightName"].ToString() == "APPROVE OR REJECT PAYROLL" || dr["RightName"].ToString() == "VIEW GENERATE PAYROLL")
                {
                    dr.Delete();
                    dr.AcceptChanges();
                }
            }
            
            return ds_dt;
        }



    }
}
