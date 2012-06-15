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
using Microsoft.VisualBasic;
using System.Drawing;
using System.Data.SqlClient;
namespace SMEPayroll.employee
{
    public partial class EmployeYearEarn : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        protected string strstdatemdy ="";
        protected string strendatemdy = "";
        protected string strstdatedmy = "";
        protected string strendatedmy = "";
        int intcnt;
        int comp_id;
        string sSQL = "";
        string ssqle = "";
        string sql = null;
        DataSet monthDs;
        DataRow[] foundRows;
        DataTable dtFilterFound;


        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {
            GridCommandItem item = e.Item as GridCommandItem;
            if (item != null)
            {
                Button btn = item.FindControl("btnsubmit") as Button;
                btn.Attributes.Add("onclick", "javascript:return validateform();");
                lblMessage.Visible = true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            /* To disable Grid filtering options  */

            SqlDataSource1.ConnectionString = Session["ConString"].ToString();
            lblerror.Text = "";
            comp_id = Utility.ToInteger(Session["Compid"]);
            
            if (!IsPostBack)
            {
                cmbYear.SelectedValue = Utility.ToString(System.DateTime.Today.Year);
            }


            //Insert default value for each employee to reflect here
            #region Insert default value for each employee to reflect here
                string ssqlb = "sp_InsertBlankRecord_EmployeeEarning";
                SqlParameter[] parms5 = new SqlParameter[1];
                parms5[0] = new SqlParameter("@year", Convert.ToInt32(System.DateTime.Now.Year));
                DataAccess.FetchRS(CommandType.StoredProcedure, ssqlb, parms5);
            #endregion
            //

        }
        protected void bindgrid(object sender, ImageClickEventArgs e)
        {
            intcnt = 1;
            cmbYear.Enabled = false;
            RadGrid1.DataBind();
        }
        protected void cmbYear_selectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void Radgrid1_databound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
        }

        protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {

            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            if (e.Item is GridCommandItem)
            {
                GridCommandItem commandItem = (GridCommandItem)e.Item;                
                ((Button)commandItem.FindControl("btnsubmit")).Enabled = false;
                string stryear = cmbYear.SelectedItem.Value;
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
                                string id = Utility.ToString(RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("ID"));
                                string Emp_ID = Utility.ToString(RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("Emp_ID"));

                                TextBox txtGrossPay = (TextBox)dataItem.FindControl("txtGrossPay");
                                TextBox txtBonus = (TextBox)dataItem.FindControl("txtBonus");
                                TextBox txtDirectorFee = (TextBox)dataItem.FindControl("txtDirectorFee");
                                TextBox txtCommission = (TextBox)dataItem.FindControl("txtCommission");
                                TextBox txtPension = (TextBox)dataItem.FindControl("txtPension");
                                TextBox txtTransAllow = (TextBox)dataItem.FindControl("txtTransAllow");
                                TextBox txtEntAllow = (TextBox)dataItem.FindControl("txtEntAllow");
                                TextBox txtOtherAllow = (TextBox)dataItem.FindControl("txtOtherAllow");
                                TextBox txtEmployeeCPF = (TextBox)dataItem.FindControl("txtEmployeeCPF");
                                TextBox txtFunds = (TextBox)dataItem.FindControl("txtFunds");
                                TextBox txtMBMF = (TextBox)dataItem.FindControl("txtMBMF");


                                double dbltxtGrossPay = Utility.ToDouble(txtGrossPay.Text);
                                double dbltxtBonus = Utility.ToDouble(txtBonus.Text);
                                double dbltxtDirectorFee = Utility.ToDouble(txtDirectorFee.Text);
                                double dbltxtCommission = Utility.ToDouble(txtCommission.Text);
                                double dbltxtPension = Utility.ToDouble(txtPension.Text);
                                double dbltxtTransAllow = Utility.ToDouble(txtTransAllow.Text);
                                double dbltxtEntAllow = Utility.ToDouble(txtEntAllow.Text);
                                double dbltxtOtherAllow = Utility.ToDouble(txtOtherAllow.Text);
                                double dbltxtEmployeeCPF = Utility.ToDouble(txtEmployeeCPF.Text);
                                double dbltxtFunds = Utility.ToDouble(txtFunds.Text);
                                double dbltxtMBMF = Utility.ToDouble(txtMBMF.Text);

                                sSQL = "";
                                if ((id == "") && ((dbltxtGrossPay >= 0) || (dbltxtBonus >= 0) || (dbltxtDirectorFee >= 0) || (dbltxtCommission >= 0) || (dbltxtPension >= 0) || (dbltxtTransAllow >= 0) || (dbltxtEntAllow >= 0) || (dbltxtOtherAllow >= 0) || (dbltxtEmployeeCPF >= 0) || (dbltxtFunds >= 0) || (dbltxtMBMF >= 0)))
                                {
                                    sSQL = "Insert into EmployeeEarning (Emp_ID,IRYear,GrossPay,Bonus,DirectorFee,Commission,Pension,TransAllow,EntAllow,OtherAllow,EmployeeCPF,Funds,MBMF) values(" + Emp_ID + ",'" + stryear + "'," + dbltxtGrossPay + "," + dbltxtBonus + "," + dbltxtDirectorFee + "," + dbltxtCommission + "," + dbltxtPension + "," + dbltxtTransAllow + "," + dbltxtEntAllow + "," + dbltxtOtherAllow + "," + dbltxtEmployeeCPF + "," + dbltxtFunds + "," + dbltxtMBMF + ")";
                                }
                                else if ((id != ""))
                                {
                                    sSQL = "Update EmployeeEarning Set GrossPay=" + dbltxtGrossPay + ",Bonus=" + dbltxtBonus + ",DirectorFee=" + dbltxtDirectorFee + ",Commission=" + dbltxtCommission + ",Pension=" + dbltxtPension + ",TransAllow=" + dbltxtTransAllow + ",EntAllow=" + dbltxtEntAllow + ",OtherAllow=" + dbltxtOtherAllow + ",EmployeeCPF=" + dbltxtEmployeeCPF + ",Funds=" + dbltxtFunds + ",MBMF=" + dbltxtMBMF + " Where ID =" + id;
                                }
                                try
                                {
                                    if (sSQL != "")
                                        DataAccess.ExecuteStoreProc(sSQL);
                                }
                                catch (Exception msg)
                                {
                                    lblerror.Text = msg.Message.ToString();                                }
                            }
                        }
                    }

                    RadGrid1.DataBind();
                }
                ((Button)commandItem.FindControl("btnsubmit")).Enabled = true;
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
        }


    }
}
