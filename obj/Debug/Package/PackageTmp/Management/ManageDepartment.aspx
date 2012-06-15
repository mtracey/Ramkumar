<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ManageDepartment.aspx.cs"
    Inherits="SMEPayroll.Management.ManageDepartment" %>
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Department</b></font>
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
            
        <script language="javascript"  type="text/javascript"  src="../Frames/Script/CommonValidations.js" >
        </script>
        <script type="text/javascript">
            var DepartmentName="";
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
                    if(DepartmentName=="" && changedFlage=="false")
                    {
                        var itemIndex = args.get_commandArgument();                            
                        var row = sender.get_masterTableView().get_dataItems()[itemIndex]; //to access the row                                
                        if(row!=null)
                        {
                            cellvalue = row._element.cells[2].innerHTML; // to access the cell value                                    
                            DepartmentName=cellvalue;
                        }
                    }                                          
                    if (result == 'Update' ||result == 'PerformInsert')
                    {
                        var sMsg="";
                        var message ="";                                    
                        message=MandatoryData(trim(DepartmentName),"Department Name");
                        if(message!="")
                            sMsg+=message+"\n";
                            
                        if(sMsg!="")
                        {
                            args.set_cancel(true);
                            alert(sMsg);
                        }
                    } 
            }
            
            function OnFocusLost_DepartmentName(val)
            {
                var Object = document.getElementById(val);                                
                DepartmentName =GetDataFromHtml(Object);
                changedFlage="true";
            }  
        </script>
        </radG:RadCodeBlock>
        
        <div>
            <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                    <td>
                        <radG:RadGrid ID="RadGrid1" OnDeleteCommand="RadGrid1_DeleteCommand" runat="server" AllowSorting="true"
                             PageSize="20" AllowPaging="true"  OnItemDataBound="RadGrid1_ItemDataBound" AllowAutomaticDeletes="True" AllowAutomaticInserts="True"
                            AllowAutomaticUpdates="True" DataSourceID="SqlDataSource1" GridLines="None" Skin="Outlook"
                            Width="93%" OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated" >
                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Bottom" DataKeyNames="id"
                                DataSourceID="SqlDataSource1" >
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
                                    <radG:GridBoundColumn DataField="id" DataType="System.Int32" HeaderText="ID" Visible="false"
                                        ReadOnly="True" SortExpression="id" UniqueName="id">
                                        <ItemStyle Width="100px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="DeptName" HeaderText="Department Name" SortExpression="DeptName"
                                        UniqueName="DeptName">
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
                                    <HeaderStyle Width="19px" />
                                </ExpandCollapseColumn>
                                <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <CommandItemSettings AddNewRecordText="Add New Department" />
                            </MasterTableView>
                            <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                <ClientEvents OnRowDblClick="RowDblClick"  OnCommand="Validations"/>
                            </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [department] ([DeptName],Company_id) VALUES (@DeptName,@company_id)"
                SelectCommand="SELECT [id], [DeptName] FROM [department] where company_id=@company_id order by 1"
                UpdateCommand="UPDATE [department] SET [DeptName] = @DeptName WHERE [id] = @id">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DeptName" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="DeptName" Type="String" />
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            </center>
        </div>
    </form>
</body>
</html>
