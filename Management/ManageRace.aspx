<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ManageRace.aspx.cs" Inherits="SMEPayroll.Management.ManageRace" %>
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
    
         <script language="javascript"  type="text/javascript"  src="../Frames/Script/CommonValidations.js" >
        </script>
            
        <script type="text/javascript">
            var Race="";
            var changedFlage="false";        
            
            function RowDblClick(sender, eventArgs)
            {
                    sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            } 
           //Check Validations for grid like Mandatory and 
           function Validations(sender, args) 
           {
                     if (typeof (args) !== "undefined")
                    {
                        var commandName = args.get_commandName();
                        var commandArgument = args.get_commandArgument();	        		    
                        switch (commandName) 
                        {
                            case "startRunningCommand":
                                $sendCommand(null, "alertCommand", new Date().toLocaleTimeString(), null);
	                            break;
                            case "alertCommand":
                                $sendCommand(null, "alertCommand", new Date().toLocaleTimeString(), null);
                                break;
                            default:
                                $sendCommand(null, "alertCommand", new Date().toLocaleTimeString(), null);
                            break;
                        }
                    }
                    
                    var result = args.get_commandName();                                    
                    if(Race=="" && changedFlage=="false")
                    {
                        var itemIndex = args.get_commandArgument();                            
                        var row = sender.get_masterTableView().get_dataItems()[itemIndex]; //to access the row                                
                        if(row!=null)
                        {
                            cellvalue = row._element.cells[2].innerHTML; // to access the cell value                                    
                            Race=cellvalue;
                        }
                    }                        
                    if (result == 'Update' ||result == 'PerformInsert')
                    {
                        var sMsg="";
                        var message ="";                                    
                        message=MandatoryData(trim(Race),"Race Name");
                        if(message!="")
                            sMsg+=message+"\n";
                            
                        if(sMsg!="")
                        {
                            args.set_cancel(true);
                            alert(sMsg);
                        }
                    } 
            }
            
            function OnFocusLost_Race(val)
            {
                var Object = document.getElementById(val);                                
                Race =GetDataFromHtml(Object);
                changedFlage="true";
            }  
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Race</b></font>
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
                <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                    border="0">
                    <tr>
                        <td><radG:RadGrid ID="RadGrid1" AllowSorting="true" runat="server" OnDeleteCommand="RadGrid1_DeleteCommand"
                    OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1" GridLines="None"  PageSize="20" AllowPaging="true" 
                    Skin="Outlook" Width="93%" OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated">
                    <MasterTableView CommandItemDisplay="Bottom" AllowAutomaticUpdates="True" DataSourceID="SqlDataSource1"
                        AllowAutomaticDeletes="True" AutoGenerateColumns="False" AllowAutomaticInserts="True"
                        DataKeyNames="id">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                        <Columns>
                            <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                </ItemTemplate>
                                <ItemStyle Width="10px" />
                            </radG:GridTemplateColumn>
                            <radG:GridBoundColumn ReadOnly="True" DataField="id" DataType="System.Int32" UniqueName="id"
                                Visible="false" SortExpression="id" HeaderText="Id">
                                <ItemStyle Width="100px" />
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="Race" UniqueName="Race" SortExpression="Race" HeaderText="Race">
                                <ItemStyle Width="90%" />
                            </radG:GridBoundColumn>
                            <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                <ItemStyle Width="30px" />
                            </radG:GridEditCommandColumn>
                            <radG:GridButtonColumn ConfirmText="Delete this record?" ButtonType="ImageButton"
                                ImageUrl="../frames/images/toolbar/Delete.gif" CommandName="Delete" Text="Delete"
                                UniqueName="DeleteColumn">
                                <ItemStyle Width="30px" />
                            </radG:GridButtonColumn>
                        </Columns>
                        <ExpandCollapseColumn Visible="False">
                            <HeaderStyle Width="19px"></HeaderStyle>
                        </ExpandCollapseColumn>
                        <RowIndicatorColumn Visible="False">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </RowIndicatorColumn>
                        <CommandItemSettings AddNewRecordText="Add New Race" />
                    </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                    <ClientEvents OnRowDblClick="RowDblClick" OnCommand="Validations" />
                                </ClientSettings>
                </radG:RadGrid></td></tr></table>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [race] ([Race]) VALUES (@Race)"
                    SelectCommand="SELECT [id], [Race] FROM [race] order by 1" UpdateCommand="UPDATE [race] SET [Race] = @Race WHERE [id] = @id">
                    <UpdateParameters>
                        <asp:Parameter Name="Race" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Race" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp;</center>
            <center>
                &nbsp;</center>
        </div>
    </form>
</body>
</html>
