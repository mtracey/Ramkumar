<%@ Page Language="C#" AutoEventWireup="true" Codebehind="PreviousYearWages.aspx.cs" Inherits="SMEPayroll.employee.PreviousYearWages" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="RadInput.Net2" Namespace="Telerik.WebControls" TagPrefix="radI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

    <script type="text/javascript" language="javascript">
    function isNumericKeyStrokeDecimal(evt)
    {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if ((charCode > 31 && (charCode < 48 || charCode > 57)) && (charCode !=46))
            return false;

         return true;
    }    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0"  cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Previous Year Wages</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right"style="height: 25px">
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
        <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading"><b>EMPLOYEE LAST YEAR WAGES</b></font>
                            </td>
                        </tr>
                    </table>
                </td>
               <%-- <td width="5%">
                    <img alt="" src="../frames/images/PAYROLl/Top-payrollvariables.png" /></td>--%>
            </tr>
        </table>
        <center>
            <asp:Label ID="lblmessage" class="bodytxt" runat="server"></asp:Label></center>
        <br /><%--Skin="Default"--%>
        <radG:RadGrid ID="RadGrid1" AllowMultiRowEdit="True" OnNeedDataSource="RadGrid1_NeedDataSource"
            OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="Radgrid1_databound"  Skin="Outlook"
            Width="95%" runat="server" GridLines="None" AllowPaging="true" PageSize="50" EnableHeaderContextMenu="true">
            <MasterTableView CommandItemDisplay="bottom" DataKeyNames="emp_code" EditMode="EditForms"
                AutoGenerateColumns="False" AllowAutomaticUpdates="true" AllowAutomaticInserts="true"
                AllowAutomaticDeletes="true">
                <CommandItemTemplate>
                    <div style="text-align: center">
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" CommandName="UpdateAll" />
                        <input id="Button2" type="button" onclick="history.go(-1)" value="Back" /></td>
                    </div>
                </CommandItemTemplate>
                <Columns>
                    <radG:GridBoundColumn DataField="emp_code" Visible="false" DataType="System.Int32"
                        HeaderText="emp_code" SortExpression="emp_code" UniqueName="emp_code">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="emp_name" HeaderText="Employee Name" SortExpression="emp_name"
                        UniqueName="emp_name" AutoPostBackOnFilter="true" CurrentFilterFunction="contains">
                       <%-- <ItemStyle Width="30%" />--%>
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="OWLastYear"  Visible="false" UniqueName="OWLastYearID" AutoPostBackOnFilter="true" CurrentFilterFunction="contains">
                    </radG:GridBoundColumn>
                    <radG:GridTemplateColumn UniqueName="OWLastYear" HeaderText="Last Year"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <asp:DropDownList ID="OWLastYear" runat="server" DataSourceID="xmldtYears" DataTextField="text" DataValueField="id" ></asp:DropDownList>
                        </ItemTemplate>
                       <%-- <ItemStyle Width="30%" />--%>
                    </radG:GridTemplateColumn>
                    <radG:GridTemplateColumn UniqueName="LYOW" HeaderText="Last Year Total Ordinary Wages"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="txtLYOW" Style="text-align: right" Width="80px" onkeypress="return isNumericKeyStrokeDecimal(event)"
                                runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.LYTotalOW")%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="NumerictxtLYOW" runat="server" ControlToValidate="txtLYOW"
                                ErrorMessage="Wages should be numeric" ValidationExpression="^\d*\.{0,1}\d+$"
                                Display="Dynamic" />
                        </ItemTemplate>
                     <%--   <ItemStyle Width="60%" />--%>
                    </radG:GridTemplateColumn>
                    <radG:GridBoundColumn DataField="time_card_no" HeaderText="Time Card ID" AllowFiltering="false"
                        ReadOnly="True" SortExpression="time_card_no" UniqueName="time_card_no" Display="true">
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
                    <radG:GridBoundColumn DataField="Designation" HeaderText="Designation" AllowFiltering="false"
                        ReadOnly="True" SortExpression="Designation" UniqueName="Designation" Display="false">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn UniqueName="ic_pp_number" HeaderText="IC/FIN Number"  DataField="ic_pp_number" Display="false"  AllowFiltering="false" >
                    </radG:GridBoundColumn>
                    
                </Columns>
                <ExpandCollapseColumn Visible="False">
                    <HeaderStyle Width="19px" />
                </ExpandCollapseColumn>
                <RowIndicatorColumn Visible="False">
                    <HeaderStyle Width="20px" />
                </RowIndicatorColumn>
            </MasterTableView>
        </radG:RadGrid>
        <asp:XmlDataSource ID="xmldtYears" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year">
        </asp:XmlDataSource>
    </form>
</body>
</html>
