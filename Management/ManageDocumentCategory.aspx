<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ManageDocumentCategory.aspx.cs"
    Inherits="SMEPayroll.Management.ManageDocumentCategory" %>
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
        var Category_Name="";
        var changedFlage="false";        
        
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
                if(Category_Name=="" && changedFlage=="false")
                {
                    var itemIndex = args.get_commandArgument();                            
                    var row = sender.get_masterTableView().get_dataItems()[itemIndex]; //to access the row                                
                    if(row!=null)
                    {
                        cellvalue = row._element.cells[2].innerHTML; // to access the cell value                                    
                        Category_Name=cellvalue;
                    }
                }                        
                if (result == 'Update' ||result == 'PerformInsert')
                {
                    var sMsg="";
                    var message ="";                                    
                    message=MandatoryData(trim(Category_Name),"Category Name");
                    if(message!="")
                        sMsg+=message+"\n";
                        
                    if(sMsg!="")
                    {
                        args.set_cancel(true);
                        alert(sMsg);
                    }
                } 
        }
        
        function OnFocusLost_Category_Name(val)
        {
            var Object = document.getElementById(val);                                
            Category_Name =GetDataFromHtml(Object);
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Document Category</b></font>
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
                    <td>
                        <radG:RadGrid ID="RadGrid1" runat="server" OnDeleteCommand="RadGrid1_DeleteCommand" AllowSorting="true" PageSize="20" AllowPaging="true"  OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1" GridLines="None"
                            Skin="Outlook" Width="93%" OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated"
                            MasterTableView-CommandItemDisplay="bottom" MasterTableView-AllowAutomaticUpdates="true"
                            MasterTableView-AutoGenerateColumns="false" MasterTableView-AllowAutomaticInserts="true"
                            MasterTableView-AllowMultiColumnSorting="true" GroupHeaderItemStyle-HorizontalAlign="left"
                            ClientSettings-EnableRowHoverStyle="true" ClientSettings-AllowColumnsReorder="true"
                            ClientSettings-ReorderColumnsOnClient="true">
                            <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="id, Company_ID">
                                <Columns>
                                    <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10px" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="id" DataType="System.Int32"
                                        UniqueName="id" Visible="false" SortExpression="id" HeaderText="Id">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="Company_ID" DataType="System.Int32"
                                        UniqueName="Company_ID" Visible="false">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="Category_Name" UniqueName="Category_Name" HeaderText="Category Name"
                                        SortExpression="Category_Name" AllowFiltering="true" AutoPostBackOnFilter="true"
                                        CurrentFilterFunction="Contains">
                                        <ItemStyle Width="90%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                        <ItemStyle Width="20px" />
                                    </radG:GridEditCommandColumn>
                                    <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                        ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle Width="20px" HorizontalAlign="Center" CssClass="MyImageButton" />
                                    </radG:GridButtonColumn>
                                </Columns>
                                <EditFormSettings>
                                    <FormTableItemStyle Wrap="True"></FormTableItemStyle>
                                    <FormCaptionStyle CssClass="EditFormHeader"></FormCaptionStyle>
                                    <FormMainTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="3"
                                        BackColor="White" Width="100%" />
                                    <FormTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="2"
                                        BackColor="White" />
                                    <FormTableAlternatingItemStyle BorderColor="blue" BorderWidth="0" Wrap="True"></FormTableAlternatingItemStyle>
                                    <EditColumn ButtonType="ImageButton" InsertText="Add New Document Category" UpdateText="Update"
                                        UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                    </EditColumn>
                                    <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                </EditFormSettings>
                                <CommandItemSettings AddNewRecordText="Add New Document Category" />
                            </MasterTableView>
                            <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                <ClientEvents OnCommand="Validations"/>
                            </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [DocumentCategory] (Company_ID, [Category_Name]) VALUES (@company_id, @Category_Name)"
                SelectCommand="SELECT [id], [Category_Name], [Company_ID] FROM [DocumentCategory]  WHERE [company_id] = @company_id Or [Company_ID]=-1"
                UpdateCommand="UPDATE [DocumentCategory] SET [Category_Name] = @Category_Name WHERE [id] = @id">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Category_Name" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Category_Name" Type="String" />
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            &nbsp;</center>
        </div>
    </form>
</body>
</html>
