<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ManageStore.aspx.cs" Inherits="SMEPayroll.Management.ManageStore" %>
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
            var StoreID="";            
            var changedFlage="false";  
            var StoreName="";            
            var changedFlage1="false";                    
        
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
                    if(StoreID=="" && changedFlage=="false")
                    {
                        var itemIndex = args.get_commandArgument();                            
                        var row = sender.get_masterTableView().get_dataItems()[itemIndex]; //to access the row                                
                        if(row!=null)
                        {
                            cellvalue = row._element.cells[2].innerHTML; // to access the cell value                                    
                            StoreID=cellvalue;  
                            //alert(StoreID);                          
                        }
                    }  
                     
                    if(StoreName=="" && changedFlage1=="false")
                    {
                    
                    
                        var itemIndex = args.get_commandArgument();                            
                        var row = sender.get_masterTableView().get_dataItems()[itemIndex]; //to access the row                                
                        if(row!=null)
                        {
                            cellvalue = row._element.cells[3].innerHTML; // to access the cell value                                    
                            StoreName=cellvalue; 
                            //alert(StoreName);
                        }
                    }                
                    if (result == 'Update' ||result == 'PerformInsert')
                    {
                        var sMsg="";
                        var message ="";                                    
                        message=MandatoryData(trim(StoreID),"StoreID");
                        if(message!="")
                            sMsg+=message+"\n";
                            
                        message=MandatoryData(trim(StoreName),"StoreName");
                        if(message!="")
                            sMsg+=message+"\n";
                            
                        if(sMsg!="")
                        {
                            args.set_cancel(true);
                            alert(sMsg);
                        }
                    } 
            }
            
            function OnFocusLost_StoreID(val)
            {
                var Object = document.getElementById(val);                                
                StoreID =GetDataFromHtml(Object);
                changedFlage="true";
            }  
            
            function OnFocusLost_StoreName(val)
            {
                var Object = document.getElementById(val);                                
                StoreName =GetDataFromHtml(Object);
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Store</b></font>
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
                            OnItemCommand="RadGrid1_ItemCommand">
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
                                    <radG:GridBoundColumn EditFormColumnIndex="0" DataField="StoreID" UniqueName="StoreID"
                                        SortExpression="StoreID" HeaderText="Store ID">
                                        <ItemStyle Width="30%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn EditFormColumnIndex="1" DataField="StoreName" UniqueName="StoreName"
                                        SortExpression="StoreName" HeaderText="Store Name">
                                        <ItemStyle Width="40%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn EditFormColumnIndex="2" DataField="Location" UniqueName="Location"
                                        SortExpression="Location" HeaderText="Location">
                                        <ItemStyle Width="40%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn EditFormColumnIndex="3" DataField="Address1" UniqueName="Address1"
                                        SortExpression="Address1" HeaderText="Address-1">
                                        <ItemStyle Width="40%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn EditFormColumnIndex="0" DataField="Address2" UniqueName="Address2"
                                        SortExpression="Address2" HeaderText="Address-2">
                                        <ItemStyle Width="40%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn EditFormColumnIndex="1" DataField="City" UniqueName="City"
                                        SortExpression="City" HeaderText="City">
                                        <ItemStyle Width="40%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridDropDownColumn EditFormColumnIndex="2" DataField="Country" DataSourceID="SqlDataSource2"
                                        HeaderText="Country" ListTextField="Country" ListValueField="ID" UniqueName="GridDropDownColumn">
                                        <ItemStyle Width="30%" HorizontalAlign="Left" />
                                    </radG:GridDropDownColumn>
                                    <radG:GridTemplateColumn EditFormColumnIndex="3" Display="false" AllowFiltering="False"
                                        UniqueName="TC">
                                        <ItemTemplate>
                                            &nbsp;
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="lblSt" runat="server" Text="&nbsp;">&nbsp;</asp:Label></EditItemTemplate>
                                    </radG:GridTemplateColumn>
                                    <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                        <ItemStyle Width="50px" />
                                    </radG:GridEditCommandColumn>
                                    <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                        ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton" />
                                    </radG:GridButtonColumn>
                                </Columns>
                                <EditFormSettings ColumnNumber="4">
                                    <FormTableItemStyle HorizontalAlign="left" Wrap="False" BorderWidth="0"></FormTableItemStyle>
                                    <FormCaptionStyle HorizontalAlign="left" CssClass="EditFormHeader"></FormCaptionStyle>
                                    <FormMainTableStyle HorizontalAlign="left" BorderColor="black" BorderWidth="0" CellSpacing="0"
                                        CellPadding="3" BackColor="White" Width="100%" />
                                    <FormTableStyle HorizontalAlign="left" BorderColor="black" BorderWidth="0" CellSpacing="0"
                                        CellPadding="2" Height="60px" BackColor="White" />
                                    <FormTableAlternatingItemStyle HorizontalAlign="left" BorderColor="blue" BorderWidth="0"
                                        Wrap="False"></FormTableAlternatingItemStyle>
                                    <EditColumn ButtonType="ImageButton" InsertText="Add New Store" UpdateText="Update"
                                        UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                    </EditColumn>
                                    <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                </EditFormSettings>
                                <CommandItemSettings AddNewRecordText="Add New Store" />
                            </MasterTableView>
                            <ClientSettings>
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                <ClientEvents OnRowDblClick="RowDblClick" OnCommand="Validations" />
                            </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" InsertCommand="INSERT INTO [Store] (Company_ID, StoreID, StoreName, Location, Address1, Address2, PostalCode, City, Country) VALUES (@Company_ID, @StoreID, @StoreName, @Location, @Address1, @Address2, @PostalCode, @City, @Country)"
                SelectCommand="Select  S.ID, StoreID, StoreName, Location, Address1, Address2, PostalCode, City, C.Country,C.ID From Store S Inner Join Country C On S.Country=C.ID Where Company_ID=@company_id"
                UpdateCommand="UPDATE [Store] SET StoreID=@StoreID, StoreName=@StoreName, Location=@Location, Address1=@Address1, Address2=@Address2, PostalCode=@PostalCode, City=@City, Country=@Country WHERE [id] = @id">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StoreID" Type="String" />
                    <asp:Parameter Name="StoreName" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="Address1" Type="String" />
                    <asp:Parameter Name="Address2" Type="String" />
                    <asp:Parameter Name="PostalCode" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Country" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="StoreID" Type="String" />
                    <asp:Parameter Name="StoreName" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="Address1" Type="String" />
                    <asp:Parameter Name="Address2" Type="String" />
                    <asp:Parameter Name="PostalCode" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Country" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="Select [id], Country From Country Order By Country">
                <SelectParameters>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
