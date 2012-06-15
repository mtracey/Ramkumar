<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payslipRemarks.aspx.cs" Inherits="SMEPayroll.Payroll.payslipRemarks" %>
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Payslip Remarks</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right" style="width: 30%">
                                <tt class="bodytxt">Year :</tt>
                                <asp:DropDownList ID="cmbYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbYear_selectedIndexChanged"
                                    Style="width: 65px" CssClass="textfields">
                                    <asp:ListItem Value="2007">2007</asp:ListItem>
                                    <asp:ListItem Value="2008">2008</asp:ListItem>
                                    <asp:ListItem Value="2009">2009</asp:ListItem>
                                    <asp:ListItem Value="2010">2010</asp:ListItem>
                                    <asp:ListItem Value="2011">2011</asp:ListItem>
                                    <asp:ListItem Value="2012">2012</asp:ListItem>
                                    <asp:ListItem Value="2013">2013</asp:ListItem>
                                    <asp:ListItem Value="2014">2014</asp:ListItem>
                                    <asp:ListItem Value="2015">2015</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 60%" valign="middle">
                                &nbsp;&nbsp; <tt class="bodytxt">Month :</tt>
                                <asp:DropDownList ID="cmbMonth" runat="server" Style="width: 165px" CssClass="textfields">
                                    <asp:ListItem Value="1">January</asp:ListItem>
                                    <asp:ListItem Value="2">February</asp:ListItem>
                                    <asp:ListItem Value="3">March</asp:ListItem>
                                    <asp:ListItem Value="4">April</asp:ListItem>
                                    <asp:ListItem Value="5">May</asp:ListItem>
                                    <asp:ListItem Value="6">June</asp:ListItem>
                                    <asp:ListItem Value="7">July</asp:ListItem>
                                    <asp:ListItem Value="8">August</asp:ListItem>
                                    <asp:ListItem Value="9">September</asp:ListItem>
                                    <asp:ListItem Value="10">October</asp:ListItem>
                                    <asp:ListItem Value="11">November</asp:ListItem>
                                    <asp:ListItem Value="12">December</asp:ListItem>
                                </asp:DropDownList>
                                <tt><asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid"
                                    runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                                </tt>
                            </td>
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
                        <radG:RadGrid ID="RadGrid1" AllowMultiRowEdit="True" OnItemCommand="RadGrid1_ItemCommand" AllowFilteringByColumn="true"
                            Skin="Outlook" Width="99%" runat="server"
                            GridLines="None" AllowMultiRowSelection="false">
                            <MasterTableView CommandItemDisplay="bottom" DataKeyNames="emp_code,Remarks"
                                EditMode="InPlace" AutoGenerateColumns="False" AllowAutomaticUpdates="true" AllowAutomaticInserts="true"
                                AllowAutomaticDeletes="true">
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
                                    <radG:GridBoundColumn DataField="emp_code" Visible="false" DataType="System.Int32"
                                        HeaderText="emp_code" ItemStyle-HorizontalAlign="Left" SortExpression="emp_code"
                                        UniqueName="emp_code">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="Time_Card_No" Visible="true" DataType="System.Int32"
                                        HeaderText="Time_Card_No" ItemStyle-HorizontalAlign="Left" SortExpression="Time_Card_No"
                                        UniqueName="Time_Card_No">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="EMPNAME" HeaderText="Employee Name" SortExpression="EMPNAME"
                                        UniqueName="EMPNAME" ItemStyle-HorizontalAlign="Left" AutoPostBackOnFilter="true"
                                        CurrentFilterFunction="contains">
                                    </radG:GridBoundColumn>
                                    <radG:GridTemplateColumn ItemStyle-HorizontalAlign="Left" DataField="Remarks" UniqueName="Remarks"
                                        HeaderText="Employee Remarks">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtRemarks" Width="95%" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.remarks")%>'></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle Width="70%" />
                                    </radG:GridTemplateColumn>
                                </Columns>
                                <CommandItemTemplate>
                                    <div style="text-align: center">
                                        <asp:Button runat="server" ID="UpdateAll" class="textfields" Style="height: 22px"
                                            Text="Update Payslip Remarks For All" CommandName="UpdateAll" />
                                    </div>
                                </CommandItemTemplate>
                            </MasterTableView>
                            <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                <Selecting AllowRowSelect="false" />
                            </ClientSettings>
                        </radG:RadGrid>
                    </td>
                </tr>
            </table>
        </center>
        <!-- IF GENERAL SOLUTION :- USE sp_emp_overtime -->
        <!-- IF BIOMETREICS :- USE sp_emp_overtime1 -->
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="select Id,Type from leave_types lt Where (lt.code!='0005' Or lt.code is null)">
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="sp_GeneratePayRollAdv"
            InsertCommand="sp_payroll_add" SelectCommandType="StoredProcedure" InsertCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                <asp:ControlParameter ControlID="cmbYear" Name="year" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:SessionParameter Name="UserID" SessionField="EmpCode" Type="Int32" />
                <asp:ControlParameter ControlID="cmbMonth" Name="Month" PropertyName="SelectedValue" Type="Int32" />
                <asp:SessionParameter Name="stdatemonth" SessionField="PayStartDay" Type="Int32" />
                <asp:SessionParameter Name="endatemonth" SessionField="PayEndDay" Type="Int32" />
                <asp:SessionParameter Name="stdatesubmonth" SessionField="PaySubStartDay" Type="Int32" />
                <asp:SessionParameter Name="endatesubmonth" SessionField="PaySubEndDay" Type="Int32" />
                <asp:ControlParameter ControlID="cmbMonth" Name="monthidintbl" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="Emp_Code" Type="String" />
                <asp:Parameter Name="basic_pay" Type="Decimal" />
                <asp:Parameter Name="overtime" Type="Decimal" />
                <asp:Parameter Name="overtime2" Type="Decimal" />
                <asp:Parameter Name="total_additions" Type="Decimal" />
                <asp:Parameter Name="total_deductions" Type="Decimal" />
                <asp:Parameter Name="status" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
