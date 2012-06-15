<%@ Page Language="C#" AutoEventWireup="true" Codebehind="EmployeeWorkFlowLevel.aspx.cs"
    Inherits="SMEPayroll.Management.EmployeeWorkFlowLevel" %>
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
      
        <table cellpadding="0"  cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Employee Workflow Level</b></font>
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
        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                    function RowDblClick(sender, eventArgs)
                    {
                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                    }
            </script>
        </radG:RadCodeBlock>
        <div>
            <table id="table1" border="0" cellpadding="0" cellspacing="0" width="93%">
                <tr>
                    <td style="width: 15%">
                    </td>
                    <td style="width: 15%">
                    </td>
                    <td style="width: 10%">
                    </td>
                    <td style="width: 10%">
                    </td>
                    <td style="width: 15%">
                    </td>
                    <td style="width: 35%">
                    </td>
                </tr>
                <tr class="bodytxt">
                    <td align="left">
                        Workflow Name
                    </td>
                    <td align="left">
                        Workflow Type
                    </td>
                    <td align="left">
                         Group Name
                    </td>                    
                    <td align="left" id="row4" runat="server" visible="false">
                        Expiry Days
                    </td>
                    <td align="left" id="row5" runat="server" visible="false">
                        Auto Action
                    </td>                    
                    <td align="left">
                    </td>
                </tr>
                <tr class="bodytxt">
                    <td align="left">
                        <asp:DropDownList CssClass="textfields" OnDataBound="drpWorkFlowID_databound" ID="drpWorkFlowID"
                            DataTextField="WorkFlowName" DataValueField="ID" DataSourceID="SqlDataSource3"
                            runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpWorkFlowID_SelectedIndexChanged"
                            Width="95%">
                        </asp:DropDownList></td>
                    <td align="left">
                        <asp:DropDownList Width="95%" ID="drpType" CssClass="textfields" runat="Server" AutoPostBack="true"
                            OnSelectedIndexChanged="drpType_SelectedIndexChanged">
                            <asp:ListItem Value="1">Payroll</asp:ListItem>
                            <asp:ListItem Value="2">Leaves</asp:ListItem>
                            <asp:ListItem Value="3">Claims</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="left">
                        <asp:DropDownList CssClass="textfields" ID="drpPayrollGroup" DataValueField="ID" runat="server"
                            Width="95%">
                        </asp:DropDownList>
                    </td>
                    <td id="row1" runat="server" visible="false">
                        <asp:TextBox Width="55%" ID="txtExpirayDays" runat="server" ></asp:TextBox>
                    </td>
                    <td id="row2" runat="server" visible="false">
                        <asp:DropDownList CssClass="textfields" ID="drpAction" runat="server">
                            <asp:ListItem Value="1">Approved</asp:ListItem>
                            <asp:ListItem Value="2">Rejected</asp:ListItem>
                            <asp:ListItem Value="3">NoAction</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="left">
                        <asp:Button Width="70%" ID="btnAdd" Text="Add Level" runat="server" OnClick="btnAdd_Click">
                        </asp:Button>
                    </td>
                </tr>                                
                <tr>
                    <td colspan="6" align="left">
                        <radG:RadGrid ID="RadGrid1" runat="server" OnDeleteCommand="RadGrid1_DeleteCommand"
                            AllowFilteringByColumn="true" AllowSorting="true" OnItemDataBound="RadGrid1_ItemDataBound"
                            GridLines="None" Skin="Outlook" Width="100%" Visible="false">
                            <MasterTableView CommandItemDisplay="None" AllowAutomaticUpdates="False" AllowAutomaticDeletes="False"
                                AutoGenerateColumns="False" AllowAutomaticInserts="False" DataKeyNames="ID, RowID"
                                EditFormSettings-EditFormType="AutoGenerated">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                <Columns>
                                    <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="5%" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridBoundColumn Display="false" DataField="ID" DataType="System.Int32" UniqueName="ID"
                                        Visible="true" SortExpression="ID" HeaderText="ID">
                                        <ItemStyle Width="0px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="RowID" DataType="System.String" UniqueName="RowID"
                                        Visible="true" SortExpression="RowID" HeaderText="Level">
                                        <ItemStyle Width="30%" HorizontalAlign="left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="FlowType" DataType="System.String" UniqueName="FlowType"
                                        Visible="true" SortExpression="FlowType" HeaderText="Payroll Flow Type">
                                        <ItemStyle Width="30%" HorizontalAlign="left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="GroupName" DataType="System.String" UniqueName="GroupName"
                                        Visible="true" SortExpression="GroupName" HeaderText="Payroll Group Name">
                                        <ItemStyle Width="30%" HorizontalAlign="left" />
                                    </radG:GridBoundColumn>
                                    
                                   <radG:GridBoundColumn DataField="ExpiryDays" DataType="System.String" UniqueName="ExpiryDays"
                                        Visible="true" SortExpression="ExpiryDays" HeaderText="Expiry Days">
                                        <ItemStyle Width="30%" HorizontalAlign="left" />
                                    </radG:GridBoundColumn>             
                                    
                                    <radG:GridBoundColumn DataField="Action" DataType="System.String" UniqueName="Action"
                                        Visible="true" SortExpression="Action" HeaderText="Action">
                                        <ItemStyle Width="30%" HorizontalAlign="left" />                                        
                                    </radG:GridBoundColumn>
                                    
                                    <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                        ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton" Width="10%" />
                                    </radG:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                            <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Resizing AllowRowResize="false" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                            </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="Select ID,WorkFlowName From EmployeeWorkFlow  Where Company_Id= @company_id">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
