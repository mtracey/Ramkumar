<%@ Page Language="C#" AutoEventWireup="true" Codebehind="claimSupervisorAssignment.aspx.cs"
    Inherits="SMEPayroll.Management.claimSupervisorAssignment" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="SMEPayroll" Namespace="SMEPayroll" TagPrefix="sds" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
</head>
<body style="margin-left: auto">
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Claim Supervisor Assignment</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                         <td   valign="middle" align="CENTER">
                           <tt class="bodytxt"> Claim Supervisor :</tt> <asp:DropDownList Width="200px" OnDataBound="drpSubProjectID_databound" ID="drpSubProjectID"
                                DataTextField="Name" DataValueField="EMP_CODE" BackColor="white" DataSourceID="SqlDataSource3"
                                runat="server" AutoPostBack="true">
                            </asp:DropDownList>
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
        <div>
            <center>
                <br />
                <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

                    <script type="text/javascript">
                        function RowDblClick(sender, eventArgs)
                        {
                            sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                        }
                    </script>

                </radG:RadCodeBlock>
                <table id="table1" border="0" cellpadding="0" cellspacing="0" width="90%">
                    <tr>
                        <td style="width: 0%">
                        </td>
                        <td style="width: 40%">
                        </td>
                        <td style="width: 20%">
                        </td>
                        <td style="width: 40%">
                        </td>
                    </tr>
                    <tr>
                        <td class="bodytxt" align="right">
                            </td>
                        <td align="left">
                            </td>
                        <td rowspan="2" valign="top">
                            <asp:Button ID="buttonAdd" runat="server" Text="Assign" OnClick="buttonAdd_Click"
                                Height="28px" Width="75px" />
                            <br />
                            <asp:Button ID="buttonDel" runat="server" Text="Un-Assign" OnClick="buttonAdd_Click"
                                Height="28px" Width="75px" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top" class="bodytxt" align="right">
                            </td>
                        <td align="left" valign="top">
                            <radG:RadGrid ID="RadGrid2" runat="server" DataSourceID="SqlDataSource2" GridLines="None"
                                Skin="Outlook" Width="98%" AllowFilteringByColumn="true" AllowMultiRowSelection="true"
                                OnPageIndexChanged="RadGrid2_PageIndexChanged" PagerStyle-Mode="NumericPages">
                                <MasterTableView AllowAutomaticUpdates="True" PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages"
                                    DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="Emp_Code"
                                    AllowPaging="true" PageSize="20">
                                    <FilterItemStyle HorizontalAlign="left" />
                                    <HeaderStyle ForeColor="Navy" />
                                    <ItemStyle BackColor="White" Height="20px" />
                                    <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                    <Columns>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="Emp_Code" DataType="System.Int32"
                                            UniqueName="Emp_Code" Visible="true" SortExpression="Emp_Code" HeaderText="Emp_Code">
                                        </radG:GridBoundColumn>
                                        <radG:GridClientSelectColumn UniqueName="Assigned">
                                            <ItemStyle Width="10%" />
                                        </radG:GridClientSelectColumn>
                                        
                                        <radG:GridBoundColumn ReadOnly="True" DataField="Time_Card_NO" DataType="System.String"
                                            UniqueName="Time_Card_NO" Visible="true" SortExpression="Time_Card_NO" HeaderText="Time Card NO">
                                        </radG:GridBoundColumn>
                                        
                                        <radG:GridBoundColumn DataField="Name" DataType="System.String" AllowFiltering="true"
                                            AutoPostBackOnFilter="true" UniqueName="Name" Visible="true" SortExpression="Name"
                                            HeaderText="Un Assigned Employee Name">
                                            <ItemStyle HorizontalAlign="left" />
                                        </radG:GridBoundColumn>
                                      
                                      <radG:GridBoundColumn DataField="Trade"  AllowFiltering="true"
                                        AutoPostBackOnFilter="true" UniqueName="Trade" Visible="true" SortExpression="Trade"
                                        HeaderText="Trade">
                                        <ItemStyle HorizontalAlign="left" />
                                    </radG:GridBoundColumn>
                                      
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                            </radG:RadGrid>&nbsp;
                        </td>
                        <td valign="top">
                            <radG:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource2" GridLines="None"
                                Skin="Outlook" Width="98%" AllowFilteringByColumn="true" AllowMultiRowSelection="true"
                                OnItemDataBound="RadGrid1_ItemDataBound" OnItemInserted="RadGrid1_ItemInserted"
                                OnItemUpdated="RadGrid1_ItemUpdated" OnDeleteCommand="RadGrid1_DeleteCommand"
                                PagerStyle-Mode="NumericPages">
                                <MasterTableView AllowAutomaticUpdates="True" PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages"
                                    DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Emp_Code"
                                    AllowPaging="true" PageSize="20">
                                    <FilterItemStyle HorizontalAlign="left" />
                                    <HeaderStyle ForeColor="Navy" />
                                    <ItemStyle BackColor="White" Height="20px" />
                                    <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                    <Columns>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="Emp_Code" DataType="System.Int32"
                                            UniqueName="Emp_Code" Visible="true" SortExpression="Emp_Code" HeaderText="Emp_Code">
                                        </radG:GridBoundColumn>
                                        <radG:GridClientSelectColumn UniqueName="Assigned">
                                            <ItemStyle Width="10%" />
                                        </radG:GridClientSelectColumn>
                                        
                                        <radG:GridBoundColumn ReadOnly="True" DataField="Time_Card_NO" DataType="System.String"
                                            UniqueName="Time_Card_NO" Visible="true" SortExpression="Time_Card_NO" HeaderText="Time Card NO">
                                        </radG:GridBoundColumn>
                                        
                                        <radG:GridBoundColumn DataField="Name" DataType="System.String" AllowFiltering="true"
                                            AutoPostBackOnFilter="true" UniqueName="Name" Visible="true" SortExpression="Name"
                                            HeaderText="Assigned Employee Name">
                                            <ItemStyle HorizontalAlign="left"  />
                                        </radG:GridBoundColumn>
                                        
                                       <radG:GridBoundColumn DataField="Trade"  AllowFiltering="true"
                                        AutoPostBackOnFilter="true" UniqueName="Trade" Visible="true" SortExpression="Trade"
                                        HeaderText="Trade">
                                        <ItemStyle HorizontalAlign="left" />
                                    </radG:GridBoundColumn>
                                        
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                            </radG:RadGrid>&nbsp;
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="SELECT EMP_CODE,EMP_NAME + ' ' + EMP_LNAME AS Name FROM EMPLOYEE   WHERE TERMINATION_DATE IS NULL  AND COMPANY_ID = @company_id ORDER BY EMP_NAME ">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT  Time_Card_No,EMP_CODE,EMP_NAME + ' ' + EMP_LNAME AS Name,(select trade from trade where id=Trade_id) as Trade FROM EMPLOYEE WHERE TERMINATION_DATE IS NULL  AND (EMP_CLSUPERVISOR IS NULL OR EMP_CLSUPERVISOR = 0) AND COMPANY_ID = @company_id ORDER BY EMP_NAME ">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT Time_Card_No,EMP_CODE,EMP_NAME + ' ' + EMP_LNAME AS Name,(select trade from trade where id=Trade_id) as Trade FROM EMPLOYEE WHERE TERMINATION_DATE IS NULL  AND EMP_CLSUPERVISOR =@EMP_CODE AND COMPANY_ID =@company_id ORDER BY EMP_NAME ">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                        <asp:ControlParameter ControlID="drpSubProjectID" Name="EMP_CODE" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;</center>
        </div>
    </form>
</body>
</html>
