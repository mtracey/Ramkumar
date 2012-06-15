<%@ Page Language="C#" AutoEventWireup="true" Codebehind="StockDetails.aspx.cs" Inherits="SMEPayroll.Management.StockDetails" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="SMEPayroll" Namespace="SMEPayroll" TagPrefix="sds" %>
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
<body style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Inventory Details</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right" style="height: 25px">
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
            <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

                <script type="text/javascript">
            function RowDblClick(sender, eventArgs)
            {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
                </script>

            </radG:RadCodeBlock>
            <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                    <td>
                        <radG:RadGrid ID="RadGrid1" runat="server" PageSize="20" AllowPaging="true" DataSourceID="SqlDataSource1" 
                            Width="93%" AllowSorting="true" Skin="Outlook" AllowFilteringByColumn="true" MasterTableView-AutoGenerateColumns="false"
                            GroupHeaderItemStyle-HorizontalAlign="left" ClientSettings-EnableRowHoverStyle="true"
                            ClientSettings-AllowColumnsReorder="true" ClientSettings-ReorderColumnsOnClient="true"
                            ClientSettings-AllowDragToGroup="true" ShowGroupPanel="true" >
                            <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="TransId" AutoGenerateColumns="false">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                <ExpandCollapseColumn Groupable="true">
                                </ExpandCollapseColumn>
                                <Columns>
                                    <radG:GridTemplateColumn  AllowFiltering="false" UniqueName="TemplateColumn">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10px" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridBoundColumn Display="true" HeaderStyle-Width="30px" ReadOnly="True" DataField="RowId" DataType="System.String"
                                        UniqueName="RowId" Visible="true" AllowFiltering="false" HeaderText="Sl No">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="ItemCode" DataType="System.String"
                                        UniqueName="ItemCode" Visible="true" AutoPostBackOnFilter="true" CurrentFilterFunction="contains" ShowFilterIcon="false" AllowFiltering="true" SortExpression="ItemCode" HeaderText="Item Code">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="True" ReadOnly="True" DataField="ItemName" DataType="System.String"
                                        UniqueName="ItemName" Visible="true" AutoPostBackOnFilter="true" CurrentFilterFunction="contains" ShowFilterIcon="false" AllowFiltering="true" SortExpression="ItemName" HeaderText="ItemName">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="True" ReadOnly="True" DataField="Quantity" DataType="System.String"
                                        UniqueName="Quantity" Visible="true" AutoPostBackOnFilter="true" CurrentFilterFunction="contains" ShowFilterIcon="false" SortExpression="Quantity" HeaderText="Quantity">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="True" ReadOnly="True" DataField="Price" DataType="System.String"
                                        UniqueName="Price" Visible="true" AutoPostBackOnFilter="true" CurrentFilterFunction="contains" ShowFilterIcon="false" SortExpression="Price" HeaderText="Price">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="True" ReadOnly="True" DataField="StoreName" DataType="System.String"
                                        UniqueName="StoreName" Visible="true" AutoPostBackOnFilter="true" CurrentFilterFunction="contains" ShowFilterIcon="false" SortExpression="StoreName" HeaderText="StoreName">
                                    </radG:GridBoundColumn>
                                    
                                </Columns>
                                <EditFormSettings ColumnNumber="3">
                                    <FormTableItemStyle HorizontalAlign="left" Wrap="False"></FormTableItemStyle>
                                    <FormCaptionStyle HorizontalAlign="left" CssClass="EditFormHeader"></FormCaptionStyle>
                                    <FormMainTableStyle HorizontalAlign="left" BorderColor="black" BorderWidth="0" CellSpacing="0"
                                        CellPadding="3" BackColor="White" Width="100%" />
                                    <FormTableStyle HorizontalAlign="left" BorderColor="black" BorderWidth="0" CellSpacing="0"
                                        CellPadding="2" Height="50px" BackColor="White" />
                                    <FormTableAlternatingItemStyle HorizontalAlign="left" BorderColor="blue" BorderWidth="0"
                                        Wrap="False"></FormTableAlternatingItemStyle>
                                    <EditColumn ButtonType="ImageButton" InsertText="Add New Item" UpdateText="Update"
                                        UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                    </EditColumn>
                                    <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                </EditFormSettings>
                                <CommandItemSettings AddNewRecordText="Add New StockOut" />
                            </MasterTableView>
                            <ClientSettings>
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                            </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="sp_getStockDetailsOrder"
                SelectCommandType="StoredProcedure" >
                <SelectParameters>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
