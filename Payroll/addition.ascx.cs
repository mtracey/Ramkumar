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

namespace SMEPayroll.Payroll
{
    public partial class addition : System.Web.UI.UserControl
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        private object _dataItem = null;
        int compid;
        string varEmpCode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            compid = Utility.ToInteger(Session["Compid"]);
            varEmpCode = Session["EmpCode"].ToString();
            if (this.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.ToString() == "System.Web.UI.HtmlControls.HtmlForm")
            {
                ((HtmlInputHidden)this.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.FindControl("txtRadId")).Value = this.ClientID;
            }
            //if (this.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.ToString() == "System.Web.UI.HtmlControls.HtmlForm")
            //{
            //    ((HtmlInputHidden)this.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.FindControl("txtRadId")).Value = this.ClientID;
            //}
            drpaddtype.Attributes.Add("OnChange", "EnablePayableOtions();");
            drpiras_approval.Attributes.Add("OnChange", "EnableApproval();");
            btnUpdate.Attributes.Add("onclick", "javascript:return ValidateForm();");
            tr1.Attributes.Add("style", "display:none");
            tr2.Attributes.Add("style", "display:none");
            tr3.Attributes.Add("style", "display:none");
            tr4.Attributes.Add("style", "display:none");
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
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
            /* Binding Country Drop down list*/
            DataSet ds_employee = new DataSet();
            string sSQL = "SELECT [emp_code], isnull([emp_name],'')+' '+isnull([emp_lname],'') 'emp_name'  FROM [employee] where termination_date is null and  company_id=" + compid + " order by emp_name";
            ds_employee = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            drpemployee.DataSource = ds_employee.Tables[0];
            drpemployee.DataTextField = ds_employee.Tables[0].Columns["emp_name"].ColumnName.ToString();
            drpemployee.DataValueField = ds_employee.Tables[0].Columns["emp_code"].ColumnName.ToString();
            drpemployee.DataBind();
          
            object Employeeid = DataBinder.Eval(DataItem, "emp_code");
            object iras_approval = DataBinder.Eval(DataItem, "iras_approval");
            object iras_approval_date = DataBinder.Eval(DataItem, "iras_approval_date");
            object additionsyears = DataBinder.Eval(DataItem, "additionsforyear");

            if (iras_approval != DBNull.Value)
            {
                drpiras_approval.SelectedValue = Utility.ToString(iras_approval.ToString());
                if (iras_approval.ToString() == "Yes")
                {
                    tr4.Attributes.Add("style", "display:block");
                }
                else
                {
                    tr4.Attributes.Add("style", "display:none");
                }
            }
            else
            {
                tr4.Attributes.Add("style", "display:none");
            }

            if (additionsyears != DBNull.Value)
            {
                drpAdditionYear.SelectedValue = Utility.ToString(additionsyears.ToString());
            }
            else
            {
                drpAdditionYear.SelectedValue = Utility.ToString(System.DateTime.Today.Year);
            }

            if (iras_approval_date != DBNull.Value)
            {

                DateTime dt;
                dt = new DateTime();
                dt = System.Convert.ToDateTime(iras_approval_date);
                txtiras_approval_date.Text = dt.Day.ToString() + "/" + dt.Month.ToString() + "/" + dt.Year.ToString();
            }
            if (Employeeid != DBNull.Value)
            {
                drpemployee.SelectedValue = Employeeid.ToString();
            }


            DataSet ds_additiontype = new DataSet();
            if (compid == 1)
                sSQL = "SELECT [id], [desc], tax_payable_options, company_id FROM [additions_types] where ((company_id=-1 or company_id=" + compid + ") And (OptionSelection='General' Or OptionSelection='Claim')) OR (upper(isShared)='YES')";
            else
                sSQL = "SELECT [id], [desc], tax_payable_options, company_id FROM [additions_types] where ((company_id=" + compid + ") And (OptionSelection='General' Or OptionSelection='Claim')) OR (upper(isShared)='YES')";
            ds_additiontype = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            drpaddtype.DataSource = ds_additiontype.Tables[0];
            drpaddtype.DataTextField = ds_additiontype.Tables[0].Columns["desc"].ColumnName.ToString();
            drpaddtype.DataValueField = ds_additiontype.Tables[0].Columns["id"].ColumnName.ToString();
            drpaddtype.DataBind();

            drplumsum.DataSource = ds_additiontype.Tables[0];
            drplumsum.DataTextField = ds_additiontype.Tables[0].Columns["tax_payable_options"].ColumnName.ToString();
            drplumsum.DataValueField = ds_additiontype.Tables[0].Columns["id"].ColumnName.ToString();
            drplumsum.DataBind();
            
            object addition_type = DataBinder.Eval(DataItem, "id");
            if (addition_type != DBNull.Value)
            {
                string strswitch="";
                DataRow[] dr;
                drpaddtype.SelectedValue = addition_type.ToString();
                dr = ds_additiontype.Tables[0].Select("id ='" + addition_type + "' And company_id=" + compid);
                if (dr.Length > 0)
                {
                    strswitch = dr[0]["tax_payable_options"].ToString();
                    ((HtmlInputHidden)this.Parent.Parent.Parent.Parent.Parent.Parent.Parent.FindControl("txtLumSum")).Value = strswitch;
                }

                string strtax_payable_options = ((DropDownList)this.Parent.Parent.Parent.Parent.Parent.Parent.Parent.FindControl("drplumsumswitch")).SelectedItem.Text;
                if (strtax_payable_options.ToString().IndexOf("," + strswitch + ",") >= 0)
                {
                    tr1.Attributes.Add("style", "display:block");
                    tr2.Attributes.Add("style", "display:block");
                    tr3.Attributes.Add("style", "display:block");
                    if (drpiras_approval.SelectedItem.Value.ToString() == "Yes")
                    {
                        tr4.Attributes.Add("style", "display:block");
                    }
                    else
                    {
                        tr4.Attributes.Add("style", "display:none");
                    }
                }
                else
                {
                    tr1.Attributes.Add("style", "display:none");
                    tr2.Attributes.Add("style", "display:none");
                    tr3.Attributes.Add("style", "display:none");
                    tr4.Attributes.Add("style", "display:none");
                }

            }

        }
        protected void drpemployee_databound(object sender, EventArgs e)
        {
            drpemployee.Items.Insert(0, new ListItem("- All Employees -", "-1"));
            drpemployee.Items.Insert(0, new ListItem("-select-", "-select-"));           
        }

        protected void drpaddtype_databound(object sender, EventArgs e)
        {
            drpaddtype.Items.Insert(0, new ListItem("-select-", "-select-"));
        }

        protected void drpaddtype_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sSQL = "select [id],cpf from additions_types where id=" + Utility.ToInteger(drpaddtype.SelectedItem.Value);
            SqlDataReader dr=DataAccess.ExecuteReader(CommandType.Text,sSQL,null);
            if (dr.Read())
            {
                lblcpf.Text = dr[1].ToString();
            }
        }
    }
}