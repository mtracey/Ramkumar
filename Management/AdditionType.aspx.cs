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


namespace SMEPayroll.Management
{
    public partial class AdditionType : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;

        int compid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            compid = Utility.ToInteger(Session["Compid"].ToString());
            /* To disable Grid filtering options  */
            GridFilterMenu menu = RadGrid1.FilterMenu;
            int i = 0;

            while (i < menu.Items.Count)
            {
                menu.Items.RemoveAt(i);
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
        private static DataSet GetDataSet(string query)
        {
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, query, null);
            return ds;
        }
        private DataSet AdditionDetails
        {
            get
            {
                DataSet ds = new DataSet();
                string sSQL = "";
                int compID = Utility.ToInteger(Session["Compid"].ToString());
                if (compID == 1)
                    sSQL = "SELECT  Replace ([desc],'''' ,'') [desc], [id],cpf,company_id,isnull(type_of_wage,'O')typeofwage,optionselection,code,formulatype,formulacalc,tax_payable,tax_payable_options, TypeOfWageDesc=Case When (Type_Of_Wage is null Or Type_Of_Wage='O') Then 'Ordinary' When Type_Of_Wage='A' Then 'Additional' Else '' End,isShared,AccountCode FROM [additions_types] where company_id= " + compID + " or company_id=-1  Order by [OptionSelection],[Desc]";
                else
                    sSQL = "SELECT  Replace ([desc],'''' ,'') [desc], [id],cpf,company_id,isnull(type_of_wage,'O')typeofwage,optionselection,code,formulatype,formulacalc,tax_payable,tax_payable_options, TypeOfWageDesc=Case When (Type_Of_Wage is null Or Type_Of_Wage='O') Then 'Ordinary' When Type_Of_Wage='A' Then 'Additional' Else '' End,isShared,AccountCode FROM [additions_types] where company_id= " + compID + "  Order by [OptionSelection],[Desc]";

                ds = GetDataSet(sSQL);
                return ds;
            }
        }
        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            this.RadGrid1.DataSource = this.AdditionDetails;
        }


        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if ((Utility.AllowedAction1(Session["Username"].ToString(), "Manage Addition Types")) == false)
            {
                RadGrid1.MasterTableView.CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.None;
                RadGrid1.MasterTableView.GetColumn("DeleteColumn").Visible = false;
                RadGrid1.MasterTableView.GetColumn("EditColumn").Visible = false;
            }
            else
            {
                if (e.Item.ItemType == GridItemType.Item || e.Item.ItemType == GridItemType.AlternatingItem)
                {
                    GridEditableItem editedItem = e.Item as GridEditableItem;
                    string strSystemDefined = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["company_id"]);
                    if (strSystemDefined == "-1")
                    {
                        GridDataItem dataItem = e.Item as GridDataItem;
                        dataItem.Cells[9].Controls[0].Visible = false;
                        dataItem.Cells[10].Controls[0].Visible = false;
                    }
                }
            }

            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string strvar = dataItem["OptionSelection"].Text.ToString();

                if (Utility.ToString(strvar).ToUpper() == "VARIABLE")
                {
                    dataItem.Cells[10].Controls[0].Visible = false;
                }
            }


        }

        protected void RadGrid1_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem editedItem = e.Item as GridEditableItem;
                string id = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["id"]);

                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, "Select count(*) cnt from emp_additions where trx_type=" + id, null);
                if (dr.Read())
                {
                    if (dr[0].ToString() != "0")
                    {
                        RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete the addition type.This addition type is in use."));
                    }
                    else
                    {
                        SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.Text, "select company_id from [additions_types] where [id]=" + id, null);
                        if (dr1.Read())
                        {
                            if (dr1[0].ToString() == "-1")
                            {
                                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete the addition type.This is a fixed addition type and cannot be deleted."));
                            }
                            else
                            {
                                string sSQL = "DELETE FROM [additions_types] WHERE [id] =" + id;

                                int retVal = DataAccess.ExecuteStoreProc(sSQL);

                                if (retVal == 1)
                                {
                                    RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Addition type  is deleted."));

                                }
                                else
                                {
                                    RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete the addition type."));
                                }
                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                string ErrMsg = ex.Message;
                if (ErrMsg.IndexOf("REFERENCE constraint", 1) > 0)
                    ErrMsg = "<font color = 'Red'>Record can not be deleted becuase of REFERENCE constraint. This record is called in other tables</font>";
                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to delete record. Reason:</font> " + ErrMsg));
                e.Canceled = true;
            }

        }

        protected void RadGrid1_InsertCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);

            string cpf = (userControl.FindControl("drpcpf") as DropDownList).SelectedItem.Value;
            string type_of_wage = (userControl.FindControl("drpWage") as DropDownList).SelectedItem.Value;
            string optionselection = (userControl.FindControl("rbllist") as RadioButtonList).SelectedItem.Value;
            string strdrptax_payable = (userControl.FindControl("drptax_payable") as DropDownList).SelectedItem.Value;
            string strdrptax_payable_options = (userControl.FindControl("drptax_payable_options") as DropDownList).SelectedItem.Value;
            string accountcode = (userControl.FindControl("txtAccountCode") as TextBox).Text;
            DropDownList drp = (userControl.FindControl("drpShared") as DropDownList);

            // IF an addition is not CPF payable then type of wage would always be Ordinary
            if (cpf == "No")
                type_of_wage = "O";
            string addtype = (userControl.FindControl("txtaddtype") as TextBox).Text;
            int i = 0;

           

            //validation to check whether the addition and deduction with same name exist
            #region Validation
            //string SQLLastOrderNo = "select [desc] from [deductions_types] where [desc]='" + addtype + "' and company_id='" + compid + "' union select [desc] from [additions_types] where [desc]='" + addtype + "'and company_id='" + compid + "'";
            //SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, SQLLastOrderNo, null);
            //if (dr.HasRows)
            //{
            //    RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Addition Type Exist Already in Addition or Detection </font> "));
            //    e.Canceled = true;
            //}

            //else
            //{
            #endregion
            #region Validation New-check whether first 'select' is selected
            if (strdrptax_payable_options == "" && strdrptax_payable == "Yes")
            {
                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Please Select Tax Payble. </font> "));
                e.Canceled = true;
            }
            else
            #endregion

            {
             //
                SqlParameter[] parms = new SqlParameter[9];
                parms[i++] = new SqlParameter("@desc", Utility.ToString(addtype));
                parms[i++] = new SqlParameter("@cpf", Utility.ToString(cpf));
                parms[i++] = new SqlParameter("@company_id", compid);
                parms[i++] = new SqlParameter("@type_of_wage", Utility.ToString(type_of_wage));
                parms[i++] = new SqlParameter("@optionselection", optionselection);
                parms[i++] = new SqlParameter("@tax_payable", strdrptax_payable);
                parms[i++] = new SqlParameter("@tax_payable_options", strdrptax_payable_options);
                parms[i++] = new SqlParameter("@accountcode", accountcode);

                if (drp == null)
                {
                    parms[i++] = new SqlParameter("@typeshared", "NO");
                }
                else
                {
                    parms[i++] = new SqlParameter("@typeshared", drp.SelectedItem.Value.ToString());
                }

                //new code
                //RadioButtonList rbl_rbllist = (userControl.FindControl("rbllist") as RadioButtonList);
                //if (rbl_rbllist.SelectedValue == "Claim")
                //{
                //    DropDownList drp_Capping = (userControl.FindControl("DropDown_Capping") as DropDownList);
                //    DropDownList Drp_PaymentType = (userControl.FindControl("DropDown_PaymentType") as DropDownList);
                //    parms[i++] = new SqlParameter("@Capping", drp_Capping.SelectedValue);
                //    parms[i++] = new SqlParameter("@payroll_PeddyCash", Drp_PaymentType.SelectedValue);
                //}
                //else
                //{
                //    parms[i++] = new SqlParameter("@Capping", "");
                //    parms[i++] = new SqlParameter("@payroll_PeddyCash", "");
                //}
                //

                string sSQL = "sp_addtype_add";
                try
                {
                    int retVal = DataAccess.ExecuteStoreProc(sSQL, parms);
                }
                catch (Exception ex)
                {
                    string ErrMsg = ex.Message;
                    if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                    {
                        ErrMsg = "<font color = 'Red'>Addition Type already Exists.</font>";
                        RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to add Addition Type. Reason:</font> " + ErrMsg));
                        e.Canceled = true;
                    }
                }
            }
        }



        protected void RadGrid1_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {

            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
            object id = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["id"];

            string cpf = (userControl.FindControl("drpcpf") as DropDownList).SelectedItem.Value;
            string type_of_wage = (userControl.FindControl("drpWage") as DropDownList).SelectedItem.Value;
            string optionselection = (userControl.FindControl("rbllist") as RadioButtonList).SelectedItem.Value;
            string addtype = (userControl.FindControl("txtaddtype") as TextBox).Text;
            int intdrpfor = Convert.ToInt16((userControl.FindControl("drpfor") as DropDownList).SelectedItem.Value);
            string strtxtFormulaCalc = (userControl.FindControl("txtFormulaCalc") as TextBox).Text;
            string strtxtCode = (userControl.FindControl("txtCode") as TextBox).Text;

            string strdrptax_payable = (userControl.FindControl("drptax_payable") as DropDownList).SelectedItem.Value;
            string strdrptax_payable_options = (userControl.FindControl("drptax_payable_options") as DropDownList).SelectedItem.Value;

            // IF an addition is not CPF payable then type of wage would always be Ordinary
            if (cpf == "No")
                type_of_wage = "O";

            //Option Selection chanage
            if ((userControl.FindControl("txtaddtype") as TextBox).Enabled == true)
            {
                if (optionselection == "Claim")
                {
                    intdrpfor = 0;
                    string ssqlopt = "select trx_type from emp_additions where status='L' and trx_type=(select id from additions_types where Replace ([desc],'''' ,'')='" + addtype + "' and company_id='" + compid + "')";
                    DataSet ds = new DataSet();
                    ds = DataAccess.FetchRS(CommandType.Text, ssqlopt, null);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string sMsg = "Cannot Update record since  payroll has already been processed";
                        sMsg = "<SCRIPT language='Javascript'>alert('" + sMsg + "');</SCRIPT>";
                        Response.Write(sMsg);
                        return;

                    }
                }

                if (optionselection == "General")
                {
                    intdrpfor = 0;
                    string ssqlopt1 = "select trx_type from emp_additions where status='L' And trx_type=(select id from additions_types where Replace ([desc],'''' ,'')='" + addtype + "' and company_id='" + compid + "')";
                    DataSet ds1 = new DataSet();
                    ds1 = DataAccess.FetchRS(CommandType.Text, ssqlopt1, null);
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        string sMsg = "Cannot Update record since  payroll has already been processed";
                        sMsg = "<SCRIPT language='Javascript'>alert('" + sMsg + "');</SCRIPT>";
                        Response.Write(sMsg);
                        return;

                    }
                }
            }

            if (optionselection == "Variable")
            {
                if (strtxtCode == "V1")
                {
                    Session["V1ID"] = id.ToString();
                    if (addtype.ToString().Length > 20)
                    {
                        Session["V1Text"] = addtype.ToString().Substring(1, 20);
                    }
                    else
                    {
                        Session["V1Text"] = addtype.ToString();
                    }
                    Session["V1Formula"] = intdrpfor.ToString();
                    Session["V1FormulaCalc"] = strtxtFormulaCalc.ToString();
                }
                if (strtxtCode == "V2")
                {
                    Session["V2ID"] = id.ToString();
                    if (addtype.ToString().Length > 20)
                    {
                        Session["V2Text"] = addtype.ToString().Substring(1, 20);
                    }
                    else
                    {
                        Session["V2Text"] = addtype.ToString();
                    }
                    Session["V2Formula"] = intdrpfor.ToString();
                    Session["V2FormulaCalc"] = strtxtFormulaCalc.ToString();
                }
                if (strtxtCode == "V3")
                {
                    Session["V3ID"] = id.ToString();
                    if (addtype.ToString().Length > 20)
                    {
                        Session["V3Text"] = addtype.ToString().Substring(1, 20);
                    }
                    else
                    {
                        Session["V3Text"] = addtype.ToString();
                    }
                    Session["V3Formula"] = intdrpfor.ToString();
                    Session["V3FormulaCalc"] = strtxtFormulaCalc.ToString();
                }
                if (strtxtCode == "V4")
                {
                    Session["V4ID"] = id.ToString();
                    if (addtype.ToString().Length > 20)
                    {
                        Session["V4Text"] = addtype.ToString().Substring(1, 20);
                    }
                    else
                    {
                        Session["V4Text"] = addtype.ToString();
                    }
                    Session["V4Formula"] = intdrpfor.ToString();
                    Session["V4FormulaCalc"] = strtxtFormulaCalc.ToString();
                }
            }


            DropDownList drp = (userControl.FindControl("drpShared") as DropDownList);
            string accountcode = (userControl.FindControl("txtAccountCode") as TextBox).Text;

            //validation to check whether the addition and deduction with same name exist
            #region Validation
                //string SQLLastOrderNo = "select [desc] from [deductions_types] where [desc]='" + addtype + "' and company_id='" + compid + "' union select [desc] from [additions_types] where [desc]='" + addtype + "'and company_id='" + compid + "'";
                //SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, SQLLastOrderNo, null);
                //if (dr.HasRows)
                //{
                //    RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Addition Type Exist Already in Addition or Detection </font> "));
                //    e.Canceled = true;
                //}

                //else
                //{
            #endregion
            #region Validation New-check whether first 'select' is selected
            if (strdrptax_payable_options == "" && strdrptax_payable=="Yes")
            {
                RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Please Select Tax Payble. </font> "));
                e.Canceled = true;
            }
            else
            #endregion
            //
            {
                int i = 0;
                SqlParameter[] parms = new SqlParameter[13];
                parms[i++] = new SqlParameter("@desc", Utility.ToString(addtype));
                parms[i++] = new SqlParameter("@cpf", Utility.ToString(cpf));
                parms[i++] = new SqlParameter("@id", id);
                parms[i++] = new SqlParameter("@type_of_wage", Utility.ToString(type_of_wage));
                parms[i++] = new SqlParameter("@optionselection", optionselection);
                parms[i++] = new SqlParameter("@formulatype", intdrpfor);
                parms[i++] = new SqlParameter("@formulacalc", strtxtFormulaCalc);
                parms[i++] = new SqlParameter("@tax_payable", strdrptax_payable);
                parms[i++] = new SqlParameter("@tax_payable_options", strdrptax_payable_options);
                parms[i++] = new SqlParameter("@accountcode", accountcode);

                if (drp == null)
                {
                    parms[i++] = new SqlParameter("@typeshared", "NO");
                }
                else
                {
                    parms[i++] = new SqlParameter("@typeshared", drp.SelectedItem.Value.ToString());
                }


                //new code
                //RadioButtonList rbl_rbllist = (userControl.FindControl("rbllist") as RadioButtonList);
                //if (rbl_rbllist.SelectedValue == "Claim")
                //{
                //    DropDownList drp_Capping = (userControl.FindControl("DropDown_Capping") as DropDownList);
                //    DropDownList Drp_PaymentType = (userControl.FindControl("DropDown_PaymentType") as DropDownList);
                //    parms[i++] = new SqlParameter("@Capping", drp_Capping.SelectedValue);
                //    parms[i++] = new SqlParameter("@payroll_PeddyCash", Drp_PaymentType.SelectedValue);
                //}
                //else
                //{
                //    parms[i++] = new SqlParameter("@Capping", "");
                //    parms[i++] = new SqlParameter("@payroll_PeddyCash", "");
                //}
                //
                string sSQL = "sp_addtype_update";
                try
                {
                    int retVal = DataAccess.ExecuteStoreProc(sSQL, parms);
                }
                catch (Exception ex)
                {
                    string ErrMsg = ex.Message;
                    if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                    {
                        ErrMsg = "<font color = 'Red'>Addition Type already Exists.</font>";
                        RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to update Addition Type. Reason:</font> " + ErrMsg));
                        e.Canceled = true;
                    }
                }
            }
        }
    }
}
