<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ImportEmployeeInfo.aspx.cs"
    Inherits="SMEPayroll.Management.ImportEmployeeInfo" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<%@ Import Namespace="SMEPayroll" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
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

</head>
<body style="margin:0px">
    <form id="form1" runat="server">
    <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0"  cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Import Employee Information</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right"style="height: 25px">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
                <%--<td width="5%">
                    <img alt="" src="../frames/images/EMPLOYEE/Top-Employeegrp.png" /></td>--%>
            </tr>
        </table>
        <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="50%"
            border="0">
            <tr>
                <td colspan="1">
                
                </td>
                <td class="bodytxt" style="width: 90%; text-align: center;">
                   <asp:Label ID="lblErr" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; text-align: center;">
                </td>
                <td>
                </td>
            </tr>
        </table>
        <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="50%"
            border="0">
            <td width="50%" class="bodytxt" align="right">
            Import Employee Info :
            </td>
            <td class="bodytxt" style="width: 50%; text-align: center;">
                <asp:FileUpload ID="fileUpload1" runat="Server" />
            </td>
            <tr>
            <td></td>
            <td></td>
            </tr>
            <tr>
                <td  width="20%" align="left"></td>
                
                <td  width="80%" align="left">
                <br />
                <asp:Button ID="btnExport"  Text="Import Employee Info" OnClick="btnExport_click"
                        runat="server" />
                    
                </td>
            </tr>
        </table>
    
    </form>
</body>
</html>
