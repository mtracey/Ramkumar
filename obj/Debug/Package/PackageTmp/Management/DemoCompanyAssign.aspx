<%@ Page Language="C#" AutoEventWireup="true" Codebehind="DemoCompanyAssign.aspx.cs"
    Inherits="SMEPayroll.Management.DemoCompanyAssign" %>

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

if(document.all)
window.parent.defaultconf=window.parent.document.body.cols
function expando()
{
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Demo Company Assignment</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td>
                            </td>                          
                            <td align="Center" style="height: 25px">
                               <tt class="bodytxt" > Employee Name :</tt>
                                <asp:DropDownList Width="200px"  
                                    ID="drpEmployeeName" DataTextField="Name" DataValueField="EMP_CODE" DataSourceID="SqlDataSource4" OnDataBound="drpEmployeeName_databound"
                                    runat="server" AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                            
                             <td align="Center" style="height: 25px;display:none"  >
                               <tt class="bodytxt" > DemoCompany :</tt>
                                <asp:DropDownList Width="200px"  OnDataBound="drpSubProjectID_databound" 
                                    ID="drpSubProjectID" DataTextField="Company_Name" DataValueField="Company_ID" DataSourceID="SqlDataSource3"
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
                                        
                    <tr style="display:none">
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
                                        
                    <tr style="display:none">
                        <td valign="top" class="bodytxt" align="right">
                        </td>
                          <td valign="top">
                            <radG:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource2" GridLines="None"
                                Skin="Outlook" Width="98%" AllowFilteringByColumn="true" AllowMultiRowSelection="true"
                                OnItemDataBound="RadGrid1_ItemDataBound" OnItemInserted="RadGrid1_ItemInserted"
                                OnItemUpdated="RadGrid1_ItemUpdated" 
                                PagerStyle-Mode="NumericPages">
                                <MasterTableView AllowAutomaticUpdates="True" PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages"
                                    DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="Emp_Code"
                                    AllowPaging="true" PageSize="50">
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
                            </radG:RadGrid>
                        </td>
                        <td align="left" valign="top">
                            <radG:RadGrid ID="RadGrid2" runat="server" DataSourceID="SqlDataSource1" GridLines="None"
                                Skin="Outlook" Width="98%" AllowFilteringByColumn="true" AllowMultiRowSelection="true"
                                OnPageIndexChanged="RadGrid2_PageIndexChanged" PagerStyle-Mode="NumericPages">
                                <MasterTableView AllowAutomaticUpdates="True" PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages"
                                    DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Emp_Code"
                                    AllowPaging="true" PageSize="50">
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
                    </tr>
                                        
                    <tr>
                        <td class="bodytxt" align="right">
                        </td>
                        <td align="left">
                        </td>
                        <td rowspan="2" valign="top">
                            <asp:Button ID="buttonAdd1" runat="server" Text="Assign"  OnClick="buttonAdd_Click"
                                Height="28px" Width="75px" />
                            <br />
                            <asp:Button ID="buttonDel1" runat="server" Text="Un-Assign"  OnClick="buttonAdd_Click"
                                Height="28px" Width="75px" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                                        
                    <tr>
                        <td valign="top" class="bodytxt" align="right">
                        </td>
                          <td valign="top">
                            <radG:RadGrid ID="RadGrid3" runat="server" DataSourceID="SqlDataSource5" GridLines="None"
                                Skin="Outlook" Width="98%" AllowFilteringByColumn="true" AllowMultiRowSelection="true"                                
                                PagerStyle-Mode="NumericPages">
                                <MasterTableView AllowAutomaticUpdates="True" PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages"
                                    DataSourceID="SqlDataSource5" AutoGenerateColumns="False" DataKeyNames="Company_ID"
                                    AllowPaging="true" PageSize="10">
                                    <FilterItemStyle HorizontalAlign="left" />
                                    <HeaderStyle ForeColor="Navy" />
                                    <ItemStyle BackColor="White" Height="20px" />
                                    <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                    <Columns>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="Company_ID" DataType="System.Int32"
                                            UniqueName="Company_ID" Visible="true" SortExpression="Company_ID" HeaderText="Company_ID">
                                        </radG:GridBoundColumn>
                                        <radG:GridClientSelectColumn UniqueName="Assigned">
                                            <ItemStyle Width="10%" />
                                        </radG:GridClientSelectColumn>
                                        <radG:GridBoundColumn DataField="Company_Name" DataType="System.String" AllowFiltering="true"
                                            AutoPostBackOnFilter="true" UniqueName="Company_Name" Visible="true" SortExpression="Company_Name"
                                            HeaderText="Assigned Company Name">
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
                        <td align="left" valign="top">
                            <radG:RadGrid ID="RadGrid4" runat="server" DataSourceID="SqlDataSource6" GridLines="None"
                                Skin="Outlook" Width="98%" AllowFilteringByColumn="true" AllowMultiRowSelection="true"
                                OnPageIndexChanged="RadGrid2_PageIndexChanged" PagerStyle-Mode="NumericPages">
                                <MasterTableView AllowAutomaticUpdates="True" PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages"
                                    DataSourceID="SqlDataSource6" AutoGenerateColumns="False" DataKeyNames="Company_ID"
                                    AllowPaging="true" PageSize="10">
                                    <FilterItemStyle HorizontalAlign="left" />
                                    <HeaderStyle ForeColor="Navy" />
                                    <ItemStyle BackColor="White" Height="20px" />
                                    <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                    <Columns>
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="Company_ID" DataType="System.Int32"
                                            UniqueName="Company_ID" Visible="true" SortExpression="Company_ID" HeaderText="Company_ID">
                                        </radG:GridBoundColumn>
                                        <radG:GridClientSelectColumn UniqueName="Assigned">
                                            <ItemStyle Width="10%" />
                                        </radG:GridClientSelectColumn>
                                        <radG:GridBoundColumn DataField="Company_Name" DataType="System.String" AllowFiltering="true"
                                            AutoPostBackOnFilter="true" UniqueName="Company_Name" Visible="true" SortExpression="Company_Name"
                                            HeaderText="Un Assigned Company Name">
                                            <ItemStyle HorizontalAlign="left" Width="90%" />
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="select Company_ID,Company_Name  From Company">                    
                </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT  ep.EMP_CODE,ep.EMP_NAME +'' +ep.EMP_LNAME   AS NAME FROM employee ep  INNER JOIN Company c ON ep.Company_Id=c.Company_Id WHERE c.isMaster=1 AND ep.EMP_CODE NOT IN (SELECT UserID FROM 	MasterCompany_User Mc INNER JOIN employee emp ON Mc.CompanyId = emp.Company_Id WHERE Company_Id=@company_id2 ) Order By Emp_Name ">
                    <SelectParameters>                                                
                        <asp:ControlParameter ControlID="drpSubProjectID" Name="company_id2" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT  EMP_CODE,EMP_NAME +'' +EMP_LNAME AS NAME FROM employee  INNER JOIN MasterCompany_User ON employee.emp_code = MasterCompany_User.UserID WHERE MasterCompany_User.Companyid=@company_id1 Order By Emp_Name">
                        <SelectParameters>                                                
                            <asp:ControlParameter ControlID="drpSubProjectID" Name="company_id1" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                </asp:SqlDataSource>
                  
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommand="SELECT  ep.EMP_CODE,ep.EMP_NAME +'' +ep.EMP_LNAME   AS NAME FROM employee ep  INNER JOIN Company c ON ep.Company_Id=c.Company_Id WHERE c.isMaster=1 Order By Emp_Name ">
                </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" SelectCommand="select Company_ID,Company_Name  From Company Where Company_ID NOT IN (Select CompanyID From MasterCompany_User Where UserID=@EMP_CODE)">
                   <SelectParameters>                                                
                        <asp:ControlParameter ControlID="drpEmployeeName" Name="EMP_CODE" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                <%--SelectCommand="Select C.Company_ID,C.Company_Name From MasterCompany_User MC INNER JOIN Company C ON C.Company_ID=MC.CompanyId Where MC.UserID=@EMP_CODE"--%>
                 <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                 SelectCommand="Select Distinct C.Company_ID,C.Company_Name From MasterCompany_User MC INNER JOIN Company C ON C.Company_ID=MC.CompanyId Where MC.UserID=@EMP_CODE"
                 >
                   <SelectParameters>                                                
                        <asp:ControlParameter ControlID="drpEmployeeName" Name="EMP_CODE" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                
                </center>
        </div>
    </form>
</body>
</html>
