<%@ Page Language="c#" Codebehind="startup.aspx.cs" AutoEventWireup="false" Inherits="SMEPayroll.frames.startup" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" id="Head1">
    <title>Home Page</title>
</head>
<link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css"></link>
<body style="margin-left: 20">
    <form id="frmStartup" runat="server">
        <center>
            <br />
            <table border="0" cellpadding="0" cellspacing="0" width="90%">
                <tr>
                    <!-- 1,1 begin -->
                    <td width="50%" valign="top">
                        <img alt="" src="../frames/images/bgifs/work permit expiry.jpg" /><font face="tahoma"
                            size="2"><b>&nbsp; Work Permit Expiring in Next 30 days</b></font>
                        <hr color="lightgrey" width="340" align="left">
                        <table cellpadding="0" cellspacing="1" style="border-collapse: collapse" width="90%"
                            border="0" bgcolor="<% =sBorderColor %>">
                            <tr bgcolor="<%=sHeadingColor%>" height="20">
                                <td width="40%">
                                    <tt class="bodytxtwhite"><b>&nbsp; Employee Name</b> </tt>
                                </td>
                                <td width="30%">
                                    <tt class="bodytxtwhite"><b>&nbsp; Work Permit No </tt></b>
                                </td>
                                <td width="30%">
                                    <tt class="bodytxtwhite"><b>&nbsp; Expiry Date </tt></b>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="right">
                                    <a href="../Reports/CompEmpExpire.aspx?expire=workpermit" class="nav2">More...</a>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <!-- Tasks - 2 -->
                        <img alt="" src="../frames/images/bgifs/insurance expiry.jpg" /><font face="tahoma"
                            size="2"><b>&nbsp; Insurance Expiring in Next 30 days</b></font>
                        <hr color="lightgrey" width="340" align="left">
                        <table cellpadding="0" cellspacing="1" style="border-collapse: collapse" width="90%"
                            border="0" bgcolor="<% =sBorderColor %>">
                            <tr bgcolor="<%=sHeadingColor%>" height="20">
                                <td width="40%">
                                    <tt class="bodytxtwhite"><b>&nbsp; Employee Name</b> </tt>
                                </td>
                                <td width="30%">
                                    <tt class="bodytxtwhite"><b>&nbsp; Work Permit No </tt></b>
                                </td>
                                <td width="30%">
                                    <tt class="bodytxtwhite"><b>&nbsp; Expiry Date </tt></b>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="right">
                                    <a href="../Reports/CompEmpExpire.aspx?expire=insurance" class="nav2">More...</a>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <!-- 1,2 begin -->
                        <td width="50%" valign="top">
                            <!-- Appointments -->
                            <img alt="" src="../frames/images/bgifs/Passport Expiry.jpg" /><font face="tahoma"
                                size="2"><b>&nbsp; Passport Expiring in Next 30 days</b></font>
                            <hr color="lightgrey" width="340" align="left">
                            <table cellpadding="0" cellspacing="1" style="border-collapse: collapse" width="90%"
                                border="0" bgcolor="<% =sBorderColor %>">
                                <tr bgcolor="<%=sHeadingColor%>" height="20">
                                    <td width="40%">
                                        <tt class="bodytxtwhite"><b>&nbsp; Employee Name</b> </tt>
                                    </td>
                                    <td width="30%">
                                        <tt class="bodytxtwhite"><b>&nbsp; Passport No </tt></b>
                                    </td>
                                    <td width="30%">
                                        <tt class="bodytxtwhite"><b>&nbsp; Expiry Date </tt></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="right">
                                        <a href="../Reports/CompEmpExpire.aspx?expire=passport" class="nav2">More...</a>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <img alt="" src="../frames/images/bgifs/work permit expiry.jpg" /><font face="tahoma"
                                size="2"><b>&nbsp; CSOC Expiring in Next 30 days</b></font>
                            <hr color="lightgrey" width="340" align="left">
                            <table cellpadding="0" cellspacing="1" style="border-collapse: collapse" width="90%"
                                border="0" bgcolor="<% =sBorderColor %>">
                                <tr bgcolor="<%=sHeadingColor%>" height="20">
                                    <td width="40%">
                                        <tt class="bodytxtwhite"><b>&nbsp; Employee Name</b> </tt>
                                    </td>
                                    <td width="30%">
                                        <tt class="bodytxtwhite"><b>&nbsp; CSOC No </tt></b>
                                    </td>
                                    <td width="30%">
                                        <tt class="bodytxtwhite"><b>&nbsp; Expiry Date </tt></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="right">
                                        <a href="../Reports/CompEmpExpire.aspx?expire=csoc" class="nav2">More...</a> &nbsp;</td>
                                </tr>
                            </table>
            </table>
            <br>
            </td>
            <!-- 1,2 end -->
            </tr> </table>
        </center>
    </form>
</body>
</html>
