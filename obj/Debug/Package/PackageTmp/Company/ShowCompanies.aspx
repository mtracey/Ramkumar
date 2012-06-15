<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ShowCompanies.aspx.cs"
    Inherits="SMEPayroll.Company.ShowCompanies" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
<body style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>View Companies</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td align="left">
                                &nbsp;<tt class="bodytxt">Total Licenced : </tt>
                                <asp:Label ID="lbltotalemp" runat="server" CssClass="bodytxt"></asp:Label></td>
                            <td align="left">
                                &nbsp;<tt class="bodytxt">Licence Used :</tt>
                                <asp:Label ID="lbldbemp" runat="server" CssClass="bodytxt"></asp:Label></td>
                            <td align="left">
                                &nbsp;<tt class="bodytxt">Licence Remaining :</tt>
                                <asp:Label ID="lbldiff" runat="server" CssClass="bodytxt"></asp:Label></td>
                            <td align="right" style="height: 25px">
                                <asp:Button ID="bnrefresh" Text="Refresh" runat="server" style="width: 80px; height: 22px" OnClick="bnrefresh_Click" />
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

            <script type="text/javascript">
                    function RowDblClick(sender, eventArgs)
                    {
                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                    }
            </script>

        </radG:RadCodeBlock>
        <div>
            <input type="hidden" id="flag" runat="server" />
            <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                    <td>
                        <radG:RadGrid ID="RadGrid1" AllowPaging="true" PageSize="15" runat="server" OnPreRender="RadGrid1_PreRender"
                            OnNeedDataSource="RadGrid1_NeedDataSource" OnItemCommand="RadGrid1_ItemDataBound"
                            OnItemDataBound="RadGrid1_ItemDataBound1" GridLines="None" Skin="Outlook" Width="99%" AllowSorting="true"  >
                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Bottom" DataKeyNames="Company_Id" >
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                <CommandItemTemplate>
                                    <div style="float: LEFT">
                                        <asp:Image ID="Image1" ImageUrl="../frames/images/toolbar/AddRecord.gif" runat="Server" />
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Company/AddCompanyNew.aspx"
                                            Font-Bold="True" Font-Underline="true">Add New Company</asp:HyperLink>
                                    </div>
                                </CommandItemTemplate>
                                <Columns>
                                    <radG:GridBoundColumn Display="false" DataField="Company_Id" HeaderText="Company_Id"
                                        ReadOnly="True" SortExpression="Company_Id" Visible="False" UniqueName="Company_Id">
                                    </radG:GridBoundColumn>
                                    <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-company.png" runat="Server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="2%" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridBoundColumn DataField="Company_code" HeaderText="Company Code" SortExpression="Company_code"
                                        UniqueName="Company_code">
                                        <ItemStyle Width="10%" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="Company_name" HeaderText="Company Name" SortExpression="Company_name"
                                        UniqueName="Company_name">
                                        <ItemStyle Width="50%" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="phone" HeaderText="Company Phone" SortExpression="phone"
                                        UniqueName="phone">
                                        <ItemStyle Width="10%" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="email" HeaderText="Company Email" SortExpression="email"
                                        UniqueName="email">
                                        <ItemStyle Width="20%" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="Country" HeaderText="Country" SortExpression="Country"
                                        UniqueName="Country">
                                        <ItemStyle Width="10%" />
                                    </radG:GridBoundColumn>
                                    <radG:GridTemplateColumn AllowFiltering="false" UniqueName="editHyperlink">
                                        <ItemTemplate>
                                            <tt class="bodytxt">
                                                <asp:ImageButton ID="btnedit" AlternateText="Edit" ImageUrl="../frames/images/toolbar/edit.gif"
                                                    runat="Server" />
                                            </tt>
                                        </ItemTemplate>
                                        <ItemStyle Width="2%" />
                                    </radG:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                            <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                <ClientEvents OnRowDblClick="RowDblClick" />
                            </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
