<%@ Import Namespace="SMEPayroll" %>
<%@ Register TagPrefix="uc1" TagName="TopLeftC" Src="~/Frames/TopLeftMenu.ascx" %>

<%@ Page Language="c#" Codebehind="inventory_nav.aspx.cs" AutoEventWireup="false" Inherits="SMEPayroll.frames.inventory_nav" %>

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
</head>
<body style="margin-left: 0px" bgcolor="E5E5E5">
<form id="form1" runat="server" >
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
                            <td align="right"     style="width: 80px; height: 22px">
                                
                            </td>
                        </tr>
                    </table>
                </td>
               
            </tr>
        </table>
    <br />
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <!-- Start Main Table -->
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Stock In"))
    {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/INVENTORY/S-stockin.jpg" height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../Management/StockDetails.aspx"
                                target="workarea" style="text-decoration:none;" class="nav"><b>Stock Details</b></a>
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
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Stock In"))
    {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/INVENTORY/S-stockin.jpg" height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../Management/StockInNew.aspx"
                                target="workarea" style="text-decoration:none;" class="nav"><b>Stock In</b></a>
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
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Stock Out"))
     {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/INVENTORY/S-stockout.jpg"
                            height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../Management/StockOutNew.aspx"
                                target="workarea" style="text-decoration:none;" class="nav"><b>Stock Out</b></a>
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
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Stock Transfer"))
     {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/INVENTORY/S-stocktransfer.jpg" height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../Management/StockTransfer.aspx"
                                target="workarea" style="text-decoration:none;" class="nav"><b>Stock Transfer</b></a>
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
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Stock Return"))
      {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/INVENTORY/S-stockreturn.jpg" height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../Management/StockReturnNew.aspx"
                                target="workarea" style="text-decoration:none;" class="nav">Stock Return</a>
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
           <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Stock In"))
    {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/INVENTORY/S-stockin.jpg" height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../Management/StockIssueDetails.aspx"
                                target="workarea" style="text-decoration:none;" class="nav"><b>Issue Details</b></a>
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
              <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Stock In"))
    {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/INVENTORY/S-stockin.jpg" height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../Management/StockReturnDetails.aspx"
                                target="workarea" style="text-decoration:none;" class="nav"><b>Return Details</b></a>
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
              <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Stock In"))
    {%>
        <tr>
            <td width="5%">
            </td>
            <td width="95%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1%">
                        </td>
                        <td align="left" width="99%" STYLE="background-repeat: no-repeat;" background="images/INVENTORY/S-stockin.jpg" height="30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../Management/StockOutstandingDetails.aspx"
                                target="workarea" style="text-decoration:none;" class="nav"><b>Outstanding Details</b></a>
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
    <!-- End Main Table -->
</body>
</html>
