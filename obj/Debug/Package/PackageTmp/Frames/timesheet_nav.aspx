<%@ Import Namespace="SMEPayroll" %>

<%@ Page Language="c#" Codebehind="timesheet_nav.aspx.cs" AutoEventWireup="false"
    Inherits="SMEPayroll.frames.timesheet_nav" %>
<%@ Register TagPrefix="uc1" TagName="TopLeftC" Src="~/Frames/TopLeftMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>admin_nav</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../STYLE/PMSStyle.css" type="text/css" rel="stylesheet"></link>
    <script language="javascript" type="text/javascript">
        function compclick()
        {
            var vCompid = document.getElementById("txtComp").value;
            window.top.parent.frames[2].location = "../Company/AddCompanyNew.aspx?compid=" + vCompid;
        }
        function homeclick()
        {
            window.location.href = "../frames/right.aspx"; 
            window.parent.frames[1].location = "../Main/Home.aspx";
        }
          function logoutclick()
        {
            window.parent.location.href  = "../Index.aspx";
        }
    </script>
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
    
      <script type="text/javascript">
        function myUrl(menuURL)
        {
            //var leftMenuUrl=menuURL.split("__");
            parent.workarea.location=menuURL;
            return  false;
        }
    </script>
</head>
<body style="margin-left: 0px" bgcolor="E5E5E5">
<form id="form1" runat="server" >
  <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <uc1:TopLeftC ID="TopLeftC1" runat="server" />
     
   <table cellpadding="0"  cellspacing="0"  width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%"  border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4" style="height: 25px">
                                
                            </td>
                        </tr>
                        <tr >
                            <td align="right"     style="width: 80px; height: 35px">
                                
                            </td>
                        </tr>
                    </table>
                </td>
               
            </tr>
        </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <!-- Start Main Table -->
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Roster") && (Session["TimeSheetApproved"].ToString() == "1"))
          {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/TIMESHEET/S-Addroaster.jpg"
                            height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            <a <%--href="../Management/ManageRoster.aspx" target="workarea"--%> 
                            onclick="javascript:return myUrl('../Management/ManageRoster.aspx');return  false;" href='#'
                            style="text-decoration:none;" class="nav">Roster</a>
                        </td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td height="5">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%}%>
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Roster Settings"))
          {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%"  STYLE="background-repeat: no-repeat;" background="images/TIMESHEET/S-roaster.jpg" height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            <a <%--href="../Management/RosterSettings.aspx"   target="workarea"--%> 
                            onclick="javascript:return myUrl('../Management/RosterSettings.aspx');return  false;" href='#'
                            style="text-decoration:none;" class="nav"><b>Roster Settings</b></a>
                        </td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td height="5">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%}%>
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Roster Assignment"))
          {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%"  STYLE="background-repeat: no-repeat;" background="images/TIMESHEET/S-manageroaster.jpg" height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            <a <%--href="../Management/RosterAssigned.aspx" target="workarea"--%>
                            onclick="javascript:return myUrl('../Management/RosterAssigned.aspx');return  false;" href='#'
                             style="text-decoration:none;" class="nav"><b>Roster Assignment</b></a>
                        </td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td height="5">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%}%>
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Employee Timesheet") )
          {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%"  STYLE="background-repeat: no-repeat;" background="images/TIMESHEET/S-managetimesheet.jpg"
                            height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            <a <%--href="../Timesheet/TimeSheetDocument.aspx" target="workarea"--%> 
                            onclick="javascript:return myUrl('../Timesheet/TimeSheetDocument.aspx');return  false;" href='#'
                            style="text-decoration:none;" class="nav"><b>Import Timesheet </b></a>
                        </td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td height="5">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%}%>        
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Project Timesheet"))
          {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%"  STYLE="background-repeat: no-repeat;" background="images/TIMESHEET/S-ManualTimesheet.jpg"
                            height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            <a <%--href="../Management/MultiProjectAssigned.aspx" target="workarea" --%>
                            onclick="javascript:return myUrl('../Management/MultiProjectAssigned.aspx');return  false;" href='#'
                            style="text-decoration:none;" class="nav">Project Assignment </a>
                        </td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td height="5">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%}%>
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Automatic Timesheet") )
          {%>
        <tr   >
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%"  STYLE="background-repeat: no-repeat;" background="images/TIMESHEET/S-uploadtimesheet.jpg"
                            height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            <a <%--href="../Timesheet/Copy of ManualTimesheetDataEntry.aspx"  target="workarea" --%>
                            onclick="javascript:return myUrl('../Timesheet/Copy of ManualTimesheetDataEntry.aspx');return  false;" href='#'
                            style="text-decoration:none;" class="nav">Timesheet</a>
                        </td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td height="5">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%}%>
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Compare Timesheet") )
          {%>
        <tr >
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%"  STYLE="background-repeat: no-repeat;" background="images/TIMESHEET/S-CompareTimesheet.jpg"
                            height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            <a href="../Timesheet/ManualTimeSheetCompare.aspx?PageType=1"     target="workarea" 
                            onclick="javascript:return myUrl('../Timesheet/ManualTimeSheetCompare.aspx');return  false;" href='#'
                            style="text-decoration:none;" class="nav">Compare Timesheet</a>
                        </td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td height="5">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%}%>
    </table>
    </form> 
    <!-- End Main Table -->
</body>
</html>
