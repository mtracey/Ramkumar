<%@ Page Language="C#" AutoEventWireup="true" Codebehind="WorkflowManagement.aspx.cs"
    Inherits="SMEPayroll.Management.WorkflowManagement" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Import Namespace="SMEPayroll" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

    <script language="JavaScript1.2"> 
<!-- 

if (document.all)
window.parent.defaultconf=window.parent.document.body.cols
function expando(){
window.parent.expandf()

}
document.ondblclick=expando 

-->
    </script>

</head>
<body style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Workflow Management</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right" style="height: 25px">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
                <%--<td width="5%">
                    <img alt="" src="../frames/images/EMPLOYEE/Top-Employeegrp.png" /></td>--%>
            </tr>
        </table>
        <div>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Workflow"))
                          {%>
                        <td align="left" style="width: 9%" runat="server" id="tdWF12_1"  >
                            <img alt="" src="../frames/images/WorkFlow/B-Workflow.png" /></td>
                        <td style="width: 41%; text-align: left" runat="server" id="tdWF12_2" >
                            <a href="../Management/EmployeeWorkflow.aspx" class="nav"><b>Manage Workflow</b></a><br />
                            <tt class="bodytxt">Manage Workflow Information</tt><br />
                        </td>
                        <%}%>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Workflow Group"))
                          {%>
                        <td align="left" style="width: 9%" runat="server" id="tdWF1_1">
                            <img alt="" src="../frames/images/WorkFlow/B-WorkflowGroups.png" /></td>
                        <td style="width: 41%; text-align: left" runat="server" id="tdWF1_2">
                            <a id="a1" runat="server" href="../Management/ManagePayrollGroup.aspx" class="nav"><b>Manage Workflow Group</b></a><br />
                            <tt class="bodytxt">Manage Workflow Group Information</tt><br />
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%} %>
                    </tr>
                </table>
            </center>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Workflow Level"))
                          {%>
                        <td width="9%" align="left" runat="server" id="tdWF1_3">
                            <img alt="" src="../frames/images/WorkFlow/B-Workflow Levels.png" /></td>
                        <td style="width: 41%; text-align: left"  runat="server" id="tdWF1_4">
                            <a id="a2" runat="server" href="../Management/EmployeeWorkflowLevel.aspx" class="nav"><b>Manage Workflow Level</b></a><br />
                            <tt class="bodytxt">Manage Workflow Level Information</tt><br />
                        </td>
                        <%}
                        if (Utility.AllowedAction1(Session["Username"].ToString(), "Workflow Employee Assignment"))
                          {%>
                        <td width="9%" align="left" runat="server" id="tdWF12_3">
                            <img alt="" src="../frames/images/WorkFlow/B-EmployeeAssignment.png" /></td>
                        <td style="width: 41%; text-align: left"  runat="server" id="tdWF12_4">
                            <a href="../Management/PayrollGroupAssigned.aspx" class="nav"><b>Assign Supervisor/Employee to
                                WorkFlow/Payroll Group</b></a><br />
                            <tt class="bodytxt">Manage Employee Assignment Information</tt><br />
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%} %>
                    </tr>
                </table>
            </center>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Payroll Workflow Assignment"))
                          {%>
                        <td align="left" style="width: 9%"  runat="server" id="tdWF12_5">
                            <img alt="" src="../frames/images/Assignment/B-LeaveSupervisor.png" /></td>
                        <td style="width: 41%; text-align: left"  runat="server" id="tdWF12_6">
                            <a href="../Management/PayrollWorkflowAssignment.aspx" class="nav"><b>Assign Employee to Workflow</b></a><br />
                            <tt class="bodytxt">Manage Payroll Workflow Assignments and Un Assignments. </tt>
                            <br />
                        </td>
                        <%}
                        if (Utility.AllowedAction1(Session["Username"].ToString(), "DELETETHIS"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/Assignment/B-ClaimSupervisor.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/claimSupervisorAssignment.aspx" class="nav"><b>Manage Claim Supervisor
                                Assignment </b></a>
                            <br />
                            <tt class="bodytxt">Manage Claim Supervisor Assignments and Un Assignments. </tt>
                            <br />
                            <%}
                          else
                          {%>
                            <td colspan="2">
                            </td>
                            <%} %>
                    </tr>
                </table>
            </center>
            <br />
        </div>
    </form>
</body>
</html>
