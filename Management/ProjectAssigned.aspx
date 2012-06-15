<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ProjectAssigned.aspx.cs"
    Inherits="SMEPayroll.Management.ProjectAssigned" %>

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
        <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Project Assigned</b></font>
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
        <div>
            <center>
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
                        <td class="bodytxt" valign="middle" align="Center" colspan="4">
                            Project Name :
                            <asp:DropDownList Width="200px" OnDataBound="drpSubProjectID_databound" ID="drpSubProjectID"
                                DataTextField="Sub_Project_Name" DataValueField="Child_ID" BackColor="white"
                                CssClass="bodytxt" DataSourceID="SqlDataSource3" runat="server" AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="bodytxt" align="right">
                        </td>
                        <td align="left">
                        </td>
                        <td rowspan="2" valign="top">
                            <br />
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
                                        <radG:GridBoundColumn ReadOnly="True" DataField="Time_Card_NO" DataType="System.String"
                                            UniqueName="Time_Card_NO" Visible="true" SortExpression="Time_Card_NO" HeaderText="Time Card No">
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn DataField="Emp_Name" DataType="System.String" UniqueName="Emp_Name"
                                            Visible="true" SortExpression="Emp_Name" ShowFilterIcon="false" AutoPostBackOnFilter="true"
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
                            <radG:RadGrid ID="RadGrid1" runat="server" OnDeleteCommand="RadGrid1_DeleteCommand"
                                AllowFilteringByColumn="true" AllowMultiRowSelection="true" AllowSorting="true"
                                OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1" GridLines="None"
                                Skin="Outlook" OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated"
                                PagerStyle-Mode="NumericPages" PagerStyle-AlwaysVisible="true" Width="98%">
                                <MasterTableView CommandItemDisplay="None" AllowAutomaticUpdates="True" DataSourceID="SqlDataSource1"
                                    AllowAutomaticDeletes="True" AutoGenerateColumns="False" AllowAutomaticInserts="True"
                                    DataKeyNames="Child_ID" AllowPaging="true" PageSize="50">
                                    <FilterItemStyle HorizontalAlign="left" />
                                    <HeaderStyle ForeColor="Navy" />
                                    <ItemStyle BackColor="White" Height="20px" />
                                    <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                    <Columns>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="Child_ID" DataType="System.Int32"
                                            UniqueName="Child_ID" Visible="true" SortExpression="Child_ID" HeaderText="Child_ID">
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
                                        <radG:GridBoundColumn ReadOnly="True" DataField="Time_Card_NO" DataType="System.String"
                                            UniqueName="Time_Card_NO" Visible="true" SortExpression="Time_Card_NO" HeaderText="Time Card NO">
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn DataField="EmpName" DataType="System.String" UniqueName="EmpName"
                                            Visible="true" SortExpression="EmpName" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                                            HeaderText="Assigned Employee Name">
                                            <ItemStyle Width="90%" HorizontalAlign="left" />
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn Display="false" DataField="Remarks" DataType="System.String"
                                            UniqueName="Remarks" Visible="true" HeaderText="Remarks" AllowFiltering="false">
                                            <ItemStyle Width="30%" HorizontalAlign="left" />
                                        </radG:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                            </radG:RadGrid>&nbsp;</td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="Select P.ID Parent_ID, P.Project_ID Parent_Project_Unique, P.Project_Name Parent_Project_Name, S.ID Child_ID, S.Sub_Project_ID, S.Sub_Project_Name   From Project P Inner Join SubProject S On P.ID = S.Parent_Project_ID Where P.Company_Id= @company_id">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="Select Time_Card_No, Emp_Code, (Emp_Name+' '+Emp_LName) Emp_Name,'Assigned' = Case  When EC.Sub_Project_ID is null Then CAST(0 AS bit) Else CAST(1 AS bit) End From Employee EA Left Outer Join (Select EA.Emp_ID,EA.Sub_Project_ID From EmployeeAssignedToProject EA Inner Join SubProject SP On  EA.Sub_Project_ID = SP.ID  Inner Join Employee EM On EA.Emp_ID = EM.Emp_Code Where EM.Company_ID=@company_id And SP.ID=@SubProjectID  And EM.[StatusID]=1) EC On EA.Emp_Code = EC.Emp_ID Where EA.Company_ID=@company_id And EC.Sub_Project_ID is null And @SubProjectID > -1 AND EA.StatusID=1 And (EA.Time_Card_No is not null  And EA.Time_Card_No !='') Order By EA.Emp_Name">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                        <asp:ControlParameter ControlID="drpSubProjectID" Name="SubProjectID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="Select EA.ID Child_ID, EA.Sub_Project_ID, SP.Sub_Project_ID, SP.Sub_Project_Name, EA.Emp_ID, (EM.Emp_Name+' '+EM.emp_LName) EmpName, EM.Time_Card_NO From EmployeeAssignedToProject EA Inner Join SubProject SP On  EA.Sub_Project_ID = SP.ID Inner Join Employee EM On EA.Emp_ID = EM.Emp_Code Where EM.Company_ID= @company_id  And SP.ID= @SubProjectID  And EM.StatusID=1 Order BY EM.Emp_Name">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                        <asp:ControlParameter ControlID="drpSubProjectID" Name="SubProjectID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;</center>
        </div>
    </form>
</body>
</html>
