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
    public partial class ManageDepartment : System.Web.UI.Page
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
            RadGrid1.ItemCreated += new GridItemEventHandler(RadGrid1_ItemCreated);
        }

        void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {
                GridEditableItem item = e.Item as GridEditableItem;
                GridTextBoxColumnEditor department_name = (GridTextBoxColumnEditor)item.EditManager.GetColumnEditor("DeptName");
                department_name.TextBoxControl.Attributes.Add("onblur", "OnFocusLost_DepartmentName('" + department_name.TextBoxControl.ClientID + "')");
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ShowDropdowns.aspx");
        }
        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if ((Utility.AllowedAction1(Session["Username"].ToString(), "Manage Departments")) == false)
            {
                RadGrid1.MasterTableView.CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.None;
                RadGrid1.MasterTableView.GetColumn("DeleteColumn").Visible = false;
                RadGrid1.MasterTableView.GetColumn("EditColumn").Visible = false;
            }
        }


        protected void RadGrid1_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem editedItem = e.Item as GridEditableItem;
                string id = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["id"]);

                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, "Select count(*) cnt from employee where dept_id=" + id, null);
                if (dr.Read())
                {
                    if (dr[0].ToString() != "0")
                    {
                        RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete the department.This department is in use."));
                    }
                    else
                    {
                        string sSQL = "DELETE FROM [department] WHERE [id] =" + id;

                        int retVal = DataAccess.ExecuteStoreProc(sSQL);

                        if (retVal == 1)
                        {
                            RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Department is Deleted Successfully."));

                        }
                        else
                        {
                            RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete the department."));
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
                e.ExceptionHandled = true;
                if(e.Exception.Message.Contains("Violation of PRIMARY KEY"))
                    DisplayMessage("<font color = 'red'> Department can not be added. Reason: Department already Exists.</font>");
                else
                    DisplayMessage("<font color = 'red'> Department can not be added. Reason: " + e.Exception.Message + "</font>");
            }
            else
            {
                DisplayMessage("Department added successfully.");
            }
        }
        protected void RadGrid1_ItemUpdated(object source, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                if (e.Exception.Message.Contains("Violation of PRIMARY KEY"))
                    DisplayMessage("<font color = 'red'> Department can not be updated. Reason: Department already Exists.</font>");
                else
                    DisplayMessage("<font color = 'red'> Department can not be updated. Reason: " + e.Exception.Message + "</font>");
            }
            else
            {
                DisplayMessage("Department updated successfully.");
            }
        }
        private void DisplayMessage(string text)
        {            
            RadGrid1.Controls.Add(new LiteralControl(text));
        }
    }
}
