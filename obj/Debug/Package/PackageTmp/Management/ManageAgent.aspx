<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ManageAgent.aspx.cs" Inherits="SMEPayroll.Management.ManageAgent" %>
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Agent</b></font>
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
                <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">
                    <script language="javascript"  type="text/javascript"  src="../Frames/Script/CommonValidations.js" >
           
                    </script>
                    <script type="text/javascript">
                            var agent_name="";
                            var phone1="";
                            var phone2="";
                            var changedFlage="false";    
                            
                            function RowDblClick(sender, eventArgs)
                            {
                                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                            }
                            
                            function ViewCreated()
                            {
                               // alert('view created');
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
                                    //alert(agent_name +"," + phone1 + "," + phone2);
                                    if(agent_name=="" && changedFlage=="false")
                                    {
                                        var itemIndex = args.get_commandArgument();
                                        //alert(itemIndex);
                                        var row = sender.get_masterTableView().get_dataItems()[itemIndex]; //to access the row                                
                                        //alert(row);
                                        if(row!=null)
                                        {
                                            cellvalue = row._element.cells[2].innerHTML; // to access the cell value                                    
                                            agent_name=cellvalue;
                                        }
                                    }
                                
                                    if (result == 'Update' ||result == 'PerformInsert')
                                    {
                                        var sMsg="";
                                        var message ="";                                    
                                        message=MandatoryData(trim(agent_name)," Agent Name");                                    
                                        if(message!="")
                                            sMsg+=message+"\n";
                                            
                                        if(phone1!='undefined')    
                                        {
                                            message=CheckNumeric(phone1," Phone1");
                                            if(message!="")
                                                sMsg+=message+"\n";
                                        }
                                        
                                        if(phone2!='undefined')    
                                        {    
                                            message=CheckNumeric(phone2," Phone2");
                                            if(message!="")
                                                sMsg+=message+"\n";
                                        }
                                            
                                        if(sMsg!="")
                                        {
                                            args.set_cancel(true);
                                            alert(sMsg);
                                        }
                                    }  
                            }
                    
                               function OnFocusLost_AGentName(val)
                               {
                                    var Object = document.getElementById(val);
                                    //alert(Object.innerHTML);
                                    agent_name =GetDataFromHtml(Object);
                                   // alert(agent_name);
                                    changedFlage="true";
                               }
                               
                               function OnFocusLost_Phone1(val)
                               {
                                    var Object = document.getElementById(val);
                                    //alert(Object.innerHTML);
                                    phone1= GetDataFromHtml(Object);
                               }
                               
                               function OnFocusLost_Phone2(val)
                               {
                                    var Object = document.getElementById(val);
                                    //alert(Object.innerHTML);
                                    phone2= GetDataFromHtml(Object);
                               }
                    </script>

                </radG:RadCodeBlock>
                <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                    border="0">
                    <tr>
                        <td align="left">
                            <radG:RadGrid ID="RadGrid1" runat="server" 
                                AllowFilteringByColumn="true" AllowSorting="true" OnItemDataBound="RadGrid1_ItemDataBound"
                                DataSourceID="SqlDataSource1" GridLines="None" Skin="Outlook" Width="93%" 
                                OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated"   
                                OnDeleteCommand="RadGrid1_DeleteCommand" >
                                <MasterTableView CommandItemDisplay="Bottom" AllowAutomaticUpdates="True" DataSourceID="SqlDataSource1"
                                    AllowAutomaticDeletes="True" AutoGenerateColumns="False" AllowAutomaticInserts="True"
                                    DataKeyNames="id" >
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
                                        <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="id" DataType="System.Int32"
                                            UniqueName="id" Visible="true" SortExpression="id" HeaderText="Id">
                                            <ItemStyle Width="100px" />
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn EditFormColumnIndex="0" DataField="Agent_Name" UniqueName="Agent_Name"
                                            HeaderText="Agent Name" SortExpression="Agent_Name" AllowFiltering="true" AutoPostBackOnFilter="true"
                                            CurrentFilterFunction="Contains">
                                            <ItemStyle Width="500px" HorizontalAlign="Left" />
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn EditFormColumnIndex="1" DataField="Phone1" UniqueName="Phone1"
                                            HeaderText="Phone-1" SortExpression="Phone1" AllowFiltering="true" AutoPostBackOnFilter="true"
                                            CurrentFilterFunction="Contains" >
                                            <ItemStyle Width="500px" HorizontalAlign="Left" />
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn EditFormColumnIndex="0" DataField="Phone2" UniqueName="Phone2"
                                            HeaderText="Phone-2" SortExpression="Phone2" AllowFiltering="true" AutoPostBackOnFilter="true"
                                            CurrentFilterFunction="Contains">
                                            <ItemStyle Width="500px" HorizontalAlign="Left" />
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn EditFormColumnIndex="1" DataField="Address" UniqueName="Address"
                                            HeaderText="Address" SortExpression="Address" AllowFiltering="true" AutoPostBackOnFilter="true"
                                            CurrentFilterFunction="Contains">
                                            <ItemStyle Width="500px" HorizontalAlign="Left" />
                                        </radG:GridBoundColumn>
                                        <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                            <ItemStyle Width="50px" />
                                        </radG:GridEditCommandColumn>
                                        <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                            ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                            UniqueName="DeleteColumn">
                                            <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton" />
                                        </radG:GridButtonColumn>
                                    </Columns>
                                    <EditFormSettings ColumnNumber="2">
                                        <FormTableItemStyle HorizontalAlign="left" Wrap="False"></FormTableItemStyle>
                                        <FormCaptionStyle HorizontalAlign="left" CssClass="EditFormHeader"></FormCaptionStyle>
                                        <FormMainTableStyle HorizontalAlign="left" BorderColor="black" BorderWidth="0" CellSpacing="0"
                                            CellPadding="3" BackColor="White" Width="100%" />
                                        <FormTableStyle HorizontalAlign="left" BorderColor="black" BorderWidth="0" CellSpacing="0"
                                            CellPadding="2" BackColor="White" />
                                        <FormTableAlternatingItemStyle HorizontalAlign="left" BorderColor="blue" BorderWidth="0"
                                            Wrap="False"></FormTableAlternatingItemStyle>
                                        <EditColumn ButtonType="ImageButton" InsertText="Add New Agent" UpdateText="Update"
                                            UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                        </EditColumn>
                                        <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>                                        
                                    </EditFormSettings>
                                    <ExpandCollapseColumn Visible="False">
                                        <HeaderStyle Width="19px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <RowIndicatorColumn Visible="False">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <CommandItemSettings AddNewRecordText="Add New Agent" />
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true"    AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                    <ClientEvents OnRowDblClick="RowDblClick" OnCommand="Validations"/>
                                </ClientSettings>
                            </radG:RadGrid>
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [EmployeeAgent] (Company_ID, [Agent_Name], Phone1, Phone2, Address) VALUES (@company_id, @Agent_Name, @Phone1, @Phone2, @Address)"
                    SelectCommand="SELECT [id], [Agent_Name],Phone1, Phone2, Address FROM [EmployeeAgent]  WHERE [company_id] = @company_id"
                    UpdateCommand="UPDATE [EmployeeAgent] SET [Agent_Name] = @Agent_Name,[Phone1] = @Phone1, [Phone2] = @Phone2, [Address] = @Address WHERE [id] = @id">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Agent_Name" Type="String" />
                        <asp:Parameter Name="Phone1" Type="String" />
                        <asp:Parameter Name="Phone2" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Agent_Name" Type="String" />
                        <asp:Parameter Name="Phone1" Type="String" />
                        <asp:Parameter Name="Phone2" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp;</center>
            <center>
                &nbsp;</center>
        </div>
    </form>
</body>
</html>
