<%@ Page Language="c#" Codebehind="emp_nav.aspx.cs" AutoEventWireup="false" Inherits="SMEPayroll.frames.emp_nav" %>
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
<form id="form1" runat="server" >
  <asp:ScriptManager ID="ScriptManager1" runat="server" />
       <uc1:TopLeftC ID="TopLeftC1" runat="server" />
    
  <table cellpadding="0"  cellspacing="0"  width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%"  border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4" style="height: 32px">
                                
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
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Employees"))
     {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                            <td align="left"  width="99%" STYLE="background-repeat: no-repeat;"  background="images/employee/S-Employee.jpg" height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            
                            <a <%--href="../Payroll/ClaimAdditions.aspx"  target="workarea"--%> onclick="javascript:return myUrl('../employee/Employee.aspx');return  false;" href='#' style="text-decoration:none;" class="nav"><b>Employees</b></a>    
                            
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
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Employee Groups"))
     {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" STYLE="background-repeat: no-repeat;" width="99%" background="images/employee/s-employeegrp.jpg" height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            <a <%--href="../employee/EmployeeGroups.aspx"  target="workarea" --%> onclick="javascript:return myUrl('../employee/EmployeeGroups.aspx');return  false;" href='#'
                            style="text-decoration:none;" class="nav"><b>Emp Leave Groups</b></a>
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
    </table>
    </form> 
    <!-- End Main Table -->
</body>
</html>
