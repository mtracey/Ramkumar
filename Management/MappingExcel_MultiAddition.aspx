<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MappingExcel_MultiAddition.aspx.cs" Inherits="SMEPayroll.Management.MappingExcel_MultiAddition" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
        <table cellpadding="0"  cellspacing="0"  width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%"  border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>MultiAddition Mapping </b></font>
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
    <div>
        <table cellpadding="0" cellspacing="0" border="0" width="50%" align="center">
            <tr>
              <td>
                    <radG:RadGrid ID="RadGrid1" AllowPaging="true" AllowFilteringByColumn="true" 
                            PageSize="100"  runat="server" OnNeedDataSource="RadGrid1_NeedDataSource"
                            GridLines="None" Skin="Outlook" Width="93%" PagerStyle-Mode="NextPrevAndNumeric" OnUpdateCommand="RadGrid1_UpdateCommand"  >
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Additions_id,Aid"   >
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                <Columns>
                                    <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                        </ItemTemplate>
                                    </radG:GridTemplateColumn>
                                    <radG:GridBoundColumn DataField="MapVariable" HeaderText="MapVariable" AllowFiltering="false" SortExpression="MapVariable"
                                        UniqueName="MapVariable">
                                        <ItemStyle Width="150px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="AdditionType" CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="True"
                                        HeaderText="AdditionType" SortExpression="AdditionType" UniqueName="AdditionType">
                                        <ItemStyle Width="500px" />
                                    </radG:GridBoundColumn>
                                
                                    <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                        <ItemStyle Width="40px" />
                                    </radG:GridEditCommandColumn>
                                </Columns>
                                <ExpandCollapseColumn Visible="False">
                                    <HeaderStyle Width="19px" />
                                </ExpandCollapseColumn>
                                <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <EditFormSettings UserControlName="MultiAdditionMap_edit.ascx" EditFormType="WebUserControl">
                                </EditFormSettings>
                            </MasterTableView>
                            <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                            </ClientSettings>
                        </radG:RadGrid>
              </td>
            </tr>
        </table>
    </div>
    </form>
    
</body>
</html>
