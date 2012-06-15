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
using Telerik.Web.UI;
namespace SMEPayroll.Leaves
{
    public partial class PublicHolidays : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        int compid;
        string flag = "false";

  
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.LCID = 2057;
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            compid = Utility.ToInteger(Session["Compid"]);
            SqlDataSource1.ConnectionString = Session["ConString"].ToString();
            if(!IsPostBack)
            {
                cmbYear.SelectedValue = System.DateTime.Now.Year.ToString();                
            }
            lblHlist.InnerHtml = "Download Holiday List for Year:" + DateTime.Today.Year.ToString();
            CmdUpload.Attributes.Add("onclick","toggleDiv('divContent', 'img1')");
            if (flag == "false")
            {
                lblMsg.Text = "";
            }
        }
        protected void RadGrid1_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            int i;
            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
            object id = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["ID"];
            string id1 = id.ToString();
            string holidaydate = (userControl.FindControl("RadDatePicker1") as Telerik.WebControls.RadDatePicker).DbSelectedDate.ToString();
            string holidayname = (userControl.FindControl("txtpublicholiname") as TextBox).Text;
            string sSQL = "update public_holidays set holiday_date=convert(datetime,'" + holidaydate + "',103) , holiday_name='" + holidayname + "' where id=" + id1 + " ";

            i = DataAccess.ExecuteStoreProc(sSQL);
            if (i == 1)
            {
                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>User record has been updated."));
            }

            
        }

        protected void RadGrid1_InsertCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            compid = Utility.ToInteger(Session["Compid"]);
            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
            string holidaydate = (userControl.FindControl("RadDatePicker1") as Telerik.WebControls.RadDatePicker).DbSelectedDate.ToString();
            string holidayname = (userControl.FindControl("txtpublicholiname") as TextBox).Text;
            string sSQL = "Insert into public_holidays (holiday_date,holiday_name,companyid) values(convert(datetime,'" + holidaydate + "',103),'" + holidayname + "'," + compid + ")";

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

        protected void RadGrid1_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem editedItem = e.Item as GridEditableItem;
                
                UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
                object id = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["ID"];
                string sSQL = "DELETE FROM public_holidays where ID = {0} ";
                sSQL = string.Format(sSQL, id);
                int i = DataAccess.ExecuteStoreProc(sSQL);
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
        protected void bindgrid(object sender, ImageClickEventArgs e)
        {

            RadGrid1.DataBind();
        }

        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs  e)
        {
            if (e.Item is GridDataItem)
            {
                if ((Utility.AllowedAction1(Session["Username"].ToString(), "Manage Public Holidays")) == false)
                {
                    RadGrid1.MasterTableView.CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.None;
                    RadGrid1.MasterTableView.GetColumn("Deletecolumn").Visible = false;
                    RadGrid1.MasterTableView.GetColumn("Editcolumn").Visible = false;
                }
                else
                {
                    GridDataItem dataItem = e.Item as GridDataItem;
                    string company = dataItem["companyid"].Text;
                    string enddateday = dataItem["holiday_date"].Text.Substring(0, 2);
                    string enddatemonth = dataItem["holiday_date"].Text.Substring(3, 2);
                    string enddateyear = dataItem["holiday_date"].Text.Substring(6, 4);

                    if (Utility.ToInteger(enddateyear) < System.DateTime.Now.Year)
                    {
                        dataItem["DeleteColumn"].Visible = false;
                        dataItem["Editcolumn"].Visible = false;
                    }
                    else if (Utility.ToInteger(enddatemonth) < System.DateTime.Now.Month && Utility.ToInteger(enddateyear) == System.DateTime.Now.Year)
                    {
                        dataItem["DeleteColumn"].Visible = false;
                        dataItem["Editcolumn"].Visible = false;
                    }
                    else if (Utility.ToInteger(enddateday) < System.DateTime.Now.Day && Utility.ToInteger(enddateyear) == System.DateTime.Now.Year && Utility.ToInteger(enddatemonth) == System.DateTime.Now.Month)
                    {
                        dataItem["DeleteColumn"].Visible = false;
                        dataItem["Editcolumn"].Visible = false;
                    }
                    else
                    {
                        dataItem["Deletecolumn"].Visible = true;
                        dataItem["Editcolumn"].Visible = true;
                    }
                }
            }
        }

        protected void CmdUpload_Click(object sender, EventArgs e)
        {
            //CREATE PROCEDURE [dbo].[sp_BulkInsert_Holidays]
            //(
            //    @filePath VARCHAR(1000),  		
            //    @compid   INT	
            //)
            string strMsg = "";
            
            if (FileUpload.PostedFile != null) //Checking for valid file
            {
                // Since the PostedFile.FileNameFileName gives the entire path we use Substring function to rip of the filename alone.
                string StrFileName = FileUpload.PostedFile.FileName.Substring(FileUpload.PostedFile.FileName.LastIndexOf("\\") + 1);
                string strorifilename = StrFileName;
                string StrFileType = FileUpload.PostedFile.ContentType;
                int IntFileSize = FileUpload.PostedFile.ContentLength;
                //Checking for the length of the file. If length is 0 then file is not uploaded.
                if (IntFileSize <= 0)
                    strMsg = "Please Select File to be uploaded";
                else
                {
                    int RandomNumber = 0;
                    RandomNumber = Utility.GetRandomNumberInRange(10000, 1000000);

                    string strTranID = Convert.ToString(RandomNumber);
                    string[] FileExt = StrFileName.Split('.');
                    string strExtent = "." + FileExt[FileExt.Length - 1];
                    StrFileName = FileExt[0] + strTranID;
                    string stfilepath = Server.MapPath(@"..\\Documents\\UploadEmployee\" + StrFileName + strExtent);
                    try
                    {
                        FileUpload.PostedFile.SaveAs(stfilepath);
                        SqlParameter[] parms = new SqlParameter[2];
                        parms[0] = new SqlParameter("@filePath", stfilepath);
                        parms[1] = new SqlParameter("@compid", compid);
                        string sSQL = "sp_BulkInsert_Holidays";
                        int retVal = DataAccess.ExecuteStoreProc(sSQL, parms);
                        if (retVal >= 1)
                        {
                            strMsg = "File Uploaded Succesfully ";
                            //bindgrid(0);
                            //empResults.Rebind();
                            RadGrid1.Rebind();
                            
                        }
                    }
                    catch (Exception ex)
                    {
                        strMsg = ex.Message;
                    }
                    lblMsg.Text = strMsg;
                    flag = "True";
                }
            }
        }
    }
}
