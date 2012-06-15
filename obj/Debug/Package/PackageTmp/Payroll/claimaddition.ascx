<%@ Control Language="C#" AutoEventWireup="true" Codebehind="claimaddition.ascx.cs"
    Inherits="SMEPayroll.Payroll.claimaddition" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radA" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radCln" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radU" %>
<center>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
        </tr>
        <tr>
            <td colspan="5" style="color: #000000; height: 28px; background-color: #e9eed4; text-align: center">
                <asp:Label ID="Label1" runat="server" Text='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"))  ? "Adding a New Record" : "Editing Record" %>'
                    Width="297px"></asp:Label></td>
        </tr>
        <tr >
            <td style="height: 31px; text-align: right">
            </td>
            <td style="height: 31px; text-align: right; width: 158px;">
                <tt class="bodytxt"><b>Employee:&nbsp;</b></tt>
                <br />
            </td>
            <td style="height: 31px; text-align: left; width: 307px;">
                <radA:RadAjaxPanel ID="r1" runat="Server" Width="434px">
                    <asp:DropDownList ID="drpemployee" Enabled='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"))  ? (1==1) : !(1==1)%>'
                        runat="server" Width="184px" OnDataBound="drpemployee_DataBound" OnSelectedIndexChanged="drpemployee_SelectedIndexChanged"
                        AutoPostBack="True">
                    </asp:DropDownList>
                    Approver:&nbsp;
                    <asp:Label ID="lblsupervisor" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.approver")%>'
                        Width="183px" CssClass="bodytxt"></asp:Label></radA:RadAjaxPanel>
            </td>
            <td style="height: 31px; text-align: left">
            </td>
            <td style="height: 31px; text-align: left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 32px; text-align: left">
            </td>
            <td style="height: 32px; text-align: right; width: 158px;">
                <tt class="bodytxt"><tt class="required">*</tt><b>Amount Only:&nbsp;</b></tt>
            </td>
            <td colspan="1" style="height: 32px; text-align: left; width: 307px;">
                <asp:TextBox ID="txtamt" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.trx_amount")%>'
                    Width="182px"></asp:TextBox>&nbsp;
            </td>
        </tr>
        <tr >
            <td style="height: 32px; text-align: left">
            </td>
            <td style="height: 32px; text-align: right; width: 158px;">
                <tt class="bodytxt"><tt class="required">*</tt><b>Transaction Period:&nbsp;</b></tt>
            </td>
            <td colspan="2" style="height: 32px; text-align: left">
                From
                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" Enabled='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"))  ? (1==1) : !(1==1)%>'
                    DbSelectedDate='<%# DataBinder.Eval(Container,"DataItem.trx_period")%>' ID="RadDatePicker1"
                    runat="server" Width="96px">
                    <DateInput ID="DateInput1" runat="server" Skin="" DateFormat="dd-MM-yyyy">
                    </DateInput>
                </radCln:RadDatePicker>
                &nbsp; &nbsp;&nbsp;- &nbsp; &nbsp;&nbsp;&nbsp;
                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" ID="RadDatePicker2" DbSelectedDate='<%# DataBinder.Eval(Container,"DataItem.trx_period")%>'
                    Enabled='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"))  ? (1==1) : !(1==1)%>'
                    runat="server" Width="102px">
                    <DateInput ID="DateInput2" runat="server" Skin="" DateFormat="dd-MM-yyyy">
                    </DateInput>
                </radCln:RadDatePicker>
            </td>
            <td style="height: 32px; text-align: left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="height: 32px; text-align: left">
            </td>
            <td style="height: 32px; text-align: right; width: 158px;">
                <tt class="bodytxt"><b>Receipt Upload:&nbsp;</b></tt>
            </td>
            <td align="left">
                <radU:RadUpload ID="RadUpload1" InitialFileInputsCount="1" runat="server" ControlObjectsVisibility="ClearButtons"
                    MaxFileInputsCount="1" OverwriteExistingFiles="True" />
            </td>
        </tr>
        <tr >
            <td style="height: 32px; text-align: left">
            </td>
            <td style="height: 32px; text-align: right; width: 158px;">
                <tt class="bodytxt"><b>Claims Type:&nbsp;</b></tt></td>
            <td colspan="3" style="height: 32px; text-align: left">
                <asp:DropDownList ID="drpaddtype" runat="server" AutoPostBack="true" Width="475px"
                    OnSelectedIndexChanged="drpaddtype_SelectedIndexChanged" OnDataBound="drpaddtype_DataBound">
                </asp:DropDownList>
            </td>
        </tr>
        <tr >
            <td style="height: 32px; text-align: left">
            </td>
            <td style="height: 32px; text-align: right; width: 158px;">
                <tt class="bodytxt"><b>Remarks:&nbsp;</b></tt></td>
            <td colspan="3" style="height: 32px; text-align: left">
                <asp:TextBox ID="claimRemark" Width="600" Font-Names="Tahoma" Font-Size="11px" TextMode="MultiLine"
                    Wrap="true" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 39px; text-align: left">
            </td>
            <td style="height: 39px; text-align: right; width: 307px;">
            
                <asp:Button ID="btnUpdate" runat="server" CommandName='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"))  ? "PerformInsert" : "Update" %>'
                    Text='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"))  ? "Insert" : "Update" %>'
                    Width="85px"/>
                    
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" Width="64px" />
            </td>
            <td style="height: 39px; text-align: left">
            </td>
            <td style="height: 39px; text-align: left">
            </td>
        </tr>
        <tr>
            <td colspan="5" style="height: 27px; background-color: #e9eed4; text-align: center">
                &nbsp;
            </td>
        </tr>
    </table>
</center>
<radA:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <radA:AjaxSetting AjaxControlID="drpaddtype">
            <UpdatedControls>
                <radA:AjaxUpdatedControl ControlID="lblcpf"></radA:AjaxUpdatedControl>
            </UpdatedControls>
        </radA:AjaxSetting>
    </AjaxSettings>
</radA:RadAjaxManager>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
    ShowMessageBox="True" ShowSummary="False" />
&nbsp;
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtamt"
    Display="None" ErrorMessage="Apply Claims - Amount Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtamt"
    Display="None" ErrorMessage="Apply Claims -Amount Is Invalid MaximumValue=1000000,MinimumValue=0" MaximumValue="1000000" MinimumValue="0"
    Type="Double"></asp:RangeValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadDatePicker2"
    Display="None" ErrorMessage="Apply Claims - To Date Required!" SetFocusOnError="True"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadDatePicker1"
    Display="None" ErrorMessage="Apply Claims - From Date Required!" SetFocusOnError="True"></asp:RequiredFieldValidator>
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="None"
    ErrorMessage="Apply Claims - Employee Name Required!" InitialValue="-select-" ControlToValidate="drpemployee"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="None"
    ErrorMessage="Apply Claims - Addition Type Required!" InitialValue="-select-" ControlToValidate="drpaddtype"></asp:RequiredFieldValidator>
<asp:CompareValidator ID="cmpEndDate" runat="server"  
 ErrorMessage="Apply Claims : To date cannot be less than start date" 
 ControlToCompare="RadDatePicker1" ControlToValidate="RadDatePicker2" 
 Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>     

