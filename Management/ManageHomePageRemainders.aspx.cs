using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using System.Text;
using System.Data.SqlClient;

namespace SMEPayroll.Management
{
    public partial class ManageHomePageRemainders : System.Web.UI.Page
    {
        int compid;
        protected void Page_Load(object sender, EventArgs e)
        {
            compid = Utility.ToInteger(Session["Compid"]);
            if (!IsPostBack)
            {
                BindGrid();
            }

            RadGrid1.ItemCommand += new GridCommandEventHandler(RadGrid1_ItemCommand);
        }


        private void BindGrid()
        {
           // string sqlup = @"select distinct  Category_Name,ID,ColID,[Days] from CertificateCategory  CC left join Home_Remainder HR on cc.ID=HR.CertificateCategoryID Where HR.CompanyId='" + compid + "' OR (CC.Company_Id='-1' or CC.Company_Id='" + compid + "') order by ColID";
            string sqlup = @"select   Category_Name,ID,ColID,[Days] from CertificateCategory  CC left  join (select * from Home_Remainder where companyid='" + compid + "') HR on cc.ID=HR.CertificateCategoryID Where CC.Company_Id='-1' or HR.CompanyId='" + compid + "' ";
            DataSet ds_ExportGrid = new DataSet();
            ds_ExportGrid = GetDataSet(sqlup);
            RadGrid1.DataSource = ds_ExportGrid;
            RadGrid1.DataBind();
        }


        private static DataSet GetDataSet(string query)
        {
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, query, null);
            return ds;
        }


        protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.Item is GridCommandItem)
            {
                GridCommandItem commandItem = (GridCommandItem)e.Item;
                if (e.CommandName == "UpdateAll")
                {
                    foreach (GridItem item in RadGrid1.MasterTableView.Items)
                    {
                        if (item is GridItem)
                        {
                            GridDataItem dataItem = (GridDataItem)item;
                            CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                            if (chkBox.Checked == true)
                            {
                                string ColID = Utility.ToString(RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("ID"));
                                TextBox RemainderDays = (TextBox)dataItem.FindControl("txtReminDays");

                                string sSQLUser_Grid_Page1 = "select * from dbo.Home_Remainder where companyId='" + compid + "' and CertificateCategoryID='" + ColID + "'";
                                      SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.Text, sSQLUser_Grid_Page1, null);
                                        if (dr1.HasRows)
                                        {

                                            string ssqlb = "UPDATE [Home_Remainder] SET [CompanyId]='" + compid + "'  ,[Days] ='" + RemainderDays.Text + "'  WHERE CertificateCategoryID='" + ColID + "'";
                                            DataAccess.FetchRS(CommandType.Text, ssqlb, null);
                                        }
                                        else
                                        {
                                            //insert
                                            string sqlInsert = "INSERT INTO [Home_Remainder]([CompanyId],[CertificateCategoryID],[Days])     VALUES('" + compid + "','" + ColID + "','" + RemainderDays.Text + "')";
                                            DataAccess.FetchRS(CommandType.Text, sqlInsert, null);
                                        }

                            }
                        }
                    }
                    ShowMessageBox("Updated Sucessfully");
                }
            }
        }


        public static void ShowMessageBox(string message)
        {
            if (!string.IsNullOrEmpty(message))
            {
                if (message.EndsWith("."))
                    message = message.Substring(0, message.Length - 1);
            }
            StringBuilder sbScript = new StringBuilder(50);
            //Java Script header            
            sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
            sbScript.Append("// Show messagebox" + Environment.NewLine);
            message = message.Replace("<br/>", "\\n").Replace("\"", "'");
            sbScript.Append(@"alert( """ + message + @""" );");
            sbScript.Append(@"</script>");
            HttpContext.Current.Response.Write(sbScript);
        }
       
    }
}