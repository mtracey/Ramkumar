<%@ Import Namespace="SMEPayroll" %>
<%@ Register TagPrefix="uc1" TagName="TopLeftC" Src="~/Frames/TopLeftMenu.ascx" %>
<%@ Page Language="c#" Codebehind="invoice_nav.aspx.cs" AutoEventWireup="false" Inherits="SMEPayroll.frames.invoice_nav" %>

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
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <uc1:TopLeftC ID="TopLeftC1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4" style="height: 23px">
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
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <!-- Start Main Table -->
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Clients"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/ADMIN/S-mangecompany.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Invoice/ClientManagement.aspx" target="workarea"--%> 
                                onclick="javascript:return myUrl('../Invoice/ClientManagement.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Manage Clients</b></a>
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
           
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Quotation"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/ADMIN/S-mangesettings.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Invoice/Quotation.aspx" target="workarea" --%>
                                onclick="javascript:return myUrl('../Invoice/Quotation.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Manage Quotation</b></a>
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
    
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Order"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/Assignment/S-ManageAssignments.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Invoice/Order.aspx" target="workarea" --%>
                                onclick="javascript:return myUrl('../Invoice/Order.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav">Manage Order</a>
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
             <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Invoice"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/ADMIN/S-Manageusers&security.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Invoice/Invoice_Main.aspx"  target="workarea"--%>
                                onclick="javascript:return myUrl('../Invoice/Invoice_Main.aspx');return  false;" href='#'
                                 style="text-decoration: none;" class="nav"><b>Manage Invoice </b></a>
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
            
             <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Manage Preference"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/ADMIN/S-Manageusers&security.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Invoice/PreferenceIcon.aspx" target="workarea" --%>
                                onclick="javascript:return myUrl('../Invoice/PreferenceIcon.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Manage Preference </b></a>
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
            
           <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Client Master"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat; visibility:hidden" background="images/ADMIN/S-Manageusers&security.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Invoice/ProjectAssignment.aspx"  target="workarea" --%>
                                onclick="javascript:return myUrl('../Invoice/ProjectAssignment.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Project Assignment</b></a>
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
            
            
            
            
            
            
            
            
            
            
            
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Payment Management"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat; visibility:hidden" background="images/ADMIN/S-Item.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a href="../Management/ItemsManagement.aspx"  target="workarea" 
                                
                                style="text-decoration: none;" class="nav">Payments</a>
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
            <%
                if (Utility.AllowedAction1(Session["Username"].ToString(), "Project Management"))
                {%>
            <tr style="display:none">
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/ADMIN/S-Project.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a href="../Management/ProjectManagement.aspx" target="workarea" 
                                
                                style="text-decoration: none;" class="nav">Mng Project</a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Accomadation Management"))
              {%>
            <tr style="display:none">
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/Admin/S-Accomadationt.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a href="../Management/ManageAccomadation.aspx"  target="workarea"
                                
                                 style="text-decoration: none;" class="nav">Mng Accomadation</a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Bulk Import"))
              {%>
            <tr style="display:none">
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/Admin/S-manageimport.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a href="../Management/ManageImports.aspx"   target="workarea"
                                
                                 style="text-decoration: none;" class="nav">Mng Imports</a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Other Managements"))
              {%>
            <tr style="display:none">
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/Admin/S-manageothers.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a href="../Management/OtherManagement.aspx" target="workarea"
                                
                                 style="text-decoration: none;" class="nav">Mng Others</a>
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
            
             <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Other Managements"))
              {%>
                <tr style="visibility:hidden">
                        <td width="5%">
                        </td>
                        <td width="95%">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="width: 1%">
                                    </td>
                                    <td align="left" width="99%" style="background-repeat: no-repeat; visibility:hidden " background="images/Admin/S-manageothers.jpg"
                                        height="30">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../Management/CertificateInformaton.aspx"
                                            target="workarea" style="text-decoration: none; visibility:hidden " class="nav">Certificate</a>
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
                    <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Create Order"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat; visibility:hidden" background="images/ADMIN/S-Workflow.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../Invoice/OrderDetails.aspx?screen=main"
                                    target="workarea" style="text-decoration: none;" class="nav">Order</a>
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
