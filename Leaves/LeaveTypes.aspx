<%@ Page Language="C#" AutoEventWireup="true" Codebehind="LeaveTypes.aspx.cs" Inherits="SMEPayroll.Leaves.LeaveTypes" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
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
        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

            <script type="text/javascript">
                    function RowDblClick(sender, eventArgs)
                    {
                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                    }
            </script>            
        <script language="javascript"  type="text/javascript"  src="../Frames/Script/CommonValidations.js" >
        </script>
        <script type="text/javascript">
                var type="";
                var changedFlage="false";        
                
               //Leave Type
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
                    if(type=="" && changedFlage=="false")
                    {
                        var itemIndex = args.get_commandArgument();                            
                        var row = sender.get_masterTableView().get_dataItems()[itemIndex]; //to access the row                                
                        if(row!=null)
                        {
                            cellvalue = row._element.cells[2].innerHTML; // to access the cell value                                    
                            type=cellvalue;
                        }
                    }                        
                    if (result == 'Update' ||result == 'PerformInsert')
                    {
                        var sMsg="";
                        var message ="";                                    
                        message=MandatoryData(trim(type),"Leave Type");
                        if(message!="")
                            sMsg+=message+"\n";
                            
                        if(sMsg!="")
                        {
                            args.set_cancel(true);
                            alert(sMsg);
                        }
                    } 
                }
                           
                //Onlost Focus Of the Manual Leave Type
                function OnFocusLost_type(val)
                {
                    var Object = document.getElementById(val);                                
                    type =GetDataFromHtml(Object);
                    changedFlage="true";
                }  
        </script>
            

        </radG:RadCodeBlock>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
             <table cellpadding="0"  cellspacing="0"  width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%"  border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4" style="height: 19px">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Leave Types </b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td align="right"style="height: 25px">
                               <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                            style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
                            </tr>
        </table>
             <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                    border="0">
                    <tr>
                        <td>
                            <radG:RadGrid ID="RadGrid1" AllowFilteringByColumn="true" OnDeleteCommand="RadGrid1_DeleteCommand"
                                OnItemDataBound="RadGrid1_ItemDataBound" AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
                                AllowAutomaticDeletes="True" runat="server" DataSourceID="SqlDataSource1" GridLines="None"
                                Skin="Outlook" Width="99%">
                                <MasterTableView CommandItemDisplay="Bottom" DataSourceID="SqlDataSource1" AutoGenerateColumns="False"
                                    DataKeyNames="id, CompanyID,InPayslip">
                                    <FilterItemStyle HorizontalAlign="left" />
                                    <HeaderStyle ForeColor="Navy" />
                                    <ItemStyle BackColor="White" Height="20px" />
                                    <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                    <Columns>
                                        <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                            <ItemTemplate>
                                                <asp:Image ID="Image11" ImageUrl="../frames/images/LEAVES/Grid-leavetypes.png" runat="Server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="10px"></ItemStyle>
                                        </radG:GridTemplateColumn>
                                        <radG:GridBoundColumn ReadOnly="True" AllowFiltering="false" Visible="false" DataField="id"
                                            DataType="System.Int32" UniqueName="id" SortExpression="id" HeaderText="Id">
                                            <ItemStyle Width="10px"></ItemStyle>
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn DataField="type" UniqueName="type" AutoPostBackOnFilter="true"
                                            CurrentFilterFunction="contains" SortExpression="type" HeaderText="Leave Type">
                                            <ItemStyle HorizontalAlign="left" Width="80%"></ItemStyle>
                                        </radG:GridBoundColumn>
                                        <radG:GridEditCommandColumn  ButtonType="ImageButton" UniqueName="EditColumn">
                                            <ItemStyle Width="30px"></ItemStyle>
                                        </radG:GridEditCommandColumn>
                                        <radG:GridClientDeleteColumn  ButtonType="ImageButton" UniqueName="DeleteColumn">
                                        </radG:GridClientDeleteColumn>
                                        
                                        <radG:GridTemplateColumn HeaderText="Show In PaySlip" HeaderStyle-Width="10%"  UniqueName="Payslip" AllowFiltering="false" ItemStyle-HorizontalAlign="center" >   
                                                 <ItemTemplate>  
                                                     <asp:CheckBox ID="CheckBox_PaySlip" ToolTip='<%# Bind( "id" ) %>'   runat="server"  AutoPostBack="true" OnCheckedChanged="CheckChanged"  />  
                                                 </ItemTemplate>  
                                        </radG:GridTemplateColumn>  

                                        
                                    </Columns>
                                    <CommandItemSettings AddNewRecordText="Add New Leave Type" />
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                        <ClientEvents OnCommand="Validations"/>
                                </ClientSettings>
                            </radG:RadGrid></td>
                    </tr>
                
                </table>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [leave_types] ([type],[companyid]) VALUES (@type,@companyid)"
                    SelectCommand="SELECT [id],[InPayslip], [type],[CompanyID] FROM [leave_types] where companyid = @companyid OR companyid = -1 order by 1"
                    UpdateCommand="UPDATE [leave_types] SET [type] = @type WHERE [id] = @id AND [id] NOT IN(8,9,10,11,12,13,14,15,16)">
                    <SelectParameters>
                        <asp:SessionParameter Name="companyid" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="type" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="type" Type="String" />
                        <asp:SessionParameter Name="companyid" SessionField="Compid" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
    </form>
</body>
</html>
