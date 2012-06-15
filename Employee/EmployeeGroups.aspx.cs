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

namespace SMEPayroll
{
    public partial class Employee_Groups : System.Web.UI.Page
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
            /* To disable Grid filtering options  */
            GridFilterMenu menu = RadGrid1.FilterMenu;
            int i = 0;

            while (i < menu.Items.Count)
            {
                menu.Items.RemoveAt(i);
            }


            if (!IsPostBack)
            {
                //Method to Load grid Seting Persister
                LoadGridSettingsPersister();
            }
        }
        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            else
            {
                if ((Utility.AllowedAction1(Session["Username"].ToString(), "Manage Employee Groups")) == false)
                {
                    RadGrid1.MasterTableView.CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.None;
                    RadGrid1.MasterTableView.GetColumn("DeleteColumn").Visible = false;
                    RadGrid1.MasterTableView.GetColumn("EditColumn").Visible = false;
                }
            }
        }

        protected void RadGrid1_Delete(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem editedItem = e.Item as GridEditableItem;
                string EmpCode = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["id"]);
                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, "Select count(*) cnt from employee where emp_group_id=" + EmpCode, null);
                if (dr.Read())
                {
                    if (dr[0].ToString() != "0")
                    {
                        RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete the employee group.This employee group is in use in Employee Info."));
                    }
                    else
                    {
                        string sSQL = "DELETE FROM emp_group where id ={0}";
                        sSQL = string.Format(sSQL, EmpCode);
                        int i = DataAccess.ExecuteStoreProc(sSQL);
                    }
                }

            }
            catch (Exception ex)
            {
                string ErrMsg = ex.Message;
                if (ErrMsg.IndexOf("FK_leaves_allowed_leave_types", 1) > 0)
                {
                    RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>This record is in Use in Allowed Leaves.</font> "));
                }
                else
                {
                    RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete the employee group .This employee group is in use.</font> "));
                }
                e.Canceled = true;
            }
        }

     


        //Toolbar
        #region Toolbar and Exporting

        //column to hide wile export
        protected void HideGridColumnseExport()
        {
            RadGrid1.MasterTableView.GetColumn("TemplateColumn").Visible = false;
            RadGrid1.MasterTableView.GetColumn("EditColumn").Visible = false;
            RadGrid1.MasterTableView.GetColumn("DeleteColumn").Visible = false;// UniqueName="DeleteColumn"
        }

        protected void tbRecord_ButtonClick(object sender, Telerik.Web.UI.RadToolBarEventArgs e)
        {
            if (e.Item.Text == "Excel" || e.Item.Text == "Word")
            {
                HideGridColumnseExport();
            }

            GridSettingsPersister obj2 = new GridSettingsPersister();
            obj2.ToolbarButtonClick(e, RadGrid1, Utility.ToString(Session["Username"]));

        }

        protected void LoadGridSettingsPersister()//call directly from page load
        {
            GridSettingsPersister obj = new GridSettingsPersister();
            obj.GrabGridSettingsPersister(Utility.ToString(Session["Username"]), RadGrid1);
        }

        protected void RadGrid1_GridExporting(object source, GridExportingArgs e)
        {
            GridSettingsPersister obj1 = new GridSettingsPersister();
            obj1.ExportGridHeader("2", Session["CompanyName"].ToString(), Session["Emp_Name"].ToString(), e);

        }

        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {
            GridSettingsPersister objCount = new GridSettingsPersister();
            objCount.RowCount(e, tbRecord);
        }


        #endregion
        //Toolbar End


    }
}
