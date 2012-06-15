<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="right.aspx.cs" Inherits="SMEPayroll.Frames.right" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="uc1" TagName="TopLeftC" Src="~/Frames/TopLeftMenu.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>right</title>
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
<body ms_positioning="GridLayout" style="MARGIN: 0px"  bgcolor="E5E5E5">
    <form id="form1" runat="server">

        <script type="text/javascript">
        //<![CDATA[
        /**********************************************************
                                ToolTip Events
        **********************************************************/ 
        function OnClientBeforeShow(sender, eventArgs)
        {
    
            LogEvent(eventArgs + "ToolTip with ID " + sender.get_id() + " will show."); 
        }
        
        function OnClientBeforeHide(sender, eventArgs)
        { 
            LogEvent("ToolTip with ID " + sender.get_id() + " will hide.");
        }
        
        function OnClientHide(sender, eventArgs)
        {
            LogEvent("ToolTip with ID " + sender.get_id() + " hide.");
        }
        
        function OnClientShow(sender, eventArgs)
        {
            LogEvent("ToolTip with ID " + sender.get_id() + " showed.");
        }
        
        /**********************************************************
                                Helper
        **********************************************************/ 
        function LogEvent(eventString) {
            document.getElementById("eventConsole").innerHTML = "kishore Here"
        }
        //]]>
       </script>
       <asp:ScriptManager ID="ScriptManager1" runat="server" />
       <uc1:TopLeftC ID="TopLeftC1" runat="server" />
       <table cellpadding="0"  cellspacing="0"  width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%"  border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4" style="height: 25px">
                                
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
            <tr>
                <td width="100%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left" width="100%" STYLE="background-repeat: no-repeat;"  background="images/HOME/S-changepassword.jpg" height="30">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a style="text-decoration:none;"id="toolId" href="#" onclick="javascript:return myUrl('../main/changepwd.aspx');return  false;" <%--href="../main/changepwd.aspx"--%> target="workarea"
                                    class="nav"><b>Change Password</b></a>
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
        </table>
        
    </form>
</body>
</html>
