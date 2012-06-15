<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomExportGrid.aspx.cs" Inherits="SMEPayroll.Management.CustomExportGrid" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

    <script language="JavaScript1.2"> 
        <!-- 

        if (document.all)
        window.parent.defaultconf=window.parent.document.body.cols
        function expando()
        {
        window.parent.expandf()

        }
        document.ondblclick=expando 

        -->

    </script>
  
</head>
<body style="margin-left: auto">
    <form id="form1" runat="server">
       <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />

        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" bgcolor="ffffff" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" width="100%" bgcolor="4D5459" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4" style="height: 23px">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Header Information</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="E5E5E5">
                            <td align="right" style="height: 35px">
                                     
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
     
        <div>
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td>
                        <radG:RadGrid ID="RadGrid1" AllowMultiRowEdit="True" AllowFilteringByColumn="true"
                            Skin="Outlook" Width="99%" runat="server" GridLines="None" AllowPaging="true"
                            AllowMultiRowSelection="true" PageSize="50"  >
                            <MasterTableView CommandItemDisplay="bottom" EditMode="InPlace" AutoGenerateColumns="False"
                                AllowAutomaticUpdates="true" AllowAutomaticInserts="true" AllowAutomaticDeletes="true"
                                TableLayout="Auto" DataKeyNames="Gid">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                <CommandItemTemplate>
                                    <div class="textfields" style="text-align: center">
                                        <asp:Button ID="btnUpdate" runat="server" class="textfields" Style="width: 80px;
                                            height: 22px" Text="Update" CommandName="UpdateAll" />
                                    </div>
                                </CommandItemTemplate>
                                <Columns>
                                    <radG:GridClientSelectColumn UniqueName="GridClientSelectColumn">
                                    </radG:GridClientSelectColumn>
                                     <radG:GridBoundColumn DataField="Gid" Display="false" DataType="System.Int32"
                                        HeaderText="Gid" SortExpression="Gid" UniqueName="Gid">
                                    </radG:GridBoundColumn>
                                     <radG:GridBoundColumn DataField="GridNo" HeaderText="Grid ID" SortExpression="GridNo"
                                        UniqueName="GridNo" AutoPostBackOnFilter="true" CurrentFilterFunction="contains">
                                        <ItemStyle Width="10%" />
                                    </radG:GridBoundColumn>
                                    
                                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="ReportName"
                                        UniqueName="ReportName" HeaderText="Report Name" AllowFiltering="false">
                                        <ItemStyle HorizontalAlign="center" />
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtReportName"  Style="text-align: left" Width="95%"
                                                runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.ReportName")%>'></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle Width="45%" />
                                    </radG:GridTemplateColumn>
                                    
                                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="Other"
                                        UniqueName="Other" HeaderText="Other Details" AllowFiltering="false">
                                        <ItemStyle HorizontalAlign="center" />
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtOther"  Style="text-align: left" Width="95%"
                                                runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Other")%>'></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle Width="40%" />
                                    </radG:GridTemplateColumn>
                                    
                                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" 
                                        UniqueName="GenerateBy"  AllowFiltering="false" HeaderText="Generated By">
                                        <ItemStyle HorizontalAlign="center" />
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkGenerateBy" runat="server" Checked='<%# DataBinder.Eval(Container,"DataItem.GenerateBy")%>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="20%" />
                                    </radG:GridTemplateColumn>
                                    
                                </Columns>
                            </MasterTableView>
                            <ClientSettings Selecting-AllowRowSelect="true" EnableRowHoverStyle="true" AllowColumnsReorder="true"
                                ReorderColumnsOnClient="true">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                            </ClientSettings>
                        </radG:RadGrid>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
