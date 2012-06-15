<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeAccomadationInfo.aspx.cs" Inherits="SMEPayroll.Management.EmployeeAccomadationInfo" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Import Namespace="SMEPayroll" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
    <link rel="stylesheet" href="../style/MenuStyle.css" type="text/css" />
</head>
<body onload="ShowMsg();" style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="ScriptManager" runat="server">
        </radG:RadScriptManager>
           <uc1:TopRightControl ID="TopRightControl" runat="server" />
         <table cellpadding="0"  cellspacing="0"  width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%"  border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Employment Accomadation Management Form</b></font>
                            </td>
                        </tr>
                       
                    </table>
             
        <!-- content start -->
        <radG:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <ajaxsettings>
                <radG:AjaxSetting AjaxControlID="RadGrid2">
                    <UpdatedControls>
                        <radG:AjaxUpdatedControl ControlID="RadGrid2" />
                    </UpdatedControls>
                </radG:AjaxSetting>
            </ajaxsettings>
        </radG:RadAjaxManager>
        <radG:RadCodeBlock ID="RadCodeBlock4" runat="server">

            <script language="javascript" type="text/javascript">
            
                function ShowMsg()
                {
                    var sMsg = '<%=sMsg%>';
                    if (sMsg != '')
                        alert(sMsg);
                }
            </script>

        </radG:RadCodeBlock>
        <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td style="width: 100%">
                    <radG:RadGrid ID="RadGrid1" runat="server" GridLines="None" AutoGenerateColumns="False"
                        Skin="Outlook" Width="98%" AllowPaging="True" PageSize="20" AllowFilteringByColumn="True"
                        AllowSorting="true" OnPreRender="RadGrid1_PreRender" OnItemDataBound="RadGrid1_ItemDataBound1"
                        OnNeedDataSource="RadGrid1_NeedDataSource" OnItemCommand="RadGrid1_ItemDataBound"
                        OnDeleteCommand="RadGrid1_DeleteCommand" OnPageIndexChanged="RadGrid1_PageIndexChanged"
                       
                        >
                        <MasterTableView  datakeynames="emp_code">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px"  />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                            
                            <Columns>
                                <radG:GridBoundColumn ShowFilterIcon="False" UniqueName="EmpCode" HeaderImageUrl="../frames/images/EMPLOYEE/Grid- employee.png"
                                    HeaderText="Emp Code" CurrentFilterFunction="StartsWith" DataField="emp_code"
                                    Display="false">
                                </radG:GridBoundColumn>
                                <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                    <ItemTemplate>
                                        <asp:Image ID="Image2" ImageUrl="../frames/images/EMPLOYEE/Grid- employee.png" runat="Server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="2px" />
                                </radG:GridTemplateColumn>
                                <radG:GridBoundColumn ShowFilterIcon="False"  UniqueName="empname" HeaderText="Employee Name"
                                    DataField="empname" CurrentFilterFunction="contains" AutoPostBackOnFilter="true">
                                    <HeaderStyle HorizontalAlign="left" />
                                    <ItemStyle Width="190px" />
                                </radG:GridBoundColumn>
                                
                                <radG:GridBoundColumn ShowFilterIcon="False"  UniqueName="time_card_no" HeaderText="Time Card ID"
                                    DataField="time_card_no" CurrentFilterFunction="contains" AutoPostBackOnFilter="true">
                                    <HeaderStyle HorizontalAlign="left" />
                                    <ItemStyle Width="50px" />
                                </radG:GridBoundColumn>
                                
                                <radG:GridBoundColumn ShowFilterIcon="False" UniqueName="PassType" HeaderText="Pass Type"
                                    DataField="PassType" CurrentFilterFunction="contains" AutoPostBackOnFilter="true">
                                    <HeaderStyle HorizontalAlign="left" />
                                    <ItemStyle Width="5px" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn ShowFilterIcon="False" UniqueName="ic_pp_number" HeaderText="IC/FIN Number"
                                    DataField="ic_pp_number" CurrentFilterFunction="contains" AutoPostBackOnFilter="true">
                                    <HeaderStyle HorizontalAlign="left" />
                                    <ItemStyle Width="30px" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn ShowFilterIcon="False" UniqueName="ID" HeaderText="ID" Visible="false" CurrentFilterFunction="contains"
                                    AutoPostBackOnFilter="true" DataField="time_card_no">
                                    <ItemStyle Width="10px" />
                                    <HeaderStyle HorizontalAlign="left" />
                                </radG:GridBoundColumn>
                               <radG:GridBoundColumn ShowFilterIcon="False" UniqueName="AccomadationCode" Visible=false  HeaderText="AccomadationCode" CurrentFilterFunction="contains"
                                    AutoPostBackOnFilter="true" DataField="AccomadationCode">
                                    <ItemStyle Width="8px" />
                                    <HeaderStyle HorizontalAlign="left" />
                                </radG:GridBoundColumn>
                                 <radG:GridBoundColumn ShowFilterIcon="False" UniqueName="AccomadationName" HeaderText="Accomadation Name" CurrentFilterFunction="contains"
                                    AutoPostBackOnFilter="true" DataField="AccomadationName">
                                    <ItemStyle Width="8px" />
                                    <HeaderStyle HorizontalAlign="left" />
                                </radG:GridBoundColumn>
                                 <radG:GridBoundColumn ShowFilterIcon="False" UniqueName="EffectiveCheckInDate" HeaderText="CheckIn Date" CurrentFilterFunction="contains"
                                    AutoPostBackOnFilter="true" DataField="EffectiveCheckInDate">
                                    <ItemStyle Width="10px" />
                                    <HeaderStyle HorizontalAlign="left" />
                                </radG:GridBoundColumn>
                                 <radG:GridBoundColumn ShowFilterIcon="False" UniqueName="EffectiveCheckOutDate" HeaderText="CheckOut Date" CurrentFilterFunction="contains"
                                    AutoPostBackOnFilter="true" DataField="EffectiveCheckOutDate">
                                    <ItemStyle Width="10px" />
                                    <HeaderStyle HorizontalAlign="left" />
                                </radG:GridBoundColumn>
                                  <radG:GridBoundColumn ShowFilterIcon="False" UniqueName="CheckInStatus" HeaderText="Status" CurrentFilterFunction="contains"
                                    AutoPostBackOnFilter="true" DataField="CheckInStatus">
                                    <ItemStyle Width="10px" />
                                    <HeaderStyle HorizontalAlign="left" />
                                </radG:GridBoundColumn>
                                <radG:GridTemplateColumn AllowFiltering="False" UniqueName="editHyperlink">
                                    <ItemTemplate>
                                        <tt class="bodytxt">
                                            <asp:ImageButton ID="btnedit" AlternateText="Edit" ImageUrl="../frames/images/toolbar/edit.gif"
                                                runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </radG:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings enablerowhoverstyle="true" allowcolumnsreorder="true" reordercolumnsonclient="true">
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                        </ClientSettings>
                    </radG:RadGrid>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
