<%@ Page Language="C#" AutoEventWireup="true" Codebehind="PayrollAdditions.aspx.cs"
    Inherits="SMEPayroll.Payroll.PayrollAddittions" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radA" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../style/PMSStyle.css" type="text/css" />

    <script language="javascript" type="text/javascript" src="../Frames/Script/CommonValidations.js"> </script>
     <style type="text/css" type="text/css">   
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
        <radG1:RadScriptManager ID="ScriptManager" runat="server"  ScriptMode="Release"  >
        </radG1:RadScriptManager>
            <!-- ToolBar -->
          <radG1:RadCodeBlock ID="newcodeid" runat="server">
               <script language="javascript" type="text/javascript"> 
        String.prototype.trim = function() 
        {
            a = this.replace(/^\s+/, '');
            return a.replace(/\s+$/, '');
        };
        
        function checkDate(fld, msg) 
        {
            var newmsg="";
            var mo, day, yr;
            var entry = fld.value;
            var re = /\b\d{1,2}[\/-]\d{1,2}[\/-]\d{4}\b/;
            if (re.test(entry)) 
            {
                var delimChar = (entry.indexOf("/") != -1) ? "/" : "-";
                var delim1 = entry.indexOf(delimChar);
                var delim2 = entry.lastIndexOf(delimChar);
                day = parseInt(entry.substring(0, delim1), 10);
                mo = parseInt(entry.substring(delim1+1, delim2), 10);
                yr = parseInt(entry.substring(delim2+1), 10);
                var testDate = new Date(yr, mo-1, day);
                if (testDate.getDate() == day) {
                    if (testDate.getMonth() + 1 == mo) {
                        if (testDate.getFullYear() == yr) {
                            return true;
                        } else {
                            newmsg = msg + " has a problem with the year entry.";
                        }
                    } else {
                        newmsg = msg + " has a problem with the month entry.";
                    }
                } else {
                    newmsg = msg + " has a problem with the date entry.";
                }
            } else {
                newmsg = msg + " has Incorrect date format. Enter as dd/mm/yyyy.";
            }
            return newmsg;
        }
        
        function ValidateForm()
        {
            var strmsg='';
            var txthid = document.getElementById('txtRadId').value + "_";
            
            var obj = document.getElementById(txthid + 'tr1'); 
            if (obj.style.display == "block")
            {
                var ctrl1 = document.getElementById(txthid + 'txtbasis_arriving_payment');
                var ctrl2 = document.getElementById(txthid + 'txtservice_length');
                var ctrl3 = document.getElementById(txthid + 'drpiras_approval');
                var ctrl4 = document.getElementById(txthid + 'txtiras_approval_date');
                
                if (ctrl1.value.trim().length  <= 0)
                {
                    strmsg = strmsg + "Please enter Basis Arriving Payment." + "\n";
                }
                
                if (ctrl2.value.trim().length  <= 0)
                {
                    strmsg = strmsg + "Please enter Service Length." + "\n";
                }
                else
                {
                    if (isNaN(ctrl2.value) == true)
                    {
                        strmsg = strmsg + "Please enter numeric value in Service Length." + "\n";
                    }
                }
                
                if (ctrl3.value  == "Yes")
                {
                    if (ctrl4.value.trim().length  <= 0)
                    {
                        strmsg = strmsg + "Please enter IRAS Approval Date." + "\n";
                    }
                    else
                    {
                        var strdate=checkDate(ctrl4, 'Approval Date');
                        if (strdate.length >= 0)
                        {
                            strmsg = strmsg + strdate + "\n";
                        }
                    }
                }
            }
            
            var ctrl5 = document.getElementById(txthid + 'drpAdditionYear');
            var ctrl6 = document.getElementById(txthid + 'txtamt');
            var ctrl7 = document.getElementById(txthid + 'drpaddtype');
            var ctrl8 = document.getElementById(txthid + 'drpemployee');
            //alert(ctrl5);txtamt drpemployee
            
            if(ctrl8.value == '-select-')
            {
                strmsg = strmsg + "Payroll Additions - Please select an Employee." + "\n";
            }            
            if(ctrl6.value.trim().length <= 0)
            {
                strmsg = strmsg + "Payroll Additions - Please enter an Amount" + "\n";
            }
            if(ctrl5.value == '')
            {
                strmsg = strmsg + "Payroll Additions - Please select year for the Addition." + "\n";
            }
            if(ctrl7.value == '-select-')
            {
                strmsg = strmsg + "Payroll Additions - Please select an Addition type." + "\n";
            }  
            
            var numericheck = CheckNumeric(ctrl6.value,"\nPayroll Additions -Amount");
            if(numericheck!="")
                strmsg+= numericheck;
            
            if (strmsg.length >0)
            {
                alert(strmsg);
                strmsg="";
                return false; 
            }
        }
        
        function selectByValue(select, value)
        {
                for(var i = 0; i < select.options.length; i++)
                {
                    if(value == select.options[i].value)
                    {
                        select.selectedIndex = i;
                        break; // Break out to stop at the first value
                    }
                }
        }
        
        function EnableApproval()
        {
            var txthid=document.getElementById('txtRadId').value + "_";
            document.getElementById(txthid + 'txtiras_approval_date').value='';

            if (document.getElementById(txthid + 'drpiras_approval').value == "Yes")
            {
                document.getElementById(txthid + 'tr4').style.display ="block";
            }
            else
            {
                document.getElementById(txthid + 'tr4').style.display ="none";
            }
        }
        function EnablePayableOtions()
        {
            var txthid=document.getElementById('txtRadId').value + "_";
            var oOption = document.getElementById('drplumsumswitch');
            var strOptions = oOption.options[oOption.selectedIndex].text;
            var drplumsum = document.getElementById(txthid + 'drplumsum');
            
            selectByValue(drplumsum,document.getElementById(txthid + 'drpaddtype').value);
            
            var intdex = drplumsum.selectedIndex;
            var txt = drplumsum.options[intdex].text;
            document.getElementById('txtLumSum').value= txt;
            var strCompare = "," + document.getElementById('txtLumSum').value + ","; 
            
            if (strOptions.indexOf(strCompare) >= 0)
            {
                document.getElementById(txthid + 'tr1').style.display ="block";
                document.getElementById(txthid + 'tr2').style.display ="block";
                document.getElementById(txthid + 'tr3').style.display ="block";
                document.getElementById(txthid + 'tr4').style.display ="none";
                var oSwitch = document.getElementById(txthid + 'drpiras_approval');
                oSwitch.selectedIndex = 0;
            }
            else
            {
                document.getElementById(txthid + 'txtbasis_arriving_payment').value ="";
                document.getElementById(txthid + 'txtservice_length').value ="";
                document.getElementById(txthid + 'tr1').style.display ="none";
                document.getElementById(txthid + 'tr2').style.display ="none";
                document.getElementById(txthid + 'tr3').style.display ="none";
                document.getElementById(txthid + 'tr4').style.display ="none";
                var oSwitch = document.getElementById(txthid + 'drpiras_approval');
                oSwitch.selectedIndex = 0;
            }
        }        
    </script>

             <%--   <script language="JavaScript1.2"> 
                    <!-- 

                    if (document.all)
                    window.parent.defaultconf=window.parent.document.body.cols
                    function expando(){
                    window.parent.expandf()

                    }
                    document.ondblclick=expando 

                    -->
                </script>--%>
                
           
          </radG1:RadCodeBlock>
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
                        <table cellpadding="0" cellspacing="0" width="100%" border="0" Height="32px" background="../frames/images/toolbar/backs.jpg">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                        <tr>
                                            <td>
                                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Payroll Additions</b></font>
                                            </td>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                                    <tr>
                                                        <td align="right">
                                                            <tt class="bodytxt" style="color:White;">Search:</tt></td>
                                                        <td>
                                                        <%--    <asp:DropDownList ID="cmbYear" runat="server" Style="width: 65px" CssClass="textfields"
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
                                                                       runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbYear_SelectedIndexChanged">
                                                               </asp:DropDownList>
                                                               <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                                                
                                                            
                                                         </td>
                                                        <td align="right">
                                                            <tt class="bodytxt" style="color:White;">Employee:</tt>
                                                        </td>
                                                        <td>
                                                            <%--<asp:DropDownList ID="drpemp" runat="server" Width="156px" CssClass="textfields">
                                                            </asp:DropDownList>--%>
                                                            <radG:RadComboBox ID="RadComboBoxPrjEmp" runat="server" OnItemsRequested="RadComboBoxEmpPrj_ItemsRequested"
                                                                AutoPostBack="true" EnableLoadOnDemand="true" HighlightTemplatedItems="true"
                                                                EmptyMessage="Select Employees" OnSelectedIndexChanged="RadComboBoxPrjEmp_SelectedIndexChanged"
                                                                DropDownWidth="375px" Width="150px" Height="200px"  >
                                                                <HeaderTemplate>
                                                                    <table style="width: 350px" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <%--<td style="width: 20px">
                                                                                Select
                                                                            </td>--%>
                                                                            <td style="width: 120px; font-family:Tahoma;font-size:12px;">
                                                                                Emp Name</td>
                                                                            <td style="width: 80px;font-family:Tahoma;font-size:12px;">
                                                                                Card No</td>
                                                                            <td style="width: 80px;font-family:Tahoma;font-size:12px;">
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
                                                                            <td style="width: 120px;font-family:Tahoma;font-size:12px;">
                                                                                <%# DataBinder.Eval(Container, "Text")%>
                                                                            </td>
                                                                            <td style="width: 80px;font-family:Tahoma;font-size:12px;">
                                                                                <%# DataBinder.Eval(Container, "Attributes['Time_Card_No']")%>
                                                                            </td>
                                                                            <td style="width: 80px;font-family:Tahoma;font-size:12px;">
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
                                </td>
                            </tr>
                        </table>
                        <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                            border="0">
                            <asp:XmlDataSource ID="XmldtTaxPayableTypeLumSumSwtich" runat="server" DataFile="~/XML/xmldata.xml"
                                XPath="SMEPayroll/Tax/TaxPayableTypeLumSumSwtich"></asp:XmlDataSource>
                            <tr style="display: none;">
                                <td>
                                    <asp:DropDownList ID="drplumsumswitch" DataTextField="text" DataValueField="id" DataSourceID="XmldtTaxPayableTypeLumSumSwtich"
                                        class="textfields" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lblerror" runat="server" ForeColor="red"></asp:Label>
                        <br />
                        <!-- top end -->
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadPane>
            <telerik:RadPane ID="gridPane2" runat="server" Width="100%" Height="100%" Scrolling="None"
                BorderWidth="0px">
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
                
                
                        <%-- DataSourceID="SqlDataSource2"--%>
                <radG:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="true" OnItemDataBound="RadGrid1_ItemDataBound"
                    OnUpdateCommand="RadGrid1_UpdateCommand" OnDeleteCommand="RadGrid1_DeleteCommand"
                    OnInsertCommand="RadGrid1_InsertCommand"  Skin="Outlook" Width="100%" 
                    OnNeedDataSource="RadGrid1_NeedDataSource"
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
                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="trx_id,id" CommandItemDisplay="Bottom" TableLayout="Auto" PagerStyle-Mode="Advanced">
                          <FilterItemStyle HorizontalAlign="left" />
                          <HeaderStyle ForeColor="Navy" Height="25px" />
                          <AlternatingItemStyle BackColor="#E5E5E5" Height="25px" VerticalAlign="middle" Wrap="false" />
                          <ItemStyle Height="25px" VerticalAlign="middle" Wrap="false"  />
                        <Columns>
                            
                            <radG:GridBoundColumn DataField="emp_code" Visible="false" HeaderText="Code" SortExpression="emp_code"
                                UniqueName="emp_code">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn Display="false" DataField="emp_name" AllowFiltering="false"
                                HeaderText="Emp Name" SortExpression="emp_name" UniqueName="emp_name">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="trx_id" DataType="System.Int32" HeaderText="Id"
                                ReadOnly="True" SortExpression="trx_id" Visible="False" UniqueName="trx_id">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="desc" HeaderText="(100)Description" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="contains" ReadOnly="True" SortExpression="desc" UniqueName="Type" ShowFilterIcon="false"  >
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="id" HeaderText="id" ReadOnly="True" SortExpression="Type"
                                Visible="False" UniqueName="Type1">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="trx_amount" AllowFiltering="false" DataType="System.Decimal"
                                HeaderText="Amount" SortExpression="trx_amount" UniqueName="trx_amount">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="trx_period" AllowFiltering="false" DataType="System.DateTime"
                                HeaderText="Period" SortExpression="trx_period" UniqueName="trx_period">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="cpf" AllowFiltering="false" DataType="System.string"
                                HeaderText="Cpf" SortExpression="cpf" UniqueName="cpf">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="iras_approval_date" AllowFiltering="false" DataType="System.string"
                                HeaderText="Approval Date" UniqueName="iras_approval_date">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="additionsforyear" AllowFiltering="false" DataType="System.string"
                                HeaderText="Additions For Year"  SortExpression="additionsforyear"
                                UniqueName="additionsforyear">
                                <%--ItemStyle-Width="100px"--%>
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="optionselection" AllowFiltering="false" Visible="true"
                                HeaderText="Type" UniqueName="optionselection">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="RecStatus" AllowFiltering="false" Visible="true"
                                HeaderText="Status" UniqueName="RecStatus">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="basis_arriving_payment" AllowFiltering="false" DataType="System.string"
                                UniqueName="basis_arriving_payment" HeaderText="Basis" Display="false">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="service_length" AllowFiltering="false" DataType="System.string"
                                UniqueName="service_length" HeaderText="Service" Display="false">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="iras_approval" AllowFiltering="false" DataType="System.string"
                                UniqueName="iras_approval" HeaderText="IRAS Appr" Display="False">
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
                        <EditFormSettings UserControlName="addition.ascx" EditFormType="WebUserControl" >
                        </EditFormSettings>
                        <CommandItemSettings AddNewRecordText="Add New Addition" />
                    </MasterTableView>
                     <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                     <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True"  />
                      </ClientSettings>
                    
                </radG:RadGrid>
          
                <!-- gid end -->
            </telerik:RadPane>
        </telerik:RadSplitter>
        <!-------------------- end -------------------------------------->
        
        
          <%--        <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="sp_emppay_add"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadComboBoxPrjEmp" Name="empcode" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="empmonth" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="cmbYear" Name="empyear" PropertyName="SelectedValue"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>--%>
        <input type="hidden" runat="server" id="txtRadId" />
        <input type="hidden" runat="server" id="txtLumSum" />
        
    </form>
</body>
</html>
