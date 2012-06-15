<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ManageSubProject.aspx.cs"
    Inherits="SMEPayroll.Management.ManageSubProject" %>

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
<body>
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Sub-Project</b></font>
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
        <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td> <%--OnUpdateCommand="RadGrid1_UpdateCommand"--%>
                    <radG:RadGrid ID="RadGrid1" runat="server" OnDeleteCommand="RadGrid1_DeleteCommand"
                        OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound"
                        DataSourceID="SqlDataSource1" Width="93%" OnItemInserted="RadGrid1_ItemInserted" 
                        OnItemUpdated="RadGrid1_ItemUpdated"
                       
                         AllowFilteringByColumn="true" AllowSorting="true"
                        Skin="Outlook" MasterTableView-CommandItemDisplay="bottom" MasterTableView-AllowAutomaticUpdates="true"
                        MasterTableView-AutoGenerateColumns="false" MasterTableView-AllowAutomaticInserts="true"
                        MasterTableView-AllowMultiColumnSorting="true" GroupHeaderItemStyle-HorizontalAlign="left"
                        ClientSettings-EnableRowHoverStyle="true" ClientSettings-AllowColumnsReorder="true"
                        ClientSettings-ReorderColumnsOnClient="true" ClientSettings-AllowDragToGroup="true"
                        ShowGroupPanel="true" OnDetailTableDataBind="RadGrid1_DetailTableDataBind"    >
                        <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="id,Sub_Project_ID" Name="Master">
                            <FilterItemStyle HorizontalAlign="left" />
                            <HeaderStyle ForeColor="Navy" />
                            <ItemStyle BackColor="White" Height="20px" />
                            <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                            <ExpandCollapseColumn Groupable="true">
                            </ExpandCollapseColumn>
                            <DetailTables>
                                <radG:GridTableView AllowFilteringByColumn="false" DataKeyNames="SubProjectID, id, Sub_Project_Proxy_ID"
                                    runat="server" Width="100%" CommandItemDisplay="Bottom" ShowHeadersWhenNoRecords="true"
                                    Name="ProxyProject" AutoGenerateColumns="false">
                                    <ParentTableRelation>
                                        <radG:GridRelationFields DetailKeyField="SubProjectID" MasterKeyField="id" />
                                    </ParentTableRelation>
                                    <Columns>
                                        <radG:GridTemplateColumn UniqueName="TemplateColumn">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="10px" />
                                        </radG:GridTemplateColumn>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="ID" DataType="System.Int32"
                                            UniqueName="ID" Visible="false" SortExpression="ID" HeaderText="ID">
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="SubProjectID" DataType="System.Int32"
                                            UniqueName="SubProjectID" Visible="false" SortExpression="SubProjectID" HeaderText="SubProjectID">
                                        </radG:GridBoundColumn>
                                        
                                            <radG:GridTemplateColumn HeaderText="Sub Project Proxy ID" DataField="Sub_Project_Proxy_ID"
                                                UniqueName="Sub_Project_Proxy_ID" EditFormColumnIndex="1" SortExpression="Sub_Project_Proxy_ID">
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblSubProjectID" Text='<%# Eval("Sub_Project_Proxy_ID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" ID="txtSubProjectProxyID" MaxLength="50" Text='<%# Bind("Sub_Project_Proxy_ID") %>'></asp:TextBox>                                                
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtSubProjectProxyID"
                                                        ErrorMessage="*" Display="dynamic" runat="server">  
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="valRegEx" runat="server" ControlToValidate="txtSubProjectProxyID"
                                                        ValidationExpression="^[0-9a-zA-Z]+$" ErrorMessage="Please enter valid Sub Project Proxy ID"
                                                        Display="dynamic"><tt class="bodytxt">*No Spaces or Wild card characters allowed.</tt>
                                                    </asp:RegularExpressionValidator>
                                                </EditItemTemplate>
                                            </radG:GridTemplateColumn>
                                        
                                             <radG:GridTemplateColumn HeaderText="StartDate" DataField="CreatedDate"
                                                        UniqueName="StartDate" EditFormColumnIndex="1" SortExpression="CreatedDate">
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblStartDate" Text='<%# Eval("CreatedDate") %>' ></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadDatePicker ID="calSDate" runat="server"  ShowAnimation-Type="Slide"   ></telerik:RadDatePicker>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="calSDate"
                                                                ErrorMessage="*" Display="dynamic" runat="server">  
                                                            </asp:RequiredFieldValidator>
                                                        </EditItemTemplate>
                                         </radG:GridTemplateColumn>
                                        
                                        <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                            <ItemStyle Width="20px" />
                                        </radG:GridEditCommandColumn>
                                        <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                            ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete Item"
                                            UniqueName="DeleteColumn">
                                            <ItemStyle Width="20px" HorizontalAlign="Center" CssClass="MyImageButton" />
                                        </radG:GridButtonColumn>
                                    </Columns>
                                    <CommandItemTemplate>
                                        <div style="height: 15px; vertical-align: middle;" align="left">
                                            <asp:LinkButton ID="btnProxyProject" Font-Size="11px" Text="Add New Proxy Project"
                                                runat="server" CommandName="InitInsert"></asp:LinkButton>
                                        </div>
                                    </CommandItemTemplate>
                                    <EditFormSettings ColumnNumber="2">
                                        <FormTableItemStyle Wrap="False"></FormTableItemStyle>
                                        <FormCaptionStyle CssClass="EditFormHeader"></FormCaptionStyle>
                                        <FormMainTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="0"
                                            BackColor="White" Width="100%" />
                                        <FormTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="0"
                                            Height="30px" BackColor="White" />
                                        <FormTableAlternatingItemStyle BorderColor="blue" BorderWidth="0" Wrap="False"></FormTableAlternatingItemStyle>
                                        <EditColumn ButtonType="ImageButton" InsertText="Add New Proxy Project" UpdateText="Update"
                                            UniqueName="edtColumnProxy" CancelText="Cancel Edit">
                                        </EditColumn>
                                        <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                    </EditFormSettings>
                                    <CommandItemSettings AddNewRecordText="Add New Proxy Project" />
                                </radG:GridTableView>
                            </DetailTables>
                            <Columns>
                               <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="Sub_Project_ID"
                                    UniqueName="Sub_Project_ID1" Visible="true" SortExpression="Sub_Project_ID" HeaderText="Sub_Project_ID">
                                </radG:GridBoundColumn>
                                <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="10px" />
                                </radG:GridTemplateColumn>
                                <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="id" DataType="System.Int32"
                                    UniqueName="id" Visible="true" SortExpression="id" HeaderText="Id">
                                </radG:GridBoundColumn>
                                <radG:GridDropDownColumn EditFormColumnIndex="0" DataField="Parent_Project_ID" DataSourceID="SqlDataSource2"
                                    HeaderText="Main Project ID" ListTextField="Project_ID" ListValueField="ID" UniqueName="GridDropDownColumn">
                                    <ItemStyle Width="30%" HorizontalAlign="Left" />
                                </radG:GridDropDownColumn>
                                <radG:GridTemplateColumn HeaderText="Sub Project ID" DataField="Sub_Project_ID" UniqueName="Sub_Project_ID"
                                    EditFormColumnIndex="1" SortExpression="Sub Project ID">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblSubProjectID" Text='<%# Eval("Sub_Project_ID") %>'></asp:Label>                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtSubProjectID" MaxLength="50" Text='<%# Bind("Sub_Project_ID") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtSubProjectID"
                                            ErrorMessage="*" Display="dynamic" runat="server">  
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="valRegEx" runat="server" ControlToValidate="txtSubProjectID"
                                            ValidationExpression="^[0-9a-zA-Z]+$" ErrorMessage="Please enter valid Sub Project ID"
                                            Display="dynamic"><tt class="bodytxt">*</tt>
                                        </asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </radG:GridTemplateColumn>
                                <radG:GridBoundColumn EditFormColumnIndex="2" DataField="Sub_Project_Name" UniqueName="Sub_Project_Name"
                                    SortExpression="Sub_Project_Name" HeaderText="Sub Project Name">
                                    <ItemStyle Width="40%" HorizontalAlign="Left" />
                                </radG:GridBoundColumn>
                                <radG:GridDropDownColumn EditFormColumnIndex="0" DataField="timesupervisor" DataSourceID="SqlDataSource3"
                                    HeaderText="Project Supervisor" ListTextField="Emp_Name" ListValueField="Emp_Code"
                                    UniqueName="grdtscol">
                                    <ItemStyle Width="30%" HorizontalAlign="Left" />
                                </radG:GridDropDownColumn>
                                <radG:GridDropDownColumn EditFormColumnIndex="0" DataField="Active" DataSourceID="xmldtYN"
                                    HeaderText="Active" ListTextField="text" ListValueField="id" UniqueName="GridDropDownColumnActive">
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
                            <EditFormSettings ColumnNumber="3">
                                <FormTableItemStyle Wrap="False"></FormTableItemStyle>
                                <FormCaptionStyle CssClass="EditFormHeader"></FormCaptionStyle>
                                <FormMainTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="3"
                                    BackColor="White" Width="100%" />
                                <FormTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="2"
                                    Height="30px" BackColor="White" />
                                <FormTableAlternatingItemStyle BorderColor="blue" BorderWidth="0" Wrap="False"></FormTableAlternatingItemStyle>
                                <EditColumn ButtonType="ImageButton" InsertText="Add New Sub Project" UpdateText="Update" 
                                    UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                </EditColumn>
                                <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                            </EditFormSettings>
                            <CommandItemSettings AddNewRecordText="Add New Sub Project" />
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="Select * From (Select 0 Emp_code, '' emp_name Union Select Emp_code, isnull(emp_name,'')+' '+isnull(emp_lname,'') emp_name from employee where company_id = @company_id) as D Order By Emp_name">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="Select [id], (Project_ID + ' - ' + Project_Name) Project_ID From Project WHERE [company_id] = @company_id">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [SubProject] (Parent_Project_ID, Sub_Project_ID, Sub_Project_Name,TimeSuperVisor,Active) VALUES (@Parent_Project_ID, @Sub_Project_ID, @Sub_Project_Name,@TimeSuperVisor,@Active)"
            SelectCommand="Select * From (Select P.ID Parent_Project_ID, Project_ID, S.ID, S.Sub_Project_ID, S.Sub_Project_Name,P.Company_ID,S.timesupervisor,S.Active From SubProject S Inner Join Project P  On S.Parent_Project_ID = P.ID) D Where D.Company_ID=@company_id"
            UpdateCommand="UPDATE [SubProject] SET Active=@Active,TimeSuperVisor=@TimeSuperVisor, Sub_Project_ID = @Sub_Project_ID, Parent_Project_ID = @Parent_Project_ID, Sub_Project_Name = @Sub_Project_Name WHERE [id] = @id">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Sub_Project_ID" Type="String" />
                <asp:Parameter Name="Parent_Project_ID" Type="Int32" />
                <asp:Parameter Name="Sub_Project_Name" Type="String" />
                <asp:Parameter Name="TimeSuperVisor" Type="Int32" />
                <asp:Parameter Name="Active" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Sub_Project_ID" Type="String" />
                <asp:Parameter Name="Parent_Project_ID" Type="Int32" />
                <asp:Parameter Name="Sub_Project_Name" Type="String" />
                <asp:Parameter Name="TimeSuperVisor" Type="Int32" />
                <asp:Parameter Name="Active" Type="Int32" />
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:XmlDataSource ID="xmldtYN" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Options/Option">
        </asp:XmlDataSource>
    </form>
</body>
</html>
