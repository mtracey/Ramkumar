<%@ Page Language="c#" Codebehind="job_nav.aspx.cs" AutoEventWireup="false" Inherits="SMEPayroll.frames.job_nav" %>

<%@ Import Namespace="SMEPayroll" %>
<%@ Register TagPrefix="uc1" TagName="TopLeftC" Src="~/Frames/TopLeftMenu.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

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
<body bgcolor="E5E5E5" style="margin-left: 0px">
    <form id="form1" runat="server">
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
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table3">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%"  STYLE="background-repeat: no-repeat;" background="images/LEAVES/s-Applyleaves.jpg" height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a style="text-decoration:none;" onclick="javascript:return myUrl('../Leaves/LeaveRequest.aspx');return  false;" href='#'
                                <%--href="../Leaves/LeaveRequest.aspx" target="workarea"--%>
                                 class="nav"> <b>Apply Leaves</b></a>
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
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table1">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/LEAVES/s-leavestatus.jpg" height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a style="text-decoration:none;"<%-- href="../Leaves/ViewAppliedLeaves.aspx"    target="workarea"--%> 
                                onclick="javascript:return myUrl('../Leaves/ViewAppliedLeaves.aspx');return  false;" href='#'
                                class="nav"> <b>Leave Status</b></a>
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
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table2">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/LEAVES/s-approvedleaves.jpg" height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a style="text-decoration:none;" <%--href="../Leaves/ApprovedLeaves.aspx"   target="workarea"--%> 
                                onclick="javascript:return myUrl('../Leaves/ApprovedLeaves.aspx');return  false;" href='#'
                                class="nav"> <b>Approved Leaves</b></a>
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
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table5">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/LEAVES/s-rejectedleaves.jpg" height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a style="text-decoration:none;" <%--href="../Leaves/RejectedLeaves.aspx"     target="workarea"--%> 
                                onclick="javascript:return myUrl('../Leaves/RejectedLeaves.aspx');return  false;" href='#'
                                class="nav"> <b>Rejected Leaves</b></a>
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
            <tr>
                <td>
                </td>
            </tr>
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Approve And Reject Leaves") || (supervisor))
     {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table6">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/LEAVES/s-pendingleaves.jpg" height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a style="text-decoration:none;" <%--href="../Leaves/PendingApproval.aspx" target="workarea" --%>
                                onclick="javascript:return myUrl('../Leaves/PendingApproval.aspx');return  false;" href='#'
                                class="nav"> <b>Pending Approval</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Leaves Allowed"))
     {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table4">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/LEAVES/s-leavesallowed.jpg" height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a style="text-decoration:none;" <%--href="../Leaves/LeavesAllowedFrm.aspx"   target="workarea"--%>
                                onclick="javascript:return myUrl('../Leaves/LeavesAllowedFrm.aspx');return  false;" href='#'
                                 class="nav"><b>Allowed Leaves</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Leave Types"))
      {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table7">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/LEAVES/s-leavetypes.jpg" height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a style="text-decoration:none;" <%--href="../Leaves/LeaveTypes.aspx" target="workarea" --%>
                                onclick="javascript:return myUrl('../Leaves/LeaveTypes.aspx');return  false;" href='#'
                                class="nav"><b>Leave types</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Leave Transfer"))
     {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table9">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/LEAVES/s-transferleavesr.jpg" height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a style="text-decoration:none;" <%--href="../Leaves/LeaveTransfer.aspx" target="workarea" --%>
                                onclick="javascript:return myUrl('../Leaves/LeaveTransfer.aspx');return  false;" href='#'
                                class="nav"> <b>Leave Transfer</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Public Holidays"))
     {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table8">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" STYLE="background-repeat: no-repeat;"  background="../frames/images/LEAVES/s-Manageholidays.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a style="text-decoration:none;" <%--href="../Leaves/PublicHolidays.aspx" target="workarea" --%>
                                onclick="javascript:return myUrl('../Leaves/PublicHolidays.aspx');return  false;" href='#'
                                class="nav"> <b>Manage Holidays</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Manage Leaves"))
     {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table10">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%"  STYLE="background-repeat: no-repeat;" background="../frames/images/LEAVES/S-mangeleaves.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a style="text-decoration:none;"<%-- href="../Leaves/LeaveAddDed.aspx" target="workarea" --%>
                                onclick="javascript:return myUrl('../Leaves/LeaveAddDed.aspx');return  false;" href='#'
                                class="nav"> <b>Manage Leaves</b></a>
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
             <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Leave Transfer"))
        {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table11">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/LEAVES/s-transferleavesr.jpg" height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a style="text-decoration:none;" <%--href="../Leaves/LeaveRollback.aspx" target="workarea" --%>
                                onclick="javascript:return myUrl('../Leaves/LeaveRollback.aspx');return  false;" href='#'
                                class="nav"> <b>Leave Rollback</b></a>
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
        <!-- End Main Table -->
    </form>
</body>
</html>
