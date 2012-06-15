<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ShowGroups.aspx.cs" Inherits="SMEPayroll.Users.ShowGroups" %>
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
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>List of Groups</b></font>
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
        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

            <script type="text/javascript">
                    function RowDblClick(sender, eventArgs)
                    {
                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                    }
            </script>

        </radG:RadCodeBlock>
        <div>
       <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                    <td>
                        <radG:RadGrid ID="RadGrid1" runat="server" AllowSorting="true" GridLines="None" OnPreRender="RadGrid1_PreRender"
                            OnNeedDataSource="RadGrid1_NeedDataSource" OnItemDataBound="RadGrid1_ItemDataBound"
                            OnUpdateCommand="RadGrid1_UpdateCommand" OnInsertCommand="RadGrid1_InsertCommand"
                            OnDeleteCommand="RadGrid1_DeleteCommand" AutoGenerateColumns="False" Skin="Outlook"
                            OnItemCommand="Radgrid1_Itemcommand" AllowFilteringByColumn="True" Width="93%">
                            <MasterTableView DataKeyNames="GroupId,GroupName" CommandItemDisplay="Bottom">
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
                                    <radG:GridBoundColumn UniqueName="Groupid" Visible="False" HeaderText="GroupID" DataField="GroupID">
                                        <ItemStyle Width="100px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn UniqueName="GroupName" HeaderText="GroupName" DataField="GroupName">
                                        <ItemStyle Height="1px" Width="90%" />
                                    </radG:GridBoundColumn>
                                    <radG:GridTemplateColumn AllowFiltering="False" DataField="Rights" UniqueName="Rights">
                                        <ItemTemplate>
                                            <tt class="bodytxt">
                                                <asp:Button runat="server" Width="50px" Style="text-decoration: underline; text-align: left"
                                                    BackColor="transparent" ForeColor="Blue" BorderStyle="None" BorderWidth="0" UseSubmitBehavior="true"
                                                    Text="Rights" ID="btnrights" />
                                            </tt>
                                        </ItemTemplate>
                                    </radG:GridTemplateColumn>
                                    <radG:GridButtonColumn ButtonType="ImageButton" ImageUrl="../frames/images/toolbar/edit.gif"
                                        CommandName="Edit" Text="Edit" UniqueName="EditColumn">
                                        <ItemStyle Width="20px" />
                                    </radG:GridButtonColumn>
                                    <radG:GridButtonColumn ConfirmText="Delete this record?" ButtonType="ImageButton"
                                        ImageUrl="../frames/images/toolbar/Delete.gif" CommandName="Delete" Text="Delete"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle Width="20px" />
                                    </radG:GridButtonColumn>
                                </Columns>
                                <EditFormSettings UserControlName="Grouptemplate.ascx" EditFormType="WebUserControl">
                                </EditFormSettings>
                                <ExpandCollapseColumn Visible="False">
                                    <HeaderStyle Width="19px" />
                                </ExpandCollapseColumn>
                                <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <CommandItemSettings AddNewRecordText="Add New User Group" />
                            </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                    <ClientEvents OnRowDblClick="RowDblClick" />
                                </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
