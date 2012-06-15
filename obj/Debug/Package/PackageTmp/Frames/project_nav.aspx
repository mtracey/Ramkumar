<%@ Page Language="c#" Codebehind="project_nav.aspx.cs" AutoEventWireup="false" Inherits="SMEPayroll.frames.project_nav" %>

<%@ Register TagPrefix="uc1" TagName="TopLeftC" Src="~/Frames/TopLeftMenu.ascx" %>
<%@ Import Namespace="SMEPayroll" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>emp_nav</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
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
        <uc1:TopLeftC ID="TopLeftC1" runat="server" OnLoad="TopLeftC1_Load" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4" style="height: 25px">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 80px; height: 15px">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Additions"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table1">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/payroll/S-additons.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Payroll/PayrollAdditions.aspx"  target="workarea" --%>
                                 onclick="javascript:return myUrl('../Payroll/PayrollAdditions.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Additions</b></a>
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
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Deductions"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table2">
                        <tr>
                            <td width="1%" style="height: 30px">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat; height: 30px;"
                                background="images/payroll/S-deductions.jpg">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Payroll/PayrollDeductions.aspx"     target="workarea"--%> 
                                onclick="javascript:return myUrl('../Payroll/PayrollDeductions.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Deductions</b></a>
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
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View overtimepay"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table4">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/payroll/S-payrollvaribales.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../employee/emp_overtime.aspx"   target="workarea" --%>
                                onclick="javascript:return myUrl('../employee/emp_overtime.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Overtime Pay</b></a>
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
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Generate or Submit Payroll"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table3">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/payroll/S-submitpayroll.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Payroll/SubmitPayroll.aspx" target="workarea" --%>
                                 onclick="javascript:return myUrl('../Payroll/SubmitPayroll.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Submit Payroll</b></a>
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
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Approve or Reject Payroll") && (string)Session["processPayroll"].ToString() == "1")
              {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/payroll/S-approvepayroll.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Payroll/ApprovePayroll.aspx"  target="workarea"--%>
                                onclick="javascript:return myUrl('../Payroll/ApprovePayroll.aspx');return  false;" href='#'
                                 style="text-decoration: none;" class="nav"><b>Approve Payroll&nbsp;<asp:Label
                                        ForeColor="red" ID="lblApprove" runat="server"></asp:Label></b></a>
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
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Generate Payroll") && (string)Session["processPayroll"].ToString() == "1")
              {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table5">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/payroll/S-generatepayroll.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Payroll/GenPayroll.aspx" target="workarea"--%> 
                                onclick="javascript:return myUrl('../Payroll/GenPayroll.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Generate Payroll&nbsp;<asp:Label
                                        ForeColor="red" ID="lblGenerate" runat="server"></asp:Label></b></a>
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
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "print payroll"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table6">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/payroll/S-payroll.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Payroll/PrintPayroll.aspx" target="workarea"--%> 
                                onclick="javascript:return myUrl('../Payroll/PrintPayroll.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Print Payroll&nbsp;<asp:Label
                                        ForeColor="Blue" ID="lblPrint" runat="server"></asp:Label></b></a>
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
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Unlock Payroll"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table7">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/payroll/S-unlockpayroll.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Payroll/UnLockPayroll.aspx" target="workarea"--%>
                                 onclick="javascript:return myUrl('../Payroll/UnLockPayroll.aspx');return  false;" href='#'
                                 style="text-decoration: none;" class="nav"><b>UnLock Payroll&nbsp;<asp:Label
                                        ForeColor="Blue" ID="lblUnlock" runat="server"></asp:Label></b></a>
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
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Multi Additions"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table8">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/payroll/S-additons.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%-- href="../Payroll/Emp_BulkAdd.aspx"  target="workarea" --%>
                                onclick="javascript:return myUrl('../Payroll/Emp_BulkAdd.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Multi Additions</b></a>
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
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Multi Deductions"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table10">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/payroll/S-deductions.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Payroll/Emp_BulkDed.aspx" target="workarea"--%>
                                onclick="javascript:return myUrl('../Payroll/Emp_BulkDed.aspx');return  false;" href='#'
                                 style="text-decoration: none;" class="nav"><b>Multi Deductions</b></a>
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
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "print my payroll"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table9">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/payroll/S-payrollvaribales.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%-- href="../Payroll/PrintMyPayroll.aspx?PageType=1" target="workarea"--%>
                                onclick="javascript:return myUrl('../Payroll/PrintMyPayroll.aspx?PageType=1');return  false;" href='#'
                                 style="text-decoration: none;" class="nav"><b>Print My Payslip</b></a>
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
</body>
</html>
