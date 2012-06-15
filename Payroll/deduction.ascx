<%@ Control Language="C#" AutoEventWireup="true" Codebehind="deduction.ascx.cs" Inherits="SMEPayroll.Payroll.deduction" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radCln" %>
<radG:RadCodeBlock ID="RadCodeBlock3" runat="server">

    <script type="text/javascript">

<%--funtion validatedate(Object,args)
{
    var stDate = document.getElementById('RadDatePicker1').value;
    var enDate = document.getElementById('RadDatePicker2').value;
    if (stDate > enDate)
    {
        alert('From Date can not be greater than To date, please enter correct dates');
        args.Isvalid=false;
    }
    else
    {
        args.Isvalid=true;
    }
}
--%></script>

</radG:RadCodeBlock>
<%--width: 691px;--%>
<table cellpadding="0" cellspacing="0" style=" height: 219px; " width="100%" >

    <tr>
        <td colspan="5" style="font-weight: bold; font-size: 9pt; color: #000000; font-family: verdana;
            height: 28px; text-align: center;background-color: #e9eed4;">
            <asp:Label ID="Label1" runat="server" Text='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted")) ? "Adding Record" : "Editing Record" %>'
                Width="297px"></asp:Label></td>
    </tr>
    <tr>
        <td style="font-weight: bold; font-size: 9pt; width: 71px; color: #000099; font-family: verdana;
            height: 31px; text-align: right">
        </td>
        <td style="font-weight: bold; font-size: 8pt; width: 163px; color: #000000; font-family: verdana;
            height: 31px; text-align: left">
            Employee</td>
        <td style="font-weight: bold; font-size: 8pt; width: 203px; color: #000099; font-family: verdana;
            height: 31px; text-align: left">
            <asp:DropDownList ID="drpemployee" OnDataBound="drpemployee_databound" Enabled='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted")) ? true : false %>'
                runat="server" Width="197px">
            </asp:DropDownList>
        </td>
        <td style="font-weight: bold; font-size: 8pt; width: 123px; color: black; font-family: verdana;
            height: 31px; text-align: left">
            Deduction Type</td>
        <td style="font-weight: bold; font-size: 9pt; width: 179px; color: #000099; font-family: verdana;
            height: 31px; text-align: left">
            <asp:DropDownList ID="drpaddtype" OnDataBound="drpaddtype_databound" runat="server"
                Width="350px">
            </asp:DropDownList>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td style="font-weight: bold; font-size: 8pt; width: 71px; color: #000000; font-family: verdana;
            height: 27px; text-align: left">
        </td>
        <td style="font-weight: bold; font-size: 8pt; width: 163px; color: #000000; font-family: verdana;
            height: 27px; text-align: left">
            Transaction Period
        </td>
        <td style="font-weight: bold; font-size: 8pt; width: 220px; color: #000000; font-family: verdana;
            height: 27px; text-align: left">
            &nbsp;From &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<radCln:RadDatePicker
                ID="RadDatePicker1" Calendar-ShowRowHeaders="false" DbSelectedDate='<%# DataBinder.Eval(Container,"DataItem.trx_period_copy")%>'
                Enabled='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted")) ? true : false %>'
                runat="server" Width="125px" DateInput-DisplayDateFormat="dd-MM-yyyy">
            </radCln:RadDatePicker>
            &nbsp; &nbsp;
        </td>
        <td style="font-weight: bold; font-size: 8pt; width: 117px; color: #000000; font-family: verdana;
            height: 27px; text-align: left">
            &nbsp;To&nbsp;
        </td>
        <td style="font-weight: bold; font-size: 8pt; width: 163px; color: #000000; font-family: verdana;
            height: 27px; text-align: left">
            <radCln:RadDatePicker Calendar-ShowRowHeaders="false" ID="RadDatePicker2" DbSelectedDate='<%# DataBinder.Eval(Container,"DataItem.trx_period_copy")%>'
                Enabled='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted")) ? true : false %>'
                runat="server" Width="125px" DateInput-DisplayDateFormat="dd-MM-yyyy">
            </radCln:RadDatePicker>
        </td>
    </tr>
    <tr >
        <td style="font-weight: bold; font-size: 8pt; width: 71px; color: #000000; font-family: verdana;
            height: 32px; text-align: left">
        </td>
        <td style="font-weight: bold; font-size: 8pt; width: 163px; color: #000000; font-family: verdana;
            height: 32px; text-align: left">
            Amount Only</td>
        <td style="font-weight: bold; font-size: 8pt; width: 220px; color: #000000; font-family: verdana;
            height: 32px; text-align: left">
            <asp:TextBox ID="txtamt" Text='<%# DataBinder.Eval(Container,"DataItem.trx_amount")%>'
                runat="server" Width="192px"></asp:TextBox></td>
        <td style="font-weight: bold; font-size: 8pt; width: 117px; color: #000000; font-family: verdana;
            height: 32px; text-align: left">
        </td>
        <td style="font-weight: bold; font-size: 8pt; width: 163px; color: #000000; font-family: verdana;
            height: 32px; text-align: left">
        </td>
    </tr>
    <tr>
     
        <td style="font-weight: bold; font-size: 9pt; width: 100%; color: #ffffff; font-family: verdana;
            height: 39px;" colspan="5" align="center">
            &nbsp;<asp:Button ID="btnUpdate" runat="server" CommandName='<%#((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted")) ? "PerformInsert" : "Update" %>'
                Text='<%#((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted")) ? "Insert" : "Update" %>'
                Width="77px" />&nbsp;
   
            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel" Width="59px" /></td>
      
    </tr>
 
</table>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="drpemployee"
    Display="None" ErrorMessage="Employee Name Required!" InitialValue="-select-"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drpaddtype"
    Display="None" ErrorMessage="Deduction Type Required!" InitialValue="-select-"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadDatePicker1"
    Display="None" ErrorMessage="From Date Required!"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadDatePicker2"
    Display="None" ErrorMessage="To Date Required!"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtamt"
    Display="None" ErrorMessage="Amount Required!"></asp:RequiredFieldValidator>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
    ShowMessageBox="True" ShowSummary="False" />
<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtamt"
    Display="None" ErrorMessage="Amount Is Invalid!" MaximumValue="1000000000000000000000000"
    MinimumValue="0" Type="Double"></asp:RangeValidator>
<asp:CompareValidator ID="cmpEndDate" runat="server"  
 ErrorMessage="To date cannot be less Start date" 
 ControlToCompare="RadDatePicker1" ControlToValidate="RadDatePicker2" 
 Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>     





    
