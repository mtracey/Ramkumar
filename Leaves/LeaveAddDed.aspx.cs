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

namespace SMEPayroll.Leaves
{
    public partial class LeaveAddDed : System.Web.UI.Page
    {
        string compid = "";
        SqlParameter[] parms;
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;

        string sSQL = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            /* To disable Grid filtering options  */
            compid = Session["Compid"].ToString();
            GridFilterMenu menu = RadGrid1.FilterMenu;
            int i = 0;
            while (i < menu.Items.Count)
            {
                menu.Items.RemoveAt(i);
            }

            SqlDataSource3.ConnectionString = Session["ConString"].ToString();
            lblerror.Text = "";

            if (!IsPostBack)
            {
                imgbtnfetch.Enabled = false;
                cmbYear.SelectedValue = Utility.ToString(System.DateTime.Today.Year);
                //   binddata();
            }

            if (Session["TimeSheetApproved"].ToString() == "1")
            {
                RadGrid1.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Bottom;
            }
            else
            {
                RadGrid1.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Bottom;
            }
        }
        protected void bindgrid(object sender, ImageClickEventArgs e)
        {
            RadGrid1.DataBind();
        }


        protected void cmbLeaveType_databound(object sender, EventArgs e)
        {
            cmbLeaveType.Items.Insert(0, new ListItem("-select-", "-1"));

        }
        protected void cmbLeaveType_selectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbLeaveType.SelectedItem.Value != "-1")
                imgbtnfetch.Enabled = true;
            else
                imgbtnfetch.Enabled = false;

        }

        void UpdateCalculateLeaves(string strButton)
        {
            string sSQL = "sp_emp_leaves_adddeduc_update";
            parms = new SqlParameter[7];
            string ErrMsg = "";
            string strrowid = "";
            string strempid = "";
            if (strButton == "UpdateAll" || strButton == "CalculateAll")
            {
                if (cmbAddDeduct.SelectedValue == "0")
                {
                    ErrMsg = ErrMsg + "Please select Leave Type" + "<br/>";
                }
                if (cmbYear.SelectedValue == "0")
                {
                    ErrMsg = ErrMsg + "Please select Year " + "<br/>";
                }

                if (txtleaveaddded.Text.ToString().Length <= 0)
                {
                    ErrMsg = ErrMsg + "Please enter Leaves Figure " + "<br/>";
                }
                if (ErrMsg.ToString().Length == 0)
                {
                    double intRoundNo = 0;
                    double intisSucess = 0;
                    int intleaveNo = Utility.ToInteger(cmbAddDeduct.SelectedValue);
                    int intleavetype = Utility.ToInteger(cmbLeaveType.SelectedValue);
                    foreach (GridItem item in RadGrid1.MasterTableView.Items)
                    {
                        double intleaveupdate = 0;
                        if (item is GridItem)
                        {
                            GridDataItem dataItem = (GridDataItem)item;
                            CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                            if (chkBox.Checked == true)
                            {
                                int empId = Utility.ToInteger(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_code"));
                                string strRemarks = "";
                                TextBox txtbox = (TextBox)dataItem.FindControl("txtRemarks");
                                strRemarks = Utility.ToString(txtbox.Text);
                                strrowid = "0";
                                strempid = Utility.ToString(empId);
                                if (strempid.ToString().Length > 0)
                                {
                                    try
                                    {
                                        double intleavereamining = Utility.ToDouble(txtleaveaddded.Text.ToString());
                                        double intleavecurrent = Utility.ToDouble(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("leave_remaining"));

                                        if (intleaveNo == 1)
                                        {
                                            intleaveupdate = intleavecurrent + intleavereamining;
                                        }
                                        else
                                        {
                                            intleaveupdate = intleavecurrent - intleavereamining;
                                        }

                                        intRoundNo = Math.Abs(intleaveupdate % 2);
                                        if (intRoundNo == 0 || intRoundNo == 1 || intRoundNo == 0.5 || intRoundNo == 1.5)
                                        {
                                            if (strButton == "UpdateAll")
                                            {
                                                parms[0] = new SqlParameter("@rowid", strrowid);
                                                parms[1] = new SqlParameter("@leavereamining", intleaveupdate);
                                                parms[2] = new SqlParameter("@leavetype", intleavetype);
                                                parms[3] = new SqlParameter("@eid", strempid);
                                                parms[4] = new SqlParameter("@Leave_Forefited", intleavereamining);
                                                parms[5] = new SqlParameter("@Remarks", strRemarks);
                                                if (intleaveNo == 1)
                                                {
                                                    parms[6] = new SqlParameter("@Status", "1");
                                                }
                                                else
                                                {
                                                    parms[6] = new SqlParameter("@Status", "0");
                                                }

                                                DataAccess.ExecuteStoreProc(sSQL, parms);
                                                if (intisSucess != 2)
                                                {
                                                    intisSucess = 1;
                                                }
                                            }
                                            else if (strButton == "CalculateAll")
                                            {
                                                //  dataItem.Cells[8].Text = intleaveupdate.ToString();
                                                dataItem.Cells[9].Text = intleaveupdate.ToString();
                                            }
                                        }
                                        else
                                        {
                                            dataItem.Cells[8].Text = "Not Updated";
                                            ErrMsg = "Some Rows cannot be updated.";
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        intisSucess = 2;
                                        ErrMsg = ex.Message;
                                        if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                                        {
                                            ErrMsg = "<font color = 'Red'>Unable to update the status.Please Try again!</font>";
                                        }
                                    }
                                }
                            }
                        }
                    }

                    if (intisSucess == 1)
                    {
                        binddata();
                        msg.Value = "Leave Records Updated Sucessfully.";
                    }
                    if (intisSucess == 2)
                    {
                        msg.Value = "Leave Records Update Failed.";
                    }
                }

                lblerror.Text = ErrMsg;
            }
        }


        protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            Boolean flag = false;
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
                            //GridDataItem dataItem = (GridDataItem)item;
                            TextBox txtbox = (TextBox)dataItem.FindControl("txtRemarks");
                            string remarks = Utility.ToString(txtbox.Text);
                            if (flag == false)
                                if (remarks != "")
                                {
                                    flag = true;
                                    Session["remarks"] = remarks;
                                }
                        }
                    }
                }
                foreach (GridItem item in RadGrid1.MasterTableView.Items)
                {
                    if (item is GridItem)
                    {
                        GridDataItem dataItem = (GridDataItem)item;
                        CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                        if (chkBox.Checked == true)
                        {
                            //GridDataItem dataItem = (GridDataItem)item;
                            TextBox txtbox = (TextBox)dataItem.FindControl("txtRemarks");
                            txtbox.Text = Utility.ToString(Session["remarks"].ToString());
                        }
                    }
                }
            }

        }
        protected void getData(object sender, ImageClickEventArgs e)
        {
            string ErrMsg = "";
            if (cmbLeaveType.SelectedItem.Value != "-1")
                binddata();
            else
            {
                ErrMsg = ErrMsg + "Please Select Leaves Type " + "<br/>";
                lblerror.Text = ErrMsg;
            }
        }
        protected void cmbYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            binddata();
        }

        private void binddata()
        {
            DataSet ds = new DataSet();
            sSQL = "sp_emp_leaves_adddeduc";
            int intleaveNo = Utility.ToInteger(cmbAddDeduct.SelectedValue);
            parms = new SqlParameter[4];
            parms[0] = new SqlParameter("@company_id", Utility.ToInteger(compid));
            parms[1] = new SqlParameter("@year", Utility.ToInteger(cmbYear.SelectedValue));
            parms[2] = new SqlParameter("@leaveType", Utility.ToInteger(cmbLeaveType.SelectedValue));
            if (intleaveNo == 1)
            {
                parms[3] = new SqlParameter("@Status", Utility.ToInteger("1"));
            }
            else
            {
                parms[3] = new SqlParameter("@Status", Utility.ToInteger("0"));
            }
            ds = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL, parms);
            RadGrid1.DataSource = ds;
            RadGrid1.DataBind();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            UpdateCalculateLeaves("UpdateAll");
        }






        protected void btnCalc_Click(object sender, EventArgs e)
        {
            UpdateCalculateLeaves("CalculateAll");
        }



    }
}
