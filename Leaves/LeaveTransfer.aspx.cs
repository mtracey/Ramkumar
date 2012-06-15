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
using System.Net.Mail;
using System.IO;

namespace SMEPayroll.Leaves
{
    public partial class LeaveTransfer : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        int compid;
        string strdate;
        protected void Page_Load(object sender, EventArgs e)
        {
             if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            rdTrdate.Enabled = false;
            if (Session["Leave_Model"].ToString() == "3" || Session["Leave_Model"].ToString() == "4" || Session["Leave_Model"].ToString() == "6" || Session["Leave_Model"].ToString() == "8")
            {
                Response.Redirect("LeaveTransferYOS.aspx");
                //rdTrdate.Enabled = true;
            }
            else
            {
                strdate = "31/12/" + cmbYear.SelectedItem.Value.ToString();
                rdTrdate.DbSelectedDate = Convert.ToDateTime(strdate);
            }


            compid = Utility.ToInteger(Session["Compid"].ToString());
            lblmsg.Visible = false;
            Button2.Visible = true;
            RadGrid1.Visible = true;

            SqlDataSource2.ConnectionString = Session["ConString"].ToString();
            if (!IsPostBack)
            {
                rdTrdate.SelectedDate = System.DateTime.Now;
                string sSQL = "select distinct id,empgroupname from emp_group where company_id={0} order by empgroupname";
                sSQL = string.Format(sSQL, Utility.ToInteger(Session["Compid"]));
                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQL, null);
                cmbEmpgroup.Items.Clear();
                cmbEmpgroup.Items.Add(new System.Web.UI.WebControls.ListItem("--Select--", ""));
                while (dr.Read())
                {
                    cmbEmpgroup.Items.Add(new System.Web.UI.WebControls.ListItem(Utility.ToString(dr.GetValue(1)), Utility.ToString(dr.GetValue(0))));
                }
                cmbEmpgroup.SelectedValue = "";
                cmbYear.SelectedValue = System.DateTime.Today.Year.ToString();
            }
            else
            {
                DataSet ds = new DataSet();
                ds = getDataSet("select id from leaves_allowed where leave_type=8 and leave_year='" + cmbYear.SelectedValue.ToString() + "' AND Group_id=" + cmbEmpgroup.SelectedValue);
                if (ds.Tables[0].Rows.Count <=0)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Please set the Leaves Allowed for the Annual Leave";
                    RadGrid1.Visible = false;
                    Button2.Visible = false;
                }
            }
        }

        private object _dataItem = null;

        public object Dataitem
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

        protected void bindgrid(object sender, ImageClickEventArgs e)
        {

            RadGrid1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            double previousyear = Convert.ToDouble(cmbYear.SelectedValue) - 1;
            string currentyear = cmbYear.SelectedValue;
            double leavesallowed = 0;
            Button2.Visible = true;
            //string ssql9 = "select leaves_allowed from leaves_allowed where leave_year='" + currentyear + "' and leave_type=8 and group_id='" + cmbEmpgroup.SelectedItem.Value.ToString() + "'";
            //DataSet ds = new DataSet();
            //ds = DataAccess.FetchRS(CommandType.Text, ssql9, null);
            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //    leavesallowed = Convert.ToInt16(ds.Tables[0].Rows[0]["leaves_allowed"]);
            //}

            foreach (GridItem item in RadGrid1.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        int i = 1;
                        double empcode = Convert.ToDouble(dataItem.Cells[3 + i].Text);
                        double TotalLastYrLeaves = Utility.ToDouble(dataItem.Cells[7 + i].Text);
                        double intrem = Convert.ToDouble(dataItem.Cells[6].Text.ToString()) - Convert.ToDouble(dataItem.Cells[7].Text.ToString());
                        double CurrentYrLeaves = Utility.ToDouble(dataItem.Cells[8 + i].Text.ToString());
                        string RemLastYrLeaves = "";
                        leavesallowed = Convert.ToDouble(dataItem.Cells[10].Text.ToString());
                        if (intrem >= 0)
                        {
                            RemLastYrLeaves = Convert.ToString(intrem);
                        }
                        else
                        {
                            RemLastYrLeaves = "0";
                        }
                        double leavesallowed1 = 0;
                        string ssql1 = "";
                        string ssql2 = "";
                        string ssql3 = "";

                        string ssql91 = "select (isnull(leaves_allowed,0)+ isnull(LY_Leaves_Bal,0)) leaves_allowed from EmployeeLeavesAllowed where leave_year='" + previousyear + "' and leave_type=8 And Emp_ID='" + empcode + "'";
                        DataSet ds1 = new DataSet();
                        ds1 = DataAccess.FetchRS(CommandType.Text, ssql91, null);
                        if (ds1.Tables[0].Rows.Count > 0)
                        {
                            leavesallowed1 = Convert.ToDouble(ds1.Tables[0].Rows[0]["leaves_allowed"]);
                        }

                        try
                        {
                            int intmsg = 0;
                            if (leavesallowed > 0)
                            {
                                intmsg = intmsg + 1;
                                ssql1 = "delete from LeavesAllowedInYears where emp_id='" + empcode + "' and Years='" + previousyear + "'";
                                DataAccess.FetchRS(CommandType.Text, ssql1);

                                ssql2 = "Insert Into LeavesAllowedInYears (Years,Emp_ID,LeavesAvailable, LY_Leaves_Bal,LeaveType)(Select  Leave_Year,Emp_ID,Leaves_Allowed,LY_Leaves_Bal,'" + Session["Leave_Model"].ToString() + "' From EmployeeLeavesAllowed  where emp_id='" + empcode + "' and leave_year='" + previousyear + "' And Leave_Type=8)";
                                DataAccess.FetchRS(CommandType.Text, ssql2);

                                ssql1 = "delete from EmployeeLeavesAllowed where emp_id='" + empcode + "' and leave_year='" + previousyear + "' And Leave_Type=8";
                                DataAccess.FetchRS(CommandType.Text, ssql1);

                                ssql2 = "insert into EmployeeLeavesAllowed (emp_id,leave_year,leave_type,leaves_allowed, LY_Leaves_Bal) values ('" + empcode + "','" + currentyear + "',8,'" + CurrentYrLeaves + "','" + TotalLastYrLeaves + "')";
                                DataAccess.FetchRS(CommandType.Text, ssql2);
                            }
                            if (leavesallowed1 > 0)
                            {
                                intmsg = intmsg + 1;
                                ssql3 = "insert into leaves_forefited (emp_id,leave_year,leave_forefited,leave_allowed,leave_forward) values ('" + empcode + "','" + previousyear + "','" + RemLastYrLeaves + "','" + leavesallowed1 + "','" + TotalLastYrLeaves + "')";
                                DataAccess.FetchRS(CommandType.Text, ssql3);
                            }

                            lblmsg.Visible = true;
                            if (intmsg > 0)
                            {
                                lblmsg.Text = "Leaves Transfered Successfully.";
                            }
                            else
                            {
                                lblmsg.Text = "Leaves cannot be transfered.";
                            }
                        }
                        catch (Exception ex)
                        {
                            string ErrMsg = ex.Message;
                            if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                            {
                                ErrMsg = "<font color = 'Red'>Unable to Transfer the Leaves.Please Try again!</font>";
                            }
                        }
                    }

                }
            }
            RadGrid1.DataBind();
        }

        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                int empid = Convert.ToInt16(dataItem.Cells[4].Text);

                string ssql = "select leave_year from EmployeeLeavesAllowed where leave_year='" + cmbYear.SelectedValue + "' and emp_id='" + empid + "' And Leave_Type=8";
                DataSet ds = new DataSet();
                ds = DataAccess.FetchRS(CommandType.Text, ssql, null);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    chkBox.Enabled = false;
                }
                else
                {
                    chkBox.Enabled = true;
                }
            }
        }
    }
}
