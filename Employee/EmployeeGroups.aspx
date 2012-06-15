<%@ Page Language="C#" AutoEventWireup="true" Codebehind="EmployeeGroups.aspx.cs"
    Inherits="SMEPayroll.Employee_Groups" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
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
    <style type="text/css">   
    html, body, form   
    {   
       height: 100%;   
       margin: 0px;   
       padding: 0px;  
       overflow: hidden;
    }   



    </style>
</head>
<body style="margin-left: auto; margin: 0px; height: 100%; overflow: hidden;">
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

        </radG:RadCodeBlock>
          <!-- ToolBar -->
          <radG:RadCodeBlock ID="RadCodeBlock2" runat="server">

            <script type="text/javascript">
                function getOuterHTML(obj) {
                    if (typeof (obj.outerHTML) == "undefined") {
                        var divWrapper = document.createElement("div");
                        var copyOb = obj.cloneNode(true);
                        divWrapper.appendChild(copyOb);
                        return divWrapper.innerHTML
                    }
                    else
                        return obj.outerHTML;
                }

                function PrintRadGrid(sender, args) {
                   if (args.get_item().get_text() == 'Print')
                     {
                        
                        var previewWnd = window.open('about:blank', '', '', false);
                        var sh = '<%= ClientScript.GetWebResourceUrl(RadGrid1.GetType(),String.Format("Telerik.Web.UI.Skins.{0}.Grid.{0}.css",RadGrid1.Skin)) %>';
                        var shBase = '<%= ClientScript.GetWebResourceUrl(RadGrid1.GetType(),"Telerik.Web.UI.Skins.Grid.css") %>';
                        var styleStr = "<html><head><link href = '" + sh + "' rel='stylesheet' type='text/css'></link>";
                        styleStr += "<link href = '" + shBase + "' rel='stylesheet' type='text/css'></link></head>";
                        var htmlcontent = styleStr + "<body>" + getOuterHTML($find('<%= RadGrid1.ClientID %>').get_element()) + "</body></html>";
                        previewWnd.document.open();
                        previewWnd.document.write(htmlcontent);
                        previewWnd.document.close();
                        previewWnd.print();
                        previewWnd.close();
                    }
                }

            </script>

            <script type="text/javascript">
             window.onload = Resize;
             function Resize()
              {
                //alert(screen.height);
                if( screen.height > 768)
                {
                    document.getElementById('<%= RadGrid1.ClientID %>').style.height="90.7%";
                }
                else
                {
                    document.getElementById('<%= RadGrid1.ClientID %>').style.height="85.5%";
                }
              }
            
            </script>

         </radG:RadCodeBlock>
         <!-- ToolBar End -->
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <!------------------------------ start ---------------------------------->
        <telerik:RadSplitter ID="RadSplitter1" Width="100%" Height="100%" runat="server"
            Orientation="Horizontal" BorderSize="0" BorderStyle="None" PanesBorderSize="0"
             BorderWidth="0px">
            <telerik:RadPane ID="Radpane1" runat="server" Scrolling="none" Height="32px" Width="100%"
                MaxHeight="100">
                <telerik:RadSplitter ID="Radsplitter11" runat="server">
                    <telerik:RadPane ID="Radpane111" runat="server" Scrolling="none">
                        <!-- top -->
                        <table cellpadding="0" cellspacing="0" width="100%" border="0">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                        <tr>
                                            <td background="../frames/images/toolbar/backs.jpg" height="31.5px">
                                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Employee Group Management</b></font>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <!-- top end -->
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadPane>
            <telerik:RadPane ID="gridPane2" runat="server" Width="100%" Height="100%" Scrolling="None"
                BorderWidth="0px" >
                
                <radG:RadToolBar ID="tbRecord" runat="server" Width="100%" Skin="Office2007" UseFadeEffect="True"  Height="30px"
                     OnButtonClick="tbRecord_ButtonClick" OnClientButtonClicking="PrintRadGrid" BorderWidth="0px" >
                    <Items>
                        <radG:RadToolBarButton runat="server" CommandName="Print" ImageUrl="../Frames/Images/GRIDTOOLBAR/printer-s.png"
                            Text="Print" ToolTip="Print">
                        </radG:RadToolBarButton>
                        <radG:RadToolBarButton IsSeparator="true">
                        </radG:RadToolBarButton>
                        <radG:RadToolBarButton runat="server" Text="">
                            <ItemTemplate>
                                <div>
                                    <table cellpadding="0" cellspacing="0" border="0" >
                                        <tr>
                                            <td class="bodytxt" valign="middle" style="height:30px">
                                                &nbsp;Export To:</td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </radG:RadToolBarButton>
                        <radG:RadToolBarButton runat="server" CommandName="Excel" ImageUrl="../Frames/Images/GRIDTOOLBAR/excel-s.png"
                            Text="Excel" ToolTip="Excel">
                        </radG:RadToolBarButton>
                        <radG:RadToolBarButton runat="server" CommandName="Word" ImageUrl="../Frames/Images/GRIDTOOLBAR/word-s.png"
                            Text="Word" ToolTip="Word">
                        </radG:RadToolBarButton>
                        <%--       <radG:RadToolBarButton runat="server" CommandName="PDF" ImageUrl="../Frames/Images/GRIDTOOLBAR/pdf-s.png" Text="PDF"    ToolTip="PDF"></radG:RadToolBarButton>--%>
                        <radG:RadToolBarButton IsSeparator="true">
                        </radG:RadToolBarButton>
                        <radG:RadToolBarButton runat="server" CommandName="Refresh" ImageUrl="../Frames/Images/GRIDTOOLBAR/reset-s.png"
                            Text="UnGroup" ToolTip="UnGroup">
                        </radG:RadToolBarButton>
                <%--        <radG:RadToolBarButton runat="server" CommandName="Refresh" ImageUrl="../Frames/Images/GRIDTOOLBAR/reset-s.png"
                            Text="Clear Sorting" ToolTip="Clear Sorting">
                        </radG:RadToolBarButton>--%>
                        <radG:RadToolBarButton IsSeparator="true">
                        </radG:RadToolBarButton>
                        <radG:RadToolBarButton runat="server" Text="Count">
                            <ItemTemplate>
                                <div>
                                    <table cellpadding="0" cellspacing="0" border="0" style="height:30px">
                                        <tr>
                                            <td valign="middle">
                                                <img src="../Frames/Images/GRIDTOOLBAR/count-s.png" border="0" alt="Count" /></td>
                                            <td valign="middle">
                                                <asp:Label ID="Label_count" runat="server" Text="" class="bodytxt"></asp:Label>&nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </radG:RadToolBarButton>
                        <radG:RadToolBarButton IsSeparator="true">
                        </radG:RadToolBarButton>
                        <radG:RadToolBarButton runat="server" ImageUrl="../Frames/Images/GRIDTOOLBAR/reset-s.png"
                            Text="Reset to Default" ToolTip="Reset to Default">
                        </radG:RadToolBarButton>
                        <radG:RadToolBarButton runat="server" ImageUrl="../Frames/Images/GRIDTOOLBAR/save-s.png"
                            Text="Save Grid Changes" ToolTip="Save Grid Changes">
                        </radG:RadToolBarButton>
                        <%--<radG:RadToolBarButton runat="server" CommandName="Graph" ImageUrl="../Frames/Images/GRIDTOOLBAR/graph-s.png" Text="Graph" ToolTip="Graph" Enabled="false"></radG:RadToolBarButton>--%>
                    </Items>
                </radG:RadToolBar>
                
                <radG:RadGrid ID="RadGrid1" AllowFilteringByColumn="true" 
                        OnItemDataBound="RadGrid1_ItemDataBound"
                        OnDeleteCommand="RadGrid1_Delete" runat="server" 
                        DataSourceID="SqlDataSource1"
                        Skin="Outlook" 
                        Width="100%"
                        PageSize="50"
                        AllowPaging="true"
                        ItemStyle-Wrap="false"
                        AlternatingItemStyle-Wrap="false"
                        PagerStyle-AlwaysVisible="True" 
                        GridLines="Both" 
                        AllowSorting="false" 
                        OnItemCreated="RadGrid1_ItemCreated"
                        OnGridExporting="RadGrid1_GridExporting"
                        Height="100%"
                        Font-Size="11"
                        Font-Names="Tahoma"
                        EnableHeaderContextMenu="true"
                        >
                        <ExportSettings HideStructureColumns="true"  />
                        <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Bottom" DataKeyNames="id"
                            DataSourceID="SqlDataSource1" AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
                            TableLayout="Auto" PagerStyle-Mode="Advanced">
                            <FilterItemStyle HorizontalAlign="left" />
                            <HeaderStyle ForeColor="Navy" />
                            <ItemStyle BackColor="White" Height="25px" />
                            <AlternatingItemStyle BackColor="#E5E5E5" Height="25px" />
                            <Columns>
                                <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" ImageUrl="../frames/images/EMPLOYEE/Grid-employeegrp.png"
                                            runat="Server" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="50px"></HeaderStyle>
                                </radG:GridTemplateColumn>
                                <radG:GridBoundColumn DataField="id" AllowFiltering="false" Visible="false" DataType="System.Int32"
                                    HeaderText="ID" ReadOnly="True" SortExpression="id" UniqueName="id">
                                    <HeaderStyle Width="90px" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="EmpGroupName" AutoPostBackOnFilter="true" CurrentFilterFunction="contains"
                                    HeaderText="Employee Group Name" SortExpression="EmpGroupName" UniqueName="EmpGroupName" ShowFilterIcon="false">
                                </radG:GridBoundColumn>
                                <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                    <HeaderStyle Width="50px" />
                                </radG:GridEditCommandColumn>
                                <radG:GridButtonColumn ConfirmText="Delete this record?" ButtonType="ImageButton"
                                    ImageUrl="../frames/images/toolbar/Delete.gif" CommandName="Delete" Text="Delete"
                                    UniqueName="DeleteColumn">
                                    <HeaderStyle Width="50px" />
                                </radG:GridButtonColumn>
                            </Columns>
                            <ExpandCollapseColumn Visible="False">
                                <HeaderStyle Width="19px" />
                            </ExpandCollapseColumn>
                            <RowIndicatorColumn Visible="False">
                                <HeaderStyle Width="20px" />
                            </RowIndicatorColumn>
                            <CommandItemSettings AddNewRecordText="Add New Employee Group" />
                        </MasterTableView>
                        <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                             <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True"   />
                        </ClientSettings>
                    </radG:RadGrid>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" DeleteCommand="DELETE FROM [emp_group] WHERE [id] = @id"
                    InsertCommandType="StoredProcedure" InsertCommand="sp_empgroup_add" SelectCommand="SELECT [id], [EmpGroupName], [Company_id] FROM [emp_group] WHERE ([Company_id] = @Company_id) ORDER BY [id]"
                    UpdateCommand="UPDATE [emp_group] SET [EmpGroupName] = @EmpGroupName, [Company_id] = @Company_id WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EmpGroupName" Type="String" />
                        <asp:SessionParameter Name="Company_id" SessionField="Compid" Type="Int32" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EmpGroupName" Type="String" />
                        <asp:SessionParameter Name="Company_id" SessionField="Compid" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="Company_id" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    
            </telerik:RadPane>
        </telerik:RadSplitter>
        <!-------------------- end -------------------------------------->
       
        
    </form>
</body>
</html>
