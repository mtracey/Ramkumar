<%@ Page Language="c#" Codebehind="report_nav.aspx.cs" AutoEventWireup="false" Inherits="SMEPayroll.frames.report_nav" %>

<%@ Register TagPrefix="uc1" TagName="TopLeftC" Src="~/Frames/TopLeftMenu.ascx" %>
<%@ Import Namespace="SMEPayroll" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>report_nav</title>
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
        
        function OpenIRAS()
        {
            var message = document.getElementById("txtMsg");            
            if(message.value=="V")
            {
                var newURL;
                var url = window.location.href;                 
                var mySplitResult = url.split("/");
                var i;
                for(i = 0; i < mySplitResult.length-2; i++)
                {
                        if(i==0)
                        {
                          newURL=mySplitResult[i]+"//";
                        }                
                        else if(mySplitResult[i]!="")
                        {
                          newURL=newURL+mySplitResult[i]+"/";
                        }
                }                  
                var url= newURL + "IRAS/Login.aspx";
                window.open(url); 
            }
            else if (message.value=="I")
            {
                alert('Maintenance Expire');
            }
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
<body bgcolor="E5E5E5" style="margin-left: 0">

    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>
        <uc1:TopLeftC ID="TopLeftC1" runat="server"/>
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4" style="height: 25px">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 80px; height: 35px">
                            </td>
                        </tr>
                        
                    </table>
                </td>
            </tr>
        </table>
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View CPF information"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="../frames/images/toolbar/S-formsCPF.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../CPF/SubmitCPF.aspx" target="workarea" --%>
                                 onclick="javascript:return myUrl('../CPF/SubmitCPF.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>CPF File</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View IRAS information"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="../frames/images/toolbar/S-formsIR8A.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a    id="IRAS"  runat="server" target="workarea" onclick="OpenIRAS();"  style="text-decoration:none;cursor:pointer; font-family:tahoma;font-size:11px" ><b>IRAS</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Giro information"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="../frames/images/toolbar/S-formsgGIRO.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Reports/Girofile.aspx" target="workarea"--%> 
                                 onclick="javascript:return myUrl('../Reports/Girofile.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Online Giro File</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Reports1123"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="../frames/images/reports/S-reports.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Management/Reportdetail.aspx" target="workarea"--%> 
                                onclick="javascript:return myUrl('../Management/Reportdetail.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Reports</b></a>
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
            <tr>
                <td>
                </td>
            </tr>
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Custom Reports"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="../frames/images/reports/S-Customreports.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Reports/CustomReportMainPage.aspx"   target="workarea" --%>
                                onclick="javascript:return myUrl('../Reports/CustomReportMainPage.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Custom Reports</b></a>
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
            <tr>
                <td>
                </td>
            </tr>
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Custom Consolidate Reports") && HttpContext.Current.Session["CurrentCompany"].ToString() == "1" && HttpContext.Current.Session["GroupName"].ToString().ToUpper() == "SUPER ADMIN")
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="../frames/images/reports/S-Customreports.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Reports/CustomConMainPage.aspx" target="workarea" --%>
                                onclick="javascript:return myUrl('../Reports/CustomConMainPage.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Consolidate Reports</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View CPF information"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="../frames/images/admin/S-manageAMCS.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Management/ManageAMC.aspx" target="workarea" --%>
                                onclick="javascript:return myUrl('../Management/ManageAMC.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>AMCS</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "generate ledger"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="Table11">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/payroll/S-payrollvaribales.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Payroll/GenerateLedger.aspx?PageType=1"   target="workarea" --%>
                                 onclick="javascript:return myUrl('../Payroll/GenerateLedger.aspx?PageType=1');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>3rd Party Integration</b></a>
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
