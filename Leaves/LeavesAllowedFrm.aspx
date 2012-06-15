<%@ Page Language="C#" AutoEventWireup="true" Codebehind="LeavesAllowedFrm.aspx.cs"
    Inherits="SMEPayroll.Leaves.LeavesAllowedFrm" %>

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
        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

            <script type="text/javascript">
                    function RowDblClick(sender, eventArgs)
                    {
                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                    }
            </script>

        </radG:RadCodeBlock>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Yearly Leaves Allowed For Employee Groups</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td align="center">
                                <tt class="bodytxt">Employee Group :</tt>
                                <asp:DropDownList ID="cmbEmpgroup" runat="server" CssClass="textfields">
                                </asp:DropDownList>
                                &nbsp;&nbsp; <tt class="bodytxt">Leave Year:</tt>
                         <%--       <asp:DropDownList ID="cmbLeaveYear" runat="server" CssClass="textfields">
                                    <asp:ListItem Value="2007">2007</asp:ListItem>
                                    <asp:ListItem Value="2008">2008</asp:ListItem>
                                    <asp:ListItem Value="2009">2009</asp:ListItem>
                                    <asp:ListItem Value="2010">2010</asp:ListItem>
                                    <asp:ListItem Value="2011">2011</asp:ListItem>
                                    <asp:ListItem Value="2012">2012</asp:ListItem>
                                    <asp:ListItem Value="2013">2013</asp:ListItem>
                                    <asp:ListItem Value="2014">2014</asp:ListItem>
                                    <asp:ListItem Value="2015">2015</asp:ListItem>
                                </asp:DropDownList>--%>
                                
                                 <asp:DropDownList ID="cmbLeaveYear"  CssClass="textfields" DataTextField="text" DataValueField="id" DataSourceID="xmldtYear" 
                                       runat="server">
                               </asp:DropDownList>
                               <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                
                                
                                &nbsp;&nbsp;&nbsp;&nbsp;<tt><asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid"
                                    runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />                                
                                </tt>                                
                            </td>
                           
                            <td valign="middle" style="width: 2%" align="right">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                            
                           
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <asp:Label ID="lblerror" ForeColor="red" class="bodytxt" runat="server"></asp:Label>
            </tr>
            <tr>
                <td>
                    <radG:RadGrid ID="RadGrid1" Skin="Outlook" runat="server" OnItemCommand="RadGrid1_ItemCommand"
                        GridLines="None" Width="99%" OnItemDataBound="RadGrid1_ItemDataBound">
                        <MasterTableView CommandItemDisplay="bottom" AutoGenerateColumns="False" DataKeyNames="id,typeid,leaves_allowed,group_id"
                           >
                            <FilterItemStyle HorizontalAlign="left" />
                            <HeaderStyle ForeColor="Navy" />
                            <ItemStyle BackColor="White" Height="20px" />
                            <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                            <CommandItemTemplate>
                                <%--to get the button in the grid header--%>
                                <div style="text-align: center">
                                    <asp:Button ID="btnCopy" runat="server" Text="Copy LastYear Leaves" CommandName="UpdateLastYear" Visible="false"  />   
                                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CommandName="UpdateAll" />                                    
                                    <asp:Button ID="btnSubmitEmp" runat="server" Text="Copy Leaves " CommandName="UpdateDataEmp"  />
                                </div>                                 
                            </CommandItemTemplate>
                            <Columns>
                                <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="10px" />
                                </radG:GridTemplateColumn>
                                <radG:GridBoundColumn Visible="false" DataField="id" DataType="System.Int32" HeaderText="id"
                                    ReadOnly="True" SortExpression="id" UniqueName="id">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn Visible="false" DataField="group_id" DataType="System.Int32"
                                    HeaderText="group_id" ReadOnly="True" SortExpression="group_id" UniqueName="group_id">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn Visible="false" DataField="typeid" DataType="System.Int32"
                                    HeaderText="typeid" ReadOnly="True" SortExpression="typeid" UniqueName="typeid">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Type" HeaderText="Leave Types" SortExpression="Type"
                                    UniqueName="Type">
                                    <ItemStyle Width="30%" />
                                </radG:GridBoundColumn>
                                <radG:GridTemplateColumn DataField="leaves_allowed" UniqueName="leaves_allowed" HeaderText="No.of Leaves Allowed">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtleaves" Width="80px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.leaves_allowed")%>'></asp:TextBox>
                                    </ItemTemplate>
                                    <ItemStyle Width="70%" />
                                </radG:GridTemplateColumn>
                                <radG:GridBoundColumn Visible="false" DataField="companyid" DataType="System.Int32"
                                    HeaderText="companyid" SortExpression="companyid" UniqueName="companyid">
                                </radG:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                        </ClientSettings>
                    </radG:RadGrid>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="sp_allowed_leaves"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter Name="groupid" Type="Int32" ControlID="cmbEmpgroup" />
                <asp:SessionParameter Name="compid" SessionField="compid" Type="Int32" />
                <asp:ControlParameter ControlID="cmbLeaveYear" PropertyName="SelectedValue" Name="leave_year" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <radG:RadGrid ID="RadGrid2" Skin="Outlook" Width="99%" OnItemCommand="RadGrid2_ItemCommand"
            runat="server" GridLines="None" DataSourceID="SqlDataSource2">
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="comp_id,group_id,year_of_service,leaves_allowed"
                CommandItemDisplay="Bottom" DataSourceID="SqlDataSource2">
                <CommandItemTemplate>
                    <%--to get the button in the grid header--%>
                    <div style="text-align: center">
                        <asp:Button ID="btnsubmit2" runat="server" Text="Submit" CommandName="UpdateAll" />
                        
                    </div>                    
                </CommandItemTemplate>
                <Columns>
                    <radG:GridBoundColumn Visible="false" DataField="comp_id" DataType="System.Int32"
                        HeaderText="comp_id" ReadOnly="True" SortExpression="comp_id" UniqueName="comp_id">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Visible="false" DataField="group_id" DataType="System.Int32"
                        HeaderText="group_id" ReadOnly="True" SortExpression="group_id" UniqueName="group_id">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="year_of_service" DataType="System.Int32" HeaderText="Year Of Service"
                        ReadOnly="True" SortExpression="year_of_service" UniqueName="year_of_service">
                        <HeaderStyle HorizontalAlign="center" />
                        <ItemStyle HorizontalAlign="center" />
                    </radG:GridBoundColumn>
                    <radG:GridTemplateColumn DataField="leaves_allowed" UniqueName="leaves_allowed" HeaderText="Annual Leaves Allowed">
                        <ItemTemplate>
                            <asp:TextBox ID="txtleavesallowed" Width="80px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.leaves_allowed")%>'></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="70%" />
                    </radG:GridTemplateColumn>
                </Columns>
                <ExpandCollapseColumn Visible="False">
                    <HeaderStyle Width="19px" />
                </ExpandCollapseColumn>
                <RowIndicatorColumn Visible="False">
                    <HeaderStyle Width="20px" />
                </RowIndicatorColumn>
            </MasterTableView>
        </radG:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" DeleteCommand="DELETE FROM [prorated_leaves] WHERE [comp_id] = @comp_id AND [group_id] = @group_id AND [year_of_service] = @year_of_service AND [leaves_allowed] = @leaves_allowed"
            InsertCommand="INSERT INTO [prorated_leaves] ([comp_id], [group_id], [year_of_service], [leaves_allowed]) VALUES (@comp_id, @group_id, @year_of_service, @leaves_allowed)"
            SelectCommand="SELECT [comp_id], [group_id], [year_of_service], [leaves_allowed] FROM [prorated_leaves] WHERE ([comp_id] = @comp_id) and ([group_id] =@groupid)">
            <DeleteParameters>
                <asp:Parameter Name="comp_id" Type="Int32" />
                <asp:Parameter Name="group_id" Type="Int32" />
                <asp:Parameter Name="year_of_service" Type="Int32" />
                <asp:Parameter Name="leaves_allowed" Type="Double" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter Name="groupid" Type="Int32" ControlID="cmbEmpgroup" />
                <asp:SessionParameter Name="comp_id" SessionField="compid" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="comp_id" Type="Int32" />
                <asp:Parameter Name="group_id" Type="Int32" />
                <asp:Parameter Name="year_of_service" Type="Int32" />
                <asp:Parameter Name="leaves_allowed" Type="Double" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cmbEmpgroup"
            Display="None" ErrorMessage="Employee Group Name is not selected!" InitialValue=""></asp:RequiredFieldValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
            ShowMessageBox="True" ShowSummary="False" />
    </form>
</body>
</html>
