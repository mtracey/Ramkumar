<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRLetter.aspx.cs" Inherits="SMEPayroll.Management.HRLetter" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
    <div>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td>
                     <radG:RadGrid ID="RadGrid1" AllowFilteringByColumn="true" 
                        runat="server" 
                        DataSourceID="SqlDataSource1"
                        Skin="Outlook" 
                        Width="100%"
                        PageSize="50"
                        AllowPaging="true"
                        ItemStyle-Wrap="false"
                        AlternatingItemStyle-Wrap="false"
                        PagerStyle-AlwaysVisible="True" 
                        GridLines="Both" 
                        AllowSorting="false" 
                        Height="500px"
                        Font-Size="11"
                        Font-Names="Tahoma"
                        EnableHeaderContextMenu="true"
                        AllowMultiRowSelection="true"
                        >
                        <ExportSettings HideStructureColumns="true"  />
                        <MasterTableView AutoGenerateColumns="False"  DataKeyNames="EMP_CODE"
                            DataSourceID="SqlDataSource1" AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
                            TableLayout="Auto" PagerStyle-Mode="Advanced">
                            <FilterItemStyle HorizontalAlign="left" />
                            <HeaderStyle ForeColor="Navy" />
                            <ItemStyle BackColor="White" Height="25px" />
                            <AlternatingItemStyle BackColor="#E5E5E5" Height="25px" />
                            <Columns>
                                <radG:GridClientSelectColumn UniqueName="GridClientSelectColumn">
                                <HeaderStyle Width="50px" />
                                </radG:GridClientSelectColumn>
                                <radG:GridBoundColumn DataField="EMP_CODE" AllowFiltering="false" Visible="false" DataType="System.Int32"
                                    HeaderText="EMP_CODE" ReadOnly="True" SortExpression="id" UniqueName="id">
                                   
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="EMP_NAME" AutoPostBackOnFilter="true" CurrentFilterFunction="contains"
                                    HeaderText="EMPLOYEE NAME" SortExpression="EMP_NAME" UniqueName="EMP_NAME" ShowFilterIcon="false">
                                </radG:GridBoundColumn>
                      
                            </Columns>
                        </MasterTableView>
                        <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true"  Selecting-AllowRowSelect="true" >
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                             <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True"   />
                        </ClientSettings>
                    </radG:RadGrid>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         SelectCommand="select  EMP_CODE, (isnull(emp_name,'') + ' ' + isnull(emp_lname,'')) 'EMP_NAME' from Employee where company_id=@Company_id" >
                        <SelectParameters>
                            <asp:SessionParameter Name="Company_id" SessionField="Compid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr> 
            <tr>
                <td>
                    <asp:Button ID="btn_generate" runat="server" Text="Generate Letter" 
                        onclick="btn_generate_Click" />
                </td>
            </tr>       
            
        </table>
    </div>
    </form>
</body>
</html>
