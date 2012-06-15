<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ApprovedLeaves.aspx.cs"
    Inherits="SMEPayroll.Leaves.ApprovedLeave" %>

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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>View Approved Leaves</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td valign="middle" align="center">
                                <tt class="bodytxt">Employee:</tt>
                                <asp:DropDownList ID="DropDownList1" class="textfields" runat="server" AutoPostBack="true"
                                    DataSourceID="SqlDataSource1" DataTextField="emp_name" DataValueField="emp_code"
                                    Width="132px">
                                    <asp:ListItem Selected="True" Text="" Value=""></asp:ListItem>
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
                                       runat="server">
                               </asp:DropDownList>
                               <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                
                                
                                <asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid" runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                            </td>
                            <td valign="middle" align="right">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <radG:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource2" GridLines="None"
                        Skin="Outlook" Width="99%">
                        <MasterTableView DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="trx_id" TableLayout="Auto" >
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
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="leave_type" Visible="false" DataType="System.Int32"
                                    UniqueName="leave_type" SortExpression="leave_type" HeaderText="Leave Type">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="type" DataType="System.String" UniqueName="type"
                                    SortExpression="type" HeaderText="Leave Type">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="start_date" DataType="System.DateTime" UniqueName="start_date"
                                    SortExpression="start_date" HeaderText="Duration    From">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="end_date" DataType="System.DateTime" UniqueName="end_date"
                                    SortExpression="end_date" HeaderText="To">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="status" DataType="System.Int32" UniqueName="status"
                                    SortExpression="status" HeaderText="Status">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Paid_leaves" UniqueName="paid_leaves" SortExpression="paid_leaves"
                                    HeaderText="Paid Leaves">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="unpaid_leaves" UniqueName="unpaid_leaves" SortExpression="unpaid_leaves"
                                    HeaderText="Un Paid Leaves">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="sumLeaves" UniqueName="sumLeaves" SortExpression="sumLeaves"
                                    HeaderText="Total Leaves">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Session" DataType="System.Int32" UniqueName="Session"
                                    SortExpression="Session" HeaderText="Session">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="remarks" UniqueName="Remarks" SortExpression="Remarks"
                                    HeaderText="Remarks">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="approver" DataType="System.Int32" UniqueName="approver"
                                    SortExpression="approver" HeaderText="Approved By">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="emp_id" DataType="System.Int32" UniqueName="emp_id"
                                    SortExpression="emp_id" Visible="False" HeaderText="emp_id">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn ReadOnly="True" DataField="trx_id" DataType="System.Int32"
                                    UniqueName="trx_id" SortExpression="trx_id" Visible="False" HeaderText="trx_id">
                                </radG:GridBoundColumn>
                                
                                 <radG:GridTemplateColumn HeaderText="Attached Document" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="h1" runat="server" Target="_blank" Text='<%# ((Convert.ToString(Eval("Path")).Length)>0) ? "Doc":" " %>' NavigateUrl='<%# Eval("Path")%>'></asp:HyperLink>
                                    </ItemTemplate>
                                </radG:GridTemplateColumn>
                                
                            </Columns>
                        </MasterTableView>
                        <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                        </ClientSettings>
                    </radG:RadGrid></td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" DeleteCommand="DELETE FROM [emp_leaves] WHERE [trx_id] = @trx_id"
            InsertCommand="INSERT INTO [emp_leaves] ([emp_id], [leave_type], [start_date], [end_date], [approver],[status], [Application Date]) VALUES (@emp_id, @leave_type, @start_date, @end_date, @approver, @status, @Application Date)"
            SelectCommand="SELECT [Path],[trx_id], [emp_id],[leave_type],b.type,a.remarks,convert(varchar(15),[start_date],103)'start_date', convert(varchar(15),[end_date],103)'end_date',timesession  as Session, paid_leaves,unpaid_leaves,(paid_leaves + unpaid_leaves)'sumLeaves', [status], convert(varchar(15),[Application Date],103)'Application Date', [approver], [status] FROM [emp_leaves] a,leave_types b WHERE ([emp_id] = @emp_id) and year(start_date)=@year and leave_type=b.id and ([status]='Approved') order by 5"
            UpdateCommand="UPDATE [emp_leaves] SET [emp_id] = @emp_id, [leave_type] = @leave_type, [start_date] = @start_date, [end_date] = @end_date, [approver] = @approver, [status] = @status, [Application Date] = @Application Date WHERE [trx_id] = @trx_id">
            <DeleteParameters>
                <asp:Parameter Name="trx_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="emp_id" Type="Int32" />
                <asp:Parameter Name="leave_type" Type="Int32" />
                <asp:Parameter Name="start_date" Type="DateTime" />
                <asp:Parameter Name="end_date" Type="DateTime" />
                <asp:Parameter Name="approver" Type="String" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="Application Date" Type="DateTime" />
                <asp:Parameter Name="trx_id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="emp_id" Type="Int32" />
                <asp:Parameter Name="leave_type" Type="Int32" />
                <asp:Parameter Name="start_date" Type="DateTime" />
                <asp:Parameter Name="end_date" Type="DateTime" />
                <asp:Parameter Name="approver" Type="String" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="Application Date" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="emp_id" PropertyName="SelectedValue"
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
        </center>
        <!-- Gap to fill the bottom -->
        <!-- footer -->
    </form>
</body>
</html>
