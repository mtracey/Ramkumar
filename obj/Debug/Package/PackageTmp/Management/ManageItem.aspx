<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ManageItem.aspx.cs" Inherits="SMEPayroll.Management.ManageItem" %>
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
            var ItemID          =   "";            
            var changedFlage    ="false";    
            var ItemName          =   "";            
            var changedFlage1    ="false";    
            
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
                    if(ItemID=="" && changedFlage=="false")
                    {
                        var itemIndex = args.get_commandArgument();                            
                        var row = sender.get_masterTableView().get_dataItems()[itemIndex]; //to access the row                                
                        if(row!=null)
                        {
                            cellvalue = row._element.cells[6].innerHTML; // to access the cell value                                    
                            ItemID=cellvalue;
                        }
                    }  
                    
                   if(ItemName=="" && changedFlage1=="false")
                    {
                        var itemIndex = args.get_commandArgument();                            
                        var row = sender.get_masterTableView().get_dataItems()[itemIndex]; //to access the row                                
                        if(row!=null)
                        {
                            cellvalue = row._element.cells[7].innerHTML; // to access the cell value                                    
                            ItemName=cellvalue;
                        }
                    }  
                                    
                    if (result == 'Update' ||result == 'PerformInsert')
                    {
                        var sMsg="";
                        var message ="";                                    
                        message=MandatoryData(trim(ItemID),"ItemCode");
                        if(message!="")
                            sMsg+=message+"\n";
                            
                        message=MandatoryData(trim(ItemName),"ItemName");
                        if(message!="")
                            sMsg+=message+"\n";
                            
                        if(sMsg!="")
                        {
                            args.set_cancel(true);
                            alert(sMsg);
                        }
                    } 
            }
            
            function OnFocusLost_ItemID(val)
            {
                var Object = document.getElementById(val);                                
                ItemID =GetDataFromHtml(Object);
                changedFlage="true";
            }  
            
            function  OnFocusLost_ItemName(val)
            {
                var Object = document.getElementById(val);                                
                ItemName=GetDataFromHtml(Object);
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Item</b></font>
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
                            PageSize="20" AllowPaging="true" OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1"
                            Width="93%" OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated"
                            OnItemCommand="RadGrid1_ItemCommand" AllowSorting="true" Skin="Outlook" MasterTableView-CommandItemDisplay="bottom"
                            MasterTableView-AllowAutomaticUpdates="true" MasterTableView-AutoGenerateColumns="false"
                            MasterTableView-AllowAutomaticInserts="true" MasterTableView-AllowMultiColumnSorting="true"
                            GroupHeaderItemStyle-HorizontalAlign="left" ClientSettings-EnableRowHoverStyle="true"
                            ClientSettings-AllowColumnsReorder="true" ClientSettings-ReorderColumnsOnClient="true"
                            OnDetailTableDataBind="RadGrid1_DetailTableDataBind" ClientSettings-AllowDragToGroup="false"
                            ShowGroupPanel="false">
                            <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="IDParent" AutoGenerateColumns="false">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                <ExpandCollapseColumn Groupable="true">
                                </ExpandCollapseColumn>
                                <DetailTables>
                                    <radG:GridTableView DataKeyNames="IDChild, ID" runat="server" Width="100%" CommandItemDisplay="Bottom"
                                        ShowHeadersWhenNoRecords="true" Name="Parameters" AutoGenerateColumns="false">
                                        <ParentTableRelation>
                                            <radG:GridRelationFields DetailKeyField="IDChild" MasterKeyField="IDParent" />
                                        </ParentTableRelation>
                                        <Columns>
                                            <radG:GridTemplateColumn UniqueName="TemplateColumn">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10px" />
                                            </radG:GridTemplateColumn>
                                            <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="ID" DataType="System.Int32"
                                                UniqueName="ID" Visible="false" SortExpression="ID" HeaderText="ID">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="IDChild" DataType="System.Int32"
                                                UniqueName="IDChild" Visible="false" SortExpression="IDChild" HeaderText="IDChild">
                                            </radG:GridBoundColumn>
                                            <radG:GridDropDownColumn EditFormColumnIndex="0" DataField="ParameterID" DataSourceID="SqlDataSource4"
                                                HeaderText="Parameter" ListTextField="ParameterName" ListValueField="ID" UniqueName="ParameterID">
                                                <ItemStyle Width="30%" HorizontalAlign="Left" />
                                            </radG:GridDropDownColumn>
                                            <radG:GridBoundColumn EditFormColumnIndex="1" DataField="ParameterVar" UniqueName="ParameterVar"
                                                SortExpression="ParameterVar" HeaderText="Parameter Remarks">
                                                <ItemStyle Width="65%" HorizontalAlign="Left" />
                                            </radG:GridBoundColumn>
                                            <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                                <ItemStyle Width="20px" />
                                            </radG:GridEditCommandColumn>
                                            <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                                ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete Item"
                                                UniqueName="DeleteColumn">
                                                <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton" />
                                            </radG:GridButtonColumn>
                                        </Columns>
                                        <CommandItemTemplate>
                                            <div style="height: 15px; vertical-align: middle;" align="left">
                                                <asp:LinkButton ID="btnAddParameter" Font-Size="11px" Text="Add Parameter" runat="server"
                                                    CommandName="InitInsert"></asp:LinkButton>
                                            </div>
                                        </CommandItemTemplate>
                                        <EditFormSettings ColumnNumber="2">
                                            <FormTableItemStyle Wrap="False"></FormTableItemStyle>
                                            <FormCaptionStyle CssClass="EditFormHeader"></FormCaptionStyle>
                                            <FormMainTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="0"
                                                BackColor="White" Width="100%" />
                                            <FormTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="0"
                                                Height="30px" BackColor="White" />
                                            <FormTableAlternatingItemStyle BorderColor="blue" BorderWidth="0" Wrap="False"></FormTableAlternatingItemStyle>
                                            <EditColumn ButtonType="ImageButton" InsertText="Add New Parameter" UpdateText="Update"
                                                UniqueName="edtColumnPar" CancelText="Cancel Edit">
                                            </EditColumn>
                                            <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                        </EditFormSettings>
                                        <CommandItemSettings AddNewRecordText="Add New Parameter" />
                                    </radG:GridTableView>
                                </DetailTables>
                                <Columns>
                                    <radG:GridTemplateColumn UniqueName="TemplateColumn">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10px" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="IDParent" DataType="System.Int32"
                                        UniqueName="IDParent" Visible="true" SortExpression="IDParent" HeaderText="IDParent">
                                    </radG:GridBoundColumn>
                                    <radG:GridDropDownColumn EditFormColumnIndex="0" DataField="UOM" DataSourceID="SqlDataSource2"
                                        HeaderText="UOM" ListTextField="UnitName" ListValueField="ID" UniqueName="GridDropDownColumn">
                                        <ItemStyle Width="10%" HorizontalAlign="Left" />
                                    </radG:GridDropDownColumn>
                                    <radG:GridDropDownColumn EditFormColumnIndex="1" DataField="ItemType" DataSourceID="SqlDataSource5"
                                        HeaderText="Inventory Type" ListTextField="TypeName" ListValueField="ID" UniqueName="GrdItemTypeCol">
                                        <ItemStyle Width="20%" HorizontalAlign="Left" />
                                    </radG:GridDropDownColumn>
                                    <radG:GridDropDownColumn EditFormColumnIndex="2" DataField="ItemSubCatID" DataSourceID="SqlDataSource6"
                                        HeaderText="Item Sub Category" ListTextField="ItemSubCategoryName" ListValueField="ID"
                                        UniqueName="GrdItemSubCategoryNameCol">
                                        <ItemStyle Width="20%" HorizontalAlign="Left" />
                                    </radG:GridDropDownColumn>
                                    <radG:GridBoundColumn EditFormColumnIndex="0" DataField="ItemID" UniqueName="ItemID"
                                        SortExpression="ItemID" HeaderText="Item Code">
                                        <ItemStyle Width="10%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn EditFormColumnIndex="1" DataField="ItemName" UniqueName="ItemName"
                                        SortExpression="ItemName" HeaderText="Item Name">
                                        <ItemStyle Width="35%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridTemplateColumn EditFormColumnIndex="2">
                                        <ItemTemplate>
                                            &nbsp;
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            &nbsp;</EditItemTemplate>
                                    </radG:GridTemplateColumn>
                                    <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                        <ItemStyle Width="50px" />
                                    </radG:GridEditCommandColumn>
                                    <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                        ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete Parameter"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle Width="50px" HorizontalAlign="Center" CssClass="MyImageButton" />
                                    </radG:GridButtonColumn>
                                </Columns>
                                <EditFormSettings ColumnNumber="3">
                                    <FormTableItemStyle HorizontalAlign="left" Wrap="False"></FormTableItemStyle>
                                    <FormCaptionStyle HorizontalAlign="left" CssClass="EditFormHeader"></FormCaptionStyle>
                                    <FormMainTableStyle HorizontalAlign="left" BorderColor="black" BorderWidth="0" CellSpacing="0"
                                        CellPadding="3" BackColor="White" Width="100%" />
                                    <FormTableStyle HorizontalAlign="left" BorderColor="black" BorderWidth="0" CellSpacing="0"
                                        CellPadding="2" Height="50px" BackColor="White" />
                                    <FormTableAlternatingItemStyle HorizontalAlign="left" BorderColor="blue" BorderWidth="0"
                                        Wrap="False"></FormTableAlternatingItemStyle>
                                    <EditColumn ButtonType="ImageButton" InsertText="Add New Item" UpdateText="Update"
                                        UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                    </EditColumn>
                                    <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                </EditFormSettings>
                                <CommandItemSettings AddNewRecordText="Add New Item" />
                            </MasterTableView>
                            <ClientSettings>
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                <ClientEvents OnRowDblClick="RowDblClick" OnCommand="Validations" />
                            </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="Select [ID], UnitName From Unit WHERE [company_id] = @company_id Or [company_id]=-1">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" SelectCommand="Select * From(Select 2 ID, 'Inventory' TypeName Union Select 1 ID, 'Non Inventory' TypeName) D">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" SelectCommand="Select ISC.ID ID, (ISC.ItemSubCategoryID+'-'+ItemSubCategoryName) ItemSubCategoryName from ItemSubCategory ISC Inner Join ItemCategory IC On ISC.Parent_ItemCategoryID = IC.ID Where IC.Company_ID= @company_id">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommand="Select [ID], ParameterName From Parameter WHERE [company_id] = @company_id Or [company_id]=-1">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [Item] (UOM, ItemID, ItemName, Company_ID, ItemType, ItemSubCatID) VALUES (@UOM, @ItemID, @ItemName, @Company_ID, @ItemType, @ItemSubCatID)"
                SelectCommand="Select * From (Select U.ID UOM, I.ID IDParent, I.ItemID, I.ItemName, I.Company_ID , I.ItemType,I.ItemSubCatID  From Item I Inner Join Unit U  On I.UOM = U.ID) D Where D.Company_ID=@company_id Or D.Company_ID=-1"
                UpdateCommand="UPDATE [Item] SET [ItemID] = @ItemID, UOM = @UOM, ItemName=@ItemName, ItemType=@ItemType,ItemSubCatID=@ItemSubCatID  WHERE [id] = @IDParent">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ItemID" Type="String" />
                    <asp:Parameter Name="UOM" Type="Int32" />
                    <asp:Parameter Name="ItemName" Type="String" />
                    <asp:Parameter Name="IDParent" Type="Int32" />
                    <asp:Parameter Name="ItemType" Type="Int32" />
                    <asp:Parameter Name="ItemSubCatID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ItemID" Type="String" />
                    <asp:Parameter Name="UOM" Type="Int32" />
                    <asp:Parameter Name="ItemName" Type="String" />
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    <asp:Parameter Name="ItemType" Type="Int32" />
                    <asp:Parameter Name="ItemSubCatID" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="Select ID, ItemID IDChild, ParameterID, ParameterVar From ItemParameter Where ItemID=@ID"
                UpdateCommand="Update ItemParameter Set ParameterID=@ParameterID, ParameterVar=@ParameterVar Where ID=@ID">
                <UpdateParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="ParameterID" Type="Int32" />
                    <asp:Parameter Name="ParameterVar" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
