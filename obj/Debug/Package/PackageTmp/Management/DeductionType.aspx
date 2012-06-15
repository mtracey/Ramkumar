<%@ Page Language="C#" AutoEventWireup="true" Codebehind="DeductionType.aspx.cs"
    Inherits="SMEPayroll.Management.DeductionType" %>

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
        <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Deduction Type</b></font>
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
                        <radG:RadGrid ID="RadGrid1" AllowPaging="true" AllowFilteringByColumn="true" OnUpdateCommand="RadGrid1_UpdateCommand"
                            OnInsertCommand="RadGrid1_InsertCommand" OnDeleteCommand="RadGrid1_DeleteCommand"
                            PageSize="20" OnItemDataBound="RadGrid1_ItemDataBound" runat="server" OnNeedDataSource="RadGrid1_NeedDataSource"
                            GridLines="None" Skin="Outlook" Width="93%" PagerStyle-Mode="NextPrevAndNumeric" AllowSorting="true" >
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id,cpf,company_id" CommandItemDisplay="Bottom">
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
                                    <radG:GridBoundColumn DataField="id" AllowFiltering="false" DataType="System.Int32"
                                        HeaderText="Id" Visible="false" ReadOnly="True" SortExpression="id" UniqueName="id">
                                        <ItemStyle Width="10px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="desc" HeaderText="Type Description" CurrentFilterFunction="StartsWith"
                                        AutoPostBackOnFilter="True" SortExpression="desc" UniqueName="desc">
                                        <ItemStyle Width="75%" />
                                    </radG:GridBoundColumn>
                                    <radG:GridDropDownColumn DataField="cpf" DataSourceID="xmldtYesNo" HeaderText="Deduct from CPF GROSS"
                                        ListTextField="text" ListValueField="id" UniqueName="GridDropDownColumnYesNo">
                                        <ItemStyle Width="15%" HorizontalAlign="Left" />
                                    </radG:GridDropDownColumn>
                                    <radG:GridBoundColumn Display="false" DataField="isShared" HeaderText="Type Description"
                                        CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="True" SortExpression="isShared"
                                        UniqueName="isShared">
                                        <ItemStyle Width="85%" />
                                    </radG:GridBoundColumn>
                                    <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                        <ItemStyle Width="20px" />
                                    </radG:GridEditCommandColumn>
                                    <radG:GridButtonColumn ConfirmText="Delete this record?" ButtonType="ImageButton"
                                        ImageUrl="../frames/images/toolbar/Delete.gif" CommandName="Delete" Text="Delete"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle Width="20px" />
                                    </radG:GridButtonColumn>
                                </Columns>
                                <ExpandCollapseColumn Visible="False">
                                    <HeaderStyle Width="19px" />
                                </ExpandCollapseColumn>
                                <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <EditFormSettings UserControlName="deduction_edit.ascx" EditFormType="WebUserControl">
                                </EditFormSettings>
                                <CommandItemSettings AddNewRecordText="Add New Deduction Type" />
                            </MasterTableView>
                            <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                <ClientEvents OnRowDblClick="RowDblClick" />
                            </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
            <asp:XmlDataSource ID="xmldtYesNo" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/OptionsText/Option">
            </asp:XmlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT [id], [desc], company_id,cpf,isShared FROM [deductions_types] where company_id=@company_id  or company_id=-1 order by [desc]">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="desc" Type="String" />
                    <asp:Parameter Name="cpf" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="desc" Type="String" />
                    <asp:Parameter Name="cpf" Type="String" />
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
