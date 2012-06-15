<%@ Page Language="C#" AutoEventWireup="true" Codebehind="SafetyPass.aspx.cs" Inherits="SMEPayroll.Management.SafetyPass" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG1" %>
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
    <radG1:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG1:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0"  cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Safety Pass</b></font>
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
        <div>
            <center>
                <br />
                <radG:RadGrid ID="RadGrid1" OnDeleteCommand="RadGrid1_DeleteCommand" Skin="Default"
                    runat="server" OnItemDataBound="RadGrid1_ItemDataBound" Width="800px" GridLines="None"
                    DataSourceID="SqlDataSource1">
                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" AllowAutomaticDeletes="True"
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CommandItemDisplay="Bottom"
                        DataSourceID="SqlDataSource1">
                        <Columns>
                            <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                </ItemTemplate>
                                <ItemStyle Width="10px" />
                            </radG:GridTemplateColumn>
                            <radG:GridBoundColumn DataField="id" DataType="System.Int32" HeaderText="Id" Visible="false"
                                ReadOnly="True" SortExpression="id" UniqueName="id">
                                <ItemStyle Width="100px" />
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="safety_type" HeaderText="Safety Type" SortExpression="safety_type"
                                UniqueName="safety_type">
                                <ItemStyle Width="500px" />                                
                            </radG:GridBoundColumn>
                            <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                <ItemStyle Width="50px" />
                            </radG:GridEditCommandColumn>
                            <radG:GridButtonColumn ConfirmText="Delete this record?" ButtonType="ImageButton"
                                ImageUrl="../frames/images/toolbar/Delete.gif" CommandName="Delete" Text="Delete"
                                UniqueName="DeleteColumn">
                                <ItemStyle Width="50px" />
                            </radG:GridButtonColumn>
                        </Columns>
                        <ExpandCollapseColumn Visible="False">
                            <HeaderStyle Width="19px" />
                        </ExpandCollapseColumn>
                        <RowIndicatorColumn Visible="False">
                            <HeaderStyle Width="20px" />
                        </RowIndicatorColumn>
                        <CommandItemSettings AddNewRecordText="Add New Safety Pass Type" />
                    </MasterTableView>                    
                    <ClientSettings >
                        <ClientEvents  OnRequestEnd="Validations"   />
                    </ClientSettings>
                    
                </radG:RadGrid><asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [safety_pass] ([safety_type],[companyid]) VALUES (@safety_type,@companyid)"
                    SelectCommand="SELECT [safety_type], [id] FROM [safety_pass] where companyid=@companyid"
                    UpdateCommand="UPDATE [safety_pass] SET [safety_type] = @safety_type WHERE [id] = @id">
                    <SelectParameters>
                        <asp:SessionParameter Name="companyid" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="safety_type" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="safety_type" Type="String" />
                        <asp:SessionParameter Name="companyid" SessionField="Compid" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </center>
        </div>
    </form>
</body>
</html>
