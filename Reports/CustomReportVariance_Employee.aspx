<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomReportVariance_Employee.aspx.cs" Inherits="SMEPayroll.Reports.CustomReportVariance_Employee"  %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />
    <style type="text/css">
    INPUT {
    FONT-SIZE: 8pt;	
    FONT-FAMILY: Tahoma;
          }
        .bigModule
        {
            width: 750px;
            background: url(qsfModuleTop.jpg) no-repeat;
            margin-bottom: 15px;
        }
        .bigModuleBottom
        {
            background: url(qsfModuleBottom.gif) no-repeat bottom;
            color: #252f34;
            padding: 23px 17px;
            line-height: 16px;
            font-size: 12px;
        }
        .trstandtop
        {
	        font-family: Tahoma;
	        font-size: 11px;
            height: 20px; 
            vertical-align:top;
        }
        .trstandbottom
        {
	        font-family: Tahoma;
	        font-size: 11px;
            height: 20px; 
            
            COLOR: gray;
            vertical-align:bottom;
            valign:bottom;
        }
       
        .tdstand
        {
            height:30px;
            vertical-align:text-bottom;
            vertical-align:bottom;
            border-bottom-width:1px;
            border-bottom-color:Silver;
            border-bottom-style:inset;
	        font-family: Tahoma;
	        font-size: 12px;
	        font-weight:bold;
        }
        .tbl
        {
            cellpadding:0;
            cellspacing:0;
            border:0;
            background-color: White; 
            width: 100%; 
            height: 100%; 
            background-image: url(../Frames/Images/TOOLBAR/qsfModuleTop2.jpg);
            background-repeat: no-repeat;
        }
        .multiPage
        {
            float:left;
            border:1px solid #94A7B5;
            background-color:#F0F1EB;
            padding:4px;
            padding-left:0;
            width:85%;
            height:550px%;
            margin-left:-1px;                
        }
        
       <%-- .multiPage div
        {
            border:1px solid #94A7B5;
            border-left:0;
            background-color:#ECE9D8;
        }--%>
        
        .multiPage img
        {
            cursor:no-drop;
        }
    
    </style>

</head>
<body style="margin-left: auto">
    <form id="employeeform" runat="server" method="post">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" Skin="Outlook" DecoratedControls="all" />
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Employee Variance</b></font>
                            </td>
                        </tr>
                       <tr bgcolor="#E5E5E5">
                         
                            <td valign="middle" align="left" style="background-image: url(images/Reports/exporttowordl.jpg)">
                               <asp:ImageButton ID="btnExportWord" AlternateText="Export To Word" OnClick="btnExportWord1_click"
                                    runat="server" ImageUrl="~/frames/images/Reports/exporttoWordl.jpg" />
                                <asp:ImageButton ID="btnExportExcel" AlternateText="Export To Excel" OnClick="btnExportExcel1_click"
                                    runat="server" ImageUrl="~/frames/images/Reports/exporttoexcel.jpg" />
                                <asp:ImageButton ID="btnExportPdf" AlternateText="Export To PDF" OnClick="btnExportPdf1_click"
                                    runat="server" ImageUrl="~/frames/images/Reports/exporttopdf.jpg" />
                            </td>
                            <td align="right" style="height: 25px">
                                <input id="Button1" type="button" onclick="history.go(-1)" value="Close" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <%--<radG:RadGrid ID="Variance_Employee" runat="server" GridLines="Both" 
                                    Skin="Outlook"  AutoGenerateColumns="True"    ClientSettings-AllowDragToGroup="true"    ShowGroupPanel="true" 
                                    OnDetailTableDataBind="Variance_Employee_DetailTableDataBind" >
                                    <MasterTableView      AllowAutomaticUpdates="True" AllowSorting="FALSE" AllowFilteringByColumn="false"
                                        PagerStyle-AlwaysVisible="true" ShowGroupFooter="true"  ShowFooter="true" TableLayout="auto" Width="99%" 
                                         DataKeyNames="Description"  >
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" />
                                        <AlternatingItemStyle BackColor="#E5E5E5"/>
                                        <Columns >
                                        </Columns>
                                        
                                         <DetailTables>
                                         <radG:GridTableView Name="Employee"  AutoGenerateColumns="false"
                                                    >
                                                    <Columns>
                                                        <radG:GridBoundColumn DataField="EMP_NAME"  HeaderText="Emp Name"
                                                            ReadOnly="True" SortExpression="EMP_NAME" UniqueName="EMP_NAME">
                                                        </radG:GridBoundColumn>
                                                    </Columns>
                                                </radG:GridTableView>
                                        </DetailTables>

                                        
                                    </MasterTableView>
                                    <ClientSettings Resizing-ClipCellContentOnResize="true" >
                                    </ClientSettings>
                                    <ExportSettings>
                                        <Pdf PageHeight="210mm" />
                                    </ExportSettings>
                                    <GroupingSettings ShowUnGroupButton="false" />
                                </radG:RadGrid>
                                
                                 <asp:SqlDataSource ID="SqlDataSource2" runat="server"  >  </asp:SqlDataSource>--%>
                                 
                                
                                 <radG:RadGrid ID="Variance_Join" runat="server" GridLines="Both" 
                                    Skin="Outlook"  AutoGenerateColumns="false"   >
                                    <MasterTableView      AllowAutomaticUpdates="True" AllowSorting="FALSE" AllowFilteringByColumn="false"
                                        PagerStyle-AlwaysVisible="true" ShowGroupFooter="true"  ShowFooter="true" TableLayout="auto" Width="99%"   >
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" />
                                        <AlternatingItemStyle BackColor="#E5E5E5"/>
                                        <Columns >
                                                <radG:GridBoundColumn DataField="EMP_NAME" HeaderText="Employee Joined During this Period" SortExpression="EMP_NAME"
                                                    UniqueName="EMP_NAME" AutoPostBackOnFilter="true" CurrentFilterFunction="contains" ShowFilterIcon="false" HeaderStyle-Width="50%">
                                                </radG:GridBoundColumn>
                                                  <radG:GridBoundColumn DataField="joining_date" HeaderText="Joining Date" SortExpression="joining_date" HeaderStyle-Width="50%"
                                                    UniqueName="joining_date" AutoPostBackOnFilter="true" CurrentFilterFunction="contains" ShowFilterIcon="false" DataType="System.DateTime">
                                                </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>  
                                    <ClientSettings Resizing-ClipCellContentOnResize="true" >
                                    </ClientSettings>
                                    <ExportSettings>
                                        <Pdf PageHeight="210mm" />
                                    </ExportSettings>
                                    <GroupingSettings ShowUnGroupButton="false" />
                                </radG:RadGrid>
                                 
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                
                               <asp:ImageButton ID="ImageButton1" AlternateText="Export To Word" OnClick="btnExportWord_click"
                                    runat="server" ImageUrl="~/frames/images/Reports/exporttoWordl.jpg" />
                                <asp:ImageButton ID="ImageButton2" AlternateText="Export To Excel" OnClick="btnExportExcel_click"
                                    runat="server" ImageUrl="~/frames/images/Reports/exporttoexcel.jpg" />
                                <asp:ImageButton ID="ImageButton3" AlternateText="Export To PDF" OnClick="btnExportPdf_click"
                                    runat="server" ImageUrl="~/frames/images/Reports/exporttopdf.jpg" />
                           
                                <radG:RadGrid ID="Variance_Terminate" runat="server" GridLines="Both" 
                                    Skin="Outlook"  AutoGenerateColumns="false"      >
                                    <MasterTableView      AllowAutomaticUpdates="True" AllowSorting="FALSE" AllowFilteringByColumn="false"
                                        PagerStyle-AlwaysVisible="true" ShowGroupFooter="true"  ShowFooter="true" TableLayout="auto" Width="99%"   >
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" />
                                        <AlternatingItemStyle BackColor="#E5E5E5"/>
                                        <Columns >
                                                <radG:GridBoundColumn DataField="EMP_NAME" HeaderText="Employee Terminated During this Period" SortExpression="EMP_NAME"
                                                    UniqueName="EMP_NAME" AutoPostBackOnFilter="true" CurrentFilterFunction="contains" ShowFilterIcon="false" HeaderStyle-Width="50%">
                                                </radG:GridBoundColumn>
                                                  <radG:GridBoundColumn DataField="Termination_Date" HeaderText="Termination Date" SortExpression="Termination_Date"
                                                    UniqueName="Termination_Date" AutoPostBackOnFilter="true" CurrentFilterFunction="contains" ShowFilterIcon="false" DataType="System.DateTime" HeaderStyle-Width="50%">
                                                </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>  
                                    <ClientSettings Resizing-ClipCellContentOnResize="true" >
                                    </ClientSettings>
                                    <ExportSettings>
                                        <Pdf PageHeight="210mm" />
                                    </ExportSettings>
                                    <GroupingSettings ShowUnGroupButton="false" />
                                </radG:RadGrid> 
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
