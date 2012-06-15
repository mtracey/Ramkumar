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

namespace SMEPayroll.Management
{
    public partial class ShowDropdowns : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            SqlDataSource1.ConnectionString = Session["ConString"].ToString();
        }

        protected void RadGrid1_PreRender(object sender, EventArgs e)
        {
            int itemCount = (sender as RadGrid).MasterTableView.GetItems(GridItemType.Item).Length + (sender as RadGrid).MasterTableView.GetItems(GridItemType.AlternatingItem).Length;
            foreach (GridItem item in (sender as RadGrid).Items)
            {
                if (item is GridDataItem && item.ItemIndex < itemCount - 1)
                {
                    ((item as GridDataItem)["ID"] as TableCell).Controls.Add(new LiteralControl("<table style='display:none;'><tr><td>"));
                }
            }
        }

    }
}
