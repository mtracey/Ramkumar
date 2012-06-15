<%@ Page Language="c#" Codebehind="bottom.aspx.cs" AutoEventWireup="false" Inherits="SMEPayroll.frames.bottom" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="uc1" TagName="BottomCtrl" Src="~/Frames/Bottom.ascx" %>
<%@ Import Namespace="SMEPayroll" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" href="../Style/PMSStyle.css" type="text/css" />
    <title>bottom</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript">
        function onmouseoverth(e)
        {
            if (document.getElementById("id1") != null)
            {
                document.getElementById("id1").src ="../frames/images/toolbar/employee.jpg";
            }
            if (document.getElementById("id2") != null)
            {
                document.getElementById("id2").src ="../frames/images/toolbar/job.jpg";
            }
            if (document.getElementById("id3") != null)
            {
                document.getElementById("id3").src ="../frames/images/toolbar/payroll.jpg";
            }
            if (document.getElementById("id4") != null)
            {
                document.getElementById("id4").src ="../frames/images/toolbar/Inventory.jpg";
            }
            if (document.getElementById("id5") != null)
            {
                document.getElementById("id5").src ="../frames/images/toolbar/Timesheet.jpg";
            }
            if (document.getElementById("id6") != null)
            {
                document.getElementById("id6").src ="../frames/images/toolbar/claims.jpg";
            }
            if (document.getElementById("id7") != null)
            {
                document.getElementById("id7").src ="../frames/images/toolbar/Invoicing.jpg";
            }
            if (document.getElementById("id8") != null)
            {
                document.getElementById("id8").src ="../frames/images/toolbar/admin.jpg";
            }
            if (document.getElementById("id9") != null)
            {
                document.getElementById("id9").src ="../frames/images/toolbar/reports.jpg";
            }
            e.src=(e.src.substring(0, e.src.length-4)) + '-O.jpg';
        }
    </script>
    
     <script language="javascript" type="text/javascript">
        function myUrl(menuURL)
        {
            var leftMenuUrl=menuURL.split("__");
            parent.workarea.location=leftMenuUrl[0];
            window.parent.frames[0].location = leftMenuUrl[1];
            return  false;
        }
    </script>
    
    
</head>
<body bottommargin="0" leftmargin="-10" topmargin="0"  scroll="no" background="../frames/images/toolbar/back.jpg"  >
<form id="formBottom" runat="server">
        <table id="Table1" style="margin-left:0px;" cellspacing="0" cellpadding="0"  background="../frames/images/toolbar/back.jpg" width="100%">
            <tr> 
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Employee Management"))
              {%>
            <td style="height: 30px">
               <a <%--href="emp_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Employee.aspx';"--%> onclick="javascript:return myUrl('../Management/Employee.aspx__../frames/emp_nav.aspx');return  false;" href="#" >
                                                    <img id="id1" onmouseover="javascript:onmouseoverth(this);" alt="" src="../frames/images/toolbar/employee.jpg"
                                                        border="0" width="129" /></a>
            </td>
            <%}%>
            
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Leave Management"))
              {%>
            <td style="height: 30px">
                <a <%--href="job_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Leave.aspx';"--%>  onclick="javascript:return myUrl('../Management/Leave.aspx__../frames/job_nav.aspx');return  false;" href="#"   >
                    <img id="id2" onmouseover="javascript:onmouseoverth(this);" alt="" src="../frames/images/toolbar/job.jpg"
                        border="0" /></a></td>
            <%}%>
            
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Claims Management"))
              {%>
            <td style="height: 30px">
                <a <%--href="claims_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Claims.aspx';"--%>  onclick="javascript:return myUrl('../Management/Claims.aspx__../frames/claims_nav.aspx');return  false;" href="#"   >
                    <img id="id6" onmouseover="javascript:onmouseoverth(this);" alt="" src="../frames/images/toolbar/claims.jpg"
                        border="0" /></a></td>
            <%}%>
            
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Timesheet Management"))
              {%>
            <td style="height: 30px">
                <a <%--href="timesheet_nav.aspx" target="main" onclick="parent.workarea.location='../Management/TimeSheet.aspx';"--%>  onclick="javascript:return myUrl('../Management/TimeSheet.aspx__../frames/timesheet_nav.aspx');return  false;" href="#"    >
                    <img id="id5" onmouseover="javascript:onmouseoverth(this);" alt="" src="../frames/images/toolbar/Timesheet.jpg"
                        border="0" /></a></td>
            <%}%>
            
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Payroll Management"))
              {%>
            <td style="height: 30px">
                <a <%--href="project_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Payroll.aspx';"--%>  onclick="javascript:return myUrl('../Management/Payroll.aspx__../frames/project_nav.aspx');return  false;" href="#"     >
                    <img id="id3" onmouseover="javascript:onmouseoverth(this);" alt="" src="../frames/images/toolbar/payroll.jpg"
                        border="0" /></a></td>
            <%}%>
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Reports Management"))
              {%>
            <td style="height: 30px">
                <a <%--href="report_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Reports.aspx';"--%>  onclick="javascript:return myUrl('../Management/Reports.aspx__../frames/report_nav.aspx');return  false;" href="#"  >
                    <img id="id9" onmouseover="javascript:onmouseoverth(this);" alt="" src="../frames/images/toolbar/reports.jpg"
                        border="0" /></a></td>
            <%}%>
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Admin Rights"))
                {%>
            <td style="height: 30px">
                <a <%--href="admin_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Admin.aspx';"--%> onclick="javascript:return myUrl('../Management/Admin.aspx__../frames/admin_nav.aspx');return  false;" href="#">
                    <img id="id8" onmouseover="javascript:onmouseoverth(this);" alt="" src="../frames/images/toolbar/admin.jpg"
                        border="0" /></a></td>
            <%}%>
            
            
             <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Invoice Management") && Session["ANBPRODUCT"].ToString() == "WMSI")
              {%>
                <td style="height: 30px">
                    <a <%--href="invoice_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Invoice.aspx';"--%> onclick="javascript:return myUrl('../Management/Invoice.aspx__../frames/invoice_nav.aspx');return  false;" href="#" >
                        <img id="id7"  alt="" src="../frames/images/toolbar/invoicing.jpg"  onmouseover="javascript:onmouseoverth(this);" border="0" />                            
                     </a></td>
            <%}%>
            
            
            <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Inventory Management") && Session["ANBPRODUCT"].ToString() == "WMSI")
              {%>
            <td style="height: 30px;display:none"  >
                <a href="inventory_nav.aspx" target="main" onclick="parent.workarea.location='../Management/Inventory.aspx';">
                    <img id="id4" onmouseover="javascript:onmouseoverth(this);" alt="" src="../frames/images/toolbar/Inventory.jpg"
                        border="0" /></a></td>
            <%}%>
         
            
        </tr>                 
        </table>        
        <table style="margin-left:-15px;" cellspacing="0" cellpadding="0"  background="../frames/images/toolbar/backstop.jpg" width="105%">
             <tr >
                <td valign="bottom" colspan="7" >
                    <uc1:BottomCtrl runat="server" ID="btmCtrl"/>
                </td>
             </tr>  
        </table>
        <telerik:RadScriptManager ID="radScript" runat="server"></telerik:RadScriptManager>    
    </form>
</body>
</html>
