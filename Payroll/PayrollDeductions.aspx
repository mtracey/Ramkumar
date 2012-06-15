<%@ Page Language="C#" AutoEventWireup="true" Codebehind="PayrollDeductions.aspx.cs"
    Inherits="SMEPayroll.Payroll.PayrollDeductions" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radA" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG1" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

    <script language="JavaScript1.2"> 
        <!-- 

            if (document.all)
            window.parent.defaultconf=window.parent.document.body.cols
            function expando()
            {
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
                   myHeight =myHeight - 100;
                   document.getElementById('<%= RadGrid1.ClientID %>').style.height=myHeight;
              
//                if( screen.height > 768)
//                {
//                    document.getElementById('<%= RadGrid1.ClientID %>').style.height="90.7%";
//                }
//                else
//                {
//                    document.getElementById('<%= RadGrid1.ClientID %>').style.height="85.5%";
//                }
              }
            
            </script>

         </radG:RadCodeBlock>
         <!-- ToolBar End -->
        <radA:RadScriptManager ID="ScriptManager" runat="server"  >
        </radA:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
          <!------------------------------ start ---------------------------------->
        <telerik:RadSplitter ID="RadSplitter1" Width="100%" Height="100%" runat="server" 
            Orientation="Horizontal" BorderSize="0" BorderStyle="None" PanesBorderSize="0" BorderWidth="0px"  >
            <telerik:RadPane ID="Radpane1" runat="server" Scrolling="none" Height="32px" Width="100%"   MaxHeight="100">
                <telerik:RadSplitter ID="Radsplitter11" runat="server">
                    <telerik:RadPane ID="Radpane111" runat="server" Scrolling="none">
                        <!-- top -->
                          <table cellpadding="0" cellspacing="0" width="100%" border="0" Height="32px" background="../frames/images/toolbar/backs.jpg">
                                <tr>
                                    <td>
                                        <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Payroll Deductions</b></font>
                                    </td>
                                    <td style="height: 32px">
                                        <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                            <tr>
                                                <td align="right">
                                                    <tt class="bodytxt" style="color:White;">Search:</tt></td>
                                                <td>
                                                    <%--<asp:DropDownList ID="cmbYear" runat="server" Style="width: 65px" CssClass="textfields"
                                                        AutoPostBack="True" OnSelectedIndexChanged="cmbYear_SelectedIndexChanged">
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
                                                           runat="server" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="cmbYear_SelectedIndexChanged">
                                                   </asp:DropDownList>
                                                   <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                
                                                    
                                                    
                                                </td>
                                                <td align="right">
                                                    <tt class="bodytxt" style="color:White;">Employee:</tt>
                                                </td>
                                                <td>
                                                    <%--                                            <asp:DropDownList ID="drpemp" runat="server" Width="156px" CssClass="textfields">
                                                    </asp:DropDownList>--%>
                                                    <radG:RadComboBox ID="RadComboBoxPrjEmp" runat="server" OnItemsRequested="RadComboBoxEmpPrj_ItemsRequested"
                                                        EnableLoadOnDemand="true" HighlightTemplatedItems="true" EmptyMessage="Select Employees" OnSelectedIndexChanged="RadComboBoxPrjEmp_SelectedIndexChanged"
                                                        DropDownWidth="375px" Width="150px" Height="200px">
                                                        <HeaderTemplate>
                                                            <table style="width: 350px" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <%--                                                <td style="width: 20px">
                                                            Select
                                                        </td>--%>
                                                                    <td style="width: 120px; font-family:Tahoma;font-size:12px;">
                                                                        Emp Name</td>
                                                                    <td style="width: 80px; font-family:Tahoma;font-size:12px;">
                                                                        Card No</td>
                                                                    <td style="width: 80px; font-family:Tahoma;font-size:12px;">
                                                                        IC NO</td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table style="width: 350px" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <%--                                                <td style="width: 30px;">
                                                            <asp:CheckBox runat="server" ID="CheckBox" onclick="stopPropagation(event);" value='<%# DataBinder.Eval(Container.DataItem, "Value") %>'
                                                                Checked='<%# ((Container.DataItem != null) ? (( bool.Parse(DataBinder.Eval(Container.DataItem, "Selected").ToString())) ? true : false) : false) %>' />
                                                        </td>--%>
                                                                    <td style="width: 120px; font-family:Tahoma;font-size:12px;">
                                                                        <%# DataBinder.Eval(Container, "Text")%>
                                                                    </td>
                                                                    <td style="width: 80px; font-family:Tahoma;font-size:12px;">
                                                                        <%# DataBinder.Eval(Container, "Attributes['Time_Card_No']")%>
                                                                    </td>
                                                                    <td style="width: 80px; font-family:Tahoma;font-size:12px;">
                                                                        <%# DataBinder.Eval(Container, "Attributes['ic_pp_number']")%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </radG:RadComboBox>
                                                </td>
                                                <td align="right">
                                                    <tt class="bodytxt" style="color:White;">Month:</tt>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="textfields">
                                                        <asp:ListItem Value="13">All</asp:ListItem>
                                                        <asp:ListItem Value="01">January</asp:ListItem>
                                                        <asp:ListItem Value="02">February</asp:ListItem>
                                                        <asp:ListItem Value="03">March</asp:ListItem>
                                                        <asp:ListItem Value="04">April</asp:ListItem>
                                                        <asp:ListItem Value="05">May</asp:ListItem>
                                                        <asp:ListItem Value="06">June</asp:ListItem>
                                                        <asp:ListItem Value="07">July</asp:ListItem>
                                                        <asp:ListItem Value="08">August</asp:ListItem>
                                                        <asp:ListItem Value="09">September</asp:ListItem>
                                                        <asp:ListItem Value="10">October</asp:ListItem>
                                                        <asp:ListItem Value="11">November</asp:ListItem>
                                                        <asp:ListItem Value="12">December</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="35%">
                                                    <asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid" runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
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
                     OnButtonClick="tbRecord_ButtonClick" OnClientButtonClicking="PrintRadGrid" BorderWidth="0px"   >
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
                   <radG:RadGrid ID="RadGrid1" runat="server" OnUpdateCommand="RadGrid1_UpdateCommand"
                        OnDeleteCommand="RadGrid1_DeleteCommand" OnInsertCommand="RadGrid1_InsertCommand" 
                        Skin="Outlook" Width="100%" OnItemDataBound="RadGrid1_ItemDataBound" OnNeedDataSource="RadGrid1_NeedDataSource"
                        PageSize="50"
                        AllowPaging="true"
                        ItemStyle-Wrap="false"
                        AlternatingItemStyle-Wrap="false"
                        PagerStyle-AlwaysVisible="True" 
                        GridLines="Both" 
                        OnItemCreated="RadGrid1_ItemCreated"
                        OnGridExporting="RadGrid1_GridExporting"
                        Height="500px"
                        Font-Size="11"
                        Font-Names="Tahoma"
                        EnableHeaderContextMenu="true"
                        AllowSorting="true" 
                         >
                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="trx_id"  CommandItemDisplay="Bottom" TableLayout="Auto" PagerStyle-Mode="Advanced">
                          <FilterItemStyle HorizontalAlign="left" />
                          <HeaderStyle ForeColor="Navy" />
                          <AlternatingItemStyle BackColor="#E5E5E5" Height="25px" VerticalAlign="middle" />
                          <ItemStyle Height="25px" VerticalAlign="middle" />
                            
                            <Columns>
                                <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn" HeaderText="101" >
                                    <ItemTemplate>
                                        <asp:Image ID="Image2" ImageUrl="../frames/images/EMPLOYEE/Grid- employee.png" runat="Server" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="30px" />
                                </radG:GridTemplateColumn>
                                <radG:GridBoundColumn DataField="emp_code" Visible="false" HeaderText="Employee Code"
                                    SortExpression="emp_code" UniqueName="emp_code">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="emp_name" HeaderText="Emp Name" SortExpression="emp_name"
                                    UniqueName="emp_name">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="trx_id" DataType="System.Int32" HeaderText="Id"
                                    ReadOnly="True" SortExpression="trx_id" Visible="False" UniqueName="trx_id">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Type" HeaderText="Type" ReadOnly="True" SortExpression="Type"
                                    UniqueName="Type">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="id" HeaderText="Type" ReadOnly="True" SortExpression="Type"
                                    UniqueName="Type" Visible="False">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="trx_amount" DataType="System.Decimal" HeaderText="Amount"
                                    SortExpression="trx_amount" UniqueName="trx_amount">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="trx_period" DataType="System.DateTime" HeaderText="Period"
                                    SortExpression="trx_period" UniqueName="trx_period">
                                </radG:GridBoundColumn>
                                <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                    <HeaderStyle Width="30px" />
                                </radG:GridEditCommandColumn>
                                <radG:GridButtonColumn ConfirmText="Delete this record?" ButtonType="ImageButton"
                                    ImageUrl="../frames/images/toolbar/Delete.gif" CommandName="Delete" Text="Delete"
                                    UniqueName="DeleteColumn">
                                    <HeaderStyle Width="30px" />
                                </radG:GridButtonColumn>
                            </Columns>
                            <EditFormSettings UserControlName="deduction.ascx" EditFormType="WebUserControl">
                            </EditFormSettings>
                            <CommandItemSettings AddNewRecordText="Add New Deduction" />
                        </MasterTableView>
                         <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                     <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True"  />
                       </ClientSettings>
                    </radG:RadGrid>  
               <!-- End grid -->
            </telerik:RadPane>
        </telerik:RadSplitter>
     <!-------------------- end -------------------------------------->
        
        
    
   </form>
</body>
</html>
