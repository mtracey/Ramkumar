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
    public partial class addition_edit : System.Web.UI.UserControl
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


            if (this.Parent.Parent.Parent.Parent.Parent.Parent.Parent.ToString() == "System.Web.UI.HtmlControls.HtmlForm")
            {
                ((HtmlInputHidden)this.Parent.Parent.Parent.Parent.Parent.Parent.Parent.FindControl("txtRadId")).Value = this.ClientID;
            }
            if (this.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.ToString() == "System.Web.UI.HtmlControls.HtmlForm")
            {
                ((HtmlInputHidden)this.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.FindControl("txtRadId")).Value = this.ClientID;
            }
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            object company_id = DataBinder.Eval(DataItem, "company_id");
            if (Utility.ToString(company_id) == "-1")
            {
                txtaddtype.Enabled = false;
                drpcpf.Enabled = false;
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

            drptax_payable.Attributes.Add("OnChange", "EnablePayable();");
           
        }

        public void rbllist_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbllist.SelectedValue == "Claim")
            {
                CappingTr.Visible = true;
            }
            else
            {
                CappingTr.Visible = false;
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
            this.DataBinding += new EventHandler(addition_DataBinding);
        }

        void addition_DataBinding(object sender, EventArgs e)
        {

            txtaddtype.Enabled = true;
            drpcpf.Enabled = true;
            drpWage.Enabled = true;

            object addcpf = DataBinder.Eval(DataItem, "cpf");
            if (addcpf != DBNull.Value)
            {
                object strtxttypename = DataBinder.Eval(DataItem, "desc");

                if (strtxttypename != DBNull.Value)
                {
                    string ssqlopt = "select trx_type from emp_additions where status='L' and trx_type=(select id from additions_types where Replace ([desc],'''' ,'')='" + strtxttypename.ToString().Trim() + "' and company_id='" + compid + "')";
                    DataSet ds = new DataSet();
                    ds = DataAccess.FetchRS(CommandType.Text, ssqlopt, null);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        txtaddtype.Enabled = false;
                        drpcpf.Enabled = false;
                        drpWage.Enabled = false;
                    }
                }

                drpcpf.SelectedValue = addcpf.ToString().Trim();
            }

            object typeofwage = DataBinder.Eval(DataItem, "typeofwage");
            if (typeofwage != DBNull.Value)
            {
                drpWage.SelectedValue = typeofwage.ToString().Trim();
            }

            object typeshared = DataBinder.Eval(DataItem, "isShared");
            if (typeshared != DBNull.Value)
            {
                drpShared.SelectedValue = Utility.ToString(typeshared.ToString());
                drpShared.Enabled = true;

                if (drpShared.SelectedValue.ToString().ToUpper() == "YES")
                {
                    if (DataBinder.Eval(DataItem, "id") != DBNull.Value)
                    {
                        string ssqlopt = "select Count(trx_id) Cnt from emp_additions where (status='L' OR status='U') and ClaimStatus != 'Rejected'";
                        DataSet ds = new DataSet();
                        ds = DataAccess.FetchRS(CommandType.Text, ssqlopt, null);
                        if (Utility.ToInteger(ds.Tables[0].Rows[0][0].ToString()) > 0)
                        {
                            drpShared.Enabled = false;
                        }
                    }
                }
            }


            object tax_payable = DataBinder.Eval(DataItem, "tax_payable");
            object tax_payable_options = DataBinder.Eval(DataItem, "tax_payable_options");

            if (tax_payable != DBNull.Value)
            {
                drptax_payable.SelectedValue = Utility.ToString(tax_payable.ToString());

                if (tax_payable.ToString().ToUpper() == "YES")
                {
                    tr1.Attributes.Add("style", "display:block");
                }
                else
                {
                    tr1.Attributes.Add("style", "display:none");
                }

            }
            else
            {
                tr1.Attributes.Add("style", "display:none");
            }

            if (tax_payable_options != DBNull.Value)
            {
                string strtax_payable_options = ((DropDownList)this.Parent.Parent.Parent.Parent.Parent.Parent.Parent.FindControl("drplumsumswitch")).SelectedItem.Text;
                if (Convert.ToString(tax_payable_options) == "0")
                {
                    drptax_payable_options.SelectedIndex = 0;
                }
                else
                {
                    drptax_payable_options.SelectedValue = Convert.ToString(tax_payable_options);
                }
            }

            object objCode = DataBinder.Eval(DataItem, "code");
            if (objCode == DBNull.Value)
            {
                rbllist.Enabled = true;
                drpfor.Visible = false;
                lblFormula.Visible = false;
                trFormula.Visible = false;
                txtCode.Visible = false;
                lblVariable.Visible = false;
                rbllist.Items.RemoveAt(2) ;
                
            }
            else
            {
                if (objCode.ToString().Trim() == "Variable")
                {
                    lblShared.Visible = false;
                    drpShared.Visible = false;

                    drpfor.Visible = true;
                    lblFormula.Visible = true;
                    trFormula.Visible = true;
                    txtCode.Visible = true;
                    lblVariable.Visible = true;
                    rbllist.Enabled = false;
                }
                else
                {
                    lblShared.Visible = false;
                    drpShared.Visible = false;

                    rbllist.Enabled = true;
                    drpfor.Visible = false;
                    lblFormula.Visible = false;
                    trFormula.Visible = false;
                    txtCode.Visible = false;
                    lblVariable.Visible = false;
                }
            }

        }
        protected void drpcpf_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpcpf.SelectedItem.Value.ToString().ToUpper() == "YES")
            {
                lblTypeOfAddition.Visible = true;
                drpWage.Visible = true;
            }
            if (drpcpf.SelectedItem.Value.ToString().ToUpper() == "NO" || drpcpf.SelectedItem.Value.ToString().ToUpper() == "NO")
            {
                lblTypeOfAddition.Visible = false;
                drpWage.Visible = false;
            }
        }

        protected void rbllist_DataBound(object sender, EventArgs e)
        {
            object optionselection = DataBinder.Eval(DataItem, "optionselection");
            object strformulatype = DataBinder.Eval(DataItem, "formulatype");
            object strformulacalc = DataBinder.Eval(DataItem, "formulacalc");

            if ((optionselection != DBNull.Value) && (optionselection != null))
            {
                rbllist.SelectedValue = optionselection.ToString();
                if (optionselection.ToString().Trim() == "Variable")
                {
                    drpfor.Visible = true;
                    lblFormula.Visible = true;
                    trFormula.Visible = true;
                    txtCode.Visible = true;
                    lblVariable.Visible = true;
                    rbllist.Items[0].Enabled = false;
                    rbllist.Items[1].Enabled = false;
                    rbllist.Items[2].Enabled = false;
                    if ((strformulatype != DBNull.Value) && (strformulatype != null))
                    {
                        if (strformulatype.ToString() == "0")
                        {
                            lblFormulaCalc.Visible = false;
                            txtFormulaCalc.Visible = false;
                            drpfor.SelectedIndex = 2;
                        }
                        if (strformulatype.ToString() == "1")
                        {
                            lblFormulaCalc.Visible = true;
                            txtFormulaCalc.Visible = true;
                            drpfor.SelectedIndex = 0;
                        }
                        if (strformulatype.ToString() == "2")
                        {
                            
                            lblFormulaCalc.Text = "Time :";
                            lblFormulaCalc.Visible = true;
                            txtFormulaCalc.Visible = true;
                            drpfor.SelectedIndex =1;
                        }
                    }
                    else
                    {
                        lblFormulaCalc.Visible = false;
                        txtFormulaCalc.Visible = false;
                    }
                }
                else
                {
                    drpfor.Visible = false;
                    lblFormula.Visible = false;
                    trFormula.Visible = false;
                    lblFormulaCalc.Visible = false;
                    txtFormulaCalc.Visible = false;
                    txtCode.Visible = false;
                    lblVariable.Visible = false;
                }
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
        }
        protected void drpfor_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtFormulaCalc.Text = "";
            if (drpfor.SelectedIndex == 2 )
            {
                lblFormulaCalc.Visible = false;
                txtFormulaCalc.Visible = false;
                rfvfcal.Visible = false;
            }
            if (drpfor.SelectedIndex == 1 || drpfor.SelectedIndex == 0)
            {
                lblFormulaCalc.Visible = true;
                txtFormulaCalc.Visible = true;
                rfvfcal.Visible = true;
            }

        }
    }
}