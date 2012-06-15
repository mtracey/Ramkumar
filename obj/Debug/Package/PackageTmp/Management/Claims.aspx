<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Claims.aspx.cs" Inherits="SMEPayroll.Management.Claims" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="SMEPayroll" %>
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
         <table cellpadding="0"  cellspacing="0"  width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%"  border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Claims Management</b></font>
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
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Apply Claim"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/claims/B-applyclaims.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Payroll/ClaimAdditions.aspx" class="nav"><b>Apply Claims </b></a>
                            <br />
                            <tt class="bodytxt">Apply Claim and submit for approval to your supervisor, You
                                <br />
                                can also view the status of applied claims.</tt><br />
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%}%>
                        <td colspan="2">
                        </td>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Claim Status"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/claims/B-Claimstatus.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Payroll/AppliedClaims.aspx" class="nav"><b>Claims Status </b></a>
                            <br />
                            <tt class="bodytxt">View the status of all the claim's applied.</tt></td>
                        <%}%>
                    </tr>
                </table>
            </center>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Approved Claims"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/claims/B-approvedclaims.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Payroll/ApprovedClaims.aspx" class="nav"><b>Approved Claims </b></a>
                            <br />
                            <tt class="bodytxt">View all the Approved Claims.</tt><br />
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%}%>
                        <td colspan="2">
                        </td>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Rejected Claims"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/claims/B-rejected claims.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Payroll/RejectedClaims.aspx" class="nav"><b>Rejected Claims </b></a>
                            <br />
                            <tt class="bodytxt">View all the Rejected Claims.</tt></td>
                         <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%}%>
                    </tr>
                </table>
            </center>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Pending Approval for Claim"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/claims/B-pendingclaims.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Payroll/ClaimApproval.aspx" class="nav"><b>Claims Pending for Approval </b>
                            </a>
                            <br />
                            <tt class="bodytxt">View all the Approved Claims.</tt><br />
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%}%>
                        <td colspan="2">
                        </td>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Approved Claims1"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/claims/B-pendingclaims.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/CappingClaims.aspx" class="nav"><b>Capping Claims </b>
                            </a>
                            <br />
                            <tt class="bodytxt">Setting Caping for Claims.</tt><br />
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%}%>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>
