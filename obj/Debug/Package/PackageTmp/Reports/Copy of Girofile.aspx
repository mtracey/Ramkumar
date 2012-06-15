<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Copy of Girofile.aspx.cs" Inherits="SMEPayroll.Reports.CopyGirofile" EnableEventValidation="false" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

    <script type="text/javascript">
        function SubmitForm()
    {
        if (ValidateDate())
        {            
           document.form1.submit();           
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
<body style="margin-left: auto">
    <form id="form1" runat="server">
        <asp:ScriptManager   runat="server" ID="scriptManager"  >
        
        </asp:ScriptManager>
       
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tr >
                            <td background="../frames/images/toolbar/backs.jpg" colspan="2">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Create Payment File</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5" style="font-size: 9pt; color: #000000; font-family: verdana">
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                    <tr >
                                        <td align="right">
                                            &nbsp;&nbsp;<tt class="bodytxt"> Year :</tt>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="cmbYear" runat="server" CssClass="textfields" AutoPostBack="true"
                                                OnSelectedIndexChanged="cmbYear_selectedIndexChanged">
                                                <asp:ListItem Selected="true" Value="-1">-select-</asp:ListItem>
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
                                        <td align="right">
                                            <tt class="bodytxt">Month :</tt>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="cmbMonth" runat="server" CssClass="textfields">
                                                <asp:ListItem Selected="true" Value="-1">-select-</asp:ListItem>
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
                                        </td>
                                        <td align="right">
                                            <tt class="bodytxt">Cheque/Cash:</tt>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="drpbank" AutoPostBack="true" runat="server" CssClass="textfields" 
                                                OnSelectedIndexChanged="drpbank_SelectedIndexChanged">
                                                <asp:ListItem Value="-5" Text="-Select-"></asp:ListItem>
                                                <asp:ListItem Value="-2" Text="Cheque"></asp:ListItem>
                                                <asp:ListItem Value="-1" Text="Cash"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right">
                                            <tt class="bodytxt">Date:</tt>
                                        </td>                                        
                                        <td>
                                            <telerik:RadDatePicker ID="radDtInput" runat="server"></telerik:RadDatePicker>
                                        </td>
                                        
                                         <td align="right">
                                            <asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid" runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                                        </td>
                                        
                                      
                                        <td align="left" style="visibility:hidden">
                                            <asp:DropDownList ID="drpaccno" runat="server" CssClass="textfields">
                                            </asp:DropDownList>
                                        </td>
                                        
                                        <td align="right" style="visibility:hidden" >
                                            <asp:DropDownList ID="drpValueDate" runat="server" CssClass="textfields">                                               
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" style="height: 25px; width: 10%;">
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
        <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="99%"
            border="0">
            <tr>
                <td>
                    <asp:Button ID="btnExport" runat="server" Text="Export to Excel"  Width="120px" Height="25px"  />
                </td>
            </tr>
            <tr>
                <td>
                    <radG:RadGrid AllowPaging="false" Width="99%"  ID="RadGrid1"
                        runat="server" GridLines="None" Skin="Outlook" AllowMultiRowSelection="True"
                        DataSourceID="SqlDataSource1"   >
                        <mastertableview autogeneratecolumns="False" datakeynames="emp_id" datasourceid="SqlDataSource1"
                            pagesize="100" allowpaging="false">
                                                        
                            <FilterItemStyle HorizontalAlign="left" />
                            <HeaderStyle ForeColor="Navy" />
                            <ItemStyle BackColor="White" Height="20px" />
                            <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                            <ExpandCollapseColumn Visible="False">
                                <HeaderStyle Width="19px" />
                            </ExpandCollapseColumn>
                            <RowIndicatorColumn Visible="False">
                                <HeaderStyle Width="20px" />
                            </RowIndicatorColumn>
                            <Columns>                                
                                <radG:GridBoundColumn DataField="emp_id" HeaderText="emp_id" SortExpression="emp_id"
                                    UniqueName="emp_id" Visible="false">
                                </radG:GridBoundColumn>
                                  <radG:GridBoundColumn DataField="Date" HeaderText="Date" SortExpression="Date"
                                    UniqueName="Date" Visible="True">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="emp_name" HeaderText="To" SortExpression="emp_name"
                                    CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="True" UniqueName="emp_name">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="DeptName" HeaderText="Dept Name" SortExpression="DeptName"
                                    CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="True" Visible="False" UniqueName="DeptName">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="giro_bank" HeaderText="Bank Code" SortExpression="giro_bank" Visible="False"
                                    CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="True" UniqueName="giro_bank">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="bank_name" HeaderText="Bank Name" SortExpression="bank_name" Visible="False"
                                    CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="True" UniqueName="bank_name">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="giro_acct_number" HeaderText="Bank AccNo" CurrentFilterFunction="StartsWith" Visible="False"
                                    AutoPostBackOnFilter="True" SortExpression="giro_acct_number" UniqueName="giro_acct_number">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="payrate" HeaderText="Basic Pay/Pay Rate" CurrentFilterFunction="StartsWith" Visible="False"
                                    AutoPostBackOnFilter="True" SortExpression="payrate" UniqueName="payrate">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="total_additions" HeaderText="Additions" CurrentFilterFunction="StartsWith" Visible="False"
                                    AutoPostBackOnFilter="True" SortExpression="total_additions" UniqueName="total_additions">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="total_deductions" HeaderText="Deductions" CurrentFilterFunction="StartsWith" Visible="False"
                                    AutoPostBackOnFilter="True" SortExpression="total_deductions" UniqueName="total_deductions">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="GrossPay" HeaderText="Amount" CurrentFilterFunction="StartsWith" Visible="False"
                                    AutoPostBackOnFilter="True" SortExpression="GrossPay" UniqueName="GrossPay">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Percentage" HeaderText="%Age" CurrentFilterFunction="StartsWith" Visible="False"
                                    AutoPostBackOnFilter="True" SortExpression="Percentage" UniqueName="Percentage">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="netpay" HeaderText="Amount" CurrentFilterFunction="StartsWith"
                                    AutoPostBackOnFilter="True" SortExpression="netpay" UniqueName="netpay">
                                </radG:GridBoundColumn>
                                 <radG:GridBoundColumn DataField="Description" HeaderText="Description" 
                                    AutoPostBackOnFilter="True" SortExpression="Description" UniqueName="Description">
                                </radG:GridBoundColumn>
                            </Columns>
                        </mastertableview>
                        <clientsettings>
                            <Selecting AllowRowSelect="True" />
                        </clientsettings>
                    </radG:RadGrid></td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="Sp_get_Cheque_CashInfo"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                <asp:ControlParameter ControlID="cmbMonth" Name="month" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:ControlParameter ControlID="cmbYear" Name="year" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:ControlParameter ControlID="drpbank" Name="bank" PropertyName="SelectedValue"
                    Type="Int32" />               
                  <asp:ControlParameter ControlID="radDtInput" Name="Date" PropertyName="SelectedDate"
                    Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
        <center>
            &nbsp;
            <asp:HiddenField ID="txthiddenbankvalue" runat="server" />
            <asp:CheckBox Visible="false" ID="chkHash" CssClass="bodytxt" runat="server" Text="Hash Validation"></asp:CheckBox>
            <asp:Button Visible="false" ID="btnsubmit" CausesValidation="true" runat="server" Text="Generate Giro File" OnClick="btngenerate_Click" />
            
            &nbsp;</center>
        <center>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drpbank"
                Display="None" ErrorMessage="Cheque/Cash Required!" InitialValue="-5"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="radDtInput"
                Display="None" ErrorMessage="Date Required!" ></asp:RequiredFieldValidator>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                ShowMessageBox="True" ShowSummary="False" />
            <radA:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <radA:AjaxSetting AjaxControlID="drpbank">
                        <UpdatedControls>
                            <radA:AjaxUpdatedControl ControlID="drpaccno" />
                        </UpdatedControls>
                    </radA:AjaxSetting>
                </AjaxSettings>
            </radA:RadAjaxManager>
        </center>
    </form>
</body>
</html>
