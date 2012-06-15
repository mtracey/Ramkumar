<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ApprovePayroll.aspx.cs"
    Inherits="SMEPayroll.Payroll.ApprovePayroll" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Import Namespace="SMEPayroll" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
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
<body  style="margin-left: auto; " >
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
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
                   var myHeight = document.body.clientHeight; 
                   myHeight =myHeight - 130;
                   document.getElementById('<%= RadGrid1.ClientID %>').style.height=myHeight;
//                if( screen.height > 768)
//                {
//                    document.getElementById('<%= RadGrid1.ClientID %>').style.height="86%";
//                }
//                else
//                {
//                    document.getElementById('<%= RadGrid1.ClientID %>').style.height="79%";
//                }
              }
            
            </script>

         </radG:RadCodeBlock>
         <!-- ToolBar End -->
        <!------------------------------ start ---------------------------------->
         <telerik:RadSplitter ID="RadSplitter1" Width="100%" Height="100%" runat="server"
            Orientation="Horizontal" BorderSize="0" BorderStyle="None" PanesBorderSize="0"
             BorderWidth="0px">
            <telerik:RadPane ID="Radpane1" runat="server" Scrolling="none" Height="32px" Width="100%"
                MaxHeight="100">
                <telerik:RadSplitter ID="Radsplitter11" runat="server">
                    <telerik:RadPane ID="Radpane111" runat="server" Scrolling="none" >
                        <!-- top -->
                      <table cellpadding="0" cellspacing="0" width="100%" border="0"  background="../frames/images/toolbar/backs.jpg" Height="32px">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%" border="0" >
                                        <tr>
                                            <td >
                                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Approve Payroll</b></font>
                                            </td>
                                  
                                            <td align="center" >
                                                <tt class="bodytxt" style="color:White;">Year :</tt>
                                        <%--        <asp:DropDownList ID="cmbYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbYear_selectedIndexChanged"
                                                    Style="width: 65px" CssClass="textfields">
                                                    <asp:ListItem Value="2007">2007</asp:ListItem>
                                                    <asp:ListItem Value="2008">2008</asp:ListItem>
                                                    <asp:ListItem Value="2009">2009</asp:ListItem>
                                                    <asp:ListItem Value="2010">2010</asp:ListItem>
                                                    <asp:ListItem Value="2011">2011</asp:ListItem>
                                                    <asp:ListItem Value="2012">2012</asp:ListItem>
                                                    <asp:ListItem Value="2013">2013</asp:ListItem>
                                                    <asp:ListItem Value="2014">2014</asp:ListItem>
                                                    <asp:ListItem Value="2015">2015</asp:ListItem>
                                                </asp:DropDownList>--%>
                                                
                                                   <asp:DropDownList ID="cmbYear" Style="width: 65px" CssClass="textfields" DataTextField="text" DataValueField="id" DataSourceID="xmldtYear" 
                                                           runat="server"  AutoPostBack="true" OnSelectedIndexChanged="cmbYear_selectedIndexChanged">
                                                   </asp:DropDownList>
                                                   <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                                
                                                
                                                &nbsp;&nbsp; <tt class="bodytxt" style="color:White;">Month :</tt>
                                                <asp:DropDownList ID="cmbMonth" runat="server" Style="width: 80px" CssClass="textfields">
                                                    <asp:ListItem Value="1">January</asp:ListItem>
                                                    <asp:ListItem Value="2">February</asp:ListItem>
                                                    <asp:ListItem Value="3">March</asp:ListItem>
                                                    <asp:ListItem Value="4">April</asp:ListItem>
                                                    <asp:ListItem Value="5">May</asp:ListItem>
                                                    <asp:ListItem Value="6">June</asp:ListItem>
                                                    <asp:ListItem Value="7">July</asp:ListItem>
                                                    <asp:ListItem Value="8">August</asp:ListItem>
                                                    <asp:ListItem Value="9">September</asp:ListItem>
                                                    <asp:ListItem Value="10">October</asp:ListItem>
                                                    <asp:ListItem Value="11">November</asp:ListItem>
                                                    <asp:ListItem Value="12">December</asp:ListItem>
                                                </asp:DropDownList>
                                                &nbsp;&nbsp;<tt class="bodytxt" style="color:White;">Dept :</tt>
                                                     <asp:DropDownList Width="100px"  CssClass="textfields"
                                                        ID="deptID" DataTextField="DeptName" DataValueField="ID" DataSourceID="SqlDataSource3"
                                                        runat="server" >
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="select 'ALL' as DeptName,'-1' as ID union SELECT DeptName,ID FROM dbo.DEPARTMENT WHERE COMPANY_ID= @company_id order by id">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                                                    </SelectParameters>
                                                    </asp:SqlDataSource>
                                               &nbsp;<tt><asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid"
                                                    runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                                                </tt>
                                            </td>
                                            <td>
                                                  <input type="button" id="btndetail" runat="server" class="textfields" onclick="showreport(this);"   value="View Pay Report" />
                                            </td>
                                            <td align="center" class="bodytxt" style="color:Red;font-size:small; font-weight:bold;" ><asp:Label ID="lblLoading" runat="server" Text=""></asp:Label></td>
                                      
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <!-- top end -->
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadPane>
            <telerik:RadPane ID="gridPane2" runat="server" Width="100%" Height="100%"   Scrolling="None" BorderWidth="0px">
             <!-- grid -->
             
                
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
                    <radG:RadToolBarButton runat="server" CommandName="Refresh" ImageUrl="../Frames/Images/GRIDTOOLBAR/reset-s.png"
                        Text="Clear Sorting" ToolTip="Clear Sorting">
                    </radG:RadToolBarButton>
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
           <%-- OnNeedDataSource="RadGrid1_NeedDataSource"--%>
            <radG:RadGrid ID="RadGrid1" runat="server"  Skin="Outlook" Width="100%"
            AutoGenerateColumns="False" AllowMultiRowSelection="True" AllowPaging="true"
            PageSize="50" OnPageIndexChanged="RadGrid1_PageIndexChanged" AllowFilteringByColumn="True" EnableHeaderContextMenu="true"
            ItemStyle-Wrap="false"
            AlternatingItemStyle-Wrap="false"
            PagerStyle-AlwaysVisible="True" 
            GridLines="Both" 
            Height="500px"
            Font-Size="11"
            Font-Names="Tahoma"
            OnItemCreated="RadGrid1_ItemCreated"
            OnGridExporting="RadGrid1_GridExporting" 
            AllowSorting="true"  
            
            DataSourceID="SqlDataSource1"
            >
            <MasterTableView DataKeyNames="trx_id,emp_name,emp_id,basic_pay,Netpay,Additions,Deductions,
                            NH_e,OT1_e,OT2_e,DeptName,Time_Card_No"  TableLayout="Auto" PagerStyle-Mode="Advanced" >
                  <FilterItemStyle HorizontalAlign="left" />
                  <HeaderStyle ForeColor="Navy" Height="25px" Wrap="false" />
                  <ItemStyle BackColor="White" Height="25px" />
                  <AlternatingItemStyle BackColor="#E5E5E5" Height="25px" />
                <Columns>
                    <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn" HeaderText="104" HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Image ID="Image2" ImageUrl="../frames/images/EMPLOYEE/Grid- employee.png" runat="Server" />
                        </ItemTemplate>
                        <HeaderStyle Width="50px" />
                    </radG:GridTemplateColumn>
                    <radG:GridClientSelectColumn UniqueName="GridClientSelectColumn" HeaderStyle-Width="50px" HeaderStyle-Wrap="false">
                    </radG:GridClientSelectColumn>
                    <radG:GridBoundColumn DataField="emp_id" Display="false" HeaderText="Employee Code"
                        SortExpression="emp_id" ReadOnly="True" UniqueName="emp_id">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="emp_name" HeaderText="Employee Name" SortExpression="emp_name"
                        UniqueName="emp_name" ShowFilterIcon="false"  ItemStyle-Wrap="false"  HeaderStyle-Wrap="false" HeaderStyle-Width="200px" AutoPostBackOnFilter="true">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="DeptName" HeaderText="Department" SortExpression="DeptName"
                        UniqueName="DeptName" ShowFilterIcon="false"  ItemStyle-Wrap="false"  HeaderStyle-Wrap="false" AutoPostBackOnFilter="true">
                    </radG:GridBoundColumn>
                    <%--                    <radG:GridBoundColumn Display="false" DataField="OT2Rate" HeaderText="OT2Rate" SortExpression="OT2Rate"
                        UniqueName="OT2Rate">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="OT1Rate" HeaderText="OT1Rate" SortExpression="OT1Rate"
                        UniqueName="OT1Rate">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="OT1_wh" HeaderText="OT1_wh" SortExpression="OT1_wh"
                        UniqueName="OT1_wh">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="OT2_wh" HeaderText="OT2_wh" SortExpression="OT2_wh"
                        UniqueName="OT2_wh">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="Wdays" HeaderText="Wdays" SortExpression="Wdays"
                        UniqueName="Wdays">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="ot_entitlement" HeaderText="ot_entitlement"
                        SortExpression="ot_entitlement" UniqueName="ot_entitlement">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="cpf_entitlement" HeaderText="cpf_entitlement"
                        SortExpression="cpf_entitlement" UniqueName="cpf_entitlement">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="cpfAdd_Ordinary" HeaderText="cpfAdd_Ordinary"
                        SortExpression="cpfAdd_Ordinary" UniqueName="cpfAdd_Ordinary">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="cpfAdd_Additional" HeaderText="cpfAdd_Additional"
                        SortExpression="cpfAdd_Additional" UniqueName="cpfAdd_Additional">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="empCPF" HeaderText="empCPF" SortExpression="empCPF"
                        UniqueName="empCPF">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="employerCPF" HeaderText="employerCPF"
                        SortExpression="employerCPF" UniqueName="employerCPF">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="cpfAmount" HeaderText="cpfAmount"
                        SortExpression="cpfAmount" UniqueName="cpfAmount">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="pr_years" HeaderText="pr_years"
                        SortExpression="pr_years" UniqueName="pr_years">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="fund_type" HeaderText="fund_type"
                        SortExpression="fund_type" UniqueName="fund_type">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" DataField="fund_amount" HeaderText="fund_amount"
                        SortExpression="fund_amount" UniqueName="fund_amount">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn Display="false" AllowFiltering="False" DataField="OT1_e" HeaderText="OT1"
                        SortExpression="OT1_e" UniqueName="OT1_e">
                        <ItemStyle Width="50px" />
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn AllowFiltering="false" Display="false" DataField="OT2_e" HeaderText="OT2"
                        SortExpression="OT2_e" UniqueName="OT2_e">
                        <ItemStyle Width="50px" />
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn AllowFiltering="false" Display="false" DataField="unpaid_leaves" HeaderText="unpaid_leaves"
                        SortExpression="unpaid_leaves" UniqueName="unpaid_leaves">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn AllowFiltering="false" Display="false" DataField="unpaid_leaves_amount" HeaderText="unpaid_leaves_amount"
                        SortExpression="unpaid_leaves_amount" UniqueName="unpaid_leaves_amount">
                    </radG:GridBoundColumn>
--%>
                    <radG:GridBoundColumn AllowFiltering="false" DataField="basic_pay" HeaderText="Basic Pay"
                        SortExpression="payrate" UniqueName="basic_pay">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="RIGHT" />
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn AllowFiltering="false" DataField="AdditionsWONH" HeaderText="Additions"
                        SortExpression="AdditionsWONH" UniqueName="AdditionsWONH">
                        <%--Width="50px"--%>
                        <ItemStyle  HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="RIGHT" />
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn AllowFiltering="false" DataField="NH_e" HeaderText="NH" SortExpression="NH_e"
                        UniqueName="NH_e">
                        <%--Width="50px"--%> 
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="RIGHT" />
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn AllowFiltering="false" DataField="OT1_e" HeaderText="OT1" SortExpression="OT1_e"
                        UniqueName="OT1_e">
                         <%--Width="50px"--%>
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="RIGHT" />
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn AllowFiltering="false" DataField="OT2_e" HeaderText="OT2" SortExpression="OT2_e"
                        UniqueName="OT2_e">
                        <%--Width="50px"--%>
                        <ItemStyle  HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="RIGHT" />
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn AllowFiltering="false" Display="false" DataField="Additions"
                        HeaderText="Additions" SortExpression="Additions" UniqueName="Additions">
                        <%--Width="50px"--%>
                        <ItemStyle  HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="RIGHT" />
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn AllowFiltering="false" DataField="Deductions" HeaderText="Deductions"
                        SortExpression="Deductions" UniqueName="Deductions">
                        <%--Width="70px"--%>
                        <ItemStyle  HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="RIGHT" />
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn AllowFiltering="false" DataField="Netpay" HeaderText="Netpay"
                        SortExpression="Netpay" UniqueName="Netpay">
                        <%--Width="50px"--%>
                        <ItemStyle  HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="RIGHT" />
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn ShowFilterIcon="False" UniqueName="ID" HeaderText="Time Card ID"
                        CurrentFilterFunction="contains" AutoPostBackOnFilter="true" DataField="time_card_no">
                        <%--<ItemStyle Width="10px" />--%>
                        <HeaderStyle HorizontalAlign="left" />
                    </radG:GridBoundColumn>
                    
                    <radG:GridBoundColumn DataField="Nationality" HeaderText="Nationality" AllowFiltering="false"
                        ReadOnly="True" SortExpression="Nationality" UniqueName="Nationality" Display="false">
                    </radG:GridBoundColumn> 
                    <radG:GridBoundColumn DataField="Trade" HeaderText="Trade" AllowFiltering="false"
                        ReadOnly="True" SortExpression="Trade" UniqueName="Trade" Display="false">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="emp_type" HeaderText="Pass Type" AllowFiltering="false"
                        ReadOnly="True" SortExpression="emp_type" UniqueName="emp_type" Display="false">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="Designation" HeaderText="Designation" AllowFiltering="false"
                        ReadOnly="True" SortExpression="Designation" UniqueName="Designation" Display="false">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn UniqueName="ic_pp_number" HeaderText="IC/FIN Number"  DataField="ic_pp_number" Display="false"  AllowFiltering="false" >
                    </radG:GridBoundColumn>
                    
                    
                </Columns>
            </MasterTableView>
               <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            <Selecting AllowRowSelect="true" />
                                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="false"
                                                AllowColumnResize="True" ClipCellContentOnResize="true"   ></Resizing>
                                            <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True" />
              </ClientSettings>
        </radG:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="sp_ApprovePayRoll"
        SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                <asp:ControlParameter ControlID="cmbMonth" Name="month" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:ControlParameter ControlID="cmbYear" Name="year" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:SessionParameter Name="UserID" SessionField="EmpCode" Type="Int32" />
                <asp:Parameter Name="Status" Type="String"  DefaultValue="P"  />
                <asp:ControlParameter ControlID="deptID" Name="DeptId" PropertyName="SelectedValue"   Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table cellpadding="0" cellspacing="0" border="0" width="100%" background="../frames/images/toolbar/backs.jpg"  Height="32px" id="TabId" runat="server"  >
                        <tr>
                            <td  class="colheading"><b>Action:</b></td>
                            <td style="width:60%;color:White;" >
                                    <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Approve or Reject Payroll"))
                                      {%>
                                    <asp:Button ID="btnApprove" runat="server" OnClick="btnApprove_Click" Text="Approve"
                                        class="textfields" Style="width: 170px; height: 22px" />
                                    <asp:Button ID="btnreject" runat="server" OnClick="btnreject_Click" Text="Reject"
                                        class="textfields" Style="width: 80px; height: 22px" />
                                    <%}%>
                            </td>
                         
                        </tr>
                    </table>
        
            <!-- End grid -->  
            </telerik:RadPane>
        </telerik:RadSplitter>
     <!-------------------- end -------------------------------------->
        
      
   <asp:Label ID="dataexportmessage" runat="server"  ForeColor="red" Visible="false"  CssClass="bodytxt">No Records to export!</asp:Label>
                                                    
                                          
        
        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

            <script type="text/javascript">
                    function RowDblClick(sender, eventArgs)
                    {
                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                    }
            </script>

        </radG:RadCodeBlock>
        <asp:PlaceHolder ID="placeholder1" runat="server">

            <script type="text/javascript"> 
        function OpenModalWindow()  
        {  
            window.radopen(null,"MYMODALWINDOW");  
        }  
          
        function CloseModalWindow()  
        {  
            var win = GetRadWindowManager().GetWindowByName("MYMODALWINDOW");          
            win.Close();  
        } 
          function showreport(e)
        {
         var month = document.getElementById('cmbMonth').value;
            var year = document.getElementById('cmbYear').value;
        window.open("paydetailreport1.aspx"+"?month="+month+"&year="+year);
         return false;
        } 
      function ShowInsertForm(row)
      {       
         var month = document.getElementById('cmbMonth').value;
        var year = document.getElementById('cmbYear').value;
         
        
         var RadGrid1= window["<%=RadGrid1.ClientID %>"];          
         var rowVal =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "emp_id").innerHTML; 
        var name =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "emp_name").innerHTML; 
          var payrate =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "basic_pay").innerHTML;     
         var netpay =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "Netpay").innerHTML; 
          var additions =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "Additions").innerHTML; 
          var deductions =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "Deductions").innerHTML; 
           
            var ot1 =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "ot1_e").innerHTML; 
         var ot2 =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "ot2_e").innerHTML; 
             var cpf =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "empcpf").innerHTML; 
                              
         var fund =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "fund_amount").innerHTML; 
         var fundtype =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "fund_type").innerHTML; 
          
           var otentitlement =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "ot_entitlement").innerHTML; 
           var cpfentitlement=RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "cpf_entitlement").innerHTML; 
              
         window.radopen("PayrollDetail1.aspx"+"?id="+rowVal+"&payrate="+payrate+"&netpay="+netpay+"&additions="+additions+"&deductions="+deductions
                        +"&ot1="+ot1+"&ot2="+ot2+"&cpf="+cpf+"&fund="+fund+"&fundtype="+fundtype +"&otentitlement="+ otentitlement+"&cpfentitlement="+cpfentitlement
                        +"&name="+name+"&month="+month+"&year="+year, "DetailGrid");
                return false;         
        
      }
            </script>

        </asp:PlaceHolder>
  <%--      <table border="0"  cellspacing="0" style="border-collapse: collapse"
            width="90%">
            <tr>
                <td align="right">
                    <asp:Button ID="Button4" CssClass="textfields" Width="150px" Text="Export to Excel"
                        OnClick="Button1_Click" runat="server"></asp:Button>
                    <asp:Button ID="Button5" CssClass="textfields" Width="150px" Text="Export to Word"
                        OnClick="Button2_Click" runat="server"></asp:Button><asp:CheckBox ID="CheckBox1"
                            CssClass="bodytxt" Text="Exports all pages" runat="server"></asp:CheckBox>
                  
                </td>
            </tr>
        </table>--%>
        
      
  
        <radW:RadWindowManager ID="RadWindowManager1" runat="server">
            <Windows>
                <radW:RadWindow ID="DetailGrid" runat="server" Title="User List Dialog" Top="50px"
                    Height="400px" Width="500px" Left="60px" ReloadOnShow="true" Modal="true" />
            </Windows>
        </radW:RadWindowManager>
    </form>
</body>
</html>
