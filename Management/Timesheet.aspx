<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Timesheet.aspx.cs" Inherits="SMEPayroll.Management.Timesheet" %>

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
         <table cellpadding="0"  cellspacing="0"  width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%"  border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Timesheet Management</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td align="right"style="height: 25px">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">                
                    <tr>
                        
                    </tr>
                    <tr >
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Roster"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/TIMESHEET/B-Addroaster.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/ManageRoster.aspx" class="nav"><b>Roster</b></a><br />
                            <tt class="bodytxt">Manual Add/Edit Rosters.</tt></td>
                        <%}%>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Roster Settings"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/TIMESHEET/B-Roaster.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/RosterSettings.aspx" class="nav"><b>Roster Settings</b></a><br />
                            <tt class="bodytxt">Add/Delete/Update Roster's information.</tt><br />
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
                    
                    </tr>
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Roster Assignment"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/TIMESHEET/B-manageroaster.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/RosterAssigned.aspx" class="nav"><b>Roster Assignment</b></a>
                            <br />
                            <tt class="bodytxt">Manage Roster Assignment, Assign/Delete Employee from
                                <br />
                                existing Roster Assigned.</tt></td>
                        <%}%>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Automatic Timesheet"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/TIMESHEET/B-Uploadtimesheet.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Timesheet/TimeSheetDocument.aspx" class="nav"><b>Import Timesheet </b></a><br />
                            <tt class="bodytxt">Import Timesheet Upload/Delete/Edit. </tt>
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
                        <% if (Utility.AllowedAction1(Session["Username"].ToString(), "Project Assignment"))
                          {%>
                           <td align="left" style="width: 9%">
                                <img alt="" src="../frames/images/PROJECTS/B-Employee Assignment.png" /></td>
                            <td style="width: 41%; text-align: left">
                                <a href="../Management/MultiProjectAssigned.aspx" class="nav"><b>Manage Project Assignment
                                </b></a>
                                <br />
                                <tt class="bodytxt">Manage Project Assignment Addition,Deletion,Update.</tt><br />
                            </td>
                          <%}%>
                         <% if (Utility.AllowedAction1(Session["Username"].ToString(), "Project Assignment"))
                          {%>
                            <td align="left" style="width: 9%;" >
                                <img alt="" src="../frames/images/TIMESHEET/B-Uploadtimesheet.png" /></td>
                            <td style="width: 41%; text-align: left;">
                                <a href="../Timesheet/Copy of ManualTimesheetDataEntry.aspx" class="nav"><b>TimeSheet
                                </b></a>
                                <br />
                                <tt class="bodytxt">TimeSheet </tt><br />
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
            </br>
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse;"
                    width="90%">
                    <tr>
                        <%if ((Utility.AllowedAction1(Session["Username"].ToString(), "Manage Employee Timesheet") )
                                ||(Utility.AllowedAction1(Session["Username"].ToString(), "View Timesheet") ))
                        
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/TIMESHEET/B-Managetimesheet.png" /></td>
                        <td style="width: 41%; text-align: left;">
                            <a href="../Timesheet/ManualTimesheetDataEntry_Daily.aspx" class="nav"><b>Timesheet Daily(Hours)</b></a><br />
                            <tt class="bodytxt">Daily Time Data Entry</tt></td>
                        <%}
                          if ((Utility.AllowedAction1(Session["Username"].ToString(), "Manage Project Timesheet"))
                                ||(Utility.AllowedAction1(Session["Username"].ToString(), "View Timesheet") ))
                          {%>
                               <td width="9%" align="left" visible="true" >
                                <img alt="" src="../frames/images/TIMESHEET/B-ManualTimesheet.png"  /></td>
                                <td style="width: 41%; text-align: left"  >
                                <a  href="../Timesheet/ManualTimesheetDataEntryMonthly.aspx" class="nav"><b>Timesheet Monthly (Hours)</b></a><br />
                                <tt class="bodytxt"  >Monthly Time Data Entry.</tt></td>                            
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%} %>
                    </tr>
                    
                </table>
            </center>
            
            
              <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse;visibility:hidden;"
                    width="90%">
                    <tr>
                        <td class="bodytxt"  colspan="2" align="left"   >
                            <b>Daily TimeSheet Hours</b>
                        </td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <%if ((Utility.AllowedAction1(Session["Username"].ToString(), "Manage Employee Timesheet") )
                                ||(Utility.AllowedAction1(Session["Username"].ToString(), "View Timesheet") ))
                        
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/TIMESHEET/B-Managetimesheet.png" /></td>
                        <td style="width: 41%; text-align: left;">
                            <a href="../Timesheet/ManualTimesheetDataEntry_Daily.aspx" class="nav"><b>Timesheet Daily Hours</b></a><br />
                            <tt class="bodytxt">Daily Time Data Entry</tt></td>
                        <%}
                          if ((Utility.AllowedAction1(Session["Username"].ToString(), "Manage Employee Timesheet"))
                                ||(Utility.AllowedAction1(Session["Username"].ToString(), "View Timesheet1") ))
                          {%>
                               <td width="9%" align="left" visible="true" >
                                <img alt="" src="../frames/images/TIMESHEET/B-ManualTimesheet.png"  /></td>
                                <td style="width: 41%; text-align: left"  >
                                <a  href="../Timesheet/ManualTimesheetDataEntryMonthly.aspx" class="nav"><b>Timesheet Monthly</b></a><br />
                                <tt class="bodytxt"  >Monthly Time Data Entry.</tt></td>                            
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
                <table border="0" cellpadding="0" cellspacing="5"  style="visibility:hidden"
                    width="90%" >
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Project Timesheet"))
                          {%>
                             <td width="9%" align="left">
                            <img alt="" src="../frames/images/TIMESHEET/B-CompareTimesheet.png" /></td>
                            <td style="width: 41%; text-align: left">
                            <a href="../Timesheet/Copy of ManualTimesheetDataEntry.aspx" class="nav"><b>TimeSheet </b></a><br />
                            <tt class="bodytxt">TimeSheet New Data Entry. </tt>
                            </td>
                        <%}
                        if (Utility.AllowedAction1(Session["Username"].ToString(), "Manual Timesheet1"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/TIMESHEET/B-ManualTimesheet.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Timesheet/ManualTimeSheetUpdate.aspx?PageType=1" class="nav"><b>Manual Timesheet</b></a><br />
                            <tt class="bodytxt">Manual Add/Edit Time In, Time Out for Employees.</tt></td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%} %>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>
