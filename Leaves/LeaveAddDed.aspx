<%@ Page Language="C#" AutoEventWireup="true" Codebehind="LeaveAddDed.aspx.cs" Inherits="SMEPayroll.Leaves.LeaveAddDed" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="RadInput.Net2" Namespace="Telerik.WebControls" TagPrefix="radI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

    <script language="javascript" type="text/javascript">
        function ShowMsg()
        {
           var control = document.getElementById('msg');
            var sMsg = control.value;
            if (sMsg != '')
            {
                alert(sMsg);
                control.value="";
            }
        }
    </script>

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
<body onload="ShowMsg();" style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4" style="height: 28px">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Leaves</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td align="center">
                                &nbsp;&nbsp;<tt class="bodytxt"> Year :</tt>
                      <%--          <asp:DropDownList ID="cmbYear" runat="server" Style="width: 65px" CssClass="textfields"
                                    AutoPostBack="True" OnSelectedIndexChanged="cmbYear_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Value="0">-select-</asp:ListItem>
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
                                AutoPostBack="True" OnSelectedIndexChanged="cmbYear_SelectedIndexChanged"       runat="server">
                               </asp:DropDownList>
                               <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                
                                <tt class="bodytxt">Type :</tt>
                                <asp:DropDownList OnDataBound="cmbLeaveType_databound" ID="cmbLeaveType" DataTextField="Type"
                                    OnSelectedIndexChanged="cmbLeaveType_selectedIndexChanged" CssClass="bodytxt"
                                    DataValueField="ID" DataSourceID="SqlDataSource3" runat="server" AutoPostBack="true">
                                </asp:DropDownList>
                                <tt class="bodytxt">Type :</tt>
                                <asp:DropDownList ID="cmbAddDeduct" runat="server" CssClass="textfields">
                                    <asp:ListItem Selected="true" Value="0">-select-</asp:ListItem>
                                    <asp:ListItem Value="1">Addition</asp:ListItem>
                                    <asp:ListItem Value="2">Deduction</asp:ListItem>
                                </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<tt class="bodytxt"></tt> <tt class="bodytxt">
                                    Leaves :</tt>
                                <asp:TextBox ID="txtleaveaddded" runat="server" MaxLength="4" Width="30px" CssClass="textfields"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="vldtxtv3" ControlToValidate="txtleaveaddded"
                                    Display="Dynamic" ErrorMessage="*" ValidationExpression="(?!^0*\.0*$)^\d{1,5}(\.\d{1,3})?$"
                                    runat="server"> 
                                </asp:RegularExpressionValidator>
                                <asp:ImageButton ID="imgbtnfetch" OnClick="getData" runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                            </td>
                            <td align="LEFT">
                            </td>
                            <td>
                            </td>
                            <td align="LEFT">
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
        <input type="hidden" id="msg" runat="server" />
        <center>
            <asp:Label ID="lblerror" ForeColor="red" class="bodytxt" runat="server"></asp:Label></center>
        <center>
            <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                </tr>
                <tr>
                    <td align="left">
                        <radG:RadGrid ID="RadGrid1" AllowMultiRowEdit="True" 
                            OnItemCommand="RadGrid1_ItemCommand" Skin="Outlook" Width="99%" runat="server"
                            GridLines="None" AllowMultiRowSelection="true"  AllowFilteringByColumn="false" EnableHeaderContextMenu="true" >
                            <MasterTableView CommandItemDisplay="bottom" DataKeyNames="emp_code,leave_remaining,Remarks"
                                EditMode="InPlace" AutoGenerateColumns="False" AllowAutomaticUpdates="true" AllowAutomaticInserts="true"
                                AllowAutomaticDeletes="true" EnableHeaderContextMenu="true">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" ForeColor="Navy" />
                                <ItemStyle HorizontalAlign="left" BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                <CommandItemTemplate>
                                </CommandItemTemplate>
                                <Columns>
                                    <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10px" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridClientSelectColumn ItemStyle-HorizontalAlign="Left" UniqueName="GridClientSelectColumn">
                                    </radG:GridClientSelectColumn>
                                    <radG:GridBoundColumn DataField="row_id" DataType="System.Int32" HeaderText="ID"
                                        SortExpression="row_id" ItemStyle-HorizontalAlign="Left" Display="false" UniqueName="row_id">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="emp_code" Visible="false" DataType="System.Int32"
                                        HeaderText="emp_code" ItemStyle-HorizontalAlign="Left" SortExpression="emp_code"
                                        UniqueName="emp_code">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="emp_name" HeaderText="Employee Name" SortExpression="emp_name"
                                        UniqueName="emp_name" ItemStyle-HorizontalAlign="Left" AutoPostBackOnFilter="true"
                                        CurrentFilterFunction="contains">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="department" HeaderText="Department" SortExpression="department"
                                        UniqueName="department" ItemStyle-HorizontalAlign="Left" AutoPostBackOnFilter="true"
                                        CurrentFilterFunction="contains">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="leave_remaining" HeaderText="Leaves Remaining" UniqueName="leave_remaining"
                                        AutoPostBackOnFilter="true" ItemStyle-HorizontalAlign="Left" CurrentFilterFunction="contains">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="calcleaverem" HeaderText="Calculate" UniqueName="calcleaverem"
                                        AutoPostBackOnFilter="true" ItemStyle-HorizontalAlign="Left" CurrentFilterFunction="contains">
                                    </radG:GridBoundColumn>
                                    <radG:GridTemplateColumn ItemStyle-HorizontalAlign="Left" DataField="Remarks" UniqueName="Remarks"
                                        HeaderText="Employee Remarks">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtRemarks" Width="95%" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.remarks")%>'></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle Width="70%" />
                                    </radG:GridTemplateColumn>
                                    
                                     <radG:GridBoundColumn DataField="TimeCardId" HeaderText="Time Card ID"    ShowFilterIcon="False" CurrentFilterFunction="StartsWith" AllowFiltering="true" AutoPostBackOnFilter="true"
                                        ReadOnly="True" SortExpression="TimeCardId" UniqueName="TimeCardId">
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
                                    <radG:GridBoundColumn DataField="Department" HeaderText="Department" AllowFiltering="false"
                                        ReadOnly="True" SortExpression="Department" UniqueName="Department" Display="false">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="Designation" HeaderText="Designation" AllowFiltering="false"
                                        ReadOnly="True" SortExpression="Designation" UniqueName="Designation" Display="false">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn UniqueName="ic_pp_number" HeaderText="IC/FIN Number"  DataField="ic_pp_number" Display="false"  AllowFiltering="false" >
                                    </radG:GridBoundColumn>
                                    
                                    
                                </Columns>
                                <CommandItemTemplate>
                                    <div style="text-align: center">
                                        <asp:Button runat="server" ID="UpdateAll" class="textfields" Style="height: 22px"
                                            Text="Update Remarks For All" CommandName="UpdateAll" />
                                    </div>
                                </CommandItemTemplate>
                            </MasterTableView>
                            <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                        </radG:RadGrid>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="text-align: center">
                            <asp:Button ID="btnsubmit" runat="server" Text="Submit" Style="width: 80px; height: 22px"
                                class="textfields" CommandName="UpdateAll" OnClick="btnsubmit_Click" />
                            <asp:Button ID="btnCalc" runat="server" Text="Calculate before Update" Style="height: 22px"
                                class="textfields" CommandName="CalculateAll" OnClick="btnCalc_Click" />
                        </div>
                    </td>
                </tr>
            </table>
        </center>
        <!-- IF GENERAL SOLUTION :- USE sp_emp_overtime -->
        <!-- IF BIOMETREICS :- USE sp_emp_overtime1 -->
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="select Id,Type from leave_types lt Where (lt.code!='0005' Or lt.code is null)">
        </asp:SqlDataSource>
    </form>
</body>
</html>
