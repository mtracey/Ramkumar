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
using System.Text;


namespace SMEPayroll.Payroll
{
    public partial class ClaimAddtitions : System.Web.UI.Page
    {
        string strMessage = "";
        StringBuilder strFailMailMsg = new StringBuilder();
        StringBuilder strPassMailMsg = new StringBuilder();
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        static string varFileName = "";

        int compid;
        string varEmpCode = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            SqlDataSource2.ConnectionString = Session["ConString"].ToString();
            compid = Utility.ToInteger(Session["Compid"]);


            if (!IsPostBack)
            {

                #region Yeardropdown
                cmbYear.DataBind();
                #endregion  
                varEmpCode = Session["EmpCode"].ToString();


                DataSet ds_employee = new DataSet();
                ds_employee = getDataSet("SELECT [emp_code], isnull([emp_name],'')+' '+isnull([emp_lname],'') 'emp_name'  FROM [employee] where termination_date is null  and company_id=" + compid + " order by emp_name");
                drpemp.DataSource = ds_employee.Tables[0];
                drpemp.DataTextField = ds_employee.Tables[0].Columns["emp_name"].ColumnName.ToString();
                drpemp.DataValueField = ds_employee.Tables[0].Columns["emp_code"].ColumnName.ToString();
                drpemp.DataBind();
                string empid = Utility.ToString(DataBinder.Eval(Dataitem, "emp_code"));
                drpemp.SelectedValue = varEmpCode.ToString();
                cmbYear.SelectedValue = System.DateTime.Now.Year.ToString();

                string SQLQuery;
                SQLQuery = "select count(emp_code) from employee where company_id=" + compid + " and emp_code=" + varEmpCode + " and GroupId in(select GroupId from usergroups where company_id=" + compid + " and GroupName='Super Admin')";

                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, SQLQuery, null);
                if (dr.Read())
                {
                    if (Utility.ToInteger(dr[0].ToString()) > 0)
                    {
                        drpemp.Enabled = true;
                    }
                    else
                    {
                        drpemp.Enabled = false;
                    }
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

        protected void RadGrid1_InsertCommand(object source, GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);

            string empcode = (userControl.FindControl("drpemployee") as DropDownList).SelectedItem.Value;
            string addtype = (userControl.FindControl("drpaddtype") as DropDownList).SelectedItem.Value;
            string amount = (userControl.FindControl("txtamt") as TextBox).Text;
            string approver = (userControl.FindControl("lblsupervisor") as Label).Text;
            RadUpload uploader = (userControl.FindControl("RadUpload1")) as RadUpload;
            string claimRemarks = (userControl.FindControl("claimRemark") as TextBox).Text; 
            varFileName = "";
            string uploadpath = "../" + "Documents" + "/" + compid + "/" + empcode + "/" + "Claims";



            if (uploader.UploadedFiles.Count != 0)
            {
                if (Directory.Exists(Server.MapPath(uploadpath)))
                {
                    if (File.Exists(Server.MapPath(uploadpath) + "/" + uploader.UploadedFiles[0].GetName()))
                    {
                        string sMsg = "File Already Exist";
                        sMsg = "<SCRIPT language='Javascript'>alert('" + sMsg + "');</SCRIPT>";
                        Response.Write(sMsg);
                        return;
                    }
                    else
                    {
                        varFileName = Server.MapPath(uploadpath) + "/" + uploader.UploadedFiles[0].GetName();
                        uploader.UploadedFiles[0].SaveAs(varFileName);
                        varFileName = uploader.UploadedFiles[0].GetName();
                    }
                }
                else

                    Directory.CreateDirectory(Server.MapPath(uploadpath));
                varFileName = Server.MapPath(uploadpath) + "/" + uploader.UploadedFiles[0].GetName();
                uploader.UploadedFiles[0].SaveAs(varFileName);
                varFileName = uploader.UploadedFiles[0].GetName();
            }

            string claimstatus = "Open";

            DateTime transperiod1 = (DateTime)(userControl.FindControl("RadDatePicker1") as RadDatePicker).SelectedDate;
            DateTime transperiod2 = (DateTime)(userControl.FindControl("RadDatePicker2") as RadDatePicker).SelectedDate;
            int month = transperiod1.Month;
            int year = transperiod2.Year;
            //string sSQL1 = "sp_getLockAddition";
            //SqlParameter[] parms1 = new SqlParameter[6];
            //parms1[0] = new SqlParameter("@month1", Utility.ToInteger(transperiod1.Month));
            //parms1[1] = new SqlParameter("@month2", Utility.ToInteger(transperiod2.Month));
            //parms1[2] = new SqlParameter("@year1", Utility.ToInteger(transperiod1.Year));
            //parms1[3] = new SqlParameter("@year2", Utility.ToInteger(transperiod2.Year));
            //parms1[4] = new SqlParameter("@emp_code", Utility.ToInteger(empcode));
            //parms1[5] = new SqlParameter("@compid", compid);
            string sSQL1 = "sp_GetPayrollProcessOn";
            SqlParameter[] parms1 = new SqlParameter[3];
            parms1[0] = new SqlParameter("@empcode", Utility.ToInteger(empcode));
            parms1[1] = new SqlParameter("@compid", compid);
            parms1[2] = new SqlParameter("@trxdate", transperiod1.ToString("dd/MM/yyyy"));
            int conLock = 0;
            SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQL1, parms1);
            while (dr1.Read())
            {
                conLock = Utility.ToInteger(dr1.GetValue(0));
            }
            if (conLock <= 0)
            {
                int i = 0;
                SqlParameter[] parms = new SqlParameter[10];
                parms[i++] = new SqlParameter("@emp_code", Utility.ToInteger(empcode));
                parms[i++] = new SqlParameter("@trx_type", Utility.ToString(addtype));
                parms[i++] = new SqlParameter("@trx_period1", transperiod1);
                parms[i++] = new SqlParameter("@trx_period2", transperiod2);
                parms[i++] = new SqlParameter("@trx_amount", Utility.ToDouble(amount));
                parms[i++] = new SqlParameter("@path", varFileName);
                parms[i++] = new SqlParameter("@approver", approver);
                parms[i++] = new SqlParameter("@claimstatus", claimstatus);
                parms[i++] = new SqlParameter("@compid", compid);
                parms[i++] = new SqlParameter("@claimRemark", claimRemarks.Replace("'",""));


                string sSQL = "sp_empclaim_add";
                try
                {
                    int retVal = DataAccess.ExecuteStoreProc(sSQL, parms);
                }
                catch (Exception ex)
                {
                    string ErrMsg = ex.Message;
                    if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                    {
                        ErrMsg = "<font color = 'Red'>Unable to add the record.Please try again.</font>";
                        RadGrid1.Controls.Add(new LiteralControl("<font color = 'Red'>Unable to add record. Reason:</font> " + ErrMsg));
                        e.Canceled = true;
                    }
                }
            }
            else
            {
                Response.Write("<script language = 'Javascript'>alert('Payroll has been Processed, Action not allowed.');</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            StringBuilder strSucSubmit = new StringBuilder();
            StringBuilder strFailSubmit = new StringBuilder();
            foreach (GridItem item in RadGrid1.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                    if (chkBox.Checked == true)
                    {
                        strMessage = "";
                        int trxid = Utility.ToInteger(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("trx_id"));
                        int empid = Utility.ToInteger(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_code"));
                        string sSQL = "update emp_additions set claimstatus='Pending' WHERE emp_code='" + empid + "' and trx_id='" + trxid + "'";
                        int retVal = 0;
                        try
                        {
                            retVal = DataAccess.ExecuteStoreProc(sSQL);
                            strSucSubmit.Append("<br/>" + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name")) + "<br/>");
                            sendemail(trxid);
                        }
                        catch (Exception ex)
                        {
                            if (retVal <= 0)
                            {
                                string ErrMsg = ex.Message;
                                if (ErrMsg.IndexOf("PRIMARY KEY constraint", 1) > 0)
                                {
                                    strFailSubmit.Append("<br/>" + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name")) + "<br/>");
                                }
                            }
                            else
                            {
                                strFailMailMsg.Append("<br/>" + Utility.ToString(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("emp_name")) + "<br/>");
                            }
                        }
                    }
                }
            }
            if (strSucSubmit.Length > 0)
            {
                ShowMessageBox("Claims Submitted Successfully for: <br/>" + strSucSubmit.ToString());
                strMessage = "";
            }
            if (strFailSubmit.Length > 0)
            {
                ShowMessageBox("Claims Not Submitted for: <br/>" + strFailSubmit.ToString());
                strMessage = "";
            }
            if (strPassMailMsg.Length > 0)
            {
                ShowMessageBox("Email Send successfully to: <br/>" + strPassMailMsg.ToString());
                strMessage = "";
            }
            if (strFailMailMsg.Length > 0)
            {
                ShowMessageBox("Error While sending Email to: <br/>" + strFailMailMsg.ToString());
                strMessage = "";
            }
            RadGrid1.DataBind();
        }

        protected void sendemail(int id)
        {
            string code = drpemp.SelectedValue;
            int companyid = Utility.ToInteger(Session["Compid"]);
            string from = "";
            string to = "";
            string SMTPserver = "";
            string SMTPUser = "";
            string SMTPPass = "";
            int SMTPPORT = 25;
            string emp_name = "";
            string emailreq = "";
            string body = "";
            string month = "";
            string year = "";
            string cc = "";

            string sql9 = "select datename(month,trx_period),year(trx_period) from emp_additions where trx_id='" + Utility.ToInteger(id) + "'";
            SqlDataReader dr9 = DataAccess.ExecuteReader(CommandType.Text, sql9, null);
            while (dr9.Read())
            {
                month = Utility.ToString(dr9.GetValue(0));
                year = Utility.ToString(dr9.GetValue(1));

            }

            string sSQLemail = "sp_sendclaim_email";
            SqlParameter[] parmsemail = new SqlParameter[2];
            parmsemail[0] = new SqlParameter("@empcode", Utility.ToInteger(code));
            parmsemail[1] = new SqlParameter("@compid", Utility.ToInteger(companyid));
            SqlDataReader dr3 = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQLemail, parmsemail);
            while (dr3.Read())
            {
                from = Utility.ToString(dr3.GetValue(15));
                to = Utility.ToString(dr3.GetValue(2));
                SMTPserver = Utility.ToString(dr3.GetValue(6));
                SMTPUser = Utility.ToString(dr3.GetValue(7));
                SMTPPass = Utility.ToString(dr3.GetValue(8));
                emp_name = Utility.ToString(dr3.GetValue(5));
                body = Utility.ToString(dr3.GetValue(10));
                SMTPPORT = Utility.ToInteger(dr3.GetValue(13));
                emailreq = Utility.ToString(dr3.GetValue(16)).ToLower();
                cc = Utility.ToString(dr3.GetValue(17));

            }
            if (emailreq == "yes")
            {
                string subject = "Claim Request By" + " " + emp_name;
                body = body.Replace("@emp_name", emp_name);
                body = body.Replace("@month", month);
                body = body.Replace("@year", year);

                SMEPayroll.Model.ANBMailer oANBMailer = new SMEPayroll.Model.ANBMailer(companyid);

                oANBMailer.Subject = subject;
                oANBMailer.MailBody = body;
                oANBMailer.From = from;
                oANBMailer.To = to;
                oANBMailer.Cc = cc;

                try
                {
                    string sRetVal = oANBMailer.SendMail();
                    if (sRetVal == "")
                    {
                        if (to.Length > 0)
                        {
                            if (cc.Length > 0)
                            {
                                strPassMailMsg.Append("<br/>" + emp_name);
                            }
                            else
                            {
                                strPassMailMsg.Append("<br/>" + emp_name);
                            }
                        }
                    }
                    else
                    {
                        strFailMailMsg.Append("<br/>" + emp_name);
                    }
                }
                catch (Exception ex)
                {
                    strFailMailMsg.Append("<br/>" + emp_name);
                }
            }

        }


        protected void RadGrid1_UpdateCommand(object source, GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
            object id = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["trx_id"];
            string TrxId = id.ToString();
            string sSQL = "sp_empclaim_update";
            string empcode = (userControl.FindControl("drpemployee") as DropDownList).SelectedItem.Value;
            string addtype = (userControl.FindControl("drpaddtype") as DropDownList).SelectedItem.Value;
            DateTime transperiod1 = (DateTime)(userControl.FindControl("RadDatePicker1") as RadDatePicker).SelectedDate;
            string amount = (userControl.FindControl("txtamt") as TextBox).Text;
            string approver = (userControl.FindControl("lblsupervisor") as Label).Text;
            RadUpload uploader = (userControl.FindControl("RadUpload1")) as RadUpload;
            varFileName = "";
            string ssqlget = "select recpath from emp_additions where trx_id='" + TrxId + "'";
            DataSet dsget = new DataSet();
            dsget = DataAccess.FetchRS(CommandType.Text, ssqlget, null);
            if (dsget.Tables[0].Rows.Count > 0)
            {
                string s = dsget.Tables[0].Rows[0]["recpath"].ToString();
                varFileName = s;

            }


            string uploadpath = "../" + "Documents" + "/" + compid + "/" + empcode + "/" + "Claims";
            if (uploader.UploadedFiles.Count != 0)
            {
                if (Directory.Exists(Server.MapPath(uploadpath)))
                {
                    if (File.Exists(Server.MapPath(uploadpath) + "/" + uploader.UploadedFiles[0].GetName()))
                    {
                        File.Delete(Server.MapPath(uploadpath) + "/" + uploader.UploadedFiles[0].GetName());
                        varFileName = Server.MapPath(uploadpath) + "/" + uploader.UploadedFiles[0].GetName();
                        uploader.UploadedFiles[0].SaveAs(varFileName);
                        varFileName = uploader.UploadedFiles[0].GetName();
                    }
                    else
                    {
                        varFileName = Server.MapPath(uploadpath) + "/" + uploader.UploadedFiles[0].GetName();
                        uploader.UploadedFiles[0].SaveAs(varFileName);
                        varFileName = uploader.UploadedFiles[0].GetName();
                    }
                }
                else
                {
                    Directory.CreateDirectory(Server.MapPath(uploadpath));
                    varFileName = Server.MapPath(uploadpath) + "/" + uploader.UploadedFiles[0].GetName();
                    uploader.UploadedFiles[0].SaveAs(varFileName);
                    varFileName = uploader.UploadedFiles[0].GetName();
                }
            }
            int i = 0;
            SqlParameter[] parms = new SqlParameter[6];
            parms[i++] = new SqlParameter("@trx_id", Utility.ToInteger(TrxId));
            parms[i++] = new SqlParameter("@trx_amount", Utility.ToDouble(amount));
            parms[i++] = new SqlParameter("@trx_type", Utility.ToInteger(addtype));
            parms[i++] = new SqlParameter("@trx_period", Utility.ToString(transperiod1));
            parms[i++] = new SqlParameter("@rec_path", Utility.ToString(varFileName));
            parms[i++] = new SqlParameter("@approver", Utility.ToString(approver));
            /* Check Status for Lock Record */
            string sSQLCheck = "select status from emp_additions where trx_id = {0}";
            sSQLCheck = string.Format(sSQLCheck, Utility.ToInteger(TrxId));
            string status = "";
            SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQLCheck, null);
            while (dr.Read())
            {
                status = Utility.ToString(dr.GetValue(0));
            }
            if (status == "U")
            {
                int retVal = DataAccess.ExecuteStoreProc(sSQL, parms);
                if (retVal == 1)
                {
                    Response.Write("<script language = 'Javascript'>alert('Information Updated Successfully.');</script>");
                }
            }
            else
            {
                Response.Write("<script language = 'Javascript'>alert('Payroll has been Processed, Action not allowed.');</script>");
            }

        }


        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item.ItemType == GridItemType.Item || e.Item.ItemType == GridItemType.AlternatingItem)
            {
                string empcode = Convert.ToString(e.Item.Cells[4].Text).ToString();
                HyperLink hl = (HyperLink)e.Item.FindControl("h1");
                if (hl.Text.ToString().Trim().Length > 0)
                {
                    hl.NavigateUrl = "../" + "Documents" + "/" + compid + "/" + empcode + "/" + "Claims" + "/" + hl.Text;
                    hl.ToolTip = "Open Document";
                    hl.Text = "Open Document";

                }
                else
                {
                    hl.Text = "No Document";
                }
            }
        }

        protected void RadGrid1_DeleteCommand(object source, GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem editedItem = e.Item as GridEditableItem;
                string TrxId = Utility.ToString(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["trx_id"]);
                string sSQLCheck = "select status from emp_additions where trx_id = {0}";
                sSQLCheck = string.Format(sSQLCheck, Utility.ToInteger(TrxId));
                string status = "";
                SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQLCheck, null);
                while (dr.Read())
                {
                    status = Utility.ToString(dr.GetValue(0));
                }
                if (status == "U")
                {
                    string sSQL = "DELETE FROM emp_additions where trx_id = {0}";
                    sSQL = string.Format(sSQL, Utility.ToInteger(TrxId));
                    int i = DataAccess.ExecuteStoreProc(sSQL);
                }
                else
                {
                    Response.Write("<script language = 'Javascript'>alert('Payroll has been Processed, Action not allowed.');</script>");
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

        public static void ShowMessageBox(string message)
        {
            if (!string.IsNullOrEmpty(message))
            {
                if (message.EndsWith("."))
                    message = message.Substring(0, message.Length - 1);
            }
            StringBuilder sbScript = new StringBuilder();
            //Java Script header            
            sbScript.Append("<script type='text/javascript'>" + Environment.NewLine);
            sbScript.Append("// Show messagebox" + Environment.NewLine);
            message = message.Replace("<br/>", "\\n").Replace("\"", "'");
            sbScript.Append(@"alert( """ + message + @""" );");
            sbScript.Append(@"</script>");
            HttpContext.Current.Response.Write(sbScript);
        }

    }
}
