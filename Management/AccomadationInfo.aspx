<%@ Page Language="C#" AutoEventWireup="true" Codebehind="AccomadationInfo.aspx.cs"
    Inherits="SMEPayroll.Management.AccomadationInfo" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
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

    <script type="text/javascript"> 
       
           function ShowInsert(row)
      {          
        window.radopen(row, "DetailGrid");
        return false;
      }
        
      function ShowInsertForm(row)
      {          
           return false;
      }
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Accomadation Info</b></font>
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
            <tr bgcolor="#ffffff">
                <td align="center" style="height: 25px">
                    <asp:Button ID="Button4" CssClass="textfields" OnClick="Button4_Click" Width="150px"
                        Text="Export to Excel" runat="server"></asp:Button>
                    <asp:Button ID="Button5" CssClass="textfields" OnClick="Button5_Click" Width="150px"
                        Text="Export to Word" runat="server"></asp:Button>
                    <asp:Button ID="Button6" CssClass="textfields" OnClick="btnExportPdf_click" Width="150px"
                        Text="Export to PDF" runat="server"></asp:Button>
                </td>
            </tr>
        </table>
        <div>
            <radG:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowPaging="true"
                PageSize="20" GridLines="None" Skin="Outlook" Width="98%" OnInsertCommand="RadGrid1_InsertCommand"
                OnUpdateCommand="RadGrid1_UpdateCommand" OnItemCreated="RadGrid1_ItemCreated"
                OnItemCommand="RadGrid1_ItemDataBound" OnNeedDataSource="RadGrid1_NeedDataSource" 
                OnDeleteCommand="RadGrid1_DeleteCommand"
                >
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="AccomadationCode,UsedCapacity"
                    CommandItemDisplay="Bottom" CommandItemSettings-AddNewRecordText="Add New Accomadation">
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
                        <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="AccomadationCode"
                            DataType="System.String" UniqueName="AccomadationCode" Visible="true" SortExpression="AccomadationCode"
                            HeaderText="AccomadationCode">
                            <HeaderStyle Width="10%" />
                        </radG:GridBoundColumn>
                        <radG:GridBoundColumn Display="True" ReadOnly="False" DataField="AccomadationName"
                            DataType="System.String" UniqueName="AccomadationName" Visible="true" SortExpression="AccomadationName"
                            HeaderText="AccomadationName">
                            <HeaderStyle Width="20%" />
                        </radG:GridBoundColumn>
                        <radG:GridBoundColumn Display="True" ReadOnly="False" DataField="Capacity" DataType="System.String"
                            UniqueName="Capacity" Visible="true" SortExpression="Capacity" HeaderText="Capacity">
                            <HeaderStyle Width="10%" />
                        </radG:GridBoundColumn>
                        <radG:GridBoundColumn Display="True" ReadOnly="False" DataField="UsedCapacity" DataType="System.String"
                            UniqueName="UsedCapacity" Visible="true" SortExpression="UsedCapacity" HeaderText="Used Capacity">
                            <HeaderStyle Width="10%" />
                        </radG:GridBoundColumn>
                        <radG:GridBoundColumn Display="True" ReadOnly="False" DataField="AccAuthPerson1"
                            DataType="System.String" UniqueName="AccAuthPerson1" Visible="true" SortExpression="AccAuthPerson1"
                            HeaderText="Authorised Person">
                            <HeaderStyle Width="10%" />
                        </radG:GridBoundColumn>
                        <radG:GridBoundColumn Display="True" ReadOnly="False" DataField="AccAuthPersonPhone"
                            DataType="System.String" UniqueName="AccAuthPersonPhone" Visible="true" SortExpression="AccAuthPersonPhone"
                            HeaderText="Auth Person Phone">
                            <HeaderStyle Width="10%" />
                        </radG:GridBoundColumn>
                        <radG:GridBoundColumn Display="True" ReadOnly="False" DataField="Cooking" DataType="System.String"
                            UniqueName="Cooking" Visible="true" SortExpression="Cooking" HeaderText="Cooking">
                            <HeaderStyle Width="10%" />
                        </radG:GridBoundColumn>
                        <radG:GridBoundColumn Display="True" ReadOnly="False" ItemStyle-Width="10%" DataField="Laundry"
                            DataType="System.String" UniqueName="Laundry" Visible="true" SortExpression="Laundry"
                            HeaderText="Laundry">
                            <HeaderStyle Width="10%" />
                        </radG:GridBoundColumn>
                        <radG:GridBoundColumn Display="True" ReadOnly="False" DataField="AirCon" DataType="System.String"
                            UniqueName="AirCon" Visible="true" SortExpression="AirCon" HeaderText="Air Con">
                            <HeaderStyle Width="10%" />
                        </radG:GridBoundColumn>
                        <radG:GridTemplateColumn AllowFiltering="False" HeaderText="" UniqueName="Image">
                            <ItemTemplate>
                                <input type="button" id="Image3" value="Details" runat="server" />
                            </ItemTemplate>
                        </radG:GridTemplateColumn>
                        <radG:GridTemplateColumn AllowFiltering="false" UniqueName="editHyperlink">
                            <ItemTemplate>
                                <tt class="bodytxt">
                                    <asp:ImageButton ID="btnDetails" AlternateText="Edit" ImageUrl="../frames/images/toolbar/edit.gif"
                                        runat="Server" />
                                </tt>
                            </ItemTemplate>
                            <ItemStyle Width="2%" />
                        </radG:GridTemplateColumn>
                          <radG:GridButtonColumn ConfirmText="Delete this record?" ButtonType="ImageButton"
                                        ImageUrl="~/frames/images/toolbar/Delete.gif" CommandName="Delete" Text="Delete"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle Width="30px" />
                          </radG:GridButtonColumn>
                    </Columns>
                    <ExpandCollapseColumn Visible="False">
                        <HeaderStyle Width="19px" />
                    </ExpandCollapseColumn>
                    <RowIndicatorColumn Visible="False">
                        <HeaderStyle Width="20px" />
                    </RowIndicatorColumn>
                    <CommandItemTemplate>
                        <div style="float: LEFT">
                            <asp:Image ID="Image1" ImageUrl="../frames/images/toolbar/AddRecord.gif" runat="Server" />
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Management/AccomadationManagement.aspx?tType=0"
                                Font-Bold="True" Font-Underline="true">Add New Accomadation</asp:HyperLink>
                        </div>
                    </CommandItemTemplate>
                </MasterTableView>
                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    <Resizing AllowRowResize="False" EnableRealTimeResize="false" ResizeGridOnColumnResize="false"
                        AllowColumnResize="false"></Resizing>
                </ClientSettings>
            </radG:RadGrid>
        </div>
        <input type="hidden" runat="server" id="txtRadId" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
            <Windows>
                <telerik:RadWindow ID="DetailGrid" runat="server" Title="User List Dialog" Top="150px"
                    Height="340px" Width="660px" Left="20px" ReloadOnShow="false" Modal="true" />
            </Windows>
        </telerik:RadWindowManager>
    </form>
</body>
</html>
