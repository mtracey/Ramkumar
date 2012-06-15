<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="assignmentManagement.aspx.cs" Inherits="SMEPayroll.Management.assignmentManagement" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Import Namespace="SMEPayroll" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
        <table cellpadding="0"  cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Assign Management</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right"style="height: 25px">
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
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Department Assignment"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/Assignment/B-Deaprtment.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/DepartmentAssignment.aspx" class="nav"><b>Department Assignments
                            </b></a>
                            <br />
                            <tt class="bodytxt">Manage Department Assignments and Un Assignments.</tt></td>
                        <%}
                          if (Utility.AllowedAction1(Session["Username"].ToString(), "Leave Supervisor Assignment"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/Assignment/B-LeaveSupervisor.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/leaveSupervisorAssignment.aspx" class="nav"><b>Manage Leave Supervisor Assignment</b></a><br />
                            <tt class="bodytxt">Manage Leave Supervisor Assignments and Un Assignments. </tt><br />
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
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Claim Supervisor Assignment"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/Assignment/B-ClaimSupervisor.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/claimSupervisorAssignment.aspx" class="nav"><b>Manage Claim Supervisor Assignment
                            </b></a>
                            <br />
                          <tt class="bodytxt">Manage Claim Supervisor Assignments and Un Assignments. </tt><br />
                         <%}
                          if (Utility.AllowedAction1(Session["Username"].ToString(), "Claim Supervisor Assignment"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/Assignment/B-LeaveSupervisor.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/EmployeeAssignedToWorkersList.aspx" class="nav"><b>Manage Workers Assignment</b></a><br />
                            <tt class="bodytxt">Manage Workers Assignments and Un Assignments. </tt><br />
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
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Department Assignment"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/Assignment/B-Deaprtment.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/DemoCompanyAssign.aspx" class="nav"><b>Demo Company Assignment
                            </b></a>
                            <br />
                            <tt class="bodytxt">Manage Demo Company Assignments and Un Assignments To User.</tt></td>
                        <%}
                          if (Utility.AllowedAction1(Session["Username"].ToString(), "Leave Supervisor Assignment"))
                          {%>
                        <td align="left" style="width: 9%;" >
                            <img alt="" src="../frames/images/Assignment/B-LeaveSupervisor.png" /></td>
                        <td style="width: 41%; text-align: left;">
                            <a href="../Management/SalaryChange.aspx" class="nav"><b>Salary Increment</b></a><br />
                            <tt class="bodytxt">Manage Salary Increment. </tt><br />
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
            
            <!-- last row-->
            
               <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Department Assignment"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/Assignment/B-ClaimSupervisor.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/TimesheetSupervisorAssignment.aspx" class="nav"><b>Manage Timesheet Supervisor Assignment
                            </b></a>
                            <br />
                            <tt class="bodytxt">Manage Timesheet Supervisor Assignments and Un Assignments.</tt></td>
                        <%}
                          if (Utility.AllowedAction1(Session["Username"].ToString(), "Leave Supervisor Assignment"))
                          {%>
                        <td align="left" style="width: 9%;visibility:hidden" >
                            <img alt="" src="../frames/images/Assignment/B-LeaveSupervisor.png" /></td>
                        <td style="width: 41%; text-align: left;visibility:hidden">
                            <a href="../Management/SalaryChange.aspx" class="nav"><b>blank</b></a><br />
                            <tt class="bodytxt">Manage Salary Increment. </tt><br />
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
            
        </div>
    </form>
</body>
</html>
