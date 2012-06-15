<%@ Page Language="C#" AutoEventWireup="true" Codebehind="AdditionType.aspx.cs" Inherits="SMEPayroll.Management.AdditionType" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
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

    <script language="javascript"> 
        function EnableApproval()
        {
            var txthid=document.getElementById('txtRadId').value + "_";
            document.getElementById(txthid + 'txtiras_approval_date').value='';

            if (document.getElementById(txthid + 'drpiras_approval').value == "Yes" || document.getElementById(txthid + 'drpiras_approval').value == "YES")
            {
                document.getElementById(txthid + 'tr5').style.display ="block";
            }
            else
            {
                document.getElementById(txthid + 'tr5').style.display ="none";
            }

        }
        function EnablePayableOtions()
        {
            var txthid=document.getElementById('txtRadId').value + "_";
            var oOption = document.getElementById('drplumsumswitch');
            var strOptions = oOption.options[oOption.selectedIndex].text;
            var strCompare = "," + document.getElementById(txthid + 'drptax_payable_options').value + ","; 

            var rfv1 = document.getElementById(txthid + 'rfvtxtbasis_arriving_payment');
            var rfv2 = document.getElementById(txthid + 'rfvtxtservice_length');
            var rfv3 = document.getElementById(txthid + 'rfvtxtiras_approval_date');

            if (strOptions.indexOf(strCompare) >= 0)
            {
                document.getElementById(txthid + 'tr2').style.display ="block";
                document.getElementById(txthid + 'tr3').style.display ="block";
                document.getElementById(txthid + 'tr4').style.display ="block";
                document.getElementById(txthid + 'tr5').style.display ="none";
                var oSwitch = document.getElementById(txthid + 'drpiras_approval');
                oSwitch.selectedIndex = 0;
            }
            else
            {
                document.getElementById(txthid + 'tr2').style.display ="none";
                document.getElementById(txthid + 'tr3').style.display ="none";
                document.getElementById(txthid + 'tr4').style.display ="none";
                document.getElementById(txthid + 'tr5').style.display ="none";
                var oSwitch = document.getElementById(txthid + 'drpiras_approval');
                oSwitch.selectedIndex = 0;
            }
        }

        function EnablePayable()
        {
            var txthid=document.getElementById('txtRadId').value + "_";
            var rfv1 = document.getElementById(txthid + 'rfvfcal');
            var oSwitch = document.getElementById(txthid + 'drptax_payable_options');
            oSwitch.selectedIndex = 0;
            if (document.getElementById(txthid + 'drptax_payable').value == "Yes" || document.getElementById(txthid + 'drptax_payable').value == "YES")
            {
                document.getElementById(txthid + 'tr1').style.display ="block";
                if (rfv1 != null)
                {
                    provinceValidator = document.getElementById(txthid + 'rfvfcal');
                    ValidatorEnable(provinceValidator, true);
                }
            }
            else
            {
                document.getElementById(txthid + 'tr1').style.display ="none";
                if (rfv1 != null)
                {
                    provinceValidator = document.getElementById(txthid + 'rfvfcal');
                    ValidatorEnable(provinceValidator, true);
                }
            }
        }
    </script>

</head>
<body style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Adition Types</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right" style="height: 25px">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
                <%--<td width="5%">
                    <img alt="" src="../frames/images/EMPLOYEE/Top-Employeegrp.png" /></td>--%>
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
        <div>
            <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr style="display: none;">
                    <td>
                        <asp:DropDownList ID="drplumsumswitch" DataTextField="text" DataValueField="id" DataSourceID="XmldtTaxPayableTypeLumSumSwtich"
                            class="textfields" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                    <td>
                        <radG:RadGrid ID="RadGrid1" AllowPaging="true" AllowFilteringByColumn="true" OnUpdateCommand="RadGrid1_UpdateCommand"
                            OnInsertCommand="RadGrid1_InsertCommand" OnDeleteCommand="RadGrid1_DeleteCommand"
                            PageSize="20" OnItemDataBound="RadGrid1_ItemDataBound" runat="server" OnNeedDataSource="RadGrid1_NeedDataSource"
                            GridLines="None" Skin="Outlook" Width="93%" PagerStyle-Mode="NextPrevAndNumeric">
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id,cpf,company_id" CommandItemDisplay="Bottom">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                <Columns>
                                    <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                        </ItemTemplate>
                                    </radG:GridTemplateColumn>
                                    <radG:GridBoundColumn DataField="optionselection" AllowFiltering="false" HeaderText="Addition Type"
                                        SortExpression="OptionSelection" UniqueName="OptionSelection">
                                        <ItemStyle Width="150px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="desc" CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="True"
                                        HeaderText="Addition Type Description" SortExpression="desc" UniqueName="desc">
                                        <ItemStyle Width="500px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="cpf" HeaderText="CPF" AllowFiltering="false" SortExpression="cpf"
                                        UniqueName="cpf">
                                        <ItemStyle Width="150px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Visible="false" DataField="company_id" HeaderText="company_id"
                                        SortExpression="company_id" UniqueName="company_id">
                                        <ItemStyle Width="150px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Visible="false" DataField="optionselection" HeaderText="OptionSelection"
                                        SortExpression="OptionSelection" UniqueName="OptionSelection">
                                        <ItemStyle Width="150px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="TypeOfWageDesc" AllowFiltering="false" HeaderText="Type Of Wage"
                                        UniqueName="TypeOfWageDesc">
                                        <ItemStyle Width="150px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                        <ItemStyle Width="40px" />
                                    </radG:GridEditCommandColumn>
                                    <radG:GridButtonColumn ConfirmText="Delete this record?" ButtonType="ImageButton"
                                        ImageUrl="../frames/images/toolbar/Delete.gif" CommandName="Delete" Text="Delete"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle Width="20px" />
                                    </radG:GridButtonColumn>
                                </Columns>
                                <ExpandCollapseColumn Visible="False">
                                    <HeaderStyle Width="19px" />
                                </ExpandCollapseColumn>
                                <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <EditFormSettings UserControlName="addition_edit.ascx" EditFormType="WebUserControl">
                                </EditFormSettings>
                                <CommandItemSettings AddNewRecordText="Add New Addition Type" />
                            </MasterTableView>
                            <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                            </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
        </div>
        <input type="hidden" runat="server" id="txtRadId" />
        <input type="hidden" runat="server" id="txtLumSum" />
        <asp:XmlDataSource ID="XmldtTaxPayableTypeLumSumSwtich" runat="server" DataFile="~/XML/xmldata.xml"
            XPath="SMEPayroll/Tax/TaxPayableTypeLumSumSwtich"></asp:XmlDataSource>
    </form>
</body>
</html>
