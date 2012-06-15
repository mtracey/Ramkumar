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
using Telerik.WebControls;
using System.Data.SqlClient;

namespace SMEPayroll.Management
{
    public partial class Courses : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;

        int compID;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            compID = Utility.ToInteger(Session["Compid"]);
            SqlDataSource1.ConnectionString = Session["ConString"].ToString();

        }
        protected void RadGrid1_ItemDataBound(object sender, Telerik.WebControls.GridItemEventArgs e)
        {
            if ((Utility.AllowedAction1(Session["Username"].ToString(), "Manage Course Types")) == false)
            {
                RadGrid1.MasterTableView.CommandItemDisplay = Telerik.WebControls.GridCommandItemDisplay.None;
                RadGrid1.MasterTableView.GetColumn("DeleteColumn").Visible = false;
                RadGrid1.MasterTableView.GetColumn("EditColumn").Visible = false;
            }
        }

        protected void RadGrid1_DeleteCommand(object source, Telerik.WebControls.GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem editedItem = e.Item as GridEditableItem;
                string id = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["id"]);

                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, "Select count(*) cnt from training_details where courseid=" + id, null);
                if (dr.Read())
                {
                    if (dr[0].ToString() != "0")
                    {
                        RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete the course type.This course type is in use."));
                    }
                    else
                    {
                        string sSQL = "DELETE FROM [course] WHERE [id] ="+id;

                        int retVal = DataAccess.ExecuteStoreProc(sSQL);

                        if (retVal == 1)
                        {
                            RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Course type is Deleted Successfully."));

                        }
                        else
                        {
                            RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete the course type."));
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
                if (e.Exception.Message.Contains("Violation of UNIQUE KEY"))
                    ErrMsg = "Course already Exists";
                if (e.Exception.Message.Contains("Cannot insert the value NULL"))
                    ErrMsg = "Please Enter Course, Empty Course can not be added";
                DisplayMessage("<font color = 'red'> Course can not be added. Reason: " + ErrMsg + ".</font>");
            }
            else
            {
                DisplayMessage("Course added successfully.");
            }
        }
        protected void RadGrid1_ItemUpdated(object source, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                string ErrMsg = e.Exception.Message;
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                if (e.Exception.Message.Contains("Violation of UNIQUE KEY"))
                    ErrMsg = "Course already Exists";
                if (e.Exception.Message.Contains("Cannot insert the value NULL"))
                    ErrMsg = "Please Enter Course, Empty Course can not be updated";
                DisplayMessage("<font color = 'red'> Course can not be updated. Reason: " + ErrMsg + ".</font>");
            }
            else
            {
                DisplayMessage("Course updated successfully.");
            }
        }
        private void DisplayMessage(string text)
        {
            RadGrid1.Controls.Add(new LiteralControl(text));
        }

    }
}
