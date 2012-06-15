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
using System.Data.Sql;

namespace SMEPayroll.Management
{
    public partial class deduction_edit : System.Web.UI.UserControl
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        private object _dataItem = null;
        int compid;

        protected void Page_Load(object sender, EventArgs e)
        {
            compid = Utility.ToInteger(Session["Compid"]);

            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            object company_id = DataBinder.Eval(DataItem, "company_id");
            if (Utility.ToString(company_id) == "-1")
            {
                txtaddtype.Enabled = false;
                drpcpf.Enabled = false;
                drpShared.Enabled = false;
            }

            if (compid == 1)
            {
                if (HttpContext.Current.Session["GroupName"].ToString().ToUpper() == "SUPER ADMIN")
                {
                }
                else
                {
                    lblShared.Visible = false;
                    drpShared.Visible = false;
                }
            }
            else
            {
                lblShared.Visible = false;
                drpShared.Visible = false;
                //drpShared.Attributes.Add("display", "block");
            }

        }


        public object DataItem
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

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            this.DataBinding += new EventHandler(deduction_DataBinding);
        }

        void deduction_DataBinding(object sender, EventArgs e)
        {

            txtaddtype.Enabled = true;
            drpcpf.Enabled = true;

            object addcpf = DataBinder.Eval(DataItem, "cpf");
            if (addcpf != DBNull.Value)
            {
                drpcpf.SelectedValue = addcpf.ToString().Trim();
            }

            object typeshared = DataBinder.Eval(DataItem, "isShared");
            if (typeshared != DBNull.Value)
            {
                drpShared.SelectedValue = Utility.ToString(typeshared.ToString());
                drpShared.Enabled = true;

                if (drpShared.SelectedValue.ToString().ToUpper()  == "YES")
                {
                    if (DataBinder.Eval(DataItem, "id") != DBNull.Value)
                    {
                        string ssqlopt = "select Count(trx_id) Cnt from emp_deductions where (status='L' OR status='U')";
                        DataSet ds = new DataSet();
                        ds = DataAccess.FetchRS(CommandType.Text, ssqlopt, null);
                        if (Utility.ToInteger(ds.Tables[0].Rows[0][0].ToString()) > 0)
                        {
                            drpShared.Enabled = false;
                        }
                    }
                }
            }


            //
            object FormulaSel = DataBinder.Eval(DataItem, "Formula");
            if (FormulaSel != DBNull.Value)
            {
                drpfor.SelectedValue = FormulaSel.ToString().Trim();
            }

            object FormulaVal = DataBinder.Eval(DataItem, "FormulaValue");
            if (FormulaVal != DBNull.Value)
            {
                if (FormulaSel.ToString() == "0")
                {
                    txtFormulaCalc.Visible = false;
                }
                else
                {
                    txtFormulaCalc.Visible = true;
                }
                txtFormulaCalc.Text = FormulaVal.ToString().Trim();
            }
            //

        }
        protected void drpcpf_SelectedIndexChanged(object sender, EventArgs e)
        {
        }


        protected override void OnPreRender(EventArgs e)
        {
        }

        protected void drpfor_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtFormulaCalc.Text = "";
            if (drpfor.SelectedValue == "0")
            {
                txtFormulaCalc.Visible = false;
            }
            else
            {
                txtFormulaCalc.Visible = true;
           
            }

        }


    }
}