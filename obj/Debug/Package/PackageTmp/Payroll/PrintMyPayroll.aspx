<%@ Page Language="C#" AutoEventWireup="true" Codebehind="PrintMyPayroll.aspx.cs"
    Inherits="SMEPayroll.Payroll.PrintMyPayroll" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../style/PMSStyle.css" type="text/css" />

    <script type="text/javascript" language="javascript">
	    function disablenow(mthis)
	    {
	        //mthis.disabled=true;
	        alert('You will receive an email for the selected employees with the DOC NO: '+ document.getElementById('hiddenrand').value);
		}
    </script>

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
<body style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
            <!-- ToolBar -->
          <radG:RadCodeBlock ID="RadCodeBlock3" runat="server">

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
                if( screen.height > 768)
                {
                //alert("1");
                   //"90.7%";
                    document.getElementById('<%= RadGrid1.ClientID %>').style.height="86%";
                 }
                else
                {
                    //document.getElementById('<%= RadGrid1.ClientID %>').style.height="85.5%";
                    document.getElementById('<%= RadGrid1.ClientID %>').style.height="79%";
                }
              }
            
            </script>

         </radG:RadCodeBlock>
         <!-- ToolBar End -->
         
       <!------------------------------ start ---------------------------------->
        <telerik:RadSplitter ID="RadSplitter1" Width="100%" Height="100%" runat="server" 
            Orientation="Horizontal" BorderSize="0" BorderStyle="None" PanesBorderSize="0"  BorderWidth="0px"  >
            <telerik:RadPane ID="Radpane1" runat="server" Scrolling="none" Height="32px" Width="100%"   MaxHeight="100">
                <telerik:RadSplitter ID="Radsplitter11" runat="server">
                    <telerik:RadPane ID="Radpane111" runat="server" Scrolling="none" >
                        <!-- top -->
                             <table cellpadding="0" cellspacing="0" width="100%" border="0" background="../frames/images/toolbar/backs.jpg" Height="32px" >
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                            <tr>
                                                <td>
                                                    <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Print My Payslip</b></font>
                                                </td>
                                                <td align="right">
                                                    <tt class="bodytxt" style="color:White;">Year :</tt>
                                                  <%--<asp:DropDownList ID="cmbYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbYear_selectedIndexChanged"
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
                                                               runat="server"  AutoPostBack="true"  OnSelectedIndexChanged="cmbYear_selectedIndexChanged" >
                                                  </asp:DropDownList>
                                                 <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                                    
                                                    
                                                    
                                                </td>
                                                <td  valign="middle" >
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
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<tt><asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid"
                                                        runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                                                    </tt>
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
             
             <radG:RadGrid ID="RadGrid1" OnItemCommand="RadGrid1_ItemCommand" runat="server" 
            AllowPaging="true" PageSize="1000" Skin="Outlook" Width="100%" AutoGenerateColumns="False"
            OnPageIndexChanged="RadGrid1_PageIndexChanged" AllowMultiRowSelection="true"
            AllowFilteringByColumn="True" EnableHeaderContextMenu="true"    OnItemCreated="RadGrid1_ItemCreated"
                Height="100%"
                ItemStyle-Wrap="false"
                AlternatingItemStyle-Wrap="false"
                PagerStyle-AlwaysVisible="True" 
                GridLines="Both" 
                AllowSorting="true"  
                OnGridExporting="RadGrid1_GridExporting"
                Font-Size="11"
                Font-Names="Tahoma" 
                HeaderStyle-Wrap="false" 
                  >
                <MasterTableView DataKeyNames="emp_id,basic_pay,Additions,Deductions,email_payslip,emp_name,email,password,time_card_no"
                DataSourceID="SqlDataSource1" TableLayout="Auto">
                <FilterItemStyle HorizontalAlign="left" />
                <HeaderStyle ForeColor="Navy" Height="25px" Wrap="false" />
                <ItemStyle BackColor="White" Height="20px" />
                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                <Columns>
                    <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn" HeaderText="110">
                        <ItemTemplate>
                            <asp:Image ID="Image2" ImageUrl="../frames/images/EMPLOYEE/Grid- employee.png" runat="Server" />
                        </ItemTemplate>
                        <HeaderStyle Width="30px" />
                    </radG:GridTemplateColumn>
                    <radG:GridClientSelectColumn UniqueName="GridClientSelectColumn" HeaderStyle-Width="30px">
                    </radG:GridClientSelectColumn>
                    <radG:GridBoundColumn DataField="emp_id" Display="false" HeaderText="Employee Code"
                        SortExpression="emp_id" ReadOnly="True" UniqueName="emp_id">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="emp_name" HeaderText="Employee Name" SortExpression="emp_name"
                        UniqueName="emp_name" ShowFilterIcon="false" HeaderStyle-Wrap="false" HeaderStyle-Width="200px">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="email" HeaderText="Employee Email" SortExpression="email"
                        UniqueName="email" ShowFilterIcon="false" HeaderStyle-Wrap="false">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="DeptName" HeaderText="Department" SortExpression="DeptName"
                        UniqueName="DeptName" ShowFilterIcon="false">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn AllowFiltering="false" DataField="basic_pay" HeaderText="Basic Pay"
                        SortExpression="payrate" UniqueName="basic_pay">
                         <%--Width="70px"--%>
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
                        <ItemStyle  HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="RIGHT" />
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn AllowFiltering="false" DataField="OT1_e" HeaderText="OT1" SortExpression="OT1_e"
                        UniqueName="OT1_e">
                        <%--Width="50px"--%>
                        <ItemStyle  HorizontalAlign="Right" />
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
                    <radG:GridTemplateColumn UniqueName="PrintTemplateColumn">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgprint" CausesValidation="false" CommandName="Print" runat="server"
                                ImageUrl="../frames/images/toolbar/print.gif" />
                        </ItemTemplate>
                    </radG:GridTemplateColumn>
                    
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
                    <radG:GridBoundColumn UniqueName="ic_pp_number" HeaderText="IC/FIN Number"  DataField="ic_pp_number" Display="false"  AllowFiltering="false" ShowFilterIcon="false" >
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="Sp_approvemypayroll"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    <asp:ControlParameter ControlID="cmbMonth" Name="month" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="cmbYear" Name="year" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:SessionParameter Name="UserID" SessionField="EmpCode" Type="Int32" />
                    <asp:Parameter Name="Status" Type="String" DefaultValue="G" />
                </SelectParameters>
            </asp:SqlDataSource>
                  <table cellpadding="0" cellspacing="0" border="0" width="100%" background="../frames/images/toolbar/backs.jpg"  Height="32px" id="TabId" runat="server"  >
                        <tr>
                            <td  class="colheading"><b>Action:</b></td>
                            <td style="width:60%;color:White;"><tt class="bodytxt">Epayslip will not be emailed<br />   to employees whose email address is not available in the system.</tt></td>
                            <td align="center" >
                                    <asp:Button ID="Button2" Visible="false" runat="server" Text="Print Payslip" class="textfields" Style="width: 210px;
                                         height: 23px" OnClick="PrintPayroll_Click" />
                                    <asp:Button ID="Button3"  runat="server" Text="Email Payslip" class="textfields" Style="width: 230px;
                                        height: 23px" OnClick="Button3_Click" OnClientClick="javascript:disablenow(this);" />
                            </td>
                        </tr>
                    </table>
            
                <!-- End grid -->  
                </telerik:RadPane>
        </telerik:RadSplitter>
     <!-------------------- end -------------------------------------->
        
     
        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

            <script type="text/javascript">
                    function RowDblClick(sender, eventArgs)
                    {
                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                    }
            </script>

        </radG:RadCodeBlock>
  <%--      <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" border="0" style="width: 98%">
            <tr>
                <td align="Center">
                    <asp:Button Visible="false" ID="Button4" CssClass="textfields" Width="150px" Text="Export to Excel"
                        OnClick="Button1_Click" runat="server"></asp:Button>
                    <asp:Button Visible="false" ID="Button5" CssClass="textfields" Width="150px" Text="Export to Word"
                        OnClick="Button2_Click" runat="server"></asp:Button>
                    <asp:CheckBox  Visible="false"  ID="CheckBox1" CssClass="bodytxt" Text="Exports all pages" runat="server">
                    </asp:CheckBox></td>
            </tr>
        </table>--%>
   
         <asp:Label ID="dataexportmessage" runat="server" Visible="false" ForeColor="red" CssClass="bodytxt">&nbsp;&nbsp;&nbsp;&nbsp;No Records to export!</asp:Label>
        <input type="hidden" id="hiddenrand" value="" runat="server" />
        <br />
    </form>
</body>
</html>
