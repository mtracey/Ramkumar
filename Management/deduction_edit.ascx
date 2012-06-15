<%@ Control Language="C#" AutoEventWireup="true" Codebehind="deduction_edit.ascx.cs"
    Inherits="SMEPayroll.Management.deduction_edit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>

  <script language="javascript" type="text/javascript">
    function isNumericKeyStrokeDecimal(evt)
    {
         var charCode = (evt.which) ? evt.which : event.keyCode 
         if ((charCode > 31 && (charCode < 48 || charCode > 57)) && (charCode !=46))
            return false;

         return true;
    }
  </script>

<center>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
        </tr>
        <tr>
            <td colspan="4" style="color: #000000; height: 28px; font-weight: bold; background-color: #e9eed4;
                text-align: center">
                <asp:Label ID="Label1" Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Adding a New Deduction Type Record" : "Editing Deduction Type Record" %>'
                    runat="server" Width="297px"></asp:Label></td>
        </tr>
        <tr>
            <td width="15%" style="height: 24px; text-align: right;">
                <tt class="bodytxt">Deduction Type :</tt></td>
            <td align="left" style="height: 24px">
                <tt class="bodytxt">
                    <asp:TextBox ID="txtaddtype" class="textfields" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.desc")%>'
                        Width="70%" MaxLength="25"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtaddtype"
                        Display="None" ErrorMessage="Please Enter Deduction Type">*</asp:RequiredFieldValidator></tt></td>
            <td width="15%" style="height: 24px; text-align: right;">
                <tt class="bodytxt">Account Code :</tt></td>
            <td align="left" style="height: 24px">
                <tt class="bodytxt">
                    <asp:TextBox ID="txtAccountCode" class="textfields" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.AccountCode")%>'></asp:TextBox>
                </tt>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <tt class="bodytxt">Amount To Be deducted from CPF Gross</tt></td>
            <td align="left" width="25%">
                <tt class="bodytxt">
                    <asp:DropDownList ID="drpcpf" class="textfields" runat="server" OnSelectedIndexChanged="drpcpf_SelectedIndexChanged"
                        AutoPostBack="true">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:DropDownList></tt></td>
            <td align="right" width="15%" style="height: 22px">
                <tt class="bodytxt">
                    <asp:Label ID="lblShared" Text="Shared:" runat="server"></asp:Label></tt>
          
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td>
                                 <tt class="bodytxt">
                                    <asp:DropDownList ID="drpShared" DataTextField="text" class="textfields" runat="server">
                                        <asp:ListItem Value="No" Text="No"></asp:ListItem>
                                        <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                    </asp:DropDownList>
                                </tt>
                            </td>
                             <td>
                                <tt class="bodytxt">Formula:</tt>
                              </td>
                        </tr>
                    </table>
              
            </td>
            <td align="left">
                   <asp:DropDownList ID="drpfor" runat="server" Width="101px" class="textfields" AutoPostBack="True" 
                                    OnSelectedIndexChanged="drpfor_SelectedIndexChanged">
                                    <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="% of Gross" Value="1"></asp:ListItem>
                   </asp:DropDownList>
                 &nbsp;
                   <asp:TextBox ID="txtFormulaCalc" class="textfields" Visible="false" runat="server"
                   Width="101px"  onkeypress="return isNumericKeyStrokeDecimal(event);" ></asp:TextBox>
            </td>
        </tr>
        <tr bgcolor="<% =sOddRowColor%>">
            <td colspan="4" style="height: 32px; text-align: center">
                &nbsp;<asp:Button ID="btnUpdate" CommandName='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "PerformInsert" : "Update" %>'
                    Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Insert" : "Update" %>'
                    runat="server" Width="85px" />
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" Width="64px" /></td>
        </tr>
        <tr bgcolor="<% =sOddRowColor%>">
            <td colspan="4" style="height: 32px; text-align: center">
                <asp:Label ID="lblMsg" runat="server" Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Adding a New Deduction Type Record" : "Editing Deduction Type Record" %>'
                    Width="297px"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="4" style="height: 27px; background-color: #e9eed4; text-align: center">
                &nbsp;<asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                    ShowMessageBox="True" ShowSummary="False" />
                &nbsp;
            </td>
        </tr>
        <tr runat="server" id="tr2" style="display: none">
            <td colspan="4">
                <asp:TextBox ID="txtForm" runat="server" Text=""></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:XmlDataSource ID="XmldtTaxPayableType" runat="server" DataFile="~/XML/xmldata.xml"
        XPath="SMEPayroll/Tax/TaxPayableType"></asp:XmlDataSource>
</center>
