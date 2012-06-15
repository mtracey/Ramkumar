<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ViewAppliedLeaves.aspx.cs"
    Inherits="SMEPayroll.Leaves.ViewAppliedLeaves" %>

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
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Leave Status</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td align="right" style="height: 25px">
                            </td>
                            <td valign="middle" align="center">
                                <tt class="bodytxt">Employee:</tt>
                                <asp:DropDownList ID="cmbEmployee" class="textfields" AutoPostBack="true" runat="server"
                                    DataSourceID="SqlDataSource1" DataTextField="emp_name" DataValueField="emp_code"
                                    Width="152px">
                                    <asp:ListItem Selected="True" Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                        <%--        <asp:DropDownList ID="cmbYear" runat="server" Style="width: 65px" CssClass="textfields">
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
                                       runat="server">
                               </asp:DropDownList>
                               <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                
                                <asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid" runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                            </td>
                            <td align="right">
                                <input id="Button1" type="button" onclick="history.go(-1)" value="Back" class="textfields"
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
                <td>
                    <radG:RadGrid ID="RadGrid1" runat="server" OnItemDataBound="RadGrid1_ItemDataBound"
                        DataSourceID="SqlDataSource2" GridLines="None" Skin="Outlook" Width="100%" OnItemCommand="RadGrid1_ItemCommand">
                        <MasterTableView DataSourceID="SqlDataSource2" AllowAutomaticDeletes="True" AutoGenerateColumns="False"
                            DataKeyNames="trx_id, emp_id, status, leave_type, type, start_date, end_date, paid_leaves, unpaid_leaves" TableLayout="Auto" >
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
                                <radG:GridBoundColumn DataField="Application Date" DataType="System.Int32" UniqueName="Application Date"
                                    SortExpression="Application Date" HeaderText="Application Date">
                                    <ItemStyle Width="10%" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="leave_type" Visible="False" DataType="System.Int32"
                                    UniqueName="leave_type" SortExpression="leave_type" HeaderText="Leave Type">
                                    <ItemStyle Width="1%" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="type" UniqueName="type" SortExpression="type" HeaderText="Leave Type">
                                    <ItemStyle Width="15%" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="start_date" DataType="System.DateTime" UniqueName="start_date"
                                    SortExpression="start_date" HeaderText="From">
                                    <ItemStyle Width="10%" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="end_date" DataType="System.DateTime" UniqueName="end_date"
                                    SortExpression="end_date" HeaderText="To">
                                    <ItemStyle Width="10%" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="status" DataType="System.Int32" UniqueName="status"
                                    SortExpression="status" HeaderText="Status">
                                    <ItemStyle Width="10%" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="payrollstatus" Visible="false" UniqueName="payrollstatus"
                                    SortExpression="payrollstatus" HeaderText="payrollStatus">
                                    <ItemStyle Width="10%" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Paid_leaves" UniqueName="paid_leaves" SortExpression="paid_leaves"
                                    HeaderText="Paid Leaves">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="unpaid_leaves" UniqueName="unpaid_leaves" SortExpression="unpaid_leaves"
                                    HeaderText="Unpaid Leaves">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="sumLeaves" UniqueName="sumLeaves" SortExpression="sumLeaves"
                                    HeaderText="Total Leaves">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Session" DataType="System.Int32" UniqueName="Session"
                                    SortExpression="Session" HeaderText="Session">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="emp_id" DataType="System.Int32" UniqueName="emp_id"
                                    SortExpression="emp_id" Visible="False" HeaderText="emp_id">
                                    <ItemStyle Width="1%" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Remarks" UniqueName="Remarks" SortExpression="Remarks"
                                    HeaderText="Remarks">
                                    <ItemStyle Width="20%" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Leavre_Model" UniqueName="Leave_Model" SortExpression="Leave_Model"
                                    HeaderText="Leave Model">
                                    <ItemStyle Width="15%" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn ReadOnly="True" DataField="trx_id" DataType="System.Int32"
                                    UniqueName="trx_id" SortExpression="trx_id" Visible="False" HeaderText="trx_id">
                                    <ItemStyle Width="1%" />
                                </radG:GridBoundColumn>
                                
                                  <radG:GridTemplateColumn HeaderText="Attached Document">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="h1" runat="server" Target="_blank" Text='<%# ((Convert.ToString(Eval("Path")).Length)>0) ? "Doc":" " %>' NavigateUrl='<%# Eval("Path")%>'></asp:HyperLink>
                                    </ItemTemplate>
                                </radG:GridTemplateColumn>
                                
                                
                                <radG:GridButtonColumn HeaderText="Delete" ButtonType="ImageButton" ConfirmText="Are you sure you want to cancel this leave?"
                                    CommandName="Delete" Text="Delete" UniqueName="Deletecolumn">
                                    <ItemStyle Width="1%" />
                                </radG:GridButtonColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                AllowColumnResize="True"  ClipCellContentOnResize="False"></Resizing>
                        </ClientSettings>
                    </radG:RadGrid>
                </td>
            </tr>
            <tr>
                <td align="center" class="bodytxt">
                    <asp:Label ForeColor="red" Font-Bold="true" ID="lblMsg" runat="Server" Text=""></asp:Label></td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT [Path],[trx_id], [emp_id], [leave_type] ,b.type,convert(varchar(15),[start_date],103)'start_date', convert(varchar(15),[end_date],103) 'end_date',timesession  as Session,paid_leaves,unpaid_leaves,(paid_leaves + unpaid_leaves)'sumLeaves', [status],payrollstatus,convert(varchar(15),[Application Date],103)'Application Date',a.Remarks,Leave_Model = Case When  a.leave_model =1 Then 'Fixed Yearly-Normal' When  a.leave_model =7 Then 'Fixed Yearly-Prorated' When  a.leave_model =2 Then 'Fixed Yearly-Prorated(Floor)' When  a.leave_model =5 Then 'Fixed Yearly-Prorated(Ceiling)' When  a.leave_model =3 Then 'Year of Service-Normal' When  a.leave_model =8 Then 'Year of Service-Prorated' When  a.leave_model =4 Then 'Year of Service-Prorated(Floor)' When  a.leave_model =6 Then 'Year of Service-Prorated(Ceiling)' END FROM [emp_leaves] a Inner Join Leave_Types b On a.leave_type=b.id Inner Join Employee e On a.Emp_ID = e.emp_code Where (a.emp_id = @emp_id) And Year(a.start_date)= @year ">
            <SelectParameters>
                <asp:ControlParameter ControlID="cmbEmployee" Name="emp_id" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:ControlParameter ControlID="cmbYear" Name="year" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" DeleteCommand="DELETE FROM [employee] WHERE [emp_code] = @emp_code"
            InsertCommand="INSERT INTO [employee] ([emp_code], [emp_name]) VALUES (@emp_code, @emp_name)"
            SelectCommand="SELECT [emp_code],isNull([emp_name],'')+' '+isnull([emp_lname],'')[emp_name]  FROM [employee] where termination_date is null and company_id=@company_id order by emp_name"
            UpdateCommand="UPDATE [employee] SET [emp_name] = @emp_name WHERE [emp_code] = @emp_code">
            <DeleteParameters>
                <asp:Parameter Name="emp_code" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="emp_name" Type="String" />
                <asp:Parameter Name="emp_code" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="emp_code" Type="String" />
                <asp:Parameter Name="emp_name" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
