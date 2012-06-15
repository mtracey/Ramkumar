<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ManageLocation.aspx.cs"
    Inherits="SMEPayroll.Management.ManageLocation" %>
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
        <table cellpadding="0"  cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td style="height: 83px">
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Location</b></font>
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
            <center>
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
                            <radG:RadGrid ID="RadGrid1" runat="server" OnDeleteCommand="RadGrid1_DeleteCommand"
                                AllowFilteringByColumn="true" AllowSorting="true" OnItemDataBound="RadGrid1_ItemDataBound"
                                DataSourceID="SqlDataSource1" GridLines="None" Skin="Outlook" Width="93%" OnItemInserted="RadGrid1_ItemInserted"
                                OnItemUpdated="RadGrid1_ItemUpdated">
                                <MasterTableView CommandItemDisplay="Bottom" AllowAutomaticUpdates="True" DataSourceID="SqlDataSource1"
                                    AllowAutomaticDeletes="True" AutoGenerateColumns="False" AllowAutomaticInserts="True"
                                    DataKeyNames="id">
                                    <FilterItemStyle HorizontalAlign="left" />
                                    <HeaderStyle ForeColor="Navy" />
                                    <ItemStyle BackColor="White" Height="20px" />
                                    <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                    <Columns>
                                        <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="10px" />
                                        </radG:GridTemplateColumn>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="id" DataType="System.Int32"
                                            UniqueName="id" Visible="true" SortExpression="id" HeaderText="Id">
                                            <ItemStyle Width="100px" />
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn EditFormColumnIndex="0" DataField="Location_Name" UniqueName="Location_Name" HeaderText="Location Name"
                                            SortExpression="Location_Name" AllowFiltering="true" AutoPostBackOnFilter="true"
                                            CurrentFilterFunction="Contains">
                                            <ItemStyle Width="90%" HorizontalAlign="Left" />
                                        </radG:GridBoundColumn>
                                        <radG:GridDropDownColumn EditFormColumnIndex="1" DataField="isShared" DataSourceID="SqlDataSource4"
                                            ListTextField="isShared" ListValueField="isShared" UniqueName="grdshcol" HeaderText="Shared" >
                                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                                        </radG:GridDropDownColumn>
                                        <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                            <ItemStyle Width="50px" />
                                        </radG:GridEditCommandColumn>
                                        <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                            ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                            UniqueName="DeleteColumn">
                                            <ItemStyle Width="50px" HorizontalAlign="Center" CssClass="MyImageButton" />
                                        </radG:GridButtonColumn>
                                    </Columns>
                                    <EditFormSettings ColumnNumber="2">
                                        <FormTableItemStyle Wrap="False"></FormTableItemStyle>
                                        <FormCaptionStyle CssClass="EditFormHeader"></FormCaptionStyle>
                                        <FormMainTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="3"
                                            BackColor="White" Width="100%" />
                                        <FormTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="2"
                                            BackColor="White" />
                                        <FormTableAlternatingItemStyle BorderColor="blue" BorderWidth="0" Wrap="False"></FormTableAlternatingItemStyle>
                                        <EditColumn ButtonType="ImageButton" InsertText="Add New Location" UpdateText="Update"
                                            UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                        </EditColumn>
                                        <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                    </EditFormSettings>
                                    <ExpandCollapseColumn Visible="False">
                                        <HeaderStyle Width="19px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <RowIndicatorColumn Visible="False">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <CommandItemSettings AddNewRecordText="Add New Location" />
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                    <ClientEvents OnRowDblClick="RowDblClick" />
                                </ClientSettings>
                            </radG:RadGrid></td>
                    </tr>
                    <tr>
                        <td>
                            <radG:RadGrid ID="RadGrid2" runat="server" OnDeleteCommand="RadGrid1_DeleteCommand" 
                                AllowFilteringByColumn="true" AllowSorting="true" OnItemDataBound="RadGrid1_ItemDataBound"
                                DataSourceID="SqlDataSource2" GridLines="None" Skin="Outlook" Width="93%" OnItemInserted="RadGrid1_ItemInserted"
                                OnItemUpdated="RadGrid1_ItemUpdated">
                                <MasterTableView CommandItemDisplay="Bottom" AllowAutomaticUpdates="True" DataSourceID="SqlDataSource2"
                                    AllowAutomaticDeletes="True" AutoGenerateColumns="False" AllowAutomaticInserts="True"
                                    DataKeyNames="id,isShared">
                                    <FilterItemStyle HorizontalAlign="left" />
                                    <HeaderStyle ForeColor="Navy" />
                                    <ItemStyle BackColor="White" Height="20px" />
                                    <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                    <Columns>
                                        <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="10px" />
                                        </radG:GridTemplateColumn>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="id" DataType="System.Int32"
                                            UniqueName="id" Visible="true" SortExpression="id" HeaderText="Id">
                                            <ItemStyle Width="100px" />
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn EditFormColumnIndex="0" DataField="Location_Name" UniqueName="Location_Name" HeaderText="Location Name"
                                            SortExpression="Location_Name" AllowFiltering="true" AutoPostBackOnFilter="true"
                                            CurrentFilterFunction="Contains">
                                            <ItemStyle Width="90%" HorizontalAlign="Left" />
                                        </radG:GridBoundColumn>
                                        <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                            <ItemStyle Width="50px" />
                                        </radG:GridEditCommandColumn>
                                        <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                            ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                            UniqueName="DeleteColumn">
                                            <ItemStyle Width="50px" HorizontalAlign="Center" CssClass="MyImageButton" />
                                        </radG:GridButtonColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <FormTableItemStyle Wrap="False"></FormTableItemStyle>
                                        <FormCaptionStyle CssClass="EditFormHeader"></FormCaptionStyle>
                                        <FormMainTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="3"
                                            BackColor="White" Width="100%" />
                                        <FormTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="2"
                                            BackColor="White" />
                                        <FormTableAlternatingItemStyle BorderColor="blue" BorderWidth="0" Wrap="False"></FormTableAlternatingItemStyle>
                                        <EditColumn ButtonType="ImageButton" InsertText="Add New Location" UpdateText="Update"
                                            UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                        </EditColumn>
                                        <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                    </EditFormSettings>
                                    <ExpandCollapseColumn Visible="False">
                                        <HeaderStyle Width="19px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <RowIndicatorColumn Visible="False">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <CommandItemSettings AddNewRecordText="Add New Location" />
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                    <ClientEvents OnRowDblClick="RowDblClick" />
                                </ClientSettings>
                            </radG:RadGrid></td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommand="Select isShared From (Select 'NO' isShared Union Select 'YES' isShared ) D">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [Location] (Company_ID, [Location_Name],isShared) VALUES (@company_id, @Location_Name, @isShared)"
                    SelectCommand="SELECT [id], [Location_Name],isShared FROM [Location]  WHERE [company_id] = @company_id Or isShared='YES'"
                    UpdateCommand="UPDATE [Location] SET [Location_Name] = @Location_Name,isShared=@isShared WHERE [id] = @id">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Location_Name" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Location_Name" Type="String" />
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" InsertCommand="INSERT INTO [Location] (Company_ID, [Location_Name],isShared) VALUES (@company_id, @Location_Name,'NO')"
                    SelectCommand="SELECT [id], [Location_Name],isShared FROM [Location]  WHERE ([company_id] = @company_id) Or isShared='YES'"
                    UpdateCommand="UPDATE [Location] SET [Location_Name] = @Location_Name WHERE [id] = @id">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Location_Name" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Location_Name" Type="String" />
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp;</center>
        </div>
    </form>
</body>
</html>



