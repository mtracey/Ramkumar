<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ManageItemSubCategory.aspx.cs"
    Inherits="SMEPayroll.Management.ManageItemSubCategory" %>
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
            var ItemSubCategoryID="";
            var ItemSubCategoryName="";
            var changedFlage="false";        
            var changedFlage1="false";
            
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
                    if(ItemSubCategoryID=="" && changedFlage=="false")
                    {
                        var itemIndex = args.get_commandArgument();                            
                        var row = sender.get_masterTableView().get_dataItems()[itemIndex]; //to access the row                                
                        if(row!=null)
                        {
                            cellvalue = row._element.cells[3].innerHTML; // to access the cell value                                    
                            ItemSubCategoryID=cellvalue;
                            alert(cellvalue);
                        }
                    }
                    
                    if(ItemSubCategoryName=="" && changedFlage1=="false")
                    {
                        var itemIndex = args.get_commandArgument();                            
                        var row = sender.get_masterTableView().get_dataItems()[itemIndex]; //to access the row                                
                        if(row!=null)
                        {
                            cellvalue = row._element.cells[4].innerHTML; // to access the cell value                                    
                            ItemSubCategoryName=cellvalue;
                            alert(cellvalue);
                        }
                    }                        
                    if (result == 'Update' ||result == 'PerformInsert')
                    {
                        var sMsg="";
                        var message ="";                                    
                        message=MandatoryData(trim(ItemSubCategoryID),"ItemSubCategoryID");
                        if(message!="")
                            sMsg+=message+"\n";
                            
                        message=MandatoryData(trim(ItemSubCategoryName),"ItemSubCategoryName");
                        if(message!="")
                            sMsg+=message+"\n";   
                         
                            
                        if(sMsg!="")
                        {
                            args.set_cancel(true);
                            alert(sMsg);
                        }
                    } 
            }
            
            function OnFocusLost_ItemSubCategoryID(val)
            {
                var Object = document.getElementById(val);                                
                ItemSubCategoryID =GetDataFromHtml(Object);
                changedFlage="true";
            }  
            
            function OnFocusLost_ItemSubCategoryName(val)
            {
                var Object = document.getElementById(val);                                
                ItemSubCategoryName =GetDataFromHtml(Object);
                changedFlage1="true";
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Item Sub-Category</b></font>
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
                            OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated" OnItemCommand="RadGrid1_ItemCommand"
                            AllowFilteringByColumn="true" AllowSorting="true" Skin="Outlook" MasterTableView-CommandItemDisplay="bottom"
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
                                    <radG:GridDropDownColumn EditFormColumnIndex="0" DataField="Parent_ItemCategoryID"
                                        DataSourceID="SqlDataSource2" HeaderText="Item Category ID" ListTextField="ItemCategoryID"
                                        ListValueField="ID" UniqueName="GridDropDownColumn">
                                        <ItemStyle Width="30%" HorizontalAlign="Left" />
                                    </radG:GridDropDownColumn>
                                    <radG:GridBoundColumn EditFormColumnIndex="1" DataField="ItemSubCategoryID" UniqueName="ItemSubCategoryID"
                                        SortExpression="ItemSubCategoryID" HeaderText="Item Sub Category ID">
                                        <ItemStyle Width="30%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn EditFormColumnIndex="2" DataField="ItemSubCategoryName" UniqueName="ItemSubCategoryName"
                                        SortExpression="ItemSubCategoryName" HeaderText="Item Sub Category Name">
                                        <ItemStyle Width="40%" HorizontalAlign="Left" />
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
                                <EditFormSettings ColumnNumber="3">
                                    <FormTableItemStyle Wrap="False"></FormTableItemStyle>
                                    <FormCaptionStyle CssClass="EditFormHeader"></FormCaptionStyle>
                                    <FormMainTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="3"
                                        BackColor="White" Width="100%" />
                                    <FormTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="2"
                                        Height="30px" BackColor="White" />
                                    <FormTableAlternatingItemStyle BorderColor="blue" BorderWidth="0" Wrap="False"></FormTableAlternatingItemStyle>
                                    <EditColumn ButtonType="ImageButton" InsertText="Add New Item Sub Category" UpdateText="Update"
                                        UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                    </EditColumn>
                                    <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                </EditFormSettings>
                                <CommandItemSettings AddNewRecordText="Add New Item Sub Category" />
                            </MasterTableView>
                            <ClientSettings>
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                <ClientEvents OnRowDblClick="RowDblClick" OnCommand="Validations"   />
                            </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="Select [id], (ItemCategoryID + ' - ' + ItemCategoryName) ItemCategoryID From ItemCategory WHERE [company_id] = @company_id Or [company_id]=-1">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [ItemSubCategory] (Parent_ItemCategoryID, ItemSubCategoryID, ItemSubCategoryName) VALUES (@Parent_ItemCategoryID, @ItemSubCategoryID, @ItemSubCategoryName)"
                SelectCommand="Select * From (Select P.ID Parent_ItemCategoryID, ItemCategoryID, S.ID, S.ItemSubCategoryID, S.ItemSubCategoryName,P.Company_ID From ItemSubCategory S Inner Join ItemCategory P  On S.Parent_ItemCategoryID = P.ID) D Where D.Company_ID=@company_id Or D.Company_ID=-1"
                UpdateCommand="UPDATE [ItemSubCategory] SET [ItemSubCategoryID] = @ItemSubCategoryID, Parent_ItemCategoryID = @Parent_ItemCategoryID, ItemSubCategoryName=@ItemSubCategoryName  WHERE [id] = @id">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ItemSubCategoryID" Type="String" />
                    <asp:Parameter Name="Parent_ItemCategoryID" Type="Int32" />
                    <asp:Parameter Name="ItemSubCategoryName" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ItemSubCategoryID" Type="String" />
                    <asp:Parameter Name="Parent_ItemCategoryID" Type="Int32" />
                    <asp:Parameter Name="ItemSubCategoryName" Type="String" />
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
