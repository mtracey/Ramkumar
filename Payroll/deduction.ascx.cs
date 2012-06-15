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

namespace SMEPayroll.Payroll
{
    public partial class deduction : System.Web.UI.UserControl
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        private object _dataItem = null;
        string varEmpCode = "";
        int compid;
        protected void Page_Load(object sender, EventArgs e)
        {
            compid = Utility.ToInteger(Session["Compid"]);
            varEmpCode = Session["EmpCode"].ToString();
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            cmpEndDate.ValueToCompare = DateTime.Now.ToShortDateString();
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
            /* Binding Country Drop down list*/
            DataSet ds_employee = new DataSet();
            string sSQL = "SELECT [emp_code], isnull([emp_name],'')+' '+isnull([emp_lname],'') 'emp_name'  FROM [employee] where termination_date is null and  company_id=" + compid + " order by emp_name";
            ds_employee = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            drpemployee.DataSource = ds_employee.Tables[0];
            drpemployee.DataTextField = ds_employee.Tables[0].Columns["emp_name"].ColumnName.ToString();
            drpemployee.DataValueField = ds_employee.Tables[0].Columns["emp_code"].ColumnName.ToString();
            drpemployee.DataBind();

            object Employeeid = DataBinder.Eval(DataItem, "emp_code");
            if (Employeeid != DBNull.Value)
            {
                drpemployee.SelectedValue = Employeeid.ToString();
            }

            DataSet ds_additiontype = new DataSet();
            if (compid == 1)
                sSQL = "SELECT [id], [desc] FROM [deductions_types] where company_id=-1 or company_id=" + compid + " OR (upper(isShared)='YES') Order By [desc]";
            else
                sSQL = "SELECT [id], [desc] FROM [deductions_types] where company_id=" + compid + " OR (upper(isShared)='YES') Order By [desc]";
            ds_additiontype = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            drpaddtype.DataSource = ds_additiontype.Tables[0];
            drpaddtype.DataTextField = ds_additiontype.Tables[0].Columns["desc"].ColumnName.ToString();
            drpaddtype.DataValueField = ds_additiontype.Tables[0].Columns["id"].ColumnName.ToString();
            drpaddtype.DataBind();
            object addition_type = DataBinder.Eval(DataItem, "id");
            if (addition_type != DBNull.Value)
            {
                drpaddtype.SelectedValue = addition_type.ToString();
            }

        }
        protected void drpemployee_databound(object sender, EventArgs e)
        {
            drpemployee.Items.Insert(0, new ListItem("- All Employees -","-1"));
            drpemployee.Items.Insert(0, new ListItem("-select-", "-select-"));
        }
        protected void drpaddtype_databound(object sender, EventArgs e)
        {
            drpaddtype.Items.Insert(0, new ListItem("-select-", "-select-"));        
        }
    }
}