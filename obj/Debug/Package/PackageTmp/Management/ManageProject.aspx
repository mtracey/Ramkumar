<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ManageProject.aspx.cs"
    Inherits="SMEPayroll.Management.ManageProject" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="SMEPayroll" Namespace="SMEPayroll" TagPrefix="sds" %>
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Project</b></font>
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
                        <radG:RadGrid ID="RadGrid1" runat="server" OnDeleteCommand="RadGrid1_DeleteCommand"
                            OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1" Width="93%"
                            OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated" AllowFilteringByColumn="true"
                            AllowSorting="true" Skin="Outlook" MasterTableView-CommandItemDisplay="bottom"
                            MasterTableView-AllowAutomaticUpdates="true" MasterTableView-AutoGenerateColumns="false"
                            MasterTableView-AllowAutomaticInserts="true" MasterTableView-AllowMultiColumnSorting="true"
                            GroupHeaderItemStyle-HorizontalAlign="left" ClientSettings-EnableRowHoverStyle="true"
                            ClientSettings-AllowColumnsReorder="true" ClientSettings-ReorderColumnsOnClient="true"
                            ClientSettings-AllowDragToGroup="true" ShowGroupPanel="true">
                            <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="id">
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
                                    <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="id" DataType="System.Int32"
                                        UniqueName="id" Visible="true" SortExpression="id" HeaderText="Id">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="Location_ID" DataType="System.Int32"
                                        UniqueName="Location_ID" Visible="true" SortExpression="Location_ID" HeaderText="Location_ID">
                                    </radG:GridBoundColumn>
                                    <radG:GridHyperLinkColumn EditFormColumnIndex="0" DataNavigateUrlFormatString="../Management/ManageLocation.aspx"
                                        DataNavigateUrlFields="Location_Name" DataTextField="Location_Name" HeaderText="Location Names">
                                        <ItemStyle Width="30%" HorizontalAlign="Left" />
                                    </radG:GridHyperLinkColumn>
                                    <radG:GridDropDownColumn Display="false" DataField="Location_ID" DataSourceID="SqlDataSource2"
                                        HeaderText="Location Name" ListTextField="Location_Name" ListValueField="ID"
                                        UniqueName="GridDropDownColumn">
                                        <ItemStyle Width="30%" HorizontalAlign="Left" />
                                    </radG:GridDropDownColumn>
                                    <%--                                    <radG:GridBoundColumn EditFormColumnIndex="1" DataField="Project_ID" UniqueName="Project_ID"
                                        SortExpression="Project_ID" HeaderText="Project ID">
                                        <ItemStyle Width="30%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>--%>
                                    <radG:GridTemplateColumn HeaderText="Project ID" DataField="Project_ID"
                                        UniqueName="Project_ID" EditFormColumnIndex="1" SortExpression="Project_ID">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblProjectID" Text='<%# Eval("Project_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtProjectID" MaxLength="50" Text='<%# Bind("Project_ID") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtProjectID"
                                                ErrorMessage="*" Display="dynamic" runat="server">  
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="valRegEx" runat="server" ControlToValidate="txtProjectID"
                                                ValidationExpression="^[0-9a-zA-Z]+$" ErrorMessage="Please enter valid Project ID"
                                                Display="dynamic"><tt class="bodytxt">*No Spaces or Wild card characters allowed.</tt>
                                            </asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                    </radG:GridTemplateColumn>
                                    <radG:GridBoundColumn EditFormColumnIndex="2" DataField="Project_Name" UniqueName="Project_Name"
                                        SortExpression="Project_Name" HeaderText="Project Name">
                                        <ItemStyle Width="40%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                        <ItemStyle Width="50px" />
                                    </radG:GridEditCommandColumn>
                                    <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                        ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton" />
                                    </radG:GridButtonColumn>
                                </Columns>
                                <EditFormSettings ColumnNumber="3">
                                    <FormTableItemStyle Wrap="False"></FormTableItemStyle>
                                    <FormCaptionStyle CssClass="EditFormHeader"></FormCaptionStyle>
                                    <FormMainTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="3"
                                        BackColor="White" Width="100%" />
                                    <FormTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="2"
                                        Height="30px" BackColor="White" />
                                    <FormTableAlternatingItemStyle BorderColor="blue" BorderWidth="0" Wrap="False"></FormTableAlternatingItemStyle>
                                    <EditColumn ButtonType="ImageButton" InsertText="Add New Project" UpdateText="Update"
                                        UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                    </EditColumn>
                                    <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                </EditFormSettings>
                                <CommandItemSettings AddNewRecordText="Add New Project" />
                            </MasterTableView>
                            <ClientSettings>
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                <ClientEvents OnRowDblClick="RowDblClick" />
                            </ClientSettings>
                        </radG:RadGrid>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="Select [id], [Location_Name] From Location WHERE [company_id] = @company_id Or isShared='YES'">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [Project] (Company_ID, Location_ID, Project_ID, Project_Name) VALUES (@company_id, @Location_ID, @Project_Id, @Project_Name)"
                SelectCommand="Select * From (Select P.ID,P.Company_ID,P.Location_ID,L.Location_Name,P.Project_ID, P.Project_Name From Project P Inner Join Location L On P.Location_ID = L.ID) D Where D.Company_ID=@company_id"
                UpdateCommand="UPDATE [Project] SET [Location_ID] = @Location_ID, Project_ID=@Project_ID, Project_Name=@Project_Name  WHERE [id] = @id">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Location_ID" Type="Int32" />
                    <asp:Parameter Name="Project_ID" Type="String" />
                    <asp:Parameter Name="Project_Name" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Location_ID" Type="String" />
                    <asp:Parameter Name="Project_ID" Type="String" />
                    <asp:Parameter Name="Project_Name" Type="String" />
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
