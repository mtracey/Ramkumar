<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageAccomadation.aspx.cs" Inherits="SMEPayroll.Management.ManageAccomadation" %>

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
         <table cellpadding="0"  cellspacing="0"  width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%"  border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Accomodation Management</b></font>
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
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Project Management"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/Accomadation/B-ManageAccomadation.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/AccomadationInfo.aspx" class="nav"><b>Manage Accomadation
                            </b></a>
                            <br />
                            <tt class="bodytxt">Manage Accomadation Addition,Deletion,Update.</tt><br />
                        </td>
                        <%}%>
                       <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Assignment Management"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/Accomadation/B-Accomadation.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/EmployeeAccomadationInfo.aspx" class="nav"><b>Assign Accomadation
                            </b></a>
                            <br />
                            <tt class="bodytxt">Assign / Un Assign Accomadation<br />
                                </tt></td>
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
