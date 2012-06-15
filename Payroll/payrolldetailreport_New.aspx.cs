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
using System.Text;
using System.IO;

namespace SMEPayroll.Payroll
{
    public partial class payrolldetailreport_New : System.Web.UI.Page
    {
        public string month, year, CompanyID;
        public int Month, Year;

        int compid;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            compid = Utility.ToInteger(Session["Compid"]);
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            month = Request.QueryString["month"].ToString();
            year = Request.QueryString["year"].ToString();  
            CompanyID = Utility.ToString(Session["Compid"]);
            Month = Convert.ToInt32(Request.QueryString["Month"]);
            Year = Convert.ToInt32(Request.QueryString["Year"]);
             



            if (!IsPostBack)
            {
                BindData();
            }

            
        }

        private void BindData()
        {
            string CompanyID = Utility.ToString(Session["Compid"]);
            int Month = Convert.ToInt32(Request.QueryString["Month"]);
            int Year = Convert.ToInt32(Request.QueryString["Year"]);

            string EmpPassID = "";

            if (Session["EmpPassID"] != null)
            {
                EmpPassID = Convert.ToString(Session["EmpPassID"]);
            }
            else
            {
                EmpPassID = "";
            }


            int i = 0;
            string sSQL = "Sp_generatepayrolladv_AddDet1";
            string sSQLextData = "";
            SqlParameter[] parms = new SqlParameter[10];
            parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(CompanyID));
            parms[i++] = new SqlParameter("@month", Utility.ToInteger(Month));
            parms[i++] = new SqlParameter("@year", Utility.ToInteger(Year));
            parms[i++] = new SqlParameter("@stdatemonth", Request.QueryString["stdatemonth"]);
            parms[i++] = new SqlParameter("@endatemonth", Request.QueryString["endatemonth"]);
            parms[i++] = new SqlParameter("@stdatesubmonth", Request.QueryString["stdatesubmonth"]);
            parms[i++] = new SqlParameter("@endatesubmonth", Request.QueryString["endatesubmonth"]);
            parms[i++] = new SqlParameter("@UserID", Utility.ToInteger(Session["EmpCode"].ToString()));
            //parms[i++] = new SqlParameter("@EmpPassID", "");
            if (EmpPassID == "")
            {
                parms[i++] = new SqlParameter("@EmpPassID", "");
            }
            else
            {
                parms[i++] = new SqlParameter("@EmpPassID", EmpPassID);
            }


            parms[i++] = new SqlParameter("@monthidintbl", Request.QueryString["monthidintbl"]);
            // SqlDataReader dr = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQL, parms);
            DataSet ds = new DataSet();
            ds = DataAccess.ExecuteSPDataSet(sSQL, parms);

            gridPayDetailReport.DataSource = ds;
            gridPayDetailReport.DataBind();
            
           
            
        }


        protected void gridPayDetailReport_DataBound(object sender, EventArgs e)
        {
            if (gridPayDetailReport.Rows.Count > 0)
            {
                int TotalRows = gridPayDetailReport.Rows.Count;
                int TotalCol = gridPayDetailReport.Rows[0].Cells.Count;
                int FixedCol = 2;
                int ComputedCol = TotalCol - FixedCol;

                gridPayDetailReport.FooterRow.Cells[FixedCol - 1].Text = "Total : ";

                for (int i = FixedCol; i < TotalCol; i++)
                {
                    double sum = 0.000;

                    for (int j = 0; j < TotalRows; j++)
                    {
                        sum += gridPayDetailReport.Rows[j].Cells[i].Text != "&nbsp;" ? double.Parse(gridPayDetailReport.Rows[j].Cells[i].Text) : 0.000;
                    }

                    gridPayDetailReport.FooterRow.Cells[i].Text = sum.ToString("#.00");
                }
            }
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            string attachment = "attachment; filename=PayrollDetails.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gridPayDetailReport.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            //confirms that an HtmlForm control is rendered for the
            //specified ASP.NET server control at run time.
        }


    }
}