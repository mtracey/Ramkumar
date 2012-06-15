<%@ Control Language="C#" AutoEventWireup="true" Codebehind="addition_edit.ascx.cs"
    Inherits="SMEPayroll.Management.addition_edit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<center>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
        </tr>
        <tr>
            <td colspan="4" style="color: #000000; height: 28px; font-weight: bold; background-color: #e9eed4;
                text-align: center">
                <asp:Label ID="Label1" Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Adding a New Addition Type Record" : "Editing Addition Type Record" %>'
                    runat="server" Width="297px"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="4" style="height: 24px;">
                <asp:RadioButtonList ID="rbllist" runat="server" RepeatDirection="Horizontal" OnDataBound="rbllist_DataBound"  AutoPostBack="true" OnSelectedIndexChanged="rbllist_SelectedIndexChanged">
                    <asp:ListItem Selected="True">General</asp:ListItem>
                    <asp:ListItem>Claim</asp:ListItem>
                    <asp:ListItem>Variable</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr bgcolor="<% =sOddRowColor%>">
            <td style="height: 24px; text-align: right;">
                <tt class="bodytxt">
                    <asp:Label ID="lblVariable" runat="server" Text="Variable Type : "></asp:Label></tt></td>
            <td align="left" colspan="3">
                <tt class="bodytxt">
                    <asp:TextBox Enabled="false" ID="txtCode" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.code")%>'
                        Width="101px"></asp:TextBox></tt></td>
        </tr>
        <tr>
            <td width="15%" style="height: 24px; text-align: right;">
                <tt class="bodytxt">Addition Type :</tt></td>
            <td align="left" style="height: 24px">
                <tt class="bodytxt">
                    <asp:TextBox ID="txtaddtype"  class="textfields" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.desc")%>' Width="50%" MaxLength="25"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtaddtype"
                        Display="None" ErrorMessage="Please Enter Addition Type">*</asp:RequiredFieldValidator></tt></td>
            <td width="15%" style="height: 24px; text-align: right;">
                <tt class="bodytxt">Account Code :</tt></td>
            <td align="left" style="height: 24px">
                <tt class="bodytxt">
                    <asp:TextBox ID="txtAccountCode" class="textfields" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.AccountCode")%>'
                        ></asp:TextBox>
                </tt>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <tt class="bodytxt">CPF Payable :</tt></td>
            <td align="left" width="25%">
                <tt class="bodytxt">
                    <asp:DropDownList ID="drpcpf" class="textfields" runat="server" OnSelectedIndexChanged="drpcpf_SelectedIndexChanged"
                        AutoPostBack="true">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:DropDownList></tt></td>
            <td align="right" width="15%">
                <tt class="bodytxt">
                    <asp:Label ID="lblTypeOfAddition" runat="server" Text="Type of  Addition : "></asp:Label></tt></td>
            <td align="left" width="25%">
                <tt class="bodytxt">
                    <asp:DropDownList ID="drpWage" class="textfields" runat="server">
                        <asp:ListItem Text="Ordinary Wage" Value="O"></asp:ListItem>
                        <asp:ListItem Text="Additional Wage" Value="A"></asp:ListItem>
                    </asp:DropDownList>
                </tt>
            </td>
        </tr>
        <tr id="trFormula" runat="server">
            <td style="height: 24px; text-align: right">
                <tt class="bodytxt">
                    <asp:Label ID="lblFormula" runat="server" Text="Formula :"></asp:Label></tt></td>
            <td align="left" width="25%" style="height: 24px">
                <asp:DropDownList ID="drpfor" runat="server" Width="101px" class="textfields" AutoPostBack="True"
                    OnSelectedIndexChanged="drpfor_SelectedIndexChanged">
                    <asp:ListItem Text="Day" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Time" Value="2"></asp:ListItem>
                    <asp:ListItem Text="N/A" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="right" width="15%" style="height: 24px">
                <tt class="bodytxt">
                    <asp:Label ID="lblFormulaCalc" runat="server"></asp:Label></tt></td>
            <td align="left" width="25%" style="height: 24px">
                <tt class="bodytxt">
                    <asp:TextBox ID="txtFormulaCalc" class="textfields" Visible="false" runat="server"
                        Text='<%# DataBinder.Eval(Container,"DataItem.formulacalc")%>' Width="101px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvfcal" runat="server" ControlToValidate="txtFormulaCalc"
                        Display="None" ErrorMessage="Please Enter Time in format hh:mm" Visible="false">*</asp:RequiredFieldValidator>
                </tt>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; height: 22px;">
                <tt class="bodytxt">Is Tax Payable:</tt></td>
            <td align="left" width="25%" style="height: 22px">
                <tt class="bodytxt">
                    <asp:DropDownList ID="drptax_payable" DataTextField="text" class="textfields" runat="server">
                        <asp:ListItem Value="No" Text="No"></asp:ListItem>
                        <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                    </asp:DropDownList></tt></td>
            <td align="right" width="15%" style="height: 22px">
                <tt class="bodytxt">
                    <asp:Label ID="lblShared" Text="Shared:" runat="server"></asp:Label></tt></td>
            <td align="left" width="25%" style="height: 22px">
                <tt class="bodytxt">
                    <asp:DropDownList ID="drpShared" DataTextField="text" class="textfields" runat="server">
                        <asp:ListItem Value="No" Text="No"></asp:ListItem>
                        <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                    </asp:DropDownList>
                </tt>
            </td>
        </tr>
        <tr runat="server" id="tr1">
            <td style="text-align: right">
                <tt class="bodytxt">Tax Payble:</tt>
            </td>
            <td colspan="3" style="text-align: left">
                <asp:DropDownList ID="drptax_payable_options" DataTextField="text" DataValueField="id"
                    DataSourceID="XmldtTaxPayableType" class="textfields" runat="server">
                </asp:DropDownList>&nbsp;
            </td>
        </tr>

        <!-- new -->
        <tr id="CappingTr" runat="server">
             <td style="text-align: right">Capping:</td>
             <td style="text-align: left">  
                   <asp:DropDownList ID="DropDown_Capping" DataTextField="text" class="textfields" runat="server">
                        <asp:ListItem Value="No" Text="No"></asp:ListItem>
                        <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                    </asp:DropDownList>
              </td>
               <td style="text-align: right">Payment Type:</td>
             <td  style="text-align: left">  
                   <asp:DropDownList ID="DropDown_PaymentType" DataTextField="text" class="textfields" runat="server">
                        <asp:ListItem Value="1" Text="Payroll"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Peddy Cash"></asp:ListItem>
                    </asp:DropDownList>
              </td>
        </tr>
        <!-- new end --->


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
                <asp:Label ID="lblMsg" runat="server" Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Adding a New Addition Type Record" : "Editing Addition Type Record" %>'
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
