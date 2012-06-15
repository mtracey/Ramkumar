<%@ Page Language="C#" AutoEventWireup="true" Codebehind="OtherManagement.aspx.cs"
    Inherits="SMEPayroll.Management.OtherManagement" %>

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

    <link href="../style/MenuStyle.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Other Management</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td align="right" style="height: 25px">
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
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Payslip Remarks"))
                         {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/OTHER MANAGEMENTS/B-PayslipRemarks.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Payroll/payslipRemarks.aspx" class="nav"><b>Manage Payslip Remarks </b></a>
                            <br />
                            <tt class="bodytxt">Add / Update Remarks In Payslip<br />
                            </tt>
                            <br />
                        </td>
                        <%}
                          if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Logo"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/OTHER MANAGEMENTS/B-PayslipRemarks.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/ManageLogoDept.aspx" class="nav"><b>Manage Logo </b></a>
                            <br />
                            <tt class="bodytxt">Manage Logo<br />
                            </tt>
                            <br />
                        </td>
                        <%}
                        else
                        {%>
                        <td colspan="2">
                        </td>
                        <%} %>
                    </tr>
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Year of Assesment"))
                         {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/OTHER MANAGEMENTS/B-PayslipRemarks.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../employee/EmployeYearEarn.aspx" class="nav"><b>Year of Assesment</b></a>
                            <br />
                            <tt class="bodytxt">Add / Update Year of Assesment<br />
                            </tt>
                            <br />
                        </td>
                        <%}
                          if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Previous Year Wages"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/OTHER MANAGEMENTS/B-PayslipRemarks.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../employee/PreviousYearWages.aspx" class="nav"><b>Previous Year Wages</b></a>
                            <br />
                            <tt class="bodytxt">Previous Year Wages<br />
                            </tt>
                            <br />
                        </td>
                        <%}
                        else
                        {%>
                        <td colspan="2">
                        </td>
                        <%} %>
                    </tr>
                    <!-- new -->
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Logo"))
                         {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/OTHER MANAGEMENTS/B-PayslipRemarks.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/CustomExportGrid.aspx" class="nav"><b>Header Information</b></a>
                            <br />
                            <tt class="bodytxt">Manage Header Information while Exporting in Grid<br />
                            </tt>
                            <br />
                        </td>
                        <%}
                            if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Logo"))
                          {%>
                        <td align="left" style="width: 9%;">
                            <img alt="" src="../frames/images/OTHER MANAGEMENTS/B-PayslipRemarks.png" /></td>
                        <td style="width: 41%; text-align: left;">
                            <a href="../Management/ManageHomePageRemainders.aspx" class="nav"><b>Manage Home Page Remainders</b></a>
                            <br />
                            <tt class="bodytxt">Previous Year Wages<br />
                            </tt>
                            <br />
                        </td>
                        <%}
                        else
                        {%>
                        <td colspan="2">
                        </td>
                        <%} %>
                    </tr>
                    <!-- new end -->
                </table>
            </center>
        </div>
    </form>
</body>
</html>
