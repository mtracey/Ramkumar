<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignAMC.aspx.cs" Inherits="SMEPayroll.Management.AssignAMC" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
        <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>AMC Scheme Assignment</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td>
                            </td>
                            <td align="Center" style="height: 25px">
                               <tt class="bodytxt" > AMC Scheme :</tt>
                                <asp:DropDownList Width="200px"  OnDataBound="drpSubProjectID_databound"
                                    ID="drpSubProjectID" DataTextField="CSN" DataValueField="ID" DataSourceID="SqlDataSource3"
                                    runat="server" AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
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
                                    DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="EmpId"
                                    AllowPaging="true" PageSize="50">
                                    <FilterItemStyle HorizontalAlign="left" />
                                    <HeaderStyle ForeColor="Navy" />
                                    <ItemStyle BackColor="White" Height="20px" />
                                    <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                    <Columns>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="EmpId" DataType="System.Int32"
                                            UniqueName="EmpId" Visible="true" SortExpression="EmpId" HeaderText="EmpId">
                                        </radG:GridBoundColumn>
                                        <radG:GridClientSelectColumn UniqueName="Assigned">
                                            <ItemStyle Width="10%" />
                                        </radG:GridClientSelectColumn>
                                        <radG:GridBoundColumn DataField="Name" DataType="System.String" AllowFiltering="true"
                                            AutoPostBackOnFilter="true" UniqueName="Name" Visible="true" SortExpression="Name"
                                            HeaderText="Un Assigned Employee Name">
                                            <ItemStyle HorizontalAlign="left" Width="90%" />
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
                                PagerStyle-Mode="NumericPages">
                                <MasterTableView AllowAutomaticUpdates="True" PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages"
                                    DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="EmpId"
                                    AllowPaging="true" PageSize="50">
                                    <FilterItemStyle HorizontalAlign="left" />
                                    <HeaderStyle ForeColor="Navy" />
                                    <ItemStyle BackColor="White" Height="20px" />
                                    <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                    <Columns>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="EmpId" DataType="System.Int32"
                                            UniqueName="EmpId" Visible="true" SortExpression="EmpId" HeaderText="EmpId">
                                        </radG:GridBoundColumn>
                                        <radG:GridClientSelectColumn UniqueName="Assigned">
                                            <ItemStyle Width="10%" />
                                        </radG:GridClientSelectColumn>
                                        <radG:GridBoundColumn DataField="Name" DataType="System.String" AllowFiltering="true"
                                            AutoPostBackOnFilter="true" UniqueName="Name" Visible="true" SortExpression="Name"
                                            HeaderText="Assigned Employee Name">
                                            <ItemStyle HorizontalAlign="left" Width="90%" />
                                        </radG:GridBoundColumn>
                                        <%--                                        <radG:GridBoundColumn DataField="Emp_Name" DataType="System.String" UniqueName="Emp_Name"
                                            Visible="true" SortExpression="Emp_Name" HeaderText="Employee Name">
                                            <ItemStyle HorizontalAlign="left" Width="90%" />
                                        </radG:GridBoundColumn>--%>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                            </radG:RadGrid>&nbsp;
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="SELECT ID,CSN FROM dbo.MedicalCSN Where Comp_Id= @company_id">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT e.emp_code As EmpId,Emp_name + '' + Emp_lname as Name from employee E Left outer join AmcAssignedEmployee AE on e.emp_code=AE.EmpCode where (AE.AssignedAMCID IS NULL )And e.Company_id=@company_id and termination_date is Null AND Emp_type in ('SPR','SC') Order By Emp_name">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT e.emp_code As EmpId,Emp_name + '' + Emp_lname as Name from employee E Left outer join AmcAssignedEmployee AE on e.emp_code=AE.EmpCode where (AE.AssignedAMCID =@csnId )And e.Company_id=@company_id and termination_date is Null Order By Emp_name">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                        <asp:ControlParameter ControlID="drpSubProjectID" Name="csnId" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;</center>
        </div>
    </form>
</body>
</html>
