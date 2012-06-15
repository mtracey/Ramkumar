<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Emp_BulkAdd.aspx.cs" Inherits="SMEPayroll.Payroll.Emp_BulkAdd" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="RadInput.Net2" Namespace="Telerik.WebControls" TagPrefix="radI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

    <script type="text/javascript" language="javascript">
	    function validateform()
	    {
		    return true;
		}
        
        function storeoldval(val)
        {
            document.getElementById('txthid').value = val;
        }
		
		function validatenumbers(ths)
		{
		    var val = ths.value;
		    var str;
		    if (val <= 999 || val == '-')
		    {
		        if (val.indexOf(".") != -1 ) 
		        {
		            str= val.substring(val.indexOf(".")+1);
		            if (str.length > 2)
		            {
		                ths.value = documen
		                t.getElementById('txthid').value;
                        alert("Should be in Minutes Format. Maximum 59 Minutes Allowed");
		            }
		            else
		            {
		                if (str.length == 2)
		                {
		                    if (str > 59)
		                    {
		                        ths.value = document.getElementById('txthid').value;
		                        alert("Should be in Minutes Format. Maximum 59 Minutes Allowed");
		                    }
		                }
		                else
		                {
		                    if (str > 5)
		                    {
		                        ths.value = document.getElementById('txthid').value;
		                        alert("Should be in Minutes Format. Maximum 59 Minutes Allowed");
		                    }
		                }
		            }
		        }
		     }
		     else
		     {
                ths.value = document.getElementById('txthid').value;
                alert("Hours cannot be more than 999");
		     }
		}
    </script>

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

    <link href="../style/MenuStyle.css" rel="stylesheet" type="text/css" />
    <link href="../style/MenuStyle.css" rel="stylesheet" type="text/css" />
    <link href="../style/MenuStyle.css" rel="stylesheet" type="text/css" />
    <link href="../style/MenuStyle.css" rel="stylesheet" type="text/css" />
    <link href="../style/MenuStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">   
    html, body, form   
    {   
       height: 100%;   
       margin: 0px;   
       padding: 0px;  
       overflow: hidden;
    }   
    .txtheight
    {
       font-size:11px;
    }
    </style>
</head>
<body style="margin-left: auto">
    <form id="form1" runat="server">
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
        <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">

            <script type="text/javascript">
            <!--
              function ChangeMonth(varmonth)
              {

              }
            -->
            </script>

        </telerik:RadCodeBlock>
        
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
              
                   var myHeight = document.body.clientHeight; 
                   myHeight =myHeight - 130;
                   document.getElementById('<%= RadGrid1.ClientID %>').style.height=myHeight;
              
//                if( screen.height > 768)
//                {
//                    document.getElementById('<%= RadGrid1.ClientID %>').style.height="86%";
//                 }
//                else
//                {
//                    document.getElementById('<%= RadGrid1.ClientID %>').style.height="79%";
//                }
              }
            
            
                function isNumericKeyStrokeDecimal(evt)
                {
                     var charCode = (evt.which) ? evt.which : event.keyCode 
                     if ((charCode > 31 && (charCode < 48 || charCode > 57)) && (charCode !=46))
                        return false;

                     return true;
                }
            </script>

         </radG:RadCodeBlock>
         <!-- ToolBar End -->
        
        
       <!------------------------------ start ---------------------------------->
        <telerik:RadSplitter ID="RadSplitter1" Width="100%" Height="100%" runat="server" 
            Orientation="Horizontal" BorderSize="0" BorderStyle="None" PanesBorderSize="0" BorderWidth="0px">
            <telerik:RadPane ID="Radpane1" runat="server" Scrolling="none" Height="32px" Width="100%"   MaxHeight="100">
                <telerik:RadSplitter ID="Radsplitter11" runat="server">
                    <telerik:RadPane ID="Radpane111" runat="server" Scrolling="none" BorderColor="red">
                        <!-- top -->
                         <table cellpadding="0" cellspacing="0" width="100%" border="0" background="../frames/images/toolbar/backs.jpg" Height="32px">
                            <input type="hidden" id="txthid" runat="server" value="0" />
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                        <tr>
                                            <td >
                                                <font class="colheading" >&nbsp;&nbsp;&nbsp;<b>Employee Multi Additions</b></font>
                                            </td>
                                            <td align="center">
                                                <asp:CheckBox ID="chkId" Text="Import From Excel" runat="server" ForeColor="white" CssClass="bodytxt" OnCheckedChanged="chkId_CheckedChanged" AutoPostBack="true"  />
                                                &nbsp;&nbsp; <tt class="bodytxt"  style="color:White;">Year :</tt>
                                                <%--  <asp:DropDownList ID="cmbYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbYear_selectedIndexChanged"
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
                                                    
                                                
                                                &nbsp;&nbsp; <tt class="bodytxt"  style="color:White;">Month :</tt>
                                                <asp:DropDownList ID="cmbMonth" runat="server" Style="width: 100px" CssClass="textfields">
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
                                                &nbsp;&nbsp;<tt class="bodytxt" id="Depttextid" runat="server" style="color:White;">Dept :</tt>
                                                <asp:DropDownList Width="100px"   CssClass="textfields"
                                                    ID="deptID" DataTextField="DeptName" DataValueField="ID" DataSourceID="SqlDataSource3"
                                                    runat="server" >
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="select 'ALL' as DeptName,'-1' as ID union SELECT DeptName,ID FROM dbo.DEPARTMENT WHERE COMPANY_ID= @company_id order by id">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                                                </SelectParameters>
                                                </asp:SqlDataSource>
                                                &nbsp;
                                                <input id="FileUpload" runat="server" class="textfields"  name="FileUpload" style="width: 200px" type="file" visible="false" />
                                                <asp:RegularExpressionValidator
                                                    ID="revFileUpload" runat="Server" ControlToValidate="FileUpload" ErrorMessage="Please Select xls Files"
                                                    ValidationExpression=".+\.(([xX][lL][sS]))">*</asp:RegularExpressionValidator>
                                                &nbsp;
                                                <asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid" runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                                            </td>
                                            
                                            <td>
                                                <asp:Label ID="lblerror" ForeColor="red" class="bodytxt" runat="server"></asp:Label>
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
             <!-- grid --><%--PageSize="50" AllowPaging="true"--%><%--OnNeedDataSource="RadGrid1_NeedDataSource" --%>
             
             <radG:RadToolBar ID="tbRecord" runat="server" Width="100%" Skin="Office2007" UseFadeEffect="True"  Height="30px"
                                     OnButtonClick="tbRecord_ButtonClick" OnClientButtonClicking="PrintRadGrid" BorderWidth="0px" Visible="false" >
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
              <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="false" ShowStatusBar="false" 
                        Skin="Outlook" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnItemCreated="RadGrid1_ItemCreated"
                        AllowMultiRowSelection="true" 
                          OnGridExporting="RadGrid1_GridExporting"
                          Height="500px"
                          ItemStyle-Wrap="false"
                          AlternatingItemStyle-Wrap="false"
                          PagerStyle-AlwaysVisible="True" 
                          GridLines="Both" 
                          Font-Size="11"
                          Font-Names="Tahoma" 
                          HeaderStyle-Wrap="false"
                          AllowPaging="true" PageSize="10000"  PagerStyle-Visible="false"
                          Width="100%"
                          AllowSorting="true"  
                          OnNeedDataSource="RadGrid1_NeedDataSource"
                         >
                        <MasterTableView DataKeyNames="Emp_Code, Time_Card_No" ShowFooter="true" TableLayout="Auto">
                         <FilterItemStyle HorizontalAlign="left" />
                        <HeaderStyle ForeColor="Navy" />
                        <ItemStyle BackColor="White" Height="25px" VerticalAlign="middle" />
                        <AlternatingItemStyle  Height="25px" VerticalAlign="middle" />
                        <HeaderStyle Wrap="false" Height="25px"  />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Emp_Code" UniqueName="Emp_Code" HeaderText="Emp_Code" Display="false"   >
                                 <HeaderStyle Width="100px" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="FullName" UniqueName="FullName" HeaderText="(108)FullName"  ItemStyle-Wrap="false" >
                                 <HeaderStyle Width="200px" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Time_Card_No" UniqueName="Time_Card_No" HeaderText="Time_Card_No" > 
                                <%--<HeaderStyle Width="70px" />--%>
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column3"  >
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column4">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                   <%-- <HeaderStyle Width="40px" />--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column5">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column6">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column7">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column8">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column9">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                 <%--   <ItemStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column10">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column11">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column12">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                    <%--<ItemStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column13">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column14">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column15">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column16">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column17">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column18">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column19">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Display="false" UniqueName="Column20">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                   <%-- <ItemStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Display="false" UniqueName="Column21">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Display="false" UniqueName="Column22">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Display="false" UniqueName="Column23">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                     <%--<HeaderStyle Width="40px"/>--%>
                                </telerik:GridTemplateColumn>
                                
                                  <%--  <telerik:GridBoundColumn DataField="TRADE" UniqueName="Trade" HeaderText="Trade" > 
                               <HeaderStyle Width="70px" />
                                </telerik:GridBoundColumn>--%>
                                
                                <telerik:GridClientSelectColumn UniqueName="GridClientSelectColumn" HeaderStyle-Width="30px">
                                </telerik:GridClientSelectColumn>
                            </Columns>
                        </MasterTableView>
                  <%--      <ClientSettings>
                            <Selecting AllowRowSelect="true" />
                            <Resizing AllowRowResize="false" EnableRealTimeResize="false" ResizeGridOnColumnResize="false"
                                AllowColumnResize="false"></Resizing>
                            <Scrolling  EnableVirtualScrollPaging="true" UseStaticHeaders="true"/>
                        </ClientSettings>--%>
                              <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true"  >
                            <Selecting AllowRowSelect="true" />
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                            <Scrolling UseStaticHeaders="true" AllowScroll="true" ScrollHeight="500px" SaveScrollPosition="True"  />
                        </ClientSettings>
                    </telerik:RadGrid>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" background="../frames/images/toolbar/backs.jpg"  Height="32px" id="TabId" runat="server" visible="false"  >
                        <tr>
                            <td  class="colheading"><b>Action:</b></td>
                            <td style="width:60%;" align="center"><asp:Button Visible="false" ID="btnUpdate" Text="Update" runat="server" CssClass="textfields" Style="width: 180px;height: 22px" OnClick="btnUpdate_Click" /></td>
                        </tr>
                    </table>
            <!-- End grid -->  
            </telerik:RadPane>
        </telerik:RadSplitter>
     <!-------------------- end -------------------------------------->
        
        
        
        
        
        <%--        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

            <script type="text/javascript">
                    function RowDblClick(sender, eventArgs)
                    {
                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                    }
            </script>

        </radG:RadCodeBlock>--%>        
  
        <%-- <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>--%>
    </form>
</body>
</html>
