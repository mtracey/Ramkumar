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
using Telerik.Web.UI;

namespace SMEPayroll.Payroll
{
    public partial class claimaddition : System.Web.UI.UserControl
    {
        private object _dataItem = null;
        int compid;
        string varEmpCode = "";
        static string username = "";
        static string sUserName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            compid = Utility.ToInteger(Session["Compid"]);
            varEmpCode = Session["EmpCode"].ToString();
            sUserName = Utility.ToString(Session["Username"]);
             if (Utility.ToString(Session["Username"]) == "")
              Response.Redirect("../SessionExpire.aspx");
              
            if (drpemployee.SelectedValue=="-select-")
            {
            lblsupervisor.Text="";
            }
            //btnUpdate.Attributes.Add("OnClientClick", "ValidateData('" + txtbankcode.);
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
        protected static DataSet getDataSet(string sSQL)
        {
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, sSQL, null);
            return ds;
        }
        protected void detailbind()
        {
            string strSql = "select a.emp_code,a.username, a.emp_name+' '+a.emp_lname 'emp_name', b.emp_name+' '+b.emp_lname emp_clsupervisor from employee a, employee b ";
            strSql += " where a.emp_clsupervisor=b.emp_code and a.emp_code=" + drpemployee.SelectedValue;
            DataSet leaveset = new DataSet();
            leaveset = getDataSet(strSql);
            int temp = leaveset.Tables[0].Rows.Count;
            if (temp != 0)
            {
                lblsupervisor.Text = Utility.ToString(leaveset.Tables[0].Rows[0]["emp_clsupervisor"]);
                username = Utility.ToString(leaveset.Tables[0].Rows[0]["username"]);
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
            string sSQL;
            string sgroupname = "";

            //SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, "SELECT GroupName FROM UserGroups ug, Employee emp WHERE emp.GroupID = ug.GroupID AND emp.UserName = '" + sUserName + "' ", null);
            //if (dr.Read())
            //{
            //    sgroupname = Utility.ToString(dr.GetValue(0));
            //}
            sgroupname = Utility.ToString(Session["GroupName"]);

                if (sgroupname == "Super Admin" || (Utility.AllowedAction1(Session["Username"].ToString(), "Apply Claim for all")==true ))
                {
                    sSQL = "SELECT [emp_code], isnull([emp_name],'')+' '+isnull([emp_lname],'') 'emp_name'  FROM [employee] where termination_date is null and company_id=" + compid + " order by emp_name";
                }
                else
                {

                    sSQL = "SELECT [emp_code], isnull([emp_name],'')+' '+isnull([emp_lname],'') 'emp_name'  FROM [employee] where termination_date is null and emp_code='" + varEmpCode + "' and company_id=" + compid + " order by emp_name";
                }
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
                sSQL = "SELECT [id], [desc] FROM [additions_types] where optionselection='Claim' and (company_id=-1 or company_id='" + compid + "')";
            else
                sSQL = "SELECT [id], [desc] FROM [additions_types] where optionselection='Claim' and company_id=" + compid;
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

        protected void drpemployee_DataBound(object sender, EventArgs e)
        {
            string sgroupname = Utility.ToString(Session["GroupName"]);
            if (sgroupname == "Super Admin" || (Utility.AllowedAction1(Session["Username"].ToString(), "Apply Claim for all") == true))
            {
                drpemployee.Items.Insert(0, new ListItem("- All Employees -", "-1"));
            }
            drpemployee.Items.Insert(0, new ListItem("-select-", "-select-"));

        }

       
        protected void drpaddtype_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sSQL = "select [id],cpf from additions_types where id=" + Utility.ToInteger(drpaddtype.SelectedItem.Value);
            SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQL, null);
            if (dr.Read())
            {
            }
        }

        protected void drpaddtype_DataBound(object sender, EventArgs e)
        {
            drpaddtype.Items.Insert(0, new ListItem("-select-", "-select-"));
        }

        protected void drpemployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpemployee.SelectedValue == "-select-")
            {
                lblsupervisor.Text = "";
            }
            else
            {
                detailbind();
            }
        }

             
    }
}