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



namespace SMEPayroll.Management
{
    public partial class Banks : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        private object _dataItem = null;

        int compID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            compID = Utility.ToInteger(Session["Compid"]);
            /* To disable Grid filtering options  */
            GridFilterMenu menu = RadGrid1.FilterMenu;
            int i = 0;

            while (i < menu.Items.Count)
            {
                menu.Items.RemoveAt(i);
            }

            RadGrid1.ItemDataBound += new GridItemEventHandler(RadGrid1_ItemDataBound);
        }

        void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            if (editedItem != null)
            {
                UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
                if (editedItem.ItemIndex != -1)
                {
                    object id = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["ID"];
                    string id1 = id.ToString();
                    if (userControl != null)
                    {
                        ViewState["InitialBankCode"] = (userControl.FindControl("txtbankcode") as TextBox).Text;
                    }
                }
            }
        }
        
        public object Dataitem
        {
            get
            {
                return this._dataItem;
            }
            set
            {
                this._dataItem = value;
            }
        }

        protected static DataSet GetDataSet(string sSQL)
        {
            
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            return ds;
        }

        protected void bindgrid(object sender, ImageClickEventArgs e)
        {

            RadGrid1.DataBind();
        }
        

       private DataSet AdditionDetails
        {
            get
            {
                DataSet ds = new DataSet();
                string sSQL = "";
                sSQL = "select id,[bank_code],[desc] from [bank]";
                ds = GetDataSet(sSQL);
                return ds;
            }
        }
       
       
       protected void RadGrid1_InsertCommand(object source, GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
            
            string bankcode = (userControl.FindControl("txtbankcode") as TextBox).Text;
            string bankname = (userControl.FindControl("txtbankname") as TextBox).Text;
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, "Select * From bank Where Bank_Code='" + bankcode + "'", null);
            if (ds.Tables[0].Rows.Count <= 0)
            {
                string sSQL = "INSERT INTO [bank] ([bank_code],[desc]) VALUES ('" + bankcode + "','" + bankname + "')";

                try
                {
                    int retVal = DataAccess.ExecuteStoreProc(sSQL);
                }
                catch (Exception ex)
                {
                    string ErrMsg = ex.Message;
                    if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                    {
                        ErrMsg = "<font color = 'Red'>Unable to add the record.Please try again.</font>";
                        RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to add record. Reason:</font> " + ErrMsg));
                        e.Canceled = true;
                    }
                }
            }
            else
            {
                string ErrMsg = "<font color = 'Red'>Unable to add the record.Please try again.</font>";
                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to add record. Reason:</font> " + ErrMsg));
                e.Canceled = true;
            }
        }

        protected void RadGrid1_UpdateCommand(object source, GridCommandEventArgs e)
        {
            int i;
            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
            object id = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["ID"];
            string id1 = id.ToString();
            string bankcode = (userControl.FindControl("txtbankcode") as TextBox).Text;
            string bankname = (userControl.FindControl("txtbankname") as TextBox).Text;
           
            Boolean AllowUpdate = true;
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, "SELECT  1 FROM  BANK WHERE  Bank_Code='" + bankcode + "'", null);
            //dr = DataAccess.ExecuteReader(CommandType.Text, "SELECT  [desc] FROM  BANK WHERE  Bank_Code='" + bankcode + "'", null);
            if (ds.Tables[0].Rows.Count > 0)
            {  
                AllowUpdate = false;
            }
            if (bankcode.Trim() == ViewState["InitialBankCode"].ToString())
            {
                AllowUpdate = true;
            }
            if (AllowUpdate)
            {
                string sSQL = "UPDATE [bank] SET [bank_code] = '" + bankcode + "',[desc]='" + bankname + "' WHERE [id] = '" + id1 + "'";

                i = DataAccess.ExecuteStoreProc(sSQL);
                if (i == 1)
                {
                    RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>User record has been updated."));
                }
            }
            else if (AllowUpdate==false)
            {
                string ErrMsg = "<font color = 'Red'>Bank Code Can not Duplicate</font>";
                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to Update Record  record. Reason:</font> " + ErrMsg));
                e.Canceled = true;
            }
        }

        protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            this.RadGrid1.DataSource = this.AdditionDetails;
        }
   }
}
