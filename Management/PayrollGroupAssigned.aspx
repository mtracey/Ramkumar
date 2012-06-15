<%@ Page Language="C#" AutoEventWireup="true" Codebehind="PayrollGroupAssigned.aspx.cs"
    Inherits="SMEPayroll.Management.PayrollGroupAssigned" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        
        <table cellpadding="0" cellspacing="0"  width="100%" runat="server" id="tablWf2"
            border="0">
            <tr visible="false" id="tr1"  runat="server">
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>WorkFlow Assigned</b></font>
                            </td>
                        </tr>
                        <tr >
                            <td>
                            </td>
                            <td align="center">
                                <tt class="bodytxt">Workflow Name :</tt>
                                <asp:DropDownList OnDataBound="drpWorkFlow_databound" ID="drpWorkFlow"
                                    DataTextField="WorkFlowName" DataValueField="ID" BackColor="White" DataSourceID="SqlDataSource4"
                                    runat="server" Width="200px" AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                            <td align="right" style="height: 25px">
                                <input id="Button1" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
                <%--<td width="5%">
                    <img alt="" src="../frames/images/EMPLOYEE/Top-Employeegrp.png" /></td>--%>
            </tr>
            <tr visible="false" id="tr2"  runat="server">
                <td>
                    <table cellpadding="5" cellspacing="0"  width="100%"  border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Payroll Group Assigned</b></font>
                            </td>
                        </tr>
                        <tr >
                            <td>
                            </td>
                            <td align="center">
                                <tt class="bodytxt">Payroll Group Name :</tt>
                                <asp:DropDownList OnDataBound="drpPayrollGroupID_databound" ID="drpPayrollGroupID"
                                    DataTextField="GroupName" DataValueField="Child_ID" BackColor="White" DataSourceID="SqlDataSource3"
                                    runat="server" Width="200px" AutoPostBack="true">
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
                    <tr runat="server" id="rw1">
                        <td style="width: 0%">
                        </td>
                        <td style="width: 40%">
                        </td>
                        <td style="width: 20%">
                        </td>
                        <td style="width: 40%">
                        </td>
                    </tr>
                    <tr runat="server" id="rw2">
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
                    <tr runat="server" id="radWF1" visible="false">
                        <td valign="top" class="bodytxt" align="right">
                        </td>
                        <td align="left" valign="top">
                            <radG:RadGrid ID="RadGrid2" runat="server" DataSourceID="SqlDataSource2" GridLines="None"
                                AllowFilteringByColumn="true" Skin="Outlook" Width="98%" AllowMultiRowSelection="true"
                                OnPageIndexChanged="RadGrid2_PageIndexChanged" PagerStyle-AlwaysVisible="true"
                                PagerStyle-Mode="NumericPages">
                                <MasterTableView AllowAutomaticUpdates="True" DataSourceID="SqlDataSource2" AutoGenerateColumns="False"
                                    DataKeyNames="Emp_Code" AllowPaging="true" PageSize="50">
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
                                        <radG:GridBoundColumn DataField="Emp_Name" DataType="System.String" UniqueName="Emp_Name"
                                            Visible="true" SortExpression="Emp_Name" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                                            HeaderText="Employee Name">
                                            <ItemStyle HorizontalAlign="left" Width="90%" />
                                        </radG:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                            </radG:RadGrid>&nbsp;
                        </td>
                        <td valign="top">
                            <radG:RadGrid ID="RadGrid1" runat="server" OnDeleteCommand="RadGrid1_DeleteCommand"
                                AllowFilteringByColumn="true" AllowSorting="true" AllowMultiRowSelection="true"
                                OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1" GridLines="None"
                                Skin="Outlook" OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated"
                                PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages" Width="98%">
                                <MasterTableView CommandItemDisplay="None" AllowAutomaticUpdates="True" DataSourceID="SqlDataSource1"
                                    AllowAutomaticDeletes="True" AutoGenerateColumns="False" AllowAutomaticInserts="True"
                                    AllowPaging="true" PageSize="50" DataKeyNames="Child_ID">
                                    <FilterItemStyle HorizontalAlign="left" />
                                    <HeaderStyle ForeColor="Navy" />
                                    <ItemStyle BackColor="White" Height="20px" />
                                    <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                    <Columns>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="Emp_ID" DataType="System.Int32"
                                            UniqueName="Emp_ID" Visible="true" SortExpression="Emp_ID" HeaderText="Emp_ID">
                                            <ItemStyle Width="0px" />
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn Display="false" DataField="Sub_Project_Name" DataType="System.String"
                                            UniqueName="Sub_Project_Name" Visible="true" SortExpression="Sub_Project_Name"
                                            HeaderText="Sub Project Name">
                                            <ItemStyle Width="30%" HorizontalAlign="left" />
                                        </radG:GridBoundColumn>
                                        <radG:GridClientSelectColumn UniqueName="Assigned">
                                            <ItemStyle Width="10%" />
                                        </radG:GridClientSelectColumn>
                                        <radG:GridBoundColumn DataField="EmpName" DataType="System.String" UniqueName="EmpName"
                                            Visible="true" SortExpression="EmpName" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                                            HeaderText="Assigned Employee Name">
                                            <ItemStyle Width="80%" HorizontalAlign="left" />
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn Display="false" DataField="Remarks" DataType="System.String"
                                            UniqueName="Remarks" Visible="true" HeaderText="Remarks" AllowFiltering="false">
                                            <ItemStyle Width="30%" HorizontalAlign="left" />
                                        </radG:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                            </radG:RadGrid>&nbsp;</td>
                    </tr>
                    
                    
                    
                    <tr runat="server" id="rw3">
                        <td style="width: 0%">
                        </td>
                        <td style="width: 40%">
                        </td>
                        <td style="width: 20%">
                        </td>
                        <td style="width: 40%">
                        </td>
                    </tr>
                    <tr runat="server" id="rw4">
                        <td class="bodytxt" align="right">
                        </td>
                        <td align="left">
                        </td>
                        <td rowspan="2" valign="top">
                            <asp:Button ID="btnWF2ASsign" runat="server" Text="Assign" 
                                Height="28px" Width="75px" />
                            <br />
                            <asp:Button ID="btnWF2UnAssign" runat="server" Text="Un-Assign" 
                                Height="28px" Width="75px" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    
                    <tr runat="server" id="radWf2" visible="false">
                        <td valign="top" class="bodytxt" align="right">
                        </td>
                        <td align="left" valign="top">
                            <radG:RadGrid ID="RadGrid3" runat="server" DataSourceID="SqlDataSource5" GridLines="None"
                                AllowFilteringByColumn="true" Skin="Outlook" Width="98%" AllowMultiRowSelection="true"
                                OnPageIndexChanged="RadGrid3_PageIndexChanged" PagerStyle-AlwaysVisible="true"
                                PagerStyle-Mode="NumericPages">
                                <MasterTableView AllowAutomaticUpdates="True" DataSourceID="SqlDataSource5" AutoGenerateColumns="False"
                                    DataKeyNames="Emp_Code" AllowPaging="true" PageSize="50">
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
                                        <radG:GridBoundColumn DataField="Emp_Name" DataType="System.String" UniqueName="Emp_Name"
                                            Visible="true" SortExpression="Emp_Name" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                                            HeaderText="Employee Name">
                                            <ItemStyle HorizontalAlign="left" Width="90%" />
                                        </radG:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                            </radG:RadGrid>&nbsp;
                        </td>
                        <td valign="top">
                            <radG:RadGrid ID="RadGrid4" runat="server" OnDeleteCommand="RadGrid4_DeleteCommand"
                                AllowFilteringByColumn="true" AllowSorting="true" AllowMultiRowSelection="true"
                                OnItemDataBound="RadGrid4_ItemDataBound" DataSourceID="SqlDataSource6" GridLines="None"
                                Skin="Outlook" OnItemInserted="RadGrid4_ItemInserted" OnItemUpdated="RadGrid4_ItemUpdated"
                                PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages" Width="98%">
                                <MasterTableView CommandItemDisplay="None" AllowAutomaticUpdates="True" DataSourceID="SqlDataSource6"
                                    AllowAutomaticDeletes="True" AutoGenerateColumns="False" AllowAutomaticInserts="True"
                                    AllowPaging="true" PageSize="50" DataKeyNames="Child_ID">
                                    <FilterItemStyle HorizontalAlign="left" />
                                    <HeaderStyle ForeColor="Navy" />
                                    <ItemStyle BackColor="White" Height="20px" />
                                    <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                    <Columns>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="Emp_ID" DataType="System.Int32"
                                            UniqueName="Emp_ID" Visible="true" SortExpression="Emp_ID" HeaderText="Emp_ID">
                                            <ItemStyle Width="0px" />
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn Display="false" DataField="Sub_Project_Name" DataType="System.String"
                                            UniqueName="Sub_Project_Name" Visible="true" SortExpression="Sub_Project_Name"
                                            HeaderText="Sub Project Name">
                                            <ItemStyle Width="30%" HorizontalAlign="left" />
                                        </radG:GridBoundColumn>
                                        <radG:GridClientSelectColumn UniqueName="Assigned">
                                            <ItemStyle Width="10%" />
                                        </radG:GridClientSelectColumn>
                                        <radG:GridBoundColumn DataField="EmpName" DataType="System.String" UniqueName="EmpName"
                                            Visible="true" SortExpression="EmpName" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                                            HeaderText="Assigned Employee Name">
                                            <ItemStyle Width="80%" HorizontalAlign="left" />
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn Display="false" DataField="Remarks" DataType="System.String"
                                            UniqueName="Remarks" Visible="true" HeaderText="Remarks" AllowFiltering="false">
                                            <ItemStyle Width="30%" HorizontalAlign="left" />
                                        </radG:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                            </radG:RadGrid>&nbsp;</td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="Select ID Child_ID, GroupName From PayrollGroup Where Company_Id= @company_id">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="Select Emp_Code, (Emp_Name+' '+Emp_LName) Emp_Name,'Assigned' = Case  When EC.PayrollGroupID is null Then CAST(0 AS bit) Else CAST(1 AS bit) End From Employee EA Left Outer Join (Select EA.Emp_ID,EA.PayrollGroupID From EmployeeAssignedToPayrollGroup EA Inner Join PayrollGroup PG On  EA.PayrollGroupID = PG.ID  Inner Join Employee EM On EA.Emp_ID = EM.Emp_Code  Where EM.Company_ID=@company_id And PG.ID=@PayrollGroupID  And EM.[StatusID]=1) EC On EA.Emp_Code = EC.Emp_ID  Where EA.Company_ID=@company_id And EC.PayrollGroupID is null And @PayrollGroupID > -1 And Emp_Code Not In (Select Emp_ID From EmployeeAssignedToPayrollGroup)  And EA.StatusID=1 And EA.TERMINATION_DATE IS NULL Order By EA.Emp_Name">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                        <asp:ControlParameter ControlID="drpPayrollGroupID" Name="PayrollGroupID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="Select EA.ID Child_ID, EA.PayrollGroupID, PG.ID, PG.GroupName, EA.Emp_ID, (EM.Emp_Name+' '+EM.emp_LName) EmpName From EmployeeAssignedToPayrollGroup EA Inner Join PayrollGroup PG On  EA.PayrollGroupID = PG.ID Inner Join Employee EM On EA.Emp_ID = EM.Emp_Code  Where EM.Company_ID= @company_id  And PG.ID= @PayrollGroupID  And EM.StatusID=1 AND EM.TERMINATION_DATE IS NULL Order By EM.Emp_Name">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                        <asp:ControlParameter ControlID="drpPayrollGroupID" Name="PayrollGroupID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                
                 <asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommand="select ID,WorkFlowName from EmployeeWorkFlow  Where Company_Id= @company_id">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" SelectCommand="Select Emp_Code, (Emp_Name+' '+Emp_LName) Emp_Name,'Assigned' = Case  When EC.PayrollGroupID is null Then CAST(0 AS bit) Else CAST(1 AS bit) End From Employee EA Left Outer Join (Select EA.Emp_ID,EA.PayrollGroupID From EmployeeAssignedToWorkFlow2Sup EA Inner Join EmployeeWorkFlow PG On  EA.PayrollGroupID = PG.ID  Inner Join Employee EM On EA.Emp_ID = EM.Emp_Code  Where EM.Company_ID=@company_id And PG.ID=@PayrollGroupIDWF  And EM.[StatusID]=1) EC On EA.Emp_Code = EC.Emp_ID  Where EA.Company_ID=@company_id And EC.PayrollGroupID is null And @PayrollGroupIDWF > -1 And Emp_Code Not In (Select Emp_ID From EmployeeAssignedToWorkFlow2Sup)  And EA.StatusID=1 And EA.TERMINATION_DATE IS NULL Order By EA.Emp_Name">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                        <asp:ControlParameter ControlID="drpWorkFlow" Name="PayrollGroupIDWF" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" SelectCommand="Select EA.ID Child_ID, EA.PayrollGroupID, PG.ID, PG.WorkFlowName, EA.Emp_ID, (EM.Emp_Name+' '+EM.emp_LName) EmpName From EmployeeAssignedToWorkFlow2Sup EA Inner Join EmployeeWorkFlow PG On  EA.PayrollGroupID = PG.ID Inner Join Employee EM On EA.Emp_ID = EM.Emp_Code  Where EM.Company_ID= @company_id  And PG.ID= @PayrollGroupIDWF  And EM.StatusID=1 AND EM.TERMINATION_DATE IS NULL Order By EM.Emp_Name">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                        <asp:ControlParameter ControlID="drpWorkFlow" Name="PayrollGroupIDWF" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                &nbsp;</center>
        </div>
    </form>
</body>
</html>
