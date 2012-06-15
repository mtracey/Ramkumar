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
    public partial class emp_overtime : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        protected string strstdatemdy = "";
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

        string strWF = "";
        string strEmpvisible = "";


        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {
            GridCommandItem item = e.Item as GridCommandItem;
            if (item != null)
            {
                Button btn = item.FindControl("btnsubmit") as Button;
                btn.Attributes.Add("onclick", "javascript:return validateform();");
                btn = item.FindControl("btnCalcOverVar") as Button;
                btn.Attributes.Add("onclick", "javascript:return validateform();");
            }


            GridSettingsPersister objCount = new GridSettingsPersister();
            objCount.RowCount(e, tbRecord);
        }

        [AjaxPro.AjaxMethod]
        public string SetDate(string monthid)
        {
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            DataSet ds = new DataSet();
            sSQL = "sp_GetPayrollMonth";// 0,2009,2
            SqlParameter[] parms = new SqlParameter[3];
            parms[0] = new SqlParameter("@ROWID", monthid);
            parms[1] = new SqlParameter("@YEARS", 0);
            parms[2] = new SqlParameter("@PAYTYPE", Session["PAYTYPE"].ToString());

            ds = DataAccess.ExecuteSPDataSet(sSQL, parms);

            Session["PayStartDay"] = ds.Tables[0].Rows[0]["PayStartDay"].ToString();
            Session["PayEndDay"] = ds.Tables[0].Rows[0]["PayEndDay"].ToString();
            Session["PaySubStartDay"] = ds.Tables[0].Rows[0]["PaySubStartDay"].ToString();
            Session["PaySubEndDay"] = ds.Tables[0].Rows[0]["PaySubEndDay"].ToString();
            Session["PaySubStartDate"] = ds.Tables[0].Rows[0]["PaySubStartDate"].ToString();
            Session["PaySubEndDate"] = ds.Tables[0].Rows[0]["PaySubEndDate"].ToString();
            return Convert.ToDateTime(ds.Tables[0].Rows[0]["PaySubStartDate"].ToString()).ToString("MM/dd/yyyy", format) + "," + Convert.ToDateTime(ds.Tables[0].Rows[0]["PaySubEndDate"].ToString()).ToString("MM/dd/yyyy", format);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            /* To disable Grid filtering options  */
            AjaxPro.Utility.RegisterTypeForAjax(typeof(emp_overtime));
            if (cmbMonth.Attributes["onchange"] == null) { cmbMonth.Attributes.Add("onchange", "javascript:ChangeMonth(this.value);"); }

            Telerik.Web.UI.GridFilterMenu menu = RadGrid1.FilterMenu;
            int i = 0;


            

            while (i < menu.Items.Count)
            {
                menu.Items.RemoveAt(i);
            }

            SqlDataSource1.ConnectionString = Session["ConString"].ToString();
            SqlDataSource3.ConnectionString = Session["ConString"].ToString();
            lblerror.Text = "";
            comp_id = Utility.ToInteger(Session["Compid"]);
            RadGrid1.PageSizeChanged += new GridPageSizeChangedEventHandler(RadGrid1_PageSizeChanged);
            RadGrid1.PageIndexChanged += new GridPageChangedEventHandler(RadGrid1_PageIndexChanged);
            if (!IsPostBack)
            {
                #region Yeardropdown
                 cmbYear.DataBind();
                #endregion  
                cmbYear.SelectedValue = Utility.ToString(System.DateTime.Today.Year);
                bindMonth();
            }

            if (Session["strWF"] == null)
            {
                string sqlWF = "Select WorkFlowID,WFPAY,WFLEAVE,WFEMP,WFCLAIM,WFReport,WFTimeSheet from company WHERE Company_Id=" + comp_id;
                DataSet dsWF = new DataSet();
                dsWF = DataAccess.FetchRS(CommandType.Text, sqlWF, null);

                if (dsWF.Tables.Count > 0)
                {
                    if (dsWF.Tables[0].Rows.Count > 0)
                    {
                        strWF = dsWF.Tables[0].Rows[0][0].ToString();
                        Session["strWF"] = strWF;
                    }
                }
            }
            else
            {
                strWF = (string)Session["strWF"];
            }




            RadGrid1.Columns[11].Visible = false;
            RadGrid1.Columns[12].Visible = false;
            RadGrid1.Columns[13].Visible = false;
            RadGrid1.Columns[14].Visible = false;
            //if (Session["V1Formula"].ToString() != "0")
            //{
            RadGrid1.Columns[11].HeaderText = Session["V1text"].ToString();
            RadGrid1.Columns[11].Visible = true;
            //}

            //if (Session["V2Formula"].ToString() != "0")
            //{
            RadGrid1.Columns[12].HeaderText = Session["V2text"].ToString();
            RadGrid1.Columns[12].Visible = true;
            //}
            //if (Session["V3Formula"].ToString() != "0")
            //{
            RadGrid1.Columns[13].HeaderText = Session["V3text"].ToString();
            RadGrid1.Columns[13].Visible = true;
            //}
            //if (Session["V4Formula"].ToString() != "0")
            //{
            RadGrid1.Columns[14].HeaderText = Session["V4text"].ToString();
            RadGrid1.Columns[14].Visible = true;
            //}

            if (Session["TimeSheetApproved"].ToString() == "1")
            {
                RadGrid1.MasterTableView.CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.Bottom;
            }
            else
            {
                RadGrid1.MasterTableView.CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.None;
            }
                                
            if (!IsPostBack)
            {
                //Method to Load grid Seting Persister
                LoadGridSettingsPersister();
            }


            //Check for WorkFlow number 2
            if (strWF == "2" && Session["PayrollWF"] != null)
            {
                if (Session["PayrollWF"].ToString() == "1")
                {
                    if (Session["GroupName"].ToString().ToUpper() != "SUPER ADMIN")
                    {
                        strEmpvisible = "";
                        if (Session["dsEmpSup"] != null)
                        {
                            if (Session["dsEmpWF"] != null)
                            {
                                DataSet dstemp = new DataSet();
                                dstemp = (DataSet)Session["dsEmpWF"];
                                foreach (DataRow dr in dstemp.Tables[0].Rows)
                                {
                                    if (strEmpvisible == "")
                                    {
                                        strEmpvisible = dr["Emp_ID"].ToString();
                                    }
                                    else
                                    {
                                        strEmpvisible = strEmpvisible + "," + dr["Emp_ID"].ToString();
                                    }
                                }
                            }
                        }
                    }
                }
            }

            //strEmpvisible = "5,127";

            if (strEmpvisible != "")
            {
                Session["EmpPassID"] = strEmpvisible;
            }
            else
            {
                Session["EmpPassID"] = "";
            }

            
        }

       protected  void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
       {
           if (e.RebindReason != GridRebindReason.InitialLoad)
           {
               if (strEmpvisible != "")
               {
                   Session["EmpPassID"] = strEmpvisible;
               }
               else
               {
                   Session["EmpPassID"] = "";
               }

               tbRecord.Visible = true;//toolbar

               intcnt = 1;

               //IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);

               int i = 0;

               DataSet ds = new DataSet();

               string ssql = "sp_emp_overtime";// 0,2009,2
               SqlParameter[] parms = new SqlParameter[4];
               parms[i++] = new SqlParameter("@month", cmbMonth.SelectedValue);
               parms[i++] = new SqlParameter("@year", cmbYear.SelectedValue);
               parms[i++] = new SqlParameter("@company_id", comp_id);
               parms[i++] = new SqlParameter("@DeptId", Utility.ToInteger(deptID.SelectedValue));
               ds = DataAccess.ExecuteSPDataSet(ssql, parms);


               if (strEmpvisible != "")
               {
                   DataView view = new DataView();

                   view = ds.Tables[0].DefaultView;
                   //ds.Tables[0].DefaultView.RowFilter = "emp_id IN(" + strEmpvisible + ")";


                   //view.Table = DataSet1.Tables["Suppliers"];
                   //view.AllowDelete = true;
                   //view.AllowEdit = true;
                   // view.AllowNew = true;
                   view.RowFilter = "empid IN(" + strEmpvisible + ")";
                   // Simple-bind to a TextBox control
                   Session["EmpPassID"] = strEmpvisible;
                   this.RadGrid1.DataSource = view;
                   //RadGrid1.DataBind();
               }
               else
               {
                   this.RadGrid1.DataSource = ds;
                   //RadGrid1.DataBind();
               }



               //RadGrid1.DataSource = ds;
               //DataRow[] drResults = monthDs.Tables[0].Select("RowID = " + cmbMonth.SelectedValue);
               //foreach (DataRow dr in drResults)
               //{
               //    Session["PayStartDay"] = dr["PayStartDay"].ToString();
               //    Session["PayEndDay"] = dr["PayEndDay"].ToString();
               //    Session["PaySubStartDay"] = dr["PaySubStartDay"].ToString();
               //    Session["PaySubEndDay"] = dr["PaySubEndDay"].ToString();
               //    Session["CurrentMonth"] = dr["Month"].ToString();
               //    Session["PaySubStartDate"] = dr["PaySubStartDate"].ToString();
               //    Session["PaySubEndDate"]= dr["PaySubEndDate"].ToString();
               //    strstdatemdy = Convert.ToDateTime(Session["PaySubStartDate"].ToString()).ToString("MM/dd/yyyy", format);
               //    strendatemdy = Convert.ToDateTime(Session["PaySubEndDate"].ToString()).ToString("MM/dd/yyyy", format);
               //    strstdatedmy = Convert.ToDateTime(Session["PaySubStartDate"].ToString()).ToString("dd/MM/yyyy", format);
               //    strendatedmy = Convert.ToDateTime(Session["PaySubEndDate"].ToString()).ToString("dd/MM/yyyy", format);
               //}
               //if (Session["PaySubStartDate"] != null)
               //{

               //}

               //RadGrid1.DataBind();
               Session["ROWID"] = cmbMonth.SelectedValue.ToString();
               Session["ROWYEAR"] = cmbYear.SelectedValue.ToString();
           }
       }

        void RadGrid1_PageIndexChanged(object source, GridPageChangedEventArgs e)
        {
            RadGrid1.CurrentPageIndex = e.NewPageIndex;
            bingrid1();
        }

       
        void RadGrid1_PageSizeChanged(object source, GridPageSizeChangedEventArgs e)
        {
           

            bingrid1();
            //throw new Exception("The method or operation is not implemented.");
        }

        void bingrid1()
        {
            if (strEmpvisible != "")
            {
                Session["EmpPassID"] = strEmpvisible;
            }
            else
            {
                Session["EmpPassID"] = "";
            }

            tbRecord.Visible = true;//toolbar

            intcnt = 1;
            cmbYear.Enabled = false;
            cmbMonth.Enabled = false;
            rdFrom.Enabled = false;
            rdEnd.Enabled = false;
            deptID.Enabled = false;
            //IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);

            int i = 0;

            DataSet ds = new DataSet();

            string ssql = "sp_emp_overtime";// 0,2009,2
            SqlParameter[] parms = new SqlParameter[4];
            parms[i++] = new SqlParameter("@month", cmbMonth.SelectedValue);
            parms[i++] = new SqlParameter("@year", cmbYear.SelectedValue);
            parms[i++] = new SqlParameter("@company_id", comp_id);
            parms[i++] = new SqlParameter("@DeptId", Utility.ToInteger(deptID.SelectedValue));
            ds = DataAccess.ExecuteSPDataSet(ssql, parms);


            if (strEmpvisible != "")
            {
                DataView view = new DataView();

                view = ds.Tables[0].DefaultView;
                //ds.Tables[0].DefaultView.RowFilter = "emp_id IN(" + strEmpvisible + ")";


                //view.Table = DataSet1.Tables["Suppliers"];
                //view.AllowDelete = true;
                //view.AllowEdit = true;
                // view.AllowNew = true;
                view.RowFilter = "empid IN(" + strEmpvisible + ")";
                // Simple-bind to a TextBox control
                Session["EmpPassID"] = strEmpvisible;
                this.RadGrid1.DataSource = view;
                RadGrid1.DataBind();
            }
            else
            {
                this.RadGrid1.DataSource = ds;
                RadGrid1.DataBind();
            }



            //RadGrid1.DataSource = ds;
            //DataRow[] drResults = monthDs.Tables[0].Select("RowID = " + cmbMonth.SelectedValue);
            //foreach (DataRow dr in drResults)
            //{
            //    Session["PayStartDay"] = dr["PayStartDay"].ToString();
            //    Session["PayEndDay"] = dr["PayEndDay"].ToString();
            //    Session["PaySubStartDay"] = dr["PaySubStartDay"].ToString();
            //    Session["PaySubEndDay"] = dr["PaySubEndDay"].ToString();
            //    Session["CurrentMonth"] = dr["Month"].ToString();
            //    Session["PaySubStartDate"] = dr["PaySubStartDate"].ToString();
            //    Session["PaySubEndDate"]= dr["PaySubEndDate"].ToString();
            //    strstdatemdy = Convert.ToDateTime(Session["PaySubStartDate"].ToString()).ToString("MM/dd/yyyy", format);
            //    strendatemdy = Convert.ToDateTime(Session["PaySubEndDate"].ToString()).ToString("MM/dd/yyyy", format);
            //    strstdatedmy = Convert.ToDateTime(Session["PaySubStartDate"].ToString()).ToString("dd/MM/yyyy", format);
            //    strendatedmy = Convert.ToDateTime(Session["PaySubEndDate"].ToString()).ToString("dd/MM/yyyy", format);
            //}
            //if (Session["PaySubStartDate"] != null)
            //{
            RadGrid1.DataBind();
            //}
            Session["ROWID"] = cmbMonth.SelectedValue.ToString();
            Session["ROWYEAR"] = cmbYear.SelectedValue.ToString();
        
        }

        protected void bindgrid(object sender, ImageClickEventArgs e)
        {
           bingrid1();
        }
        protected void cmbYear_selectedIndexChanged(object sender, EventArgs e)
        {
            Session["ROWYEAR"] = cmbYear.SelectedValue.ToString();
            bindMonth();
            Session["ROWID"] = cmbMonth.SelectedValue.ToString();
        }
        private void bindMonth()
        {
            MonthFill();
        }
        protected void Radgrid1_databound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {

            if ((Utility.AllowedAction1(Session["Username"].ToString(), "Manage Overtime Payroll")) == false)
            {
                RadGrid1.MasterTableView.CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.None;

            }
            else
            {
                RadGrid1.MasterTableView.CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.Bottom;
            }

            if (e.Item.ItemType == GridItemType.Item || e.Item.ItemType == GridItemType.AlternatingItem)
            {
                if (Session["PaySubStartDate"] != null)
                {
                    GridItem dataItem = (GridItem)e.Item;
                    GridDataItem dtItem = e.Item as GridDataItem;
                    string empid = dataItem.Cells[4].Text.ToString();
                    TextBox txtbox = (TextBox)dataItem.FindControl("txtovertime");
                    TextBox txtbox1 = (TextBox)dataItem.FindControl("txtovertime2");
                    TextBox txtbox2 = (TextBox)dataItem.FindControl("txtDaysWork");
                    TextBox txtbox3 = (TextBox)dataItem.FindControl("txtNHWork");
                    TextBox txtv1 = (TextBox)dataItem.FindControl("txtv1");
                    TextBox txtv2 = (TextBox)dataItem.FindControl("txtv2");
                    TextBox txtv3 = (TextBox)dataItem.FindControl("txtv3");
                    TextBox txtv4 = (TextBox)dataItem.FindControl("txtv4");
                    TextBox txtot_entitlement = (TextBox)dataItem.FindControl("txtot_entitlement");

                    string ssql9 = "select d.emp_id,isnull(d.status,'') as status from prepare_payroll_detail d,prepare_payroll_hdr h";
                    ssql9 = ssql9 + " where d.trx_id=h.trx_id and d.emp_id='" + empid + "' and (Convert(DateTime,h.start_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,h.end_period,103) <= Convert(DateTime,'" + strendatedmy + "',103)) and year(h.start_period)='" + cmbYear.SelectedValue + "' and d.status not in('R')";
                    string status;
                    DataSet ds = new DataSet();
                    ds = DataAccess.FetchRS(CommandType.Text, ssql9, null);
                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        status = "";
                    }
                    else
                    {
                        status = Convert.ToString(ds.Tables[0].Rows[0]["status"]).ToString();
                    }

                    if (dtItem["pay_frequency"].Text.Trim() != "D")
                    {
                        txtbox2.Enabled = false;
                        txtbox2.BackColor = Color.LightYellow;
                    }
                    //if (dtItem["pay_frequency"].Text.Trim() == "M" || dtItem["pay_frequency"].Text.Trim() == "H")
                    if (dtItem["pay_frequency"].Text.Trim() == "H")
                    {
                        txtbox3.Enabled = true;
                    }
                    else
                    {
                        txtbox3.Enabled = false;
                        txtbox3.BackColor = Color.LightYellow;
                    }

                    if (status == "G" || status == "P" || status == "A")
                    {
                        txtbox.Enabled = false;
                        txtbox1.Enabled = false;
                        txtbox2.Enabled = false;
                        txtbox3.Enabled = false;
                        txtv1.Enabled = false;
                        txtv2.Enabled = false;
                        txtv3.Enabled = false;
                        txtv4.Enabled = false;
                        dataItem.BackColor = Color.Azure;
                    }
                    else
                    {
                        if (txtot_entitlement.Text.ToString().Trim() == "N")
                        {
                            txtbox.Enabled = false;
                            txtbox1.Enabled = false;
                            txtbox.BackColor = Color.LightYellow;
                            txtbox1.BackColor = Color.LightYellow;
                        }
                        if (Session["V1Formula"].ToString() != "0")
                        {
                            string strRate = dataItem.Cells[19].Text.ToString().Replace("&nbsp;", "");
                            if (strRate.Length > 0)
                            {
                                try
                                {
                                    double intrae = Utility.ToDouble(strRate);
                                    if (intrae <= 0)
                                    {
                                        ((TextBox)dataItem.Cells[13].Controls[1]).Enabled = false;
                                        ((TextBox)dataItem.Cells[13].Controls[1]).BackColor = Color.LightYellow;

                                    }
                                }
                                catch (Exception ee)
                                {
                                    throw ee;
                                }
                                finally
                                {
                                }
                            }
                            else
                            {
                                ((TextBox)dataItem.Cells[13].Controls[1]).Enabled = false;
                                ((TextBox)dataItem.Cells[13].Controls[1]).BackColor = Color.LightYellow;
                            }
                        }
                        if (Session["V2Formula"].ToString() != "0")
                        {
                            string strRate = dataItem.Cells[20].Text.ToString().Replace("&nbsp;", "");
                            if (strRate.Length > 0)
                            {
                                try
                                {
                                    double intrae = Utility.ToDouble(strRate);
                                    if (intrae <= 0)
                                    {
                                        ((TextBox)dataItem.Cells[14].Controls[1]).Enabled = false;
                                        ((TextBox)dataItem.Cells[14].Controls[1]).BackColor = Color.LightYellow;
                                    }
                                }
                                catch (Exception ee)
                                {
                                    throw ee;
                                }
                                finally
                                {
                                }
                            }
                            else
                            {
                                ((TextBox)dataItem.Cells[14].Controls[1]).Enabled = false;
                                ((TextBox)dataItem.Cells[14].Controls[1]).BackColor = Color.LightYellow;
                            }
                        }

                        if (Session["V3Formula"].ToString() != "0")
                        {
                            string strRate = dataItem.Cells[21].Text.ToString().Replace("&nbsp;", "");
                            if (strRate.Length > 0)
                            {
                                try
                                {
                                    double intrae = Utility.ToDouble(strRate);
                                    if (intrae <= 0)
                                    {
                                        ((TextBox)dataItem.Cells[15].Controls[1]).Enabled = false;
                                        ((TextBox)dataItem.Cells[15].Controls[1]).BackColor = Color.LightYellow;
                                    }
                                }
                                catch (Exception ee)
                                {
                                    throw ee;
                                }
                                finally
                                {
                                }
                            }
                            else
                            {
                                ((TextBox)dataItem.Cells[15].Controls[1]).Enabled = false;
                                ((TextBox)dataItem.Cells[15].Controls[1]).BackColor = Color.LightYellow;
                            }
                        }

                        if (Session["V4Formula"].ToString() != "0")
                        {
                            string strRate = dataItem.Cells[22].Text.ToString().Replace("&nbsp;", "");
                            if (strRate.Length > 0)
                            {
                                try
                                {
                                    double intrae = Utility.ToDouble(strRate);
                                    if (intrae <= 0)
                                    {
                                        ((TextBox)dataItem.Cells[16].Controls[1]).Enabled = false;
                                        ((TextBox)dataItem.Cells[16].Controls[1]).BackColor = Color.LightYellow;
                                    }
                                }
                                catch (Exception ee)
                                {
                                    throw ee;
                                }
                                finally
                                {
                                }
                            }
                            else
                            {
                                ((TextBox)dataItem.Cells[16].Controls[1]).Enabled = false;
                                ((TextBox)dataItem.Cells[16].Controls[1]).BackColor = Color.LightYellow;
                            }
                        }
                    }

                }
            }
        }

        protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            strstdatemdy = Convert.ToDateTime(Session["PaySubStartDate"].ToString()).ToString("MM/dd/yyyy", format);
            strendatemdy = Convert.ToDateTime(Session["PaySubEndDate"].ToString()).ToString("MM/dd/yyyy", format);
            strstdatedmy = Convert.ToDateTime(Session["PaySubStartDate"].ToString()).ToString("dd/MM/yyyy", format);
            strendatedmy = Convert.ToDateTime(Session["PaySubEndDate"].ToString()).ToString("dd/MM/yyyy", format);
            if (e.Item is GridCommandItem)
            {
                GridCommandItem commandItem = (GridCommandItem)e.Item;
                ((Button)commandItem.FindControl("btnsubmit")).Enabled = false;
                ((Button)commandItem.FindControl("btnCalcOverVar")).Enabled = false;
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
                                string empcode = Utility.ToString(RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_code"));
                                string empid = Utility.ToString(RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("empid"));
                                int id = Utility.ToInteger(RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("id"));

                                TextBox txtbox = (TextBox)dataItem.FindControl("txtovertime");
                                TextBox txtbox1 = (TextBox)dataItem.FindControl("txtovertime2");
                                TextBox txtbox2 = (TextBox)dataItem.FindControl("txtDaysWork");
                                TextBox txtbox3 = (TextBox)dataItem.FindControl("txtNHWork");
                                TextBox txtv1 = (TextBox)dataItem.FindControl("txtv1");
                                TextBox txtv2 = (TextBox)dataItem.FindControl("txtv2");
                                TextBox txtv3 = (TextBox)dataItem.FindControl("txtv3");
                                TextBox txtv4 = (TextBox)dataItem.FindControl("txtv4");

                                string ssql9 = "select d.emp_id,isnull(d.status,'') as status from prepare_payroll_detail d,prepare_payroll_hdr h";
                                ssql9 = ssql9 + " where d.trx_id=h.trx_id and d.emp_id='" + empid + "' and (Convert(DateTime,h.start_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,h.end_period,103) <= Convert(DateTime,'" + strendatedmy + "',103)) and year(h.start_period)='" + cmbYear.SelectedValue + "' and d.status not in('R')";
                                string status;
                                DataSet dsStatus = new DataSet();
                                dsStatus = DataAccess.FetchRS(CommandType.Text, ssql9, null);
                                if (dsStatus.Tables[0].Rows.Count == 0)
                                {
                                    status = "";
                                }
                                else
                                {
                                    status = Convert.ToString(dsStatus.Tables[0].Rows[0]["status"]).ToString();
                                }

                                if (status == "G" || status == "P" || status == "A")
                                {
                                }
                                else
                                {


                                    double i = Utility.ToDouble(txtbox.Text);
                                    double j = Utility.ToDouble(txtbox1.Text);
                                    double k = Utility.ToDouble(txtbox2.Text);
                                    double l = Utility.ToDouble(txtbox3.Text);
                                    double dblv1 = Utility.ToDouble(txtv1.Text);
                                    double dblv2 = Utility.ToDouble(txtv2.Text);
                                    double dblv3 = Utility.ToDouble(txtv3.Text);
                                    double dblv4 = Utility.ToDouble(txtv4.Text);


                                    status = "U";
                                    double v1, v2, v3, v4;

                                    ssqle = "select isnull(v1rate,0) as v1rate, isnull(v2rate,0) as v2rate,isnull(v3rate,0) as v3rate,isnull(v4rate,0) as v4rate from employee where emp_code='" + empid + "'";
                                    DataSet ds = new DataSet();
                                    ds = DataAccess.FetchRS(CommandType.Text, ssqle, null);
                                    if (ds.Tables[0].Rows.Count == 0)
                                    {
                                        v1 = 0;
                                        v2 = 0;
                                        v3 = 0;
                                        v4 = 0;
                                    }
                                    else
                                    {
                                        v1 = Utility.ToDouble(ds.Tables[0].Rows[0]["v1rate"].ToString());
                                        v2 = Utility.ToDouble(ds.Tables[0].Rows[0]["v2rate"].ToString());
                                        v3 = Utility.ToDouble(ds.Tables[0].Rows[0]["v3rate"].ToString());
                                        v4 = Utility.ToDouble(ds.Tables[0].Rows[0]["v4rate"].ToString());
                                    }

                                    //string date = cmbMonth.SelectedValue + "/" + "01" + "/" + cmbYear.SelectedValue + "";
                                    string date = strstdatemdy;
                                    string v1id = Session["V1Id"].ToString();
                                    string v2id = Session["V2Id"].ToString();
                                    string v3id = Session["V3Id"].ToString();
                                    string v4id = Session["V4Id"].ToString();
                                    //Getting multiplication for rate and days
                                    double ratev1 = dblv1 * v1;
                                    double ratev2 = dblv2 * v2;
                                    double ratev3 = dblv3 * v3;
                                    double ratev4 = dblv4 * v4;

                                    string ssqlv1;
                                    string chkv1;
                                    //variable1 condition -START
                                    chkv1 = "select trx_type,trx_period,emp_code from emp_additions where emp_code='" + empid + "' and trx_type='" + v1id + "' and (Convert(DateTime,trx_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,trx_period,103) <= Convert(DateTime,'" + strendatedmy + "',103))";
                                    DataSet dschk1 = new DataSet();
                                    dschk1 = DataAccess.FetchRS(CommandType.Text, chkv1, null);
                                    if (dschk1.Tables[0].Rows.Count == 0)
                                    {
                                        if (ratev1 > 0)
                                        {
                                            ssqlv1 = "insert into emp_additions(trx_type,trx_period,trx_amount,emp_code,status,claimstatus) values('" + v1id + "','" + date + "','" + ratev1 + "','" + empid + "','" + status + "'," + "'Approved')";
                                            int retv1 = DataAccess.ExecuteStoreProc(ssqlv1);
                                        }
                                    }
                                    else
                                    {
                                        if (ratev1 <= 0)
                                        {
                                            ssqlv1 = "Delete From emp_additions where emp_code='" + empid + "' and trx_type='" + v1id + "' and (Convert(DateTime,trx_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,trx_period,103) <= Convert(DateTime,'" + strendatedmy + "',103))";
                                            int retv1 = DataAccess.ExecuteStoreProc(ssqlv1);
                                        }
                                        ssqlv1 = "update emp_additions set trx_amount='" + ratev1 + "' where emp_code='" + empid + "' and trx_type='" + v1id + "' and (Convert(DateTime,trx_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,trx_period,103) <= Convert(DateTime,'" + strendatedmy + "',103))";
                                        int retv2 = DataAccess.ExecuteStoreProc(ssqlv1);
                                    }
                                    //variable1 condition -END

                                    //variable2 condition -START
                                    chkv1 = "select trx_type,trx_period,emp_code from emp_additions where emp_code='" + empid + "' and trx_type='" + v2id + "' and (Convert(DateTime,trx_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,trx_period,103) <= Convert(DateTime,'" + strendatedmy + "',103))";
                                    dschk1 = DataAccess.FetchRS(CommandType.Text, chkv1, null);
                                    if (dschk1.Tables[0].Rows.Count == 0)
                                    {
                                        if (ratev2 > 0)
                                        {
                                            ssqlv1 = "insert into emp_additions(trx_type,trx_period,trx_amount,emp_code,status,claimstatus) values('" + v2id + "','" + date + "','" + ratev2 + "','" + empid + "','" + status + "'," + "'Approved')";
                                            int retv1 = DataAccess.ExecuteStoreProc(ssqlv1);
                                        }
                                    }
                                    else
                                    {
                                        if (ratev2 <= 0)
                                        {
                                            ssqlv1 = "Delete From emp_additions where emp_code='" + empid + "' and trx_type='" + v2id + "' and (Convert(DateTime,trx_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,trx_period,103) <= Convert(DateTime,'" + strendatedmy + "',103))";
                                            int retv1 = DataAccess.ExecuteStoreProc(ssqlv1);
                                        }
                                        ssqlv1 = "update emp_additions set trx_amount='" + ratev2 + "' where emp_code='" + empid + "' and trx_type='" + v2id + "' and (Convert(DateTime,trx_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,trx_period,103) <= Convert(DateTime,'" + strendatedmy + "',103))";
                                        int retv2 = DataAccess.ExecuteStoreProc(ssqlv1);
                                    }
                                    //variable2 condition -END

                                    //variable3 condition -START
                                    chkv1 = "select trx_type,trx_period,emp_code from emp_additions where emp_code='" + empid + "' and trx_type='" + v3id + "' and (Convert(DateTime,trx_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,trx_period,103) <= Convert(DateTime,'" + strendatedmy + "',103))";
                                    dschk1 = DataAccess.FetchRS(CommandType.Text, chkv1, null);
                                    if (dschk1.Tables[0].Rows.Count == 0)
                                    {
                                        if (ratev3 > 0)
                                        {
                                            ssqlv1 = "insert into emp_additions(trx_type,trx_period,trx_amount,emp_code,status,claimstatus) values('" + v3id + "','" + date + "','" + ratev3 + "','" + empid + "','" + status + "'," + "'Approved')";
                                            int retv1 = DataAccess.ExecuteStoreProc(ssqlv1);
                                        }
                                    }
                                    else
                                    {
                                        if (ratev3 <= 0)
                                        {
                                            ssqlv1 = "Delete From emp_additions where emp_code='" + empid + "' and trx_type='" + v3id + "' and (Convert(DateTime,trx_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,trx_period,103) <= Convert(DateTime,'" + strendatedmy + "',103))";
                                            int retv1 = DataAccess.ExecuteStoreProc(ssqlv1);
                                        }
                                        ssqlv1 = "update emp_additions set trx_amount='" + ratev3 + "' where emp_code='" + empid + "' and trx_type='" + v3id + "' and (Convert(DateTime,trx_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,trx_period,103) <= Convert(DateTime,'" + strendatedmy + "',103))";
                                        int retv2 = DataAccess.ExecuteStoreProc(ssqlv1);
                                    }
                                    //variable3 condition -END

                                    //variable4 condition -START
                                    chkv1 = "select trx_type,trx_period,emp_code from emp_additions where emp_code='" + empid + "' and trx_type='" + v4id + "' and (Convert(DateTime,trx_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,trx_period,103) <= Convert(DateTime,'" + strendatedmy + "',103))";
                                    dschk1 = DataAccess.FetchRS(CommandType.Text, chkv1, null);
                                    if (dschk1.Tables[0].Rows.Count == 0)
                                    {
                                        if (ratev4 > 0)
                                        {
                                            ssqlv1 = "insert into emp_additions(trx_type,trx_period,trx_amount,emp_code,status,claimstatus) values('" + v4id + "','" + date + "','" + ratev4 + "','" + empid + "','" + status + "'," + "'Approved')";
                                            int retv1 = DataAccess.ExecuteStoreProc(ssqlv1);
                                        }
                                    }
                                    else
                                    {
                                        if (ratev4 <= 0)
                                        {
                                            ssqlv1 = "Delete From emp_additions where emp_code='" + empid + "' and trx_type='" + v4id + "' and (Convert(DateTime,trx_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,trx_period,103) <= Convert(DateTime,'" + strendatedmy + "',103))";
                                            int retv1 = DataAccess.ExecuteStoreProc(ssqlv1);
                                        }
                                        ssqlv1 = "update emp_additions set trx_amount='" + ratev4 + "' where emp_code='" + empid + "' and trx_type='" + v4id + "' and (Convert(DateTime,trx_period,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,trx_period,103) <= Convert(DateTime,'" + strendatedmy + "',103))";
                                        int retv2 = DataAccess.ExecuteStoreProc(ssqlv1);
                                    }
                                    //variable4 condition -END

                                    sSQL = "";
                                    if ((empcode == "") && ((i >= 0) || (j >= 0) || (k >= 0) || (l >= 0)))
                                    {
                                        string newdate = strstdatemdy;
                                        int icnt = 0;
                                        //DataSet monthDs = new DataSet();
                                        //string ssql = "sp_GetPayrollMonth";// 0,2009,2
                                        //SqlParameter[] parms = new SqlParameter[3];
                                        //parms[icnt++] = new SqlParameter("@ROWID", "0");
                                        //parms[icnt++] = new SqlParameter("@YEARS", 0);
                                        //parms[icnt++] = new SqlParameter("@PAYTYPE", 0);
                                        //monthDs = DataAccess.ExecuteSPDataSet(ssql, parms);
                                        //DataRow[] drResults = monthDs.Tables[0].Select("RowID = " + cmbMonth.SelectedValue);

                                        //if (cmbMonth.SelectedItem.Text.ToString().ToLower().IndexOf("first") > 0)
                                        //{
                                        //    newdate = drResults[0]["Month"].ToString() + "/" + "01" + "/" + cmbYear.SelectedValue + "";
                                        //}
                                        //else
                                        //{
                                        //    newdate = drResults[0]["Month"].ToString() + "/" + "16" + "/" + cmbYear.SelectedValue + "";
                                        //}
                                        if (Utility.ToDouble(dblv1) > -1000 || Utility.ToDouble(dblv2) > -1000 || Utility.ToDouble(dblv3) > -1000 || Utility.ToDouble(dblv4) > -1000 || Utility.ToDouble(i) > -1000 || Utility.ToDouble(j) > -1000 || Utility.ToDouble(k) > -1000 || Utility.ToDouble(l) > -1000)
                                        {
                                            sSQL = "Insert into emp_overtime (emp_code,overtime1,overtime2,trx_date,trx_month,trx_year,days_work,v1,v2,v3,v4,NH_Work,payrollstdate) values(" + empid + "," + i + "," + j + ", getdate(), " + cmbMonth.SelectedValue + "," + cmbYear.SelectedValue + "," + Utility.ToDouble(k) + "," + Utility.ToDouble(dblv1) + "," + Utility.ToDouble(dblv2) + "," + Utility.ToDouble(dblv3) + "," + Utility.ToDouble(dblv4) + "," + l + ",'" + newdate + "')";
                                        }
                                    }
                                    else if ((empcode != ""))  //&& ( (i != 0) || (j !=0) || (k != 0)))
                                    {
                                        sSQL = "Update emp_overtime set NH_Work=" + l + ", overtime1=" + i + ",overtime2=" + j + ",days_work=" + Utility.ToDouble(k) + ",v1=" + Utility.ToDouble(dblv1) + ",v2=" + Utility.ToDouble(dblv2) + ",v3=" + Utility.ToDouble(dblv3) + ",v4=" + Utility.ToDouble(dblv4) + " where emp_code=" + empcode + " and (Convert(DateTime,PayRollStDate,103) >= Convert(DateTime,'" + strstdatedmy + "',103) And Convert(DateTime,PayRollStDate,103) <= Convert(DateTime,'" + strendatedmy + "',103)) And trx_year=" + cmbYear.SelectedValue; //+ " and id=" + id;
                                    }
                                    try
                                    {
                                        if (sSQL != "")
                                            DataAccess.ExecuteStoreProc(sSQL);
                                    }
                                    catch (Exception msg)
                                    {
                                        lblerror.Text = msg.Message.ToString();     //"Please click the go button and then insert the record for the corresponding month";
                                    }
                                }

                            }
                        }
                    }

                   // RadGrid1.DataBind();


                }

                if (e.CommandName == "CalcOverVar")
                {
                    string time_card_no = "";
                    string srSql;
                    string empcode;
                    string empid;
                    int id;
                    string strInTime = "";
                    string strOutTime = "";
                    string strOT = "";
                    double intot1;
                    double intotcalc;
                    int inthour;
                    int intmin;
                    double inttotmin;
                    double intworkinghours;
                    double intworkingmints;
                    double intworkingtotmin;
                    double intbalancemin = 0;
                    double intdaysworkedhrmin = 0;
                    double intdaysworked = 0;
                    double intdaysworkedhrsmon = 0;
                    double intdaysworkedminmon = 0;

                        
                    //srSql = "Select userid,E.Emp_code,day(CONVERT(datetime,timeentry, 105)) date,convert(varchar, timeentry, 8) timeentry From actatek_logs  A Inner Join Employee E On A.UserID= E.Time_Card_No where upper(A.EventID) Like '%IN%' and A.softdelete=0 and Month(CONVERT(datetime,timeentry, 105) )=" + cmbMonth.SelectedValue + " and year(CONVERT(datetime,timeentry, 105) )=" + cmbYear.SelectedValue + " Order By timeentry";
                    //srSql = srSql + ";Select userid,E.Emp_code,day(CONVERT(datetime,timeentry, 105) ) date,convert(varchar, timeentry, 8) timeentry From actatek_logs  A Inner Join Employee E On A.UserID= E.Time_Card_No where upper(A.EventID) Like '%OUT%' and A.softdelete=0 and Month(CONVERT(datetime,timeentry, 105) )=" + cmbMonth.SelectedValue + " and year(CONVERT(datetime,timeentry, 105) )=" + cmbYear.SelectedValue + " Order By timeentry Desc";
                    //srSql = srSql + ";Select * From DaysInMonth where month=" + cmbMonth.SelectedValue + " and year=" + cmbYear.SelectedValue;
                    //srSql = srSql + ";Select Res.Emp_Code,day(CONVERT(datetime,Res.[month], 103)) [date],ph.ID,datename(dw,CONVERT(datetime,Res.[month], 103)) Day_Name From (Select Em.Emp_Code,Em.Emp_Name,TS.* From (Select 'Time_Card_No' = CASE  WHEN InUserID IS NULL THEN OutUserId Else InUserID END, 'TranID' = CASE  WHEN InTranID IS NULL THEN OutTranID Else InTranID END, 'Month' = CASE  WHEN InMonth IS NULL THEN OutMonth  Else InMonth END, InTime,OutTime,CONVERT(CHAR(5), CONVERT(datetime,InTime, 105), 108) InShortTime,CONVERT(CHAR(5), CONVERT(datetime,OutTime, 105), 108) OutShortTime From(Select TSIN.UserId InUserID,TSIN.TranID InTranID,TSIN.[Month] InMonth,TSIN.TimeEntry as [InTime],TSOUT.UserId OutUserID,TSOUT.TranID OutTranID,TSOUT.[Month] OutMonth,TSOut.TimeEntry as [OutTime] From  (Select  [Month],TranID,UserID,EventID,MIN(CONVERT(datetime,TimeEntry, 103)) TimeEntry From (SELECT *,CONVERT(VARCHAR, CONVERT(datetime,A.TimeEntry, 105), 103) [Month] From ACTATEK_LOGS A ) As Ts Where softdelete=0 and upper(EventID) Like '%IN%' Group By TranID,USerID,EventID,[Month]) TSIN FULL OUTER JOIN( Select [Month],TranID,UserID,EventID,MAX(CONVERT(datetime,TimeEntry, 103)) TimeEntry From (SELECT *,CONVERT(VARCHAR, CONVERT(datetime,A.TimeEntry, 105), 103) [Month] From ACTATEK_LOGS A ) As Ts Where upper(EventID) Like '%OUT%' and softdelete=0 Group By TranID,USerID,EventID,[Month] ) TSOUT On  TSIN.TranID=TSOUT.TranID And TSIN.UserID=TSOUT.UserID And TSIN.[Month]=TSOUT.[Month]) TSOutPut ) TS Inner Join Employee Em On TS.Time_Card_No = Em.Time_Card_No)  [Res]  Left Outer Join public_holidays [ph] On CONVERT(datetime,Res.[month], 103) = CONVERT(datetime,ph.holiday_date, 103) Where year(CONVERT(datetime,Res.[month], 103))= " + cmbYear.SelectedValue + " and Month(CONVERT(datetime,Res.[month], 103))= " + cmbMonth.SelectedValue + "  and datename(dw,CONVERT(datetime,Res.[month], 103)) = 'Sunday' or ph.id is not null Order By Res.[month]";
                    //srSql = srSql + ";Select Time_Card_No, dbo.ConvertToHours(Sum(NH)) NH, dbo.ConvertToHours(Sum(OT1)) OT1, dbo.ConvertToHours(Sum(OT2)) OT2, dbo.ConvertToHours(Sum(TotalHrsWrk)) TotalHrsWrk From (Select	Time_Card_No,dbo.ConvertToMinutes(NH) NH,dbo.ConvertToMinutes(OT1) OT1,dbo.ConvertToMinutes(OT2) OT2,dbo.ConvertToMinutes(TotalHrsWrk) TotalHrsWrk From ApprovedTimeSheet Where Month(TimeEntryStart)=" + cmbMonth.SelectedValue + " and Year(TimeEntryStart)=" + cmbYear.SelectedValue + ") D Group By Time_Card_No";
                    srSql = "Select userid,E.Emp_code,day(CONVERT(datetime,timeentry, 105)) date,convert(varchar, timeentry, 8) timeentry From actatek_logs_proxy  A Inner Join Employee E On A.UserID= E.Time_Card_No where upper(A.EventID) Like '%IN%' and A.softdelete=0 and (CONVERT(datetime,timeentry, 105)>=CONVERT(datetime,'" + rdFrom.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "', 105) And CONVERT(datetime,timeentry, 105)<=CONVERT(datetime,'" + rdEnd.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "', 105))  Order By timeentry";
                    srSql = srSql + ";Select userid,E.Emp_code,day(CONVERT(datetime,timeentry, 105) ) date,convert(varchar, timeentry, 8) timeentry From actatek_logs_proxy  A Inner Join Employee E On A.UserID= E.Time_Card_No where upper(A.EventID) Like '%OUT%' and A.softdelete=0 and (CONVERT(datetime,timeentry, 105)>=CONVERT(datetime,'" + rdFrom.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "', 105) And CONVERT(datetime,timeentry, 105)<=CONVERT(datetime,'" + rdEnd.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "', 105)) Order By timeentry Desc";
                    srSql = srSql + ";Select DATEDIFF(day,Convert(datetime,'" + rdFrom.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "',103),Convert(datetime,'" + rdEnd.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "',103)) calendar_days";
                    srSql = srSql + ";Select Res.Emp_Code,day(CONVERT(datetime,Res.[month], 103)) [date],ph.ID,datename(dw,CONVERT(datetime,Res.[month], 103)) Day_Name From (Select Em.Emp_Code,Em.Emp_Name,TS.* From (Select 'Time_Card_No' = CASE  WHEN InUserID IS NULL THEN OutUserId Else InUserID END, 'TranID' = CASE  WHEN InTranID IS NULL THEN OutTranID Else InTranID END, 'Month' = CASE  WHEN InMonth IS NULL THEN OutMonth  Else InMonth END, InTime,OutTime,CONVERT(CHAR(5), CONVERT(datetime,InTime, 105), 108) InShortTime,CONVERT(CHAR(5), CONVERT(datetime,OutTime, 105), 108) OutShortTime From(Select TSIN.UserId InUserID,TSIN.TranID InTranID,TSIN.[Month] InMonth,TSIN.TimeEntry as [InTime],TSOUT.UserId OutUserID,TSOUT.TranID OutTranID,TSOUT.[Month] OutMonth,TSOut.TimeEntry as [OutTime] From  (Select  [Month],TranID,UserID,EventID,MIN(CONVERT(datetime,TimeEntry, 103)) TimeEntry From (SELECT *,CONVERT(VARCHAR, CONVERT(datetime,A.TimeEntry, 105), 103) [Month] From actatek_logs_proxy A ) As Ts Where softdelete=0 and upper(EventID) Like '%IN%' Group By TranID,USerID,EventID,[Month]) TSIN FULL OUTER JOIN( Select [Month],TranID,UserID,EventID,MAX(CONVERT(datetime,TimeEntry, 103)) TimeEntry From (SELECT *,CONVERT(VARCHAR, CONVERT(datetime,A.TimeEntry, 105), 103) [Month] From actatek_logs_proxy A ) As Ts Where upper(EventID) Like '%OUT%' and softdelete=0 Group By TranID,USerID,EventID,[Month] ) TSOUT On  TSIN.TranID=TSOUT.TranID And TSIN.UserID=TSOUT.UserID And TSIN.[Month]=TSOUT.[Month]) TSOutPut ) TS Inner Join Employee Em On TS.Time_Card_No = Em.Time_Card_No)  [Res]  Left Outer Join public_holidays [ph] On CONVERT(datetime,Res.[month], 103) = CONVERT(datetime,ph.holiday_date, 103) Where (CONVERT(datetime,InTime, 105)>=CONVERT(datetime,'" + rdFrom.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "', 103) And CONVERT(datetime,OutTime, 103)<=CONVERT(datetime,'" + rdEnd.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "', 103))  and datename(dw,CONVERT(datetime,Res.[month], 103)) = 'Sunday' or ph.id is not null Order By Res.[month]";
                    //srSql = srSql + ";Select Time_Card_No, dbo.ConvertToHours(Sum(NH)) NH, dbo.ConvertToHours(Sum(OT1)) OT1, dbo.ConvertToHours(Sum(OT2)) OT2, dbo.ConvertToHours(Sum(TotalHrsWrk)) TotalHrsWrk From (Select	Time_Card_No,dbo.ConvertToMinutes(NH) NH,dbo.ConvertToMinutes(OT1) OT1,dbo.ConvertToMinutes(OT2) OT2,dbo.ConvertToMinutes(TotalHrsWrk) TotalHrsWrk From ApprovedTimeSheet Where (CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) >=CONVERT(datetime,'" + rdFrom.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "',103) And CONVERT(datetime,CONVERT(varchar,TimeEntryEnd,103),103) <=CONVERT(datetime,'" + rdEnd.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "',103))  And SoftDelete=0) D Group By Time_Card_No";
                    srSql = srSql + ";Select Time_Card_No, dbo.ConvertToHours(Sum(NH)) NH, dbo.ConvertToHours(Sum(OT1)) OT1, dbo.ConvertToHours(Sum(OT2)) OT2, dbo.ConvertToHours(Sum(TotalHrsWrk)) TotalHrsWrk From (Select	Time_Card_No,dbo.ConvertToMinutes(NH) NH,dbo.ConvertToMinutes(OT1) OT1,dbo.ConvertToMinutes(OT2) OT2,dbo.ConvertToMinutes(TotalHrsWrk) TotalHrsWrk From ApprovedTimeSheet Where (CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) >=CONVERT(datetime,'" + rdFrom.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "',103) And CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) <=CONVERT(datetime,'" + rdEnd.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "',103))  And SoftDelete=0) D Group By Time_Card_No";
               

                    int intbldcount = 5;

                    DataSet ds = new DataSet();
                    DataSet dsTS = new DataSet();
                    ds = DataAccess.FetchRS(CommandType.Text, srSql, null);
                    int intCountV1 = 0;
                    int intCountV2 = 0;
                    int intCountV3 = 0;
                    int intCountV4 = 0;
                    double v1, v2, v3, v4, wdayperweek;
                    int intdaysinmonth = 0;

                    if (ds.Tables.Count == intbldcount)
                    {
                        if (ds.Tables[2].Rows.Count > 0)
                        {
                            intdaysinmonth = Convert.ToInt32(ds.Tables[2].Rows[0]["calendar_days"]);
                        }
                    }

                    //SqlParameter[] parms1 = new SqlParameter[7];
                    //parms1[0] = new SqlParameter("@start_date", rdFrom.SelectedDate.ToString("dd/MM/yyyy"));
                    //parms1[1] = new SqlParameter("@end_date", rdEnd.SelectedDate.ToString("dd/MM/yyyy"));
                    //parms1[2] = new SqlParameter("@compid", comp_id);
                    //parms1[3] = new SqlParameter("@isEmpty", "No");
                    //parms1[4] = new SqlParameter("@empid", "-1");
                    //parms1[5] = new SqlParameter("@subprojid", "-1");
                    //parms1[6] = new SqlParameter("@sessid", 0);
                    //dsTS = DataAccess.ExecuteSPDataSet("sp_ProcessTimesheet", parms1);



                    foreach (GridItem item in RadGrid1.MasterTableView.Items)
                    {
                        if (item is GridItem)
                        {
                            GridDataItem dataItem = (GridDataItem)item;
                            CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                            if (chkBox.Checked == true)
                            {
                                intCountV1 = 0;
                                intCountV2 = 0;
                                intCountV3 = 0;
                                intCountV4 = 0;
                                srSql = "";
                                empcode = "";
                                empid = "";
                                empcode = Utility.ToString(RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_code"));
                                empid = Utility.ToString(RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("empid"));
                                id = Utility.ToInteger(RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("id"));
                                time_card_no = Utility.ToString(RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("time_card_no"));
                                TextBox txtot1 = (TextBox)dataItem.FindControl("txtovertime");
                                TextBox txtot2 = (TextBox)dataItem.FindControl("txtovertime2");
                                TextBox txtv1 = (TextBox)dataItem.FindControl("txtv1");
                                TextBox txtv2 = (TextBox)dataItem.FindControl("txtv2");
                                TextBox txtv3 = (TextBox)dataItem.FindControl("txtv3");
                                TextBox txtv4 = (TextBox)dataItem.FindControl("txtv4");
                                TextBox txtdayswork = (TextBox)dataItem.FindControl("txtDaysWork");
                                TextBox txtNHWork = (TextBox)dataItem.FindControl("txtNHWork");

                                strInTime = "";
                                strOutTime = "";
                                string ssql9 = "select d.emp_id,isnull(d.status,'') as status from prepare_payroll_detail d,prepare_payroll_hdr h";
                                ssql9 = ssql9 + " where d.trx_id=h.trx_id and d.emp_id='" + empid + "' and month(h.start_period)='" + cmbMonth.SelectedValue + "' and year(h.start_period)='" + cmbYear.SelectedValue + "' and d.status not in('R')";
                                string status;
                                DataSet dsStatus = new DataSet();
                                dsStatus = DataAccess.FetchRS(CommandType.Text, ssql9, null);
                                if (dsStatus.Tables[0].Rows.Count == 0)
                                {
                                    status = "";
                                }
                                else
                                {
                                    status = Convert.ToString(dsStatus.Tables[0].Rows[0]["status"]).ToString();
                                }

                                if (status == "G" || status == "P" || status == "A")
                                {
                                }
                                else
                                {
                                    if (ds.Tables.Count == intbldcount)
                                    {
                                        DataRow[] dr;
                                        DataRow[] drpubholday;

                                        ssqle = "select isnull(v1rate,0) as v1rate, isnull(v2rate,0) as v2rate,isnull(v3rate,0) as v3rate,isnull(v4rate,0) as v4rate, ot_entitlement,pay_frequency, payrate,wdays_per_week from employee where emp_code='" + empid + "'";
                                        //here check if employee is Hourly then one need to just total the hours for each day....
                                        DataSet dsRate = new DataSet();
                                        dsRate = DataAccess.FetchRS(CommandType.Text, ssqle, null);
                                        if (dsRate.Tables[0].Rows.Count == 0)
                                        {
                                            v1 = 0;
                                            v2 = 0;
                                            v3 = 0;
                                            v4 = 0;
                                            wdayperweek = 0;
                                        }
                                        else
                                        {
                                            v1 = Utility.ToDouble(dsRate.Tables[0].Rows[0]["v1rate"].ToString());
                                            v2 = Utility.ToDouble(dsRate.Tables[0].Rows[0]["v2rate"].ToString());
                                            v3 = Utility.ToDouble(dsRate.Tables[0].Rows[0]["v3rate"].ToString());
                                            v4 = Utility.ToDouble(dsRate.Tables[0].Rows[0]["v4rate"].ToString());
                                            wdayperweek = Utility.ToDouble(dsRate.Tables[0].Rows[0]["wdays_per_week"].ToString());
                                            strOT = dsRate.Tables[0].Rows[0]["ot_entitlement"].ToString().Trim().ToUpper();
                                        }


                                        if ((strOT == "Y") || (txtdayswork.Enabled == true))
                                        {
                                            intdaysworkedhrmin = 0;
                                            intdaysworkedhrsmon = 0;
                                            intdaysworkedminmon = 0;
                                            txtot1.Text = "0";
                                            txtot2.Text = "0";
                                            intdaysworked = 0;
                                            intdaysworkedhrmin = Utility.ToDouble(Session["WorkingHours"]) + Utility.ToDouble(Session["WorkingMinutes"]);

                                            if (time_card_no.ToString().Trim().Length > 0)
                                            {
                                                dr = ds.Tables[4].Select("Time_Card_No ='" + time_card_no + "'");

                                                if (dr.Length > 0)
                                                {
                                                    if (dr[0]["NH"].ToString() == "0.00" || dr[0]["NH"].ToString() == "")
                                                    {
                                                        txtNHWork.Text = "";
                                                    }
                                                    else
                                                    {
                                                        if (txtNHWork.Enabled == true)
                                                        {
                                                            txtNHWork.Text = dr[0]["NH"].ToString();
                                                        }
                                                        else
                                                        {
                                                            txtNHWork.Text = "";
                                                        }
                                                        if (txtdayswork.Enabled)
                                                        { 
                                                            if(dr[0]["NH"].ToString()!="0" && dr[0]["NH"].ToString()!="")
                                                            {
                                                                double hours =  Convert.ToDouble(dr[0]["NH"].ToString())/8;
                                                                txtdayswork.Text = hours.ToString();
                                                            }
                                                        }
                                                    }
                                                    if (dr[0]["OT1"].ToString() == "0.00" || dr[0]["OT1"].ToString() == "")
                                                    {
                                                        txtot1.Text = "";
                                                    }
                                                    else
                                                    {
                                                        txtot1.Text = dr[0]["OT1"].ToString();
                                                    }
                                                    if (dr[0]["OT2"].ToString() == "0.00" || dr[0]["OT2"].ToString() == "")
                                                    {
                                                        txtot2.Text = "";
                                                    }
                                                    else
                                                    {
                                                        txtot2.Text = dr[0]["OT2"].ToString();
                                                    }
                                                }
                                            }
                                            for (int i = 1; i <= intdaysinmonth; i++)
                                            {
                                                strInTime = "";
                                                strOutTime = "";
                                                dr = ds.Tables[0].Select("Emp_Code ='" + empid + "' And Date=" + i);

                                                drpubholday = ds.Tables[3].Select("Emp_Code ='" + empid + "' And Date=" + i);

                                                if (dr.Length > 0)
                                                {
                                                    strInTime = dr[0]["timeentry"].ToString();
                                                }

                                                dr = ds.Tables[1].Select("Emp_Code ='" + empid + "' And Date=" + i);

                                                if (dr.Length > 0)
                                                {
                                                    strOutTime = dr[0]["timeentry"].ToString();
                                                }

                                                if (strInTime != "" && strOutTime != "")
                                                {
                                                    #region "DELETED"
                                                    //if (Session["TimeSheetApproved"] != null)
                                                    //{
                                                    //    if (Session["TimeSheetApproved"].ToString() == "1") //Timesheet Approved
                                                    //    {
                                                    //        try
                                                    //        {
                                                    //            DateTime dtIn = DateTime.Parse(strInTime, format);
                                                    //            DateTime dtOut = DateTime.Parse(strOutTime, format);
                                                    //            SMEDateTime timein = new SMEDateTime(dtIn.Hour, dtIn.Minute, dtIn.Second);
                                                    //            SMEDateTime timeout = new SMEDateTime(dtOut.Hour, dtOut.Minute, dtOut.Second);
                                                    //            SMEDateTime smetime = new SMEDateTime();

                                                    //            inthour = SMEDateTime.TimeDiff(timeout, timein).Hour;
                                                    //            intmin = SMEDateTime.TimeDiff(timeout, timein).Minute;
                                                    //            inttotmin = (inthour * 60) + intmin;

                                                    //            intworkinghours = Utility.ToDouble(Session["WorkingHours"]) * 60;
                                                    //            intworkingmints = Utility.ToDouble(Session["WorkingMinutes"]);
                                                    //            intworkingtotmin = intworkinghours + intworkingmints;
                                                    //            intbalancemin = 0;

                                                    //            if (inttotmin > intworkingtotmin) //worked hrs is more than the expected hours i.e ot
                                                    //            {
                                                    //                if (wdayperweek == 5)
                                                    //                {
                                                    //                    if (dtIn.ToString("ddd") == "Sat" || dtIn.ToString("ddd") == "Sun")
                                                    //                    {
                                                    //                        intbalancemin = inttotmin; // For saturday and sunday worked whole day as OT
                                                    //                    }
                                                    //                    else
                                                    //                    {
                                                    //                        intbalancemin = inttotmin - intworkingtotmin; //overtime hour to be charged for regular days
                                                    //                    }
                                                    //                }

                                                    //                if (wdayperweek == 5.5)
                                                    //                {
                                                    //                    if (dtIn.ToString("ddd") == "Sat")
                                                    //                    {
                                                    //                        intbalancemin = inttotmin - (intworkingtotmin / 2); // For saturday and half day as OT
                                                    //                    }
                                                    //                    else if (dtIn.ToString("ddd") == "Sun")
                                                    //                    {
                                                    //                        intbalancemin = inttotmin; // For sunday worked whole day as OT
                                                    //                    }
                                                    //                    else
                                                    //                    {
                                                    //                        intbalancemin = inttotmin - intworkingtotmin; //overtime hour to be charged for regular days
                                                    //                    }
                                                    //                }

                                                    //                if (wdayperweek == 6)
                                                    //                {
                                                    //                    if (dtIn.ToString("ddd") == "Sun")
                                                    //                    {
                                                    //                        intbalancemin = inttotmin; // For sunday worked whole day as OT
                                                    //                    }
                                                    //                    else
                                                    //                    {
                                                    //                        intbalancemin = inttotmin - intworkingtotmin; //overtime hour to be charged for regular days
                                                    //                    }
                                                    //                }
                                                    //                if (wdayperweek == 7)
                                                    //                {
                                                    //                    intbalancemin = inttotmin - intworkingtotmin; //overtime hour to be charged for regular days
                                                    //                }

                                                    //                if (strOT == "Y")
                                                    //                {
                                                    //                    if (intbalancemin > 0)
                                                    //                    {

                                                    //                        if (drpubholday.Length > 0)
                                                    //                        {
                                                    //                            if (drpubholday[0]["id"] != DBNull.Value)
                                                    //                            {
                                                    //                                // This is a Public Holdiday hence whole day worked should be counted
                                                    //                                intot1 = Utility.ToDouble(txtot2.Text);
                                                    //                                intotcalc = Utility.ToDouble(inttotmin / 60) + intot1;
                                                    //                                txtot2.Text = intotcalc.ToString("#0.00");
                                                    //                            }
                                                    //                            else
                                                    //                            {
                                                    //                                //This is a Sunday type of holiday
                                                    //                                intot1 = Utility.ToDouble(txtot2.Text);
                                                    //                                intotcalc = Utility.ToDouble(intbalancemin / 60) + intot1;
                                                    //                                txtot2.Text = intotcalc.ToString("#0.00");
                                                    //                            }
                                                    //                        }
                                                    //                        else
                                                    //                        {
                                                    //                            intot1 = Utility.ToDouble(txtot1.Text);
                                                    //                            intotcalc = Utility.ToDouble(intbalancemin / 60) + intot1;
                                                    //                            txtot1.Text = intotcalc.ToString("#0.00");
                                                    //                        }
                                                    //                    }
                                                    //                    //if OT entitled yes
                                                    //                    intdaysworkedminmon = intdaysworkedminmon + (inttotmin - intbalancemin);
                                                    //                }
                                                    //                else
                                                    //                {
                                                    //                    //if OT Entit is no then all the hours will b treated in days hour worked
                                                    //                    intdaysworkedminmon = intdaysworkedminmon + inttotmin;
                                                    //                }
                                                    //            }
                                                    //            else
                                                    //            {
                                                    //                //total time for the day is worked is less than the actual working time.
                                                    //                string eid = empid;
                                                    //                intbalancemin = Math.Abs(intbalancemin);

                                                    //                if (wdayperweek == 5)
                                                    //                {
                                                    //                    if (dtIn.ToString("ddd") == "Sat" || dtIn.ToString("ddd") == "Sun")
                                                    //                    {
                                                    //                        intbalancemin = inttotmin; // For saturday and sunday worked whole day as OT
                                                    //                    }
                                                    //                    else
                                                    //                    {
                                                    //                        intbalancemin = 0; //overtime hour to be charged for regular days is 0 since it is less 
                                                    //                    }
                                                    //                }

                                                    //                if (wdayperweek == 5.5)
                                                    //                {
                                                    //                    if (dtIn.ToString("ddd") == "Sat")
                                                    //                    {
                                                    //                        if (intbalancemin > (intworkingtotmin / 2)) // For saturday and half day as OT
                                                    //                        {
                                                    //                            intbalancemin = (intbalancemin - (intworkingtotmin / 2));
                                                    //                        }
                                                    //                        else
                                                    //                        {
                                                    //                            intbalancemin = 0;
                                                    //                        }

                                                    //                    }
                                                    //                    else if (dtIn.ToString("ddd") == "Sun")
                                                    //                    {
                                                    //                        // For sunday worked hour which is already calcuated will be done.
                                                    //                    }
                                                    //                    else
                                                    //                    {
                                                    //                        intbalancemin = 0; //overtime hour to be charged for regular days is 0 since it is less 
                                                    //                    }
                                                    //                }

                                                    //                if (wdayperweek == 6)
                                                    //                {
                                                    //                    if (dtIn.ToString("ddd") == "Sun")
                                                    //                    {
                                                    //                        // For sunday worked hour which is already calcuated will be done.
                                                    //                    }
                                                    //                    else
                                                    //                    {
                                                    //                        intbalancemin = 0; //overtime hour to be charged for regular days
                                                    //                    }
                                                    //                }
                                                    //                if (wdayperweek == 7)
                                                    //                {
                                                    //                    intbalancemin = 0; //overtime hour to be charged for regular days
                                                    //                }
                                                    //                if (strOT == "Y")
                                                    //                {
                                                    //                    if (drpubholday.Length > 0)
                                                    //                    {
                                                    //                        if (drpubholday[0]["id"] != DBNull.Value)
                                                    //                        {
                                                    //                            // This is a Public Holdiday hence whole day worked should be counted
                                                    //                            intot1 = Utility.ToDouble(txtot2.Text);
                                                    //                            intotcalc = Utility.ToDouble(inttotmin / 60) + intot1;
                                                    //                            txtot2.Text = intotcalc.ToString("#0.00");
                                                    //                        }
                                                    //                        else
                                                    //                        {
                                                    //                            //This is a Sunday type of holiday
                                                    //                            intot1 = Utility.ToDouble(txtot2.Text);
                                                    //                            intotcalc = Utility.ToDouble(intbalancemin / 60) + intot1;
                                                    //                            txtot2.Text = intotcalc.ToString("#0.00");
                                                    //                        }
                                                    //                    }
                                                    //                    else
                                                    //                    {
                                                    //                        intot1 = Utility.ToDouble(txtot1.Text);
                                                    //                        intotcalc = Utility.ToDouble(intbalancemin / 60) + intot1;
                                                    //                        txtot1.Text = intotcalc.ToString("#0.00");
                                                    //                    }
                                                    //                    //if OT entitled yes
                                                    //                    intdaysworkedminmon = intdaysworkedminmon + (inttotmin - intbalancemin);
                                                    //                }
                                                    //                else
                                                    //                {
                                                    //                    //if OT Entit is no then all the hours will b treated in days hour worked
                                                    //                    intdaysworkedminmon = intdaysworkedminmon + inttotmin;
                                                    //                }
                                                    //            }


                                                    //        }
                                                    //        catch (Exception ex)
                                                    //        {
                                                    //            throw ex;
                                                    //        }
                                                    //    }
                                                    //}
                                                    #endregion

                                                    //If Variable Pay is Applicable...
                                                    if (txtv1.Enabled == true)
                                                    {
                                                        if (Session["V1Formula"] != null)
                                                        {
                                                            if (Session["V1Formula"].ToString() == "1") //DAY
                                                            {
                                                                //intCountV1 = intCountV1 + 1;
                                                                if (txtNHWork.Enabled == true)
                                                                {
                                                                    if (Session["V1FormulaCalc"].ToString() == "")
                                                                    {
                                                                        intCountV1 = Convert.ToInt32(Convert.ToDouble(txtNHWork.Text) / 8);
                                                                    }
                                                                    else 
                                                                    {
                                                                        if(Session["V1FormulaCalc"].ToString()!="0")
                                                                        {
                                                                            intCountV1 = Convert.ToInt32(Convert.ToDouble(txtNHWork.Text) / Convert.ToInt32(Session["V1FormulaCalc"].ToString()));
                                                                        }
                                                                    
                                                                    }
                                                                }

                                                            }
                                                            if (Session["V1Formula"].ToString() == "2") //TIME
                                                            {
                                                                DateTime dtFormulaCalc = DateTime.Parse("2001-01-01 " + Session["V1FormulaCalc"].ToString());
                                                                DateTime dtOut = DateTime.Parse(strOutTime, format);
                                                                if (dtOut.TimeOfDay.Ticks > dtFormulaCalc.TimeOfDay.Ticks)
                                                                {
                                                                    intCountV1 = intCountV1 + 1;
                                                                }
                                                            }
                                                        }
                                                    }

                                                    //If Variable Pay is Applicable...
                                                    if (txtv2.Enabled == true)
                                                    {
                                                        if (Session["V2Formula"] != null)
                                                        {
                                                            if (Session["V2Formula"].ToString() == "1") //DAY
                                                            {
                                                                //intCountV2 = intCountV2 + 1;
                                                                if (txtNHWork.Enabled == true)
                                                                {
                                                                    if (Session["V2FormulaCalc"].ToString() == "")
                                                                    {
                                                                        intCountV2 = Convert.ToInt32(Convert.ToDouble(txtNHWork.Text) / 8);
                                                                    }
                                                                    else
                                                                    {
                                                                        if (Session["V2FormulaCalc"].ToString() != "0")
                                                                        {
                                                                            intCountV2 = Convert.ToInt32(Convert.ToDouble(txtNHWork.Text) / Convert.ToInt32(Session["V2FormulaCalc"].ToString()));
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            if (Session["V2Formula"].ToString() == "2") //TIME
                                                            {
                                                                DateTime dtFormulaCalc = DateTime.Parse("2001-01-01 " + Session["V2FormulaCalc"].ToString());
                                                                DateTime dtOut = DateTime.Parse(strOutTime, format);
                                                                if (dtOut.TimeOfDay.Ticks > dtFormulaCalc.TimeOfDay.Ticks)
                                                                {
                                                                    intCountV2 = intCountV2 + 1;
                                                                }
                                                            }
                                                        }
                                                    }

                                                    //If Variable Pay is Applicable...
                                                    if (txtv3.Enabled == true)
                                                    {
                                                        if (Session["V3Formula"] != null)
                                                        {
                                                            if (Session["V3Formula"].ToString() == "1") //DAY
                                                            {
                                                                //intCountV3 = intCountV3 + 1;
                                                                if (txtNHWork.Enabled == true)
                                                                {
                                                                    if (Session["V3FormulaCalc"].ToString() == "")
                                                                    {
                                                                        intCountV3 = Convert.ToInt32(Convert.ToDouble(txtNHWork.Text) / 8);
                                                                    }
                                                                    else
                                                                    {
                                                                        if (Session["V3FormulaCalc"].ToString() != "0")
                                                                        {
                                                                            intCountV3 = Convert.ToInt32(Convert.ToDouble(txtNHWork.Text) / Convert.ToInt32(Session["V3FormulaCalc"].ToString()));
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            if (Session["V3Formula"].ToString() == "2") //TIME
                                                            {
                                                                DateTime dtFormulaCalc = DateTime.Parse("2001-01-01 " + Session["V3FormulaCalc"].ToString());
                                                                DateTime dtOut = DateTime.Parse(strOutTime, format);
                                                                if (dtOut.TimeOfDay.Ticks > dtFormulaCalc.TimeOfDay.Ticks)
                                                                {
                                                                    intCountV3 = intCountV3 + 1;
                                                                }
                                                            }
                                                        }
                                                    }


                                                    //If Variable Pay is Applicable...
                                                    if (txtv4.Enabled == true)
                                                    {
                                                        if (Session["V4Formula"] != null)
                                                        {
                                                            if (Session["V4Formula"].ToString() == "1") //DAY
                                                            {
                                                                //intCountV4 = intCountV4 + 1;
                                                                if (txtNHWork.Enabled == true)
                                                                {
                                                                    if (Session["V4FormulaCalc"].ToString() == "")
                                                                    {
                                                                        intCountV4 = Convert.ToInt32(Convert.ToDouble(txtNHWork.Text) / 8);
                                                                    }
                                                                    else
                                                                    {
                                                                        if (Session["V4FormulaCalc"].ToString() != "0")
                                                                        {
                                                                            intCountV4 = Convert.ToInt32(Convert.ToDouble(txtNHWork.Text) / Convert.ToInt32(Session["V4FormulaCalc"].ToString()));
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            if (Session["V4Formula"].ToString() == "2") //TIME
                                                            {
                                                                DateTime dtFormulaCalc = DateTime.Parse("2001-01-01 " + Session["V4FormulaCalc"].ToString());
                                                                DateTime dtOut = DateTime.Parse(strOutTime, format);
                                                                if (dtOut.TimeOfDay.Ticks > dtFormulaCalc.TimeOfDay.Ticks)
                                                                {
                                                                    intCountV4 = intCountV4 + 1;
                                                                }
                                                            }
                                                        }
                                                    }

                                                    //Calculates only when intime and outime is presetn
                                                    intdaysworkedhrsmon = intdaysworkedminmon / 60;
                                                    intdaysworked = (intdaysworkedhrsmon / intdaysworkedhrmin);

                                                }
                                            }


                                            #region Deleted

                                            //if (intdaysworked > 0)
                                            //{
                                            //    txtdayswork.Text = intdaysworked.ToString("#0.00");
                                            //}
                                            #endregion
                                        }

                                        //If Variable Pay is Applicable...
                                        if (txtv1.Enabled == true)
                                        {
                                            txtv1.Text = Convert.ToString(intCountV1);
                                            //Check for Formula As Day or not 
                                        }
                                        if (txtv2.Enabled == true)
                                        {
                                            txtv2.Text = Convert.ToString(intCountV2);
                                        }
                                        if (txtv3.Enabled == true)
                                        {
                                            txtv3.Text = Convert.ToString(intCountV3);
                                        }
                                        if (txtv4.Enabled == true)
                                        {
                                            txtv4.Text = Convert.ToString(intCountV4);
                                        }
                                        //Check for Approved TimeSheet Data If data is there then 
                                        //Get Data From Approved TimeSheet and then show the data in the ApprovedTimeSheet Data 

                                        string srSqlTS = "Select Time_Card_No, dbo.ConvertToHours(Sum(NH)) NH, dbo.ConvertToHours(Sum(OT1)) OT1, dbo.ConvertToHours(Sum(OT2)) OT2, dbo.ConvertToHours(Sum(TotalHrsWrk)) TotalHrsWrk,sum(v1) v1,sum(v2) v2,sum(v3) v3,sum(v4) v4  From (Select	Time_Card_No,dbo.ConvertToMinutes(NH) NH,dbo.ConvertToMinutes(OT1) OT1,dbo.ConvertToMinutes(OT2) OT2,dbo.ConvertToMinutes(TotalHrsWrk) TotalHrsWrk,v1,v2,v3,v4 From ApprovedTimeSheet Where (CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) >=CONVERT(datetime,'" + rdFrom.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "',103) And CONVERT(datetime,CONVERT(varchar,TimeEntryStart,103),103) <=CONVERT(datetime,'" + rdEnd.SelectedDate.Value.ToString("dd/MM/yyyy", format) + "',103))  And SoftDelete=0) D Group By Time_Card_No";
                                        DataSet dsTs_New = new DataSet();

                                        dsTs_New = DataAccess.FetchRS(CommandType.Text, srSqlTS, null);
                                        if (dsTs_New != null)
                                        {
                                            if (dsTs_New.Tables.Count > 0)
                                            {
                                                DataRow[] drTS;
                                                drTS = dsTs_New.Tables[0].Select("Time_Card_No ='" + time_card_no + "'");

                                                 if (drTS.Length > 0)
                                                 {
                                                     if (drTS[0]["v1"].ToString() != "0" || drTS[0]["v1"].ToString() != "")
                                                     {
                                                         if (txtv1.Enabled == true)
                                                         {
                                                             txtv1.Text = Convert.ToString(drTS[0]["v1"].ToString());
                                                             //Check for Formula As Day or not 
                                                         }
                                                     }
                                                     if (drTS[0]["v2"].ToString() != "0" || drTS[0]["v2"].ToString() != "")
                                                     {
                                                         if (txtv2.Enabled == true)
                                                         {
                                                             txtv2.Text = Convert.ToString(drTS[0]["v2"].ToString());
                                                             //Check for Formula As Day or not 
                                                         }
                                                     }

                                                     if (drTS[0]["v3"].ToString() != "0" || drTS[0]["v3"].ToString() != "")
                                                     {
                                                         if (txtv3.Enabled == true)
                                                         {
                                                             txtv3.Text = Convert.ToString(drTS[0]["v3"].ToString());
                                                             //Check for Formula As Day or not 
                                                         }
                                                     }

                                                     if (drTS[0]["v4"].ToString() != "0" || drTS[0]["v4"].ToString() != "")
                                                     {
                                                         if (txtv4.Enabled == true)
                                                         {
                                                             txtv4.Text = Convert.ToString(drTS[0]["v4"].ToString());
                                                             //Check for Formula As Day or not 
                                                         }
                                                     }
                                                 }
                                            }
                                        }

                                    }
                                }
                            }
                        }
                    }
                }
                ((Button)commandItem.FindControl("btnsubmit")).Enabled = true;
                ((Button)commandItem.FindControl("btnCalcOverVar")).Enabled = true;
            }

            
        }

        void MonthFill()
        {
            int i = 0;
            string ssql = "sp_GetPayrollMonth";// 0,2009,2
            SqlParameter[] parms = new SqlParameter[3];
            parms[i++] = new SqlParameter("@ROWID", "0");
            parms[i++] = new SqlParameter("@YEARS", 0);
            parms[i++] = new SqlParameter("@PAYTYPE", Session["PAYTYPE"].ToString());
            monthDs = DataAccess.ExecuteSPDataSet(ssql, parms);
            dtFilterFound = new DataTable();
            dtFilterFound = monthDs.Tables[0].Clone();

            if (Session["ROWID"] == null)
            {
                foundRows = monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "'");
                foreach (DataRow dr in monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "'"))
                {
                    dtFilterFound.ImportRow(dr);
                }
            }
            else
            {
                if (Session["ROWYEAR"] != null)
                {
                    foundRows = monthDs.Tables[0].Select("YEAR = '" + Session["ROWYEAR"].ToString() + "'");
                    foreach (DataRow dr in monthDs.Tables[0].Select("YEAR = '" + Session["ROWYEAR"].ToString() + "'"))
                    {
                        dtFilterFound.ImportRow(dr);
                    }
                }
                else
                {
                    foundRows = monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "'");
                    foreach (DataRow dr in monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "'"))
                    {
                        dtFilterFound.ImportRow(dr);
                    }
                
                }
            }

            //if (PayrollType == 0)
            //{
            //    foundRows = monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "'");
            //    foreach (DataRow dr in monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "'"))
            //    {
            //        dtFilterFound.ImportRow(dr);
            //    }
            //}
            //else
            //{
            //    foundRows = monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "' And PAYTYPE='" + PayrollType.ToString() + "'");
            //    foreach (DataRow dr in monthDs.Tables[0].Select("YEAR = '" + cmbYear.SelectedValue + "' And PAYTYPE='" + PayrollType.ToString() + "'"))
            //    {
            //        dtFilterFound.ImportRow(dr);
            //    }
            //}

            cmbMonth.DataSource = dtFilterFound;
            cmbMonth.DataTextField = "MonthName";
            cmbMonth.DataValueField = "RowID";
            cmbMonth.DataBind();
            SetControlDate(cmbMonth.SelectedValue);
        }

        void SetControlDate(string mon)
        {
            IFormatProvider format = new System.Globalization.CultureInfo("en-GB", true);
            DataRow[] drResults = monthDs.Tables[0].Select("RowID = " + mon);
            foreach (DataRow dr in drResults)
            {
                Session["PayStartDay"] = dr["PayStartDay"].ToString();
                Session["PayEndDay"] = dr["PayEndDay"].ToString();
                Session["PaySubStartDay"] = dr["PaySubStartDay"].ToString();
                Session["PaySubEndDay"] = dr["PaySubEndDay"].ToString();
                Session["PaySubStartDate"] = dr["PaySubStartDate"].ToString();
                Session["PaySubEndDate"] = dr["PaySubEndDate"].ToString();
                strstdatemdy = Convert.ToDateTime(Session["PaySubStartDate"].ToString()).ToString("MM/dd/yyyy", format);
                strendatemdy = Convert.ToDateTime(Session["PaySubEndDate"].ToString()).ToString("MM/dd/yyyy", format);
                strstdatedmy = Convert.ToDateTime(Session["PaySubStartDate"].ToString()).ToString("dd/MM/yyyy", format);
                strendatedmy = Convert.ToDateTime(Session["PaySubEndDate"].ToString()).ToString("dd/MM/yyyy", format);

                rdFrom.DbSelectedDate = Utility.ToString(dr["PaySubStartDate"].ToString());
                rdEnd.DbSelectedDate = Utility.ToString(dr["PaySubEndDate"].ToString());
            }
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (Session["ROWID"] == null)
            {
            }
            else
            {
                if (intcnt == 1)
                {
                    cmbMonth.SelectedValue = Utility.ToString(Session["ROWID"]);
                    cmbYear.SelectedValue = Utility.ToString(Session["ROWYEAR"]);
                }
                else
                {
                    if (IsPostBack == true)
                    {
                        MonthFill();
                    }
                    cmbMonth.SelectedValue = Utility.ToString(Session["ROWID"]);
                    cmbYear.SelectedValue = Utility.ToString(Session["ROWYEAR"]);
                    SetControlDate(cmbMonth.SelectedValue);
                }
            }

        }




        //Toolbar
        #region Toolbar and Exporting

        //column to hide wile export
        protected void HideGridColumnseExport()
        {
            RadGrid1.MasterTableView.GetColumn("TemplateColumn").Visible = false;
            RadGrid1.MasterTableView.GetColumn("GridClientSelectColumn").Visible = false;// UniqueName="DeleteColumn"
        }

        protected void tbRecord_ButtonClick(object sender, Telerik.Web.UI.RadToolBarEventArgs e)
        {
            if (e.Item.Text == "Excel" || e.Item.Text == "Word")
            {
                HideGridColumnseExport();
            }

            GridSettingsPersister obj2 = new GridSettingsPersister();
            obj2.ToolbarButtonClick(e, RadGrid1, Utility.ToString(Session["Username"]));

        }

        protected void LoadGridSettingsPersister()//call directly from page load
        {
            GridSettingsPersister obj = new GridSettingsPersister();
            obj.GrabGridSettingsPersister(Utility.ToString(Session["Username"]), RadGrid1);
        }

        protected void RadGrid1_GridExporting(object source, GridExportingArgs e)
        {
            GridSettingsPersister obj1 = new GridSettingsPersister();
            obj1.ExportGridHeader("102", Session["CompanyName"].ToString(), Session["Emp_Name"].ToString(), e);

        }


        #endregion
        //Toolbar End

    }
}
