<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ClaimAdditions.aspx.cs"
    Inherits="SMEPayroll.Payroll.ClaimAddtitions" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../style/PMSStyle.css" type="text/css" />

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
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Apply Claims</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td width="100%" style="height: 25px">
                                <tt class="bodytxt">Employee:</tt>
                                <asp:DropDownList ID="drpemp" runat="server" Width="136px" CssClass="textfields">
                                </asp:DropDownList>
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="textfields">
                                    <asp:ListItem Value="13">All</asp:ListItem>
                                    <asp:ListItem Value="01">January</asp:ListItem>
                                    <asp:ListItem Value="02">February</asp:ListItem>
                                    <asp:ListItem Value="03">March</asp:ListItem>
                                    <asp:ListItem Value="04">April</asp:ListItem>
                                    <asp:ListItem Value="05">May</asp:ListItem>
                                    <asp:ListItem Value="06">June</asp:ListItem>
                                    <asp:ListItem Value="07">July</asp:ListItem>
                                    <asp:ListItem Value="08">August</asp:ListItem>
                                    <asp:ListItem Value="09">September</asp:ListItem>
                                    <asp:ListItem Value="10">October</asp:ListItem>
                                    <asp:ListItem Value="11">November</asp:ListItem>
                                    <asp:ListItem Value="12">December</asp:ListItem>
                                </asp:DropDownList>
                            <%--    <asp:DropDownList ID="cmbYear" runat="server" Style="width: 65px" CssClass="textfields">
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
                                <asp:DropDownList ID="cmbYear" Style="width: 65px" CssClass="textfields" DataTextField="text" DataValueField="id" DataSourceID="xmldtYear" 
                                               runat="server"  AutoPostBack="true" >
                                       </asp:DropDownList>
                                       <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                
                                
                                
                                <asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid" runat="server" ImageUrl="~/frames/images/toolbar/go.ico" /></td>
                            <td>
                                <input id="Button1" type="button" onclick="history.go(-1)" value="Back" class="textfields"
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
                <asp:Label ID="lblerror" runat="server" ForeColor="red"></asp:Label>
            </tr>
            <tr>
                <td>
                    <radG:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="true" OnItemDataBound="RadGrid1_ItemDataBound"
                        OnUpdateCommand="RadGrid1_UpdateCommand" OnDeleteCommand="RadGrid1_DeleteCommand"
                        OnInsertCommand="RadGrid1_InsertCommand" DataSourceID="SqlDataSource2" GridLines="None"
                        Skin="Outlook" Width="93%" EnableHeaderContextMenu="true">
                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="trx_id,emp_code,emp_name"
                            DataSourceID="SqlDataSource2" CommandItemDisplay="Bottom">
                            <FilterItemStyle HorizontalAlign="left" />
                            <HeaderStyle BackColor="SkyBlue" ForeColor="Navy" />
                            <ItemStyle BackColor="White" Height="20px" />
                            <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                            <Columns>
                                <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="10px" />
                                </radG:GridTemplateColumn>
                                <radG:GridClientSelectColumn UniqueName="GridClientSelectColumn">
                                </radG:GridClientSelectColumn>
                                <radG:GridBoundColumn DataField="emp_code" Visible="False" HeaderText="Code" SortExpression="emp_code"
                                    UniqueName="emp_code">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="emp_name" HeaderText="Employee Name" SortExpression="emp_name"
                                    UniqueName="emp_name">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="trx_id" DataType="System.Int32" HeaderText="Id"
                                    ReadOnly="True" SortExpression="trx_id" Visible="False" UniqueName="trx_id">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="desc" HeaderText="Claim Type" ReadOnly="True" SortExpression="Type"
                                    UniqueName="Type">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Department" HeaderText="Department" ReadOnly="True"
                                    SortExpression="Department" UniqueName="Department">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="id" HeaderText="id" ReadOnly="True" SortExpression="Type"
                                    Visible="False" UniqueName="Type1">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="approver" HeaderText="approver" ReadOnly="True"
                                    SortExpression="approver" Visible="False" UniqueName="approver">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="trx_amount" DataType="System.Decimal" HeaderText="Amount"
                                    SortExpression="trx_amount" UniqueName="trx_amount">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="trx_period" DataType="System.DateTime" HeaderText="Period"
                                    SortExpression="trx_period" UniqueName="trx_period">
                                </radG:GridBoundColumn>
                                <radG:GridTemplateColumn HeaderText="Attached Document">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="h1" runat="server" Target="_blank" Text='<%# Eval("recpath")%>'></asp:HyperLink>
                                    </ItemTemplate>
                                </radG:GridTemplateColumn>
                                <radG:GridBoundColumn DataField="remarks" ItemStyle-Width="150px" DataType="System.String"
                                    HeaderText="Remarks" SortExpression="remarks" UniqueName="remarks">
                                </radG:GridBoundColumn>
                                <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                    <ItemStyle Width="30px" />
                                </radG:GridEditCommandColumn>
                                <radG:GridButtonColumn ConfirmText="Delete this record?" ButtonType="ImageButton"
                                    ImageUrl="~/frames/images/toolbar/Delete.gif" CommandName="Delete" Text="Delete"
                                    UniqueName="DeleteColumn">
                                    <ItemStyle Width="30px" />
                                </radG:GridButtonColumn>
                                
                               <radG:GridBoundColumn DataField="Nationality" HeaderText="Nationality" AllowFiltering="false"
                                    ReadOnly="True" SortExpression="Nationality" UniqueName="Nationality" Display="false">
                                </radG:GridBoundColumn> 
                                <radG:GridBoundColumn DataField="Trade" HeaderText="Trade" AllowFiltering="false"
                                    ReadOnly="True" SortExpression="Trade" UniqueName="Trade" Display="false">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="emp_type" HeaderText="Pass Type" AllowFiltering="false"
                                    ReadOnly="True" SortExpression="emp_type" UniqueName="emp_type" Display="false">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Designation" HeaderText="Designation" AllowFiltering="false"
                                    ReadOnly="True" SortExpression="Designation" UniqueName="Designation" Display="false">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn UniqueName="ic_pp_number" HeaderText="IC/FIN Number"  DataField="ic_pp_number" Display="false"  AllowFiltering="false" >
                                </radG:GridBoundColumn>
                                
                                
                            </Columns>
                            <EditFormSettings UserControlName="claimaddition.ascx" EditFormType="WebUserControl">
                            </EditFormSettings>
                            <CommandItemSettings AddNewRecordText="Add New Claims" />
                            <ExpandCollapseColumn Visible="False">
                                <HeaderStyle Width="19px" />
                            </ExpandCollapseColumn>
                            <RowIndicatorColumn Visible="False">
                                <HeaderStyle Width="20px" />
                            </RowIndicatorColumn>
                        </MasterTableView>
                        <ClientSettings>
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                    </radG:RadGrid>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="Button2" runat="server" Text="Submit Claim" class="textfields" Style="width: 130px;
                        height: 23px" OnClick="Button2_Click" />
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="sp_emppayclaim_add"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="drpemp" Name="empcode" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList1" Name="empmonth" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:ControlParameter ControlID="cmbYear" Name="empyear" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
