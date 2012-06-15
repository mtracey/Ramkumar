using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace SMEPayroll.frames
{
	/// <summary>
	/// Summary description for _default.
	/// </summary>
	public class _default : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            string strWF = "";
            string strWfGroup="";
            string strNamePayroll = "";

            //Get The Details for If TSProcess
            string strProcess = "Select AppTSProcess,AppLeaveProcess,AppClaimsProcess from Company  WHERE Company_Id=" + Utility.ToInteger(Session["Compid"]);
            DataSet dsprocess = DataAccess.FetchRS(CommandType.Text, strProcess);

            if (dsprocess.Tables.Count > 0)
            {   
                if (dsprocess.Tables[0].Rows.Count > 0)
                {
                    if (Session["processPayroll"] == null)
                    {
                        if (dsprocess.Tables[0].Rows[0]["AppTSProcess"] == DBNull.Value)
                        {
                            Session["processPayroll"] = "1";
                        }
                        else
                        {
                            Session["processPayroll"] = dsprocess.Tables[0].Rows[0]["AppTSProcess"].ToString();
                        }
                    }

                    if (Session["processLeave"] == null)
                    {
                        if (dsprocess.Tables[0].Rows[0]["AppLeaveProcess"] == DBNull.Value)
                        {
                            Session["processLeave"] = "1";
                        }
                        else
                        {
                            Session["processLeave"] = dsprocess.Tables[0].Rows[0]["AppLeaveProcess"].ToString();
                        }
                    }

                    if (Session["processClaim"] == null)
                    {
                        if (dsprocess.Tables[0].Rows[0]["AppClaimsProcess"] == DBNull.Value)
                        {
                            Session["processClaim"] = "1";
                        }
                        else
                        {
                            Session["processClaim"] = dsprocess.Tables[0].Rows[0]["AppClaimsProcess"].ToString();
                        }
                    }
                }
            }
           


            if (Session["GroupName"].ToString().ToUpper() != "SUPER ADMIN")
            {
                if (Session["strWF"] == null)
                {
                    string sqlWF = "Select WorkFlowID,WFPAY,WFLEAVE,WFEMP,WFCLAIM,WFReport,WFTimeSheet from company WHERE Company_Id=" + Utility.ToInteger(Session["Compid"]);
                    DataSet dsWF = new DataSet();
                    dsWF = DataAccess.FetchRS(CommandType.Text, sqlWF, null);

                    if (dsWF.Tables.Count > 0)
                    {
                        if (dsWF.Tables[0].Rows.Count > 0)
                        {
                            strWF = dsWF.Tables[0].Rows[0][0].ToString();
                            Session["strWF"] = strWF;

                            if(dsWF.Tables[0].Rows[0]["WFPAY"]!=DBNull.Value)
                            {
                                strNamePayroll= dsWF.Tables[0].Rows[0]["WFPAY"].ToString();
                                Session["PayrollWF"] = strNamePayroll;
                            }
                            else
                            {
                                strNamePayroll= "";
                                Session["PayrollWF"] = "";
                            }

                            if (strWF == "2")
                            {
                                if (Session["GroupName"].ToString().ToUpper() != "SUPER ADMIN")
                                 {
                                string strEmpSup = "SELECT * FROM EmployeeAssignedToWorkFlow2Sup ES INNER JOIN EmployeeWorkFlow  EW ON ES.PayrollGroupID=EW.ID WHERE ES.Emp_ID=" + Session["EmpCode"].ToString();
                                DataSet dsEmpSup = new DataSet();
                                dsEmpSup = DataAccess.FetchRS(CommandType.Text, strEmpSup, null);

                                if (dsEmpSup.Tables.Count > 0)
                                {
                                    if (dsEmpSup.Tables[0].Rows.Count > 0)
                                    {
                                        Session["dsEmpSup"] = dsEmpSup;
                                        strWfGroup = dsEmpSup.Tables[0].Rows[0]["PayrollGroupID"].ToString();
                                    }
                                }

                                if (Session["dsEmpSup"] != null)
                                {
                                    string strEmpGrp = "SELECT * FROM EmployeeAssignedToWorkFlow2Emp WHERE PayrollGroupID=" + strWfGroup;
                                    DataSet dsEmpWF = new DataSet();
                                    dsEmpWF = DataAccess.FetchRS(CommandType.Text, strEmpGrp, null);
                                    Session["dsEmpWF"] = dsEmpWF;
                                }
                               }
                            }
                        }
                    }
                }
                else
                {
                    strWF = (string)Session["strWF"];
                }
            }
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);
		}
		#endregion
	}
}
