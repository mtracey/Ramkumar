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
using System.Data.SqlClient;

namespace SMEPayroll.Management
{
    public partial class GroupRights : System.Web.UI.UserControl
    {
        private int GroupID = 0;
        private string rightCategory = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rightsHeader.InnerText = "Rights For " + rightCategory;
                bindgrid();
            }
          
        }
        private DataSet RightDetails
        {
            get
            {
                                string sSQL = "" ;

                DataSet ds = new DataSet();

                if (HttpContext.Current.Session["ANBPRODUCT"].ToString() == "SME")
                {
                    sSQL = " Select * From (Select GroupID = case when a.GroupID is not null then 'true' else 'False' end, b.RightID,b.ActualRightName, b.RightSubCategory,b.Description,b.displayid ";
                    sSQL = sSQL + " from GroupRights a Inner Join UserRights b On a.RightID=b.RightID ";
                    sSQL = sSQL + " where b.rightcategory='" + rightCategory + "' and a.GroupID = " + GroupID;
                    sSQL = sSQL + " And (b.Product = 0 OR b.Product = 2 OR b.Product is null) ";
                    sSQL = sSQL + " Union ";
                    sSQL = sSQL + " Select 'False' GroupID,b.RightID,b.ActualRightName, b.RightSubCategory,b.Description,b.displayid  From UserRights b  ";
                    sSQL = sSQL + " Where RightID Not In  ";
                    sSQL = sSQL + " ((select b.RightID from GroupRights a Inner Join UserRights b On a.RightID=b.RightID  where b.rightcategory='" + rightCategory + "' and a.GroupID = " + GroupID + " And (b.Product = 0 OR b.Product = 2 OR b.Product is null))) ";
                    sSQL = sSQL + " And b.rightcategory='" + rightCategory + "' ) D order by  DisplayId";

                    //sSQL = "select GroupID = case when a.GroupID is not null then 'true' else 'False' end, b.RightID,b.ActualRightName, b.RightSubCategory,b.Description  from GroupRights a Inner Join UserRights b On a.RightID=b.RightID ";
                    //sSQL = sSQL + " where b.rightcategory='" + rightCategory + "' and a.GroupID = " + GroupID;
                    //sSQL = sSQL + " And (b.Product = 0 OR b.Product = 2 OR b.Product is null) order by  DisplayId";
                }
                if ((HttpContext.Current.Session["ANBPRODUCT"].ToString() == "WMS")||(HttpContext.Current.Session["ANBPRODUCT"].ToString() == "WMSI"))
                {
                    //sSQL = "select GroupID = case when a.GroupID is not null then 'true' else 'False' end, b.RightID,b.ActualRightName, b.RightSubCategory,b.Description  from GroupRights a Inner Join UserRights b On a.RightID=b.RightID ";
                    //sSQL = sSQL + " where b.rightcategory='" + rightCategory + "' and a.GroupID = " + GroupID;
                    //sSQL = sSQL + " And (b.Product = 1 OR b.Product = 2) order by  DisplayId";

                    sSQL = " Select * From (Select GroupID = case when a.GroupID is not null then 'true' else 'False' end, b.RightID,b.ActualRightName, b.RightSubCategory,b.Description,b.displayid ";
                    sSQL = sSQL + " from GroupRights a Inner Join UserRights b On a.RightID=b.RightID ";
                    sSQL = sSQL + " where b.rightcategory='" + rightCategory + "' and a.GroupID = " + GroupID;
                    sSQL = sSQL + " And (b.Product = 1 OR b.Product = 2) ";
                    sSQL = sSQL + " Union ";
                    sSQL = sSQL + " Select 'False' GroupID,b.RightID,b.ActualRightName, b.RightSubCategory,b.Description,b.displayid  From UserRights b  ";
                    sSQL = sSQL + " Where RightID Not In  ";
                    sSQL = sSQL + " ((select b.RightID from GroupRights a Inner Join UserRights b On a.RightID=b.RightID  where b.rightcategory='" + rightCategory + "' and a.GroupID = " + GroupID + " And (b.Product = 0 OR b.Product = 2))) ";
                    sSQL = sSQL + " And b.rightcategory='" + rightCategory + "' ) D order by  DisplayId";
                }

                

                ds = GetDataSet(sSQL);
                return ds;
            }
        }
        private void bindgrid()
        {
        RadGrid1.DataSource  =RightDetails;
        RadGrid1.DataBind();
        }
        protected bool GenerateBindString(object dataItem)
        {
            bool ret = false;


            // if column is null set checkbox.checked = false

            if ((DataBinder.Eval(dataItem, "GroupID")).ToString() == "False")
                ret = false;
            else // set checkbox.checked to boolean value in Status column
                ret = true;
            return ret;
        }
        private static DataSet GetDataSet(string query)
        {
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, query, null);
            return ds;
        }
        
        public int MyGroupId
        {
            get
            {
                return GroupID;
            }
            set
            {
                GroupID = value;
            }
        }
        public string MyrightCategory
        {
            get
            {
                return rightCategory;
            }
            set
            {
                rightCategory = value;
            }
        }


    }
}