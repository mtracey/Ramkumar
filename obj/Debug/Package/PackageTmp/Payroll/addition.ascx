<%@ Control Language="C#" AutoEventWireup="true" Codebehind="addition.ascx.cs" Inherits="SMEPayroll.Payroll.addition" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radA" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radCln" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radI" %>
<center>

    <script language="javascript" type="text/javascript">
        function isItemSelected(source, arguments){
        if (arguments.Value =='-1')
        {
        alert(arguments.Value);
        arguments.IsValid = false;
        }
        else
        {
        arguments.IsValid = true;
        }
        }
    </script>

    <table cellpadding="0" cellspacing="0" width="100%" border="0">
      <%--  <tr>
            <td style="width: 3%">
            </td>
            <td style="width: 22%">
            </td>
            <td style="width: 40%">
            </td>
            <td style="width: 15%">
            </td>
            <td style="width: 30%">
            </td>
        </tr>--%>
        <tr>
            <td colspan="5" style="font-weight: bold;color: #000000; height: 28px; background-color: #e9eed4; text-align: center">
                <asp:Label ID="Label1" runat="server" Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Adding a New Record" : "Editing Record" %>'
                    Width="100%"></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 31px; text-align: right">
            </td>
            <td style="height: 31px; text-align: right">
                <tt class="bodytxt">*Employee:&nbsp;</tt></td>
            <td style="height: 31px; text-align: left;">
                <asp:DropDownList ID="drpemployee" OnDataBound="drpemployee_databound" Enabled='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? (1==1) : !(1==1)%>'
                    runat="server">
                </asp:DropDownList>
            </td>
            <td style="height: 31px; text-align: left">
            </td>
            <td style="height: 31px; text-align: left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 32px; text-align: left">
            </td>
            <td style="height: 32px; text-align: right">
                <tt class="bodytxt">*Amount Only:&nbsp;</tt>
            </td>
            <td colspan="1" style="height: 32px; text-align: left;">
                <asp:TextBox ID="txtamt" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.trx_amount")%>'></asp:TextBox>&nbsp;
            </td>
            <td style="text-align: right">
                <tt class="bodytxt">CPF Payable:&nbsp;</tt></td>
            <td>
                <asp:Label ID="lblcpf" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.cpf")%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 32px; text-align: left">
            </td>
            <td style="height: 32px; text-align: right">
                <tt class="bodytxt">*Transaction Period:&nbsp;</tt>
            </td>
            <td colspan="2" style="height: 32px; text-align: left">
                &nbsp; From
                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" Enabled='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted")) ? true : false %>'
                    DbSelectedDate='<%# DataBinder.Eval(Container,"DataItem.trx_period_copy")%>'
                    ID="RadDatePicker1" runat="server" DateInput-DisplayDateFormat="dd-MM-yyyy">
                </radCln:RadDatePicker>
                &nbsp; &nbsp;&nbsp;- &nbsp; &nbsp;&nbsp;&nbsp;
                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" ID="RadDatePicker2" DbSelectedDate='<%# DataBinder.Eval(Container,"DataItem.trx_period_copy")%>'
                    Enabled='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? (1==1) : !(1==1)%>'
                    runat="server" DateInput-DisplayDateFormat="dd-MM-yyyy">
                </radCln:RadDatePicker>
                &nbsp;&nbsp;
            </td>
            <td style="height: 32px; text-align: left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="height: 32px; text-align: left">
            </td>
            <td style="height: 32px; text-align: right">
                <tt class="bodytxt">*Additions for Year:&nbsp;</tt></td>
            <td colspan="3" style="height: 32px; text-align: left">
           <%-- <asp:DropDownList ID="drpAdditionYear" runat="server" CssClass="textfields">
                    <asp:ListItem Value="">Select</asp:ListItem>
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
                
               <asp:DropDownList ID="drpAdditionYear" CssClass="textfields" DataTextField="text" DataValueField="id" DataSourceID="xmldtYear" 
                       runat="server" AppendDataBoundItems="true">
                      <asp:ListItem Value="">Select</asp:ListItem>
               </asp:DropDownList>
               <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                
            </td>
        </tr>
        <tr>
            <td style="height: 32px; text-align: left">
            </td>
            <td style="height: 32px; text-align: right">
                <tt class="bodytxt">*Addition Type:&nbsp;</tt></td>
            <td colspan="3" style="height: 32px; text-align: left">
                <asp:DropDownList ID="drpaddtype" OnDataBound="drpaddtype_databound" runat="server"
                    Width="90%" OnSelectedIndexChanged="drpaddtype_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr runat="server" id="tr1">
            <td style="height: 32px; text-align: left">
            </td>
            <td style="text-align: right;">
                <tt class="bodytxt">Basis Arriving Payment:&nbsp;</tt>
            </td>
            <td colspan="3" style="text-align: left">
                <tt class="bodytxt">
                    <asp:TextBox ID="txtbasis_arriving_payment" Text='<%# DataBinder.Eval(Container,"DataItem.basis_arriving_payment")%>'
                        MaxLength="100" class="textfields" runat="server"></asp:TextBox></tt>&nbsp;
            </td>
        </tr>
        <tr runat="server" id="tr2">
            <td style="height: 32px; text-align: left">
            </td>
            <td style="text-align: right; height: 24px;">
                <tt class="bodytxt">Service Length:&nbsp;</tt>
            </td>
            <td colspan="3" style="text-align: left; height: 24px;">
                <asp:TextBox ID="txtservice_length" MaxLength="52" Text='<%# DataBinder.Eval(Container,"DataItem.service_length")%>'
                    class="textfields" runat="server"></asp:TextBox>
                &nbsp;
            </td>
        </tr>
        <tr runat="server" id="tr3">
            <td style="height: 32px; text-align: left">
            </td>
            <td style="text-align: right;">
                <tt class="bodytxt">Is IRAS Approval:&nbsp;</tt>
            </td>
            <td colspan="3" style="text-align: left">
                <asp:DropDownList ID="drpiras_approval" DataTextField="text" class="textfields" runat="server">
                    <asp:ListItem Value="No" Text="No"></asp:ListItem>
                    <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr runat="server" id="tr4">
            <td style="height: 32px; text-align: left">
            </td>
            <td style="text-align: right;">
                <tt class="bodytxt">Approval Date:&nbsp;</tt>
            </td>
            <td colspan="3" style="text-align: left">
                <asp:TextBox ID="txtiras_approval_date" Text='<%# DataBinder.Eval(Container,"DataItem.iras_approval_date")%>'
                    MaxLength="10" class="textfields" runat="server"></asp:TextBox>
                <asp:Label runat="server" ID="lblDate" Text="( mm/dd/yyyy (Example 11/21/2011 i.e 21-Nov-2011))"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 39px; text-align: center;" colspan="5" style="color: #000000; height: 28px; background-color: #e9eed4; text-align: center">
                <asp:Button ID="btnUpdate" runat="server" CommandName='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted")) ? "PerformInsert" : "Update" %>'
                    Text='<%# ((bool)DataBinder.Eval(Container, "OwnerTableView.IsItemInserted")) ? "Insert" : "Update" %>'
                    OnClientClick="return Validations()" />
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" Width="64px" />
            </td>
        </tr>
        <tr style="display: none">
            <td colspan="5" style="height: 27px; background-color: #e9eed4; text-align: center">
                &nbsp;
                <asp:DropDownList ID="drplumsum" runat="server" AutoPostBack="True" Width="90%">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</center>
<%--<radCln:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <radCln:AjaxSetting AjaxControlID="drpaddtype">
            <UpdatedControls>
                <radCln:AjaxUpdatedControl ControlID="lblcpf"></radCln:AjaxUpdatedControl>
            </UpdatedControls>
        </radCln:AjaxSetting>
    </AjaxSettings>
</radCln:RadAjaxManager>--%>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
    ShowMessageBox="True" ShowSummary="False" />
&nbsp;
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtamt"
    Display="None" ErrorMessage="Amount Required!" SetFocusOnError="True"></asp:RequiredFieldValidator>
<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtamt"
    Display="None" ErrorMessage="Amount Is Invalid!" MaximumValue="1000000" MinimumValue="0"
    Type="Double"></asp:RangeValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadDatePicker2"
    Display="None" ErrorMessage="To Date Required!" SetFocusOnError="True"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadDatePicker1"
    Display="None" ErrorMessage="From Date Required!" SetFocusOnError="True"></asp:RequiredFieldValidator>
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="None"
    ErrorMessage="Employee Name Required!" InitialValue="-select-" ControlToValidate="drpemployee"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="None"
    ErrorMessage="Addition Type Required!" InitialValue="-select-" ControlToValidate="drpaddtype"></asp:RequiredFieldValidator>

<script language="javascript" src="../Frames/Script/CommonValidations.js">
</script>

<script language="javascript" type="text/javascript"> 
    function Validations()
    {
            var newMsg = "";
            /** Mandatory Fields Based Upon Simple No Value OR Combobox Values Like NA OR -SELECT-*/
		    var msg =   "Payroll Additions - Amount Only,Payroll Additions - Addition Type";
		    //var msg =   "Payroll Additions - Amount Only";
		    var srcData="";
		    //Control Validation		    
		    //validateData(srcCtrl,destSrc,opType,srcData,msg,con)            
            var variable1   =   document.getElementById("<%= txtamt.ClientID %>");      
            var vaiable2    =   document.getElementById("<%= drpaddtype.ClientID %>");
            
            var srcCtrl     =   variable1.id+','+vaiable2.id;
            var strirmsg    =   validateData(srcCtrl,'','MandatoryAll',srcData,msg,''); 
            if(strirmsg!="")
            {
                newMsg += strirmsg;
                newMsg = "Following fields are missing.\n" + newMsg + "\n";            
            }
            
            strirmsg="";
            var strirmsg = CheckNumeric(variable1.value,"\n Payroll Additions - Amount Only");
            if(strirmsg!="")
                newMsg+= strirmsg;
                
            //Check Date Values
             
            //alert(document.getElementById('RadDatePicker1').id); 
            var variable3   =   document.getElementById("<%= RadDatePicker1.ClientID %>"); 
            var variable4   =   document.getElementById("<%= RadDatePicker2.ClientID %>"); 
                        
            strirmsg="";
            strirmsg = CompareDate(variable3.value,variable4.value,
                    "Payroll Additions - From Date Can not greater than To Date\n","");
            if(strirmsg!="")
                newMsg+= strirmsg;
            
            if (newMsg == "")
            {
                return true;
            }
		    else
		    {
			    alert(newMsg); 
			    return false;
	        }
    }
</script>

