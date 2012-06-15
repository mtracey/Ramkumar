<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ShowDropdowns.aspx.cs"
    Inherits="SMEPayroll.Management.ShowDropdowns" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../style/PMSStyle.css" type="text/css" />
    <style type="text/css">
        .item, .alternatingItem
        {
           float: left;
           margin: 2px;
           width: 240px;
           height: 30px;
           border: 1px solid threedshadow;
        }
        .item
        {
           background: whitesmoke !important;
        }
        .alternatingItem
        {
           background: whitesmoke !important;
        }
        .item:hover, .alternatingItem:hover
        {
           background: silver !important;
        } 
    </style>
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
<body style="margin-left: auto">
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Show Dropdowns</b></font>
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
        <div>
            <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                    <td align="center">
                <radG:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" AllowFilteringByColumn='false'
                    GridLines="none" AllowPaging="true" AllowSorting="false" PageSize="100" OnPreRender="RadGrid1_PreRender" Width="80%">
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <MasterTableView ShowHeader="false" TableLayout="Auto">
                        <ItemTemplate>
                            <%# (((GridItem)Container).ItemIndex != 0)? "</td></tr></table>" : "" %>
                            <table class='<%# (((GridItem)Container).ItemType == GridItemType.Item)? "item" : "alternatingItem" %>'>
                                <tr>
                                    <td>
                                        <%--<asp:Image ImageAlign="left" ID="id1" runat="server" ImageUrl="~/Frames/Images/ADMIN/B-managecomapny.png" />--%>
                                        <a href='<%# DataBinder.Eval(Container.DataItem, "Navigate") %>'><span style="font-size: 14px;
                                            text-align: left">
                                            <%# DataBinder.Eval(Container.DataItem, "DropDown") %>
                                        </span></a>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="left" />
                    </MasterTableView>
                    <GroupingSettings CaseSensitive="false" />
                </radG:RadGrid>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT [ID], [dropdown],[Navigate] FROM [dropdowns] order by DropDown">
                </asp:SqlDataSource>
            </td></tr></table>
        </div>
    </form>
</body>
</html>
