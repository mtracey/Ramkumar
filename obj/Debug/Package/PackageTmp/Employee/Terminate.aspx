<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Terminate.aspx.cs" Inherits="SMEPayroll.Employee.Terminate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Termination Report</title>
    <link href="../help/style_blue.css" type="text/css" rel="stylesheet" />
    <link href="../help/pagestyles.css" type="text/css" rel="stylesheet" />
    <link href="../help/AppStyles.css" type="text/css" rel="stylesheet" />
    <link href="../help/TableLayoutCss.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />
    <style  type="text/css">
      .tdstand
        {
            height:30px;
            vertical-align:text-bottom;
            vertical-align:bottom;
            border-bottom-width:1px;
            border-bottom-color:Silver;
            border-bottom-style:inset;
	        font-family: Tahoma;
	        font-size: 12px;
	        font-weight:bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <radG:RadScriptManager ID="ScriptManager" runat="server">
    </radG:RadScriptManager>
    <div>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td style="width:49%">
                    <!-- leave --->
                    <span class="tdstand">LEAVES DETAILS</span>
                    <radG:RadGrid ID="gridLeave" runat="server" Width="100%" AllowFilteringByColumn="true"
                        AllowSorting="true" Skin="Outlook" MasterTableView-CommandItemDisplay="bottom"
                        MasterTableView-AllowAutomaticUpdates="true" MasterTableView-AutoGenerateColumns="false"
                        MasterTableView-AllowAutomaticInserts="true" MasterTableView-AllowMultiColumnSorting="true"
                        GroupHeaderItemStyle-HorizontalAlign="left" ClientSettings-EnableRowHoverStyle="true"
                        ClientSettings-AllowColumnsReorder="true" ClientSettings-ReorderColumnsOnClient="true">
                        <MasterTableView AllowFilteringByColumn="false" CommandItemDisplay="None" DataKeyNames="id, LeavesAllowed, LY_Leaves_Bal">
                            <FilterItemStyle HorizontalAlign="left" />
                            <HeaderStyle ForeColor="Navy" />
                            <ItemStyle BackColor="White" Height="20px" />
                            <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                            <Columns>
                                <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Leave Type">
                                    <ItemStyle  />
                                    <ItemTemplate>
                                        <asp:Label ID="lblType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Type")%>'></asp:Label>
                                    </ItemTemplate>
                                </radG:GridTemplateColumn>
                                <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Balance Leaves">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLA" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ActualLeavesAvailable")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="true" HorizontalAlign="right" />
                                    <ItemStyle Font-Bold="true" HorizontalAlign="right"  />
                                </radG:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings>
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="False"
                                AllowColumnResize="False"></Resizing>
                        </ClientSettings>
                    </radG:RadGrid>
                </td>
                <td>
                    &nbsp;
                </td>
                <td valign="top" style="width:50%">
                    <!-- item -->
                    <span class="tdstand">ITEM DETAILS</span>
                    <radG:RadGrid ID="gridItem" runat="server" Width="100%" AllowFilteringByColumn="true"
                        AllowSorting="true" Skin="Outlook" MasterTableView-CommandItemDisplay="bottom"
                        MasterTableView-AllowAutomaticUpdates="true" MasterTableView-AutoGenerateColumns="false"
                        MasterTableView-AllowAutomaticInserts="true" MasterTableView-AllowMultiColumnSorting="true"
                        GroupHeaderItemStyle-HorizontalAlign="left" ClientSettings-EnableRowHoverStyle="true"
                        ClientSettings-AllowColumnsReorder="true" ClientSettings-ReorderColumnsOnClient="true">
                        <MasterTableView AllowFilteringByColumn="false" CommandItemDisplay="None" DataKeyNames="id, LeavesAllowed, LY_Leaves_Bal">
                            <FilterItemStyle HorizontalAlign="left" />
                            <HeaderStyle ForeColor="Navy" />
                            <ItemStyle BackColor="White" Height="20px" />
                            <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                            <Columns>
                                <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Item Name">
                                    <ItemStyle Width="150px" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ItemName")%>'></asp:Label>
                                    </ItemTemplate>
                                </radG:GridTemplateColumn>
                                <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Serial Number">
                                    <ItemStyle Width="150px" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SerialNumber")%>'></asp:Label>
                                    </ItemTemplate>
                                </radG:GridTemplateColumn>
                                <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLA" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Quantity")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="true" HorizontalAlign="right" />
                                    <ItemStyle Font-Bold="true" HorizontalAlign="right" Width="55px" />
                                </radG:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings>
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="False"
                                AllowColumnResize="False"></Resizing>
                        </ClientSettings>
                    </radG:RadGrid>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            
                            <td valign="top">
                                <!--Leave Supervisor -->
                               <span class="tdstand"> LEAVE SUPERVISOR</span>
                                <radG:RadGrid ID="gridLeaveSup" runat="server" Width="330px" AllowFilteringByColumn="true"
                                    AllowSorting="true" Skin="Outlook" MasterTableView-CommandItemDisplay="bottom"
                                    MasterTableView-AllowAutomaticUpdates="true" MasterTableView-AutoGenerateColumns="false"
                                    MasterTableView-AllowAutomaticInserts="true" MasterTableView-AllowMultiColumnSorting="true"
                                    GroupHeaderItemStyle-HorizontalAlign="left" ClientSettings-EnableRowHoverStyle="true"
                                    ClientSettings-AllowColumnsReorder="true" ClientSettings-ReorderColumnsOnClient="true"
                                    OnItemDataBound="gridLeaveSup_ItemDataBound">
                                    <MasterTableView AllowFilteringByColumn="false" CommandItemDisplay="None" Width="330px">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridTemplateColumn HeaderText="Sl.No" UniqueName="SlNo" HeaderStyle-Width="10%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSn" runat="server" />
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                            <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Emp Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EMP_CODE")%>'></asp:Label>
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                            <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Empoyee Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="False"
                                            AllowColumnResize="False"></Resizing>
                                         <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True" ScrollHeight="180px">
                                         </Scrolling>
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td valign="top">
                                <!-- Claim Supervisor -->
                                <span class="tdstand">Claim Supervisor</span>
                                <radG:RadGrid ID="gridClaimSup" runat="server" Width="330px" AllowFilteringByColumn="true"
                                    AllowSorting="true" Skin="Outlook" MasterTableView-CommandItemDisplay="bottom"
                                    MasterTableView-AllowAutomaticUpdates="true" MasterTableView-AutoGenerateColumns="false"
                                    MasterTableView-AllowAutomaticInserts="true" MasterTableView-AllowMultiColumnSorting="true"
                                    GroupHeaderItemStyle-HorizontalAlign="left" ClientSettings-EnableRowHoverStyle="true"
                                    ClientSettings-AllowColumnsReorder="true" ClientSettings-ReorderColumnsOnClient="true"
                                    OnItemDataBound="gridClaimSup_ItemDataBound">
                                    <MasterTableView AllowFilteringByColumn="false" CommandItemDisplay="None" Width="330px">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridTemplateColumn HeaderText="Sl.No" UniqueName="SlNo" HeaderStyle-Width="10%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSn" runat="server" />
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                            <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Emp Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EMP_CODE")%>'></asp:Label>
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                            <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Empoyee Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="False"
                                            AllowColumnResize="False"></Resizing>
                                            <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True" ScrollHeight="180px">
                                         </Scrolling>
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <span class="tdstand">TIMESHEET SUPERVISOR</span>
                                <radG:RadGrid ID="gridTimeSheetSup" runat="server" Width="330px" AllowFilteringByColumn="true"
                                    AllowSorting="true" Skin="Outlook" MasterTableView-CommandItemDisplay="bottom"
                                    MasterTableView-AllowAutomaticUpdates="true" MasterTableView-AutoGenerateColumns="false"
                                    MasterTableView-AllowAutomaticInserts="true" MasterTableView-AllowMultiColumnSorting="true"
                                    GroupHeaderItemStyle-HorizontalAlign="left" ClientSettings-EnableRowHoverStyle="true"
                                    ClientSettings-AllowColumnsReorder="true" ClientSettings-ReorderColumnsOnClient="true"
                                    OnItemDataBound="gridTimeSheetSup_ItemDataBound">
                                    <MasterTableView AllowFilteringByColumn="false" CommandItemDisplay="None" Width="330px">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridTemplateColumn HeaderText="Sl.No" UniqueName="SlNo" HeaderStyle-Width="10%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSn" runat="server" />
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                            <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Emp Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EMP_CODE")%>'></asp:Label>
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                            <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Empoyee Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="False"
                                            AllowColumnResize="False"></Resizing>
                                              <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True" ScrollHeight="180px">
                                         </Scrolling>
                                    </ClientSettings>
                                  
                                </radG:RadGrid>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td valign="top">
                                <span class="tdstand">WORKFLOW SUPERVISOR</span>
                                <radG:RadGrid ID="gridWorkflowSup" runat="server" Width="330px" AllowFilteringByColumn="true"
                                    AllowSorting="true" Skin="Outlook" MasterTableView-CommandItemDisplay="bottom"
                                    MasterTableView-AllowAutomaticUpdates="true" MasterTableView-AutoGenerateColumns="false"
                                    MasterTableView-AllowAutomaticInserts="true" MasterTableView-AllowMultiColumnSorting="true"
                                    GroupHeaderItemStyle-HorizontalAlign="left" ClientSettings-EnableRowHoverStyle="true"
                                    ClientSettings-AllowColumnsReorder="true" ClientSettings-ReorderColumnsOnClient="true"
                                    OnItemDataBound="gridWorkflowSup_ItemDataBound">
                                    <MasterTableView AllowFilteringByColumn="false" CommandItemDisplay="None" Width="330px">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridTemplateColumn HeaderText="Sl.No" UniqueName="SlNo" HeaderStyle-Width="10%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSn" runat="server" />
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                            <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Emp Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EMP_CODE")%>'></asp:Label>
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                            <radG:GridTemplateColumn AllowFiltering="false" HeaderText="Empoyee Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="False"
                                            AllowColumnResize="False"></Resizing>
                                            <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True" ScrollHeight="180px">
                                         </Scrolling>
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                   <asp:Label ID="lblMessage" runat="server" ForeColor="red" class="bodytxt" Font-Bold="true" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
