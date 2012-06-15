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

namespace SMEPayroll.Invoice
{

    public partial class PaymentTerms : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        protected int compID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            compID = Utility.ToInteger(Session["Compid"]);
       
            SqlDataSource2.ConnectionString = Session["ConString"].ToString();
            SqlDataSource_VarPref.ConnectionString = Session["ConString"].ToString();
        
        }


        #region Grid2-preference


        protected void RadGrid2_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem editedItem = e.Item as GridEditableItem;
                string id = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["Ip"]);

                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, "Select count(*) cnt from invoice_info where PaymentTerms='" + id + "' AND Company_Id='" + compID + "'", null);
                if (dr.Read())
                {
                    if (dr[0].ToString() != "0")
                    {
                        RadGrid2.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete .Payment Terms Trade is in use."));
                    }
                    else
                    {
                        string sSQL = "DELETE FROM [PaymentTerms] WHERE [ip] ='" + id + "'";

                        int retVal = DataAccess.ExecuteStoreProc(sSQL);

                        if (retVal == 1)
                        {
                            RadGrid2.Controls.Add(new LiteralControl("<font color = 'Red'>Deleted Successfully."));

                        }
                        else
                        {
                            RadGrid2.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete."));
                        }

                    }
                }

            }
            catch (Exception ex)
            {
                string ErrMsg = ex.Message;
                if (ErrMsg.IndexOf("REFERENCE constraint", 1) > 0)
                    ErrMsg = "<font color = 'Red'>Record can not be deleted becuase of REFERENCE constraint. This record is called in other tables</font>";
                RadGrid2.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete record. Reason:</font> " + ErrMsg));
                e.Canceled = true;
            }
        }
        protected void RadGrid2_ItemInserted(object source, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                if (e.Exception.Message.Contains("Violation of PRIMARY KEY"))
                    DisplayMessage("<font color = 'red'> Trade can not be added. Reason: Trade already Exists.</font>");
                else
                    DisplayMessage("<font color = 'red'> Trade can not be added. Reason: " + e.Exception.Message + "</font>");
            }
            else
            {
                DisplayMessage("Trade added successfully.");
            }
        }
        protected void RadGrid2_ItemUpdated(object source, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                if (e.Exception.Message.Contains("Violation of PRIMARY KEY"))
                    DisplayMessage("<font color = 'red'> Trade can not be updated. Reason: Trade already Exists.</font>");
                else
                    DisplayMessage("<font color = 'red'> Trade can not be updated. Reason: " + e.Exception.Message + "</font>");
            }
            else
            {
                DisplayMessage("Trade updated successfully.");
            }
        }
        private void DisplayMessage(string text)
        {
            RadGrid2.Controls.Add(new LiteralControl(text));
        }


        #endregion
    }

 
}
