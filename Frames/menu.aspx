<%@ Page Language="c#" Codebehind="menu.aspx.cs" AutoEventWireup="false" Inherits="SMEPayroll.frames.menu" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Import Namespace="SMEPayroll" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>menu</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
</head>
<link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css"></link>
<body bgcolor="4D5459" background="../frames/images/toolbar/backs.jpg" topmargin="5"
    style="margin-top: 5">
    <form id="Form1" method="post" runat="server" style="font-size: 8pt; color: white;
        font-style: normal; font-family: TAHOMA; font-variant: normal">
        <strong>
            <table width="100%" style="font-size: 8pt; color: white; font-style: normal; font-family: TAHOMA;
                font-variant: normal">
                <tr>
                    <td>
                        <a class="menunav" href="right.aspx" target="main" onclick="parent.workarea.location='../Main/Home.aspx';"
                            style="text-decoration: none"><font color="#FFFFFF">HOME&nbsp;&nbsp; |&nbsp;</font></a>
                    </td>
                    <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Employee Management"))
                      {%>
                    <td>
                        <a class="menunav" href="emp_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Employee.aspx';"
                            style="text-decoration: none"><font color="#FFFFFF">EMPLOYEES&nbsp;&nbsp; |&nbsp;</font></a>
                    </td>
                    <%}%>
                    <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Leave Management"))
                      {%>
                    <td>
                        <a class="menunav" href="job_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Leave.aspx';"
                            style="text-decoration: none"><font color="#FFFFFF">LEAVES&nbsp; &nbsp;|&nbsp;</font></a>&nbsp;
                    </td>
                    <%}%>
                    <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Payroll Management"))
                      {%>
                    <td>
                        <a class="menunav" href="project_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Payroll.aspx';"
                            style="text-decoration: none"><font color="#FFFFFF">PAYROLL&nbsp; &nbsp|&nbsp;</font></td>
                    <%}%>
                    <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Reports Management"))
                      {%>
                    <td>
                        <a class="menunav" href="report_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Reports.aspx';"
                            style="text-decoration: none"><font color="#FFFFFF">REPORTS&nbsp;&nbsp; |&nbsp;</font></a></td>
                    <%}%>
                    <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Admin Rights"))
                      {%>
                    <td>
                        <a class="menunav" href="admin_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Admin.aspx';"
                            style="text-decoration: none"><font color="#FFFFFF">ADMIN MODULE&nbsp;&nbsp; |&nbsp;</font></a></td>
                    <%}%>
                    <td>
                        <a class="menunav" href="../Login.aspx" target="_parent" style="text-decoration: none">
                            <font color="#FFFFFF">LOGOUT</td>
                    <td align="Right">
                        <%=companyname%>
                    </td>
                    </a>
                </tr>
            </table>
        </strong>
    </form>
</body>
</html>
