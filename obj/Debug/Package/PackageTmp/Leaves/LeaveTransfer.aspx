<%@ Page Language="C#" AutoEventWireup="true" Codebehind="LeaveTransfer.aspx.cs"
    Inherits="SMEPayroll.Leaves.LeaveTransfer" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
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

        function isNumericKeyStrokeDecimal(evt)
        {
             var charCode = (evt.which) ? evt.which : event.keyCode
             if ((charCode > 31 && (charCode < 48 || charCode > 57)) && (charCode !=46))
                return false;

             return true;
        }

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
                            <td background="../frames/images/toolbar/backs.jpg" colspan="10">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Leave Transfer Form</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td width="10%" align="right">
                                <tt class="bodytxt">
                                    <asp:Label ID="lbl1" Text="Employee Group :" runat="server"></asp:Label></tt>
                            </td>
                            <td width="10%" align="left">
                                <tt class="bodytxt">
                                    <asp:DropDownList ID="cmbEmpgroup" runat="server" CssClass="textfields">
                                    </asp:DropDownList></tt>
                            </td>
                            <td width="10%" align="right">
                                <tt class="bodytxt">
                                    <asp:Label ID="Label1" Text="Forward Leaves :" runat="server"></asp:Label></tt>
                            </td>
                            <td width="2%" align="left">
                                <tt class="bodytxt">
                                    <asp:TextBox MaxLength="4"  onkeypress="return isNumericKeyStrokeDecimal(event)" ID="txtfwd" Style="height: 13px" CssClass="textfields" runat="Server"
                                        Width="30px"></asp:TextBox></tt>
                            </td>
                            <td width="15%" align="right">
                                <tt class="bodytxt">
                                    <asp:Label ID="Label2" Text="Leaves Transfer In Year :" runat="server"></asp:Label></tt>
                            </td>
                            <td width="5%" align="left">
                                <tt class="bodytxt">
                                    <asp:DropDownList ID="cmbYear" AutoPostBack="true" runat="server" CssClass="textfields">
                                        <asp:ListItem Value="2007">2007</asp:ListItem>
                                        <asp:ListItem Value="2008">2008</asp:ListItem>
                                        <asp:ListItem Value="2009">2009</asp:ListItem>
                                        <asp:ListItem Value="2010">2010</asp:ListItem>
                                        <asp:ListItem Value="2011">2011</asp:ListItem>
                                        <asp:ListItem Value="2012">2012</asp:ListItem>
                                        <asp:ListItem Value="2013">2013</asp:ListItem>
                                        <asp:ListItem Value="2014">2014</asp:ListItem>
                                        <asp:ListItem Value="2015">2015</asp:ListItem>
                                    </asp:DropDownList></tt>
                            </td>
                            <td width="10%" align="right">
                                <tt class="bodytxt">
                                    <asp:Label ID="lblTrdate" Text="Transfer Date:" runat="server"></asp:Label></tt></tt>
                            </td>
                            <td width="5%" align="left">
                                <tt class="bodytxt">
                                    <radCln:RadDatePicker CssClass="trstandtop" Calendar-ShowRowHeaders="false" ID="rdTrdate"
                                        DateInput-Enabled="false" runat="server" Width="100px">
                                        <DateInput Skin="" DateFormat="dd/MM/yyyy">
                                        </DateInput>
                                    </radCln:RadDatePicker>
                                </tt>
                            </td>
                            <td width="5%" align="right">
                                <tt class="bodytxt">
                                    <asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid" runat="server" ImageUrl="~/frames/images/toolbar/go.ico" /></tt>
                            </td>
                            <td width="13%" align="right">
                                <tt class="bodytxt">
                                    <input id="Button3" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                        style="width: 80px; height: 22px" /></tt>
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
                    <radG:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource2" AllowMultiRowSelection="true"
                        AllowPaging="true" PageSize="200" GridLines="None" Skin="Outlook" Width="99%"
                        OnItemDataBound="RadGrid1_ItemDataBound" EnableHeaderContextMenu="true">
                        <MasterTableView AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="emp_code"
                            DataSourceID="SqlDataSource2">
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
                                <radG:GridClientSelectColumn UniqueName="GridClientSelectColumn">
                                </radG:GridClientSelectColumn>
                                <radG:GridBoundColumn DataField="emp_code" Visible="False" HeaderText="Code" SortExpression="emp_code"
                                    UniqueName="emp_code">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn CurrentFilterFunction="contains" AutoPostBackOnFilter="true"
                                    DataField="emp_name" HeaderText="Emp Name" SortExpression="emp_name" UniqueName="emp_name">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="lastyearleaves" HeaderText="LastYrBalLeaves" ReadOnly="True"
                                    SortExpression="LastYr_leaves_allowed" UniqueName="Type">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="company_policy" HeaderText="MaxAllowedToTransfer"
                                    ReadOnly="True" SortExpression="company_policy" UniqueName="company_policy">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="TotalLastYrLeaves" HeaderText="TotalLastYrLeavesForTransfer"
                                    ReadOnly="True" SortExpression="TotalLastYrLeaves" UniqueName="TotalLastYrLeaves">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="CurrentYear" HeaderText="CurrentYrLeaves" SortExpression="CurrentYear"
                                    UniqueName="CurrentYear">
                                </radG:GridBoundColumn>
                                <%--                                <radG:GridBoundColumn DataField=" RemLastYrLeaves" Visible="false" HeaderText="RemLastYrLeaves"
                                    ReadOnly="True" SortExpression="RemLastYrLeaves" UniqueName="RemLastYrLeaves">
                                </radG:GridBoundColumn>
--%>
                                <radG:GridBoundColumn DataField="TotalAvailLeaves" HeaderText="TotalAvlLeaves" SortExpression="TotalAvailLeaves"
                                    UniqueName="TotalAvailLeaves">
                                </radG:GridBoundColumn>
                                
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
                        </MasterTableView>
                        <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                    </radG:RadGrid></td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="sp_trans_leave"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter Name="groupid" Type="Int32" ControlID="cmbEmpgroup" />
                <asp:ControlParameter ControlID="cmbYear" Name="year" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="txtfwd" Name="leaves" PropertyName="text" Type="double" />
                <asp:ControlParameter ControlID="rdTrdate" Name="applydateon" PropertyName="SelectedDate"
                    Type="datetime" />
                <asp:SessionParameter Name="compid" SessionField="Compid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cmbEmpgroup"
            Display="None" ErrorMessage="Employee Group Name is not selected!" InitialValue=""></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtfwd"
            Display="None" ErrorMessage="Please Enter Forward Leaves!" InitialValue=""></asp:RequiredFieldValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
            ShowMessageBox="True" ShowSummary="False" />
        <center>
            <asp:Button ID="Button2" runat="server" Text="Transfer Leaves" class="textfields"
                Style="width: 130px; height: 23px" OnClick="Button2_Click" />
        </center>
        <center>
            <asp:Label ID="lblmsg" CssClass="bodytxt" ForeColor="red" runat="server" Visible="false"></asp:Label>
        </center>
    </form>
</body>
</html>
