<%@ Import Namespace="SMEPayroll" %>
<%@ Register TagPrefix="uc1" TagName="TopLeftC" Src="~/Frames/TopLeftMenu.ascx" %>
<%@ Page Language="c#" Codebehind="admin_nav.aspx.cs" AutoEventWireup="false" Inherits="SMEPayroll.frames.admin_nav" %>

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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Company"))
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
                                <a <%--href="../Company/ShowCompanies.aspx" target="workarea" --%>
                                 onclick="javascript:return myUrl('../Company/ShowCompanies.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav"><b>Mng Company</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Users"))
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
                                <a <%--href="../Users/ShowGroups.aspx"   target="workarea"--%>
                                 onclick="javascript:return myUrl('../Users/ShowGroups.aspx');return  false;" href='#'
                                 style="text-decoration: none;" class="nav"><b>Mng Security</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Lookups"))
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
                                <a <%--href="../Management/ShowDropdowns.aspx" target="workarea"--%>
                                 onclick="javascript:return myUrl('../Management/ShowDropdowns.aspx');return  false;" href='#'
                                 style="text-decoration: none;" class="nav"><b>Mng Settings</b></a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Workflow Management"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/ADMIN/S-Workflow.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Management/WorkFlowManagement.aspx" target="workarea" --%>
                                 onclick="javascript:return myUrl('../Management/WorkFlowManagement.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav">Mng Workflow</a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Assignment Management"))
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
                                <a <%--href="../Management/assignmentManagement.aspx"  target="workarea" --%>
                                 onclick="javascript:return myUrl('../Management/assignmentManagement.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav">Mng Assignments</a>
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
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Items Management"))
              {%>
            <tr>
                <td width="5%">
                </td>
                <td width="95%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="1%">
                            </td>
                            <td align="left" width="99%" style="background-repeat: no-repeat;" background="images/ADMIN/S-Item.jpg"
                                height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a <%--href="../Management/ItemsManagement.aspx"  target="workarea" --%>
                                 onclick="javascript:return myUrl('../Management/ItemsManagement.aspx');return  false;" href='#'
                                style="text-decoration: none;" class="nav">Mng Items</a>
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
            <tr>
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
                                <a <%--href="../Management/ProjectManagement.aspx" target="workarea"--%>
                                 onclick="javascript:return myUrl('../Management/ProjectManagement.aspx');return  false;" href='#'
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
            <tr>
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
                                <a <%--href="../Management/ManageAccomadation.aspx"  target="workarea"--%> 
                                 onclick="javascript:return myUrl('../Management/ManageAccomadation.aspx');return  false;" href='#'
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
            <%if ((Session["anbsysadmingroup"].ToString() == "anbsysadmingroup"))
              {%>
            <tr>
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
                                <a <%--href="../Management/ManageImports.aspx" target="workarea" --%>
                                 onclick="javascript:return myUrl('../Management/ManageImports.aspx');return  false;" href='#'
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
            <tr>
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
                                <a <%--href="../Management/OtherManagement.aspx" target="workarea" --%>
                                 onclick="javascript:return myUrl('../Management/OtherManagement.aspx');return  false;" href='#'
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
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                        <a <%--href="../Management/CertificateInformaton.aspx"  target="workarea"--%> 
                                         onclick="javascript:return myUrl('../Management/CertificateInformaton.aspx');return  false;" href='#'
                                        style="text-decoration: none; visibility:hidden " class="nav">Certificate</a>
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
