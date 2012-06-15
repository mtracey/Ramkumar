<%@ Page Language="C#" AutoEventWireup="true" Codebehind="GenerateLedger.aspx.cs"
    Inherits="SMEPayroll.Payroll.GenerateLedger" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../style/PMSStyle.css" type="text/css" />

    <script type="text/javascript" language="javascript">
	    function disablenow(mthis)
	    {
	        //mthis.disabled=true;
	        alert('You will receive an email for the selected employees with the DOC NO: '+ document.getElementById('hiddenrand').value);
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
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Generate Ledger</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right" style="width: 30%">
                                <tt class="bodytxt">Year :</tt>
                  <%--              <asp:DropDownList ID="cmbYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbYear_selectedIndexChanged"
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
                                </asp:DropDownList>--%>
                                <asp:DropDownList ID="cmbYear" Style="width: 65px" CssClass="textfields" DataTextField="text" DataValueField="id" DataSourceID="xmldtYear" 
                                       runat="server"  AutoPostBack="true" OnSelectedIndexChanged="cmbYear_selectedIndexChanged" >
                                      
                               </asp:DropDownList>
                               <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                
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
                                &nbsp;&nbsp;&nbsp;&nbsp;<tt><asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid"
                                    runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                                </tt>
                            </td>
                            <td align="right" style="height: 25px">
                                <input id="Button1" type="button" onclick="history.go(-1)" value="Back" class="textfields"
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
        <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" border="0" style="width: 98%">
            <tr>
                <td align="Center">
                    <asp:Button ID="Button4" CssClass="textfields" Width="150px" Text="Export to Excel"
                        OnClick="Button1_Click" runat="server"></asp:Button>
                    <asp:CheckBox  Visible="false"  ID="CheckBox1" CssClass="bodytxt" Text="Exports all pages" runat="server">
                    </asp:CheckBox></td>
            </tr>
        </table>
        <radG:RadGrid ID="RadGrid1" OnItemCommand="RadGrid1_ItemCommand" runat="server" GridLines="None" AllowPaging="true" PageSize="1000" Skin="Outlook" Width="99%" AutoGenerateColumns="False" OnPageIndexChanged="RadGrid1_PageIndexChanged" AllowMultiRowSelection="true" AllowFilteringByColumn="True">
            <MasterTableView DataSourceID="SqlDataSource1" TableLayout="Auto" AllowFilteringByColumn="false" >
                <FilterItemStyle HorizontalAlign="left"  />
                <HeaderStyle ForeColor="Navy" />
                <ItemStyle BackColor="White" Height="20px" />
                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                <Columns>
                    <radG:GridBoundColumn DataField="SetNum" HeaderText="SetNum" UniqueName="SetNum"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="CoCode" HeaderText="CoCode" UniqueName="CoCode"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="TransType" HeaderText="TransType" UniqueName="TransType"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="BUCode" HeaderText="BUCode" UniqueName="BUCode"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="StaffCode" HeaderText="StaffCode" UniqueName="StaffCode"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="Docnum" HeaderText="Docnum" UniqueName="Docnum"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="ChqNum" HeaderText="ChqNum" UniqueName="ChqNum"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="MasNum" HeaderText="MasNum" UniqueName="MasNum"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="TradeDate" HeaderText="TradeDate" UniqueName="TradeDate"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="DueDate" HeaderText="DueDate" UniqueName="DueDate"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="DocmDate" HeaderText="DocmDate" UniqueName="DocmDate"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="PartyCode" HeaderText="PartyCode" UniqueName="PartyCode"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="PartyName" HeaderText="PartyName" UniqueName="PartyName"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="Taxableynx" HeaderText="Taxableynx" UniqueName="Taxableynx"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="VATCode" HeaderText="VATCode" UniqueName="VATCode"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="DrCr" HeaderText="DrCr" UniqueName="DrCr"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="Offsetyn" HeaderText="Offsetyn" UniqueName="Offsetyn"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="OffsetInvNum" HeaderText="OffsetInvNum" UniqueName="OffsetInvNum"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="Acctnum" HeaderText="Acctnum" UniqueName="Acctnum"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="AmtForex" HeaderText="AmtForex" UniqueName="AmtForex"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="CCY" HeaderText="CCY" UniqueName="CCY"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="CCYRT" HeaderText="CCYRT" UniqueName="CCYRT"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="AmtLocal" HeaderText="AmtLocal" UniqueName="AmtLocal"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="Description" HeaderText="Description" UniqueName="Description"></radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="PrjCode" HeaderText="PrjCode" UniqueName="PrjCode"></radG:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <ClientSettings Selecting-AllowRowSelect="true" EnableRowHoverStyle="true" AllowColumnsReorder="true"
                ReorderColumnsOnClient="true">
                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                    AllowColumnResize="True" ClipCellContentOnResize="false"></Resizing>
            </ClientSettings>
        </radG:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="Sp_genledger"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                <asp:ControlParameter ControlID="cmbMonth" Name="month" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:ControlParameter ControlID="cmbYear" Name="year" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:SessionParameter Name="UserID" SessionField="EmpCode" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table width="100%">
            <tr>
                <td>
                    <asp:Label ID="dataexportmessage" runat="server" Visible="false" ForeColor="red"
                        CssClass="bodytxt">&nbsp;&nbsp;&nbsp;&nbsp;No Records to export!</asp:Label></td>
            </tr>
        </table>
        <input type="hidden" id="hiddenrand" value="" runat="server" />
        <br />
    </form>
</body>
</html>
