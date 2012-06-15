<%@ Page Language="C#" AutoEventWireup="true" Codebehind="EmployeeWorkflow.aspx.cs"
    Inherits="SMEPayroll.Management.EmployeeWorkflow" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="SMEPayroll" Namespace="SMEPayroll" TagPrefix="sds" %>
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
            var WorkFlowName="";
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
                    if(WorkFlowName=="" && changedFlage=="false")
                    {
                        var itemIndex = args.get_commandArgument();                            
                        var row = sender.get_masterTableView().get_dataItems()[itemIndex]; //to access the row                                
                        if(row!=null)
                        {
                            cellvalue = row._element.cells[2].innerHTML; // to access the cell value                                    
                            WorkFlowName=cellvalue;
                        }
                    }                        
                    if (result == 'Update' ||result == 'PerformInsert')
                    {
                        var sMsg="";
                        var message ="";                                    
                        message=MandatoryData(trim(WorkFlowName),"WorkFlowName");
                        if(message!="")
                            sMsg+=message+"\n";
                            
                        if(sMsg!="")
                        {
                            args.set_cancel(true);
                            alert(sMsg);
                        }
                    } 
            }
            
            function OnFocusLost_WorkFlowName(val)
            {
                var Object = document.getElementById(val);                                
                WorkFlowName =GetDataFromHtml(Object);
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Employee Workflow</b></font>
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
       
            <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

                <script type="text/javascript">
            function RowDblClick(sender, eventArgs)
            {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
                </script>

            </radG:RadCodeBlock>
            <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                    <td>
                        <radG:RadGrid ID="RadGrid1" runat="server" OnDeleteCommand="RadGrid1_DeleteCommand"
                            OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1" Width="93%"
                            OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated" AllowFilteringByColumn="true"
                            AllowSorting="true" Skin="Outlook" MasterTableView-CommandItemDisplay="bottom"
                            MasterTableView-AllowAutomaticUpdates="true" MasterTableView-AutoGenerateColumns="false"
                            MasterTableView-AllowAutomaticInserts="true" MasterTableView-AllowMultiColumnSorting="true"
                            GroupHeaderItemStyle-HorizontalAlign="left" ClientSettings-EnableRowHoverStyle="true"
                            ClientSettings-AllowColumnsReorder="true" ClientSettings-ReorderColumnsOnClient="true"
                            ClientSettings-AllowDragToGroup="true" ShowGroupPanel="true">
                            <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="id">
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
                                    <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="id" DataType="System.Int32"
                                        UniqueName="id" Visible="true" SortExpression="id" HeaderText="Id">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="WorkFlowName" UniqueName="WorkFlowName" SortExpression="WorkFlowName"
                                        HeaderText="Workflow Name">
                                        <ItemStyle Width="90%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                        <ItemStyle Width="50px" />
                                    </radG:GridEditCommandColumn>
                                    <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                        ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle Width="50px" HorizontalAlign="Center" CssClass="MyImageButton" />
                                    </radG:GridButtonColumn>
                                </Columns>
                                <EditFormSettings ColumnNumber="2">
                                    <FormTableItemStyle Wrap="False"></FormTableItemStyle>
                                    <FormCaptionStyle CssClass="EditFormHeader"></FormCaptionStyle>
                                    <FormMainTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="3"
                                        BackColor="White" Width="100%" />
                                    <FormTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="2"
                                        BackColor="White" />
                                    <FormTableAlternatingItemStyle BorderColor="blue" BorderWidth="0" Wrap="False"></FormTableAlternatingItemStyle>
                                    <EditColumn ButtonType="ImageButton" InsertText="Add Workflow" UpdateText="Update"
                                        UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                    </EditColumn>
                                    <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                </EditFormSettings>
                                <CommandItemSettings AddNewRecordText="Add Workflow" />
                            </MasterTableView>
                            <ClientSettings>
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                <ClientEvents OnRowDblClick="RowDblClick" OnCommand="Validations" />
                            </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [EmployeeWorkFlow] (WorkFlowName,Company_ID) VALUES (@WorkFlowName, @company_id)"
                SelectCommand="Select * From EmployeeWorkFlow E Where E.Company_ID=@company_id"
                UpdateCommand="UPDATE [EmployeeWorkFlow] SET [WorkFlowName] = @WorkFlowName WHERE [id] = @id">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="WorkFlowName" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="WorkFlowName" Type="String" />
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
