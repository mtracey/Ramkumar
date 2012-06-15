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
    public partial class ManageLocation : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        int compid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            SqlDataSource1.ConnectionString = Session["ConString"].ToString();
            SqlDataSource4.ConnectionString = Session["ConString"].ToString();
            SqlDataSource2.ConnectionString = Session["ConString"].ToString();
            compid = Utility.ToInteger(Session["Compid"]);

            if (compid == 1)
            {
                if (HttpContext.Current.Session["GroupName"].ToString().ToUpper() == "SUPER ADMIN")
                {
                    RadGrid1.Visible = true;
                    RadGrid2.Visible = false;
                }
                else
                {
                    RadGrid1.Visible = false;
                    RadGrid2.Visible = true;
                }
            }
            else
            {
                RadGrid1.Visible = false;
                RadGrid2.Visible = true;
                //drpShared.Attributes.Add("display", "block");
            }
        }
        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if ((Utility.AllowedAction1(Session["Username"].ToString(), "Location")) == false)
            {
                RadGrid1.MasterTableView.CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.None;
                RadGrid1.MasterTableView.GetColumn("DeleteColumn").Visible = false;
                RadGrid1.MasterTableView.GetColumn("EditColumn").Visible = false;
            }

            if ((e.Item is GridEditableItem) && (e.Item.IsInEditMode))
            {
                GridEditableItem edititem = (GridEditableItem)e.Item;
                if (e.Item.ItemIndex != -1)
                {
                    TextBox txtbx = (TextBox)edititem["Location_Name"].Controls[0];
                    if (edititem.GetDataKeyValue("isShared").ToString() == "YES")
                    {
                        txtbx.Enabled = false;
                    }
                }
            }
        }
        protected void RadGrid1_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem editedItem = e.Item as GridEditableItem;
                string id = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["id"]);

                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, "Select Count(ID) From Project Where Location_ID=" + id, null);
                if (dr.Read())
                {
                    if (Convert.ToInt16(dr[0].ToString()) > 0)
                    {
                        RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete the Location. This Location is in use."));
                    }
                    else
                    {
                        string sSQL = "DELETE FROM [Location] WHERE [id] =" + id;

                        int retVal = DataAccess.ExecuteStoreProc(sSQL);

                        if (retVal == 1)
                        {
                            RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Location is Deleted Successfully."));

                        }
                        else
                        {
                            RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete the Location."));
                        }

                    }
                }

            }
            catch (Exception ex)
            {
                string ErrMsg = ex.Message;
                if (ErrMsg.IndexOf("REFERENCE constraint", 1) > 0)
                    ErrMsg = "<font color = 'Red'>Record can not be deleted becuase of REFERENCE constraint. This record is called in other tables</font>";
                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete record. Reason:</font> " + ErrMsg));
                e.Canceled = true;
            }

        }
        protected void RadGrid1_ItemInserted(object source, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                string ErrMsg = e.Exception.Message;
                e.ExceptionHandled = true;
                if (e.Exception.Message.Contains("IX_LocName"))
                    ErrMsg = "Location already Exists";
                if (e.Exception.Message.Contains("Cannot insert the value NULL"))
                    ErrMsg = "Please Enter Location";
                DisplayMessage("<font color = 'red'>" + ErrMsg + ".</font>");
            }
            else
            {
                DisplayMessage("Location added successfully.");
            }
        }
        protected void RadGrid1_ItemUpdated(object source, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                string ErrMsg = e.Exception.Message;
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                if (e.Exception.Message.Contains("IX_LocName"))
                    ErrMsg = "Location already Exists";
                if (e.Exception.Message.Contains("Cannot insert the value NULL"))
                    ErrMsg = "Please Enter Location";
                DisplayMessage("<font color = 'red'>" + ErrMsg + ".</font>");
            }
            else
            {
                DisplayMessage("Location updated successfully.");
            }
        }
        private void DisplayMessage(string text)
        {
            RadGrid1.Controls.Add(new LiteralControl(text));
        }
    }
}

