<%@ Page Language="C#" AutoEventWireup="true" Codebehind="SubmitPayroll.aspx.cs" Inherits="SMEPayroll.Payroll.SubmitPayroll" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Import Namespace="SMEPayroll" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />
    <link rel="stylesheet" href="../style/MenuStyle.css" type="text/css" />
    <script type="text/javascript" language="javascript">
	    function disablenow(mthis)
	    {
	        //mthis.disabled=true;
	       // alert('You will receive an email for the selected employees with the DOC NO: '+ document.getElementById('hiddenrand').value);
		}
	
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
<body  style="margin-left: auto; margin: 0px; height: 100%; overflow: hidden;" >
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server" ScriptMode="release" AsyncPostBackTimeout="1000000" >
           <Scripts>
                <asp:ScriptReference Path="Init.js" />
            </Scripts>
        </radG:RadScriptManager>
      
            <!-- ToolBar -->
          <radG:RadCodeBlock ID="RadCodeBlock3" runat="server">
            <script type="text/JavaScript" language="JavaScript">
        //http://msdn.microsoft.com/en-us/library/bb386518.aspx
//        function pageLoad() {
//            var manager = Sys.WebForms.PageRequestManager.getInstance();
//           // manager.add_beginRequest(OnBeginRequest);
//            manager.add_endRequest(endRequest);
//        }
//        function OnBeginRequest(sender, args) {
//            var postBackElement = args.get_postBackElement();
//            if (postBackElement.id == 'imgbtnfetch') {
//                 document.getElementById("imgbtnfetch").disabled = true;
//                document.getElementById("lblLoading").innerHTML = "Processing Payroll...";
//            }
//            
//        }

//        function endRequest(sender, args) {
//            alert("sfsdfsfs");
//            Resize();
            //alert("unloading");
//            document.getElementById("imgbtnfetch").disabled = false;
//            document.getElementById("lblLoading").innerHTML = "";
            }
//            //error handling
//             if( args.get_error() )
//             {   
//                //document.getElementById("lblLoading").innerHTML =  args.get_error().description;
//                // args.set_errorHandled( true );
//                document.getElementById("lblLoading").innerHTML ="Please refresh and try again..";             
//                     
//             }
          
            </script>
               <!-- to fix sys is undefines -->
          <script type="text/javascript">
//              Sys.WebForms.PageRequestManager.getInstance().add_endRequest(End);
//              function End(sender, args) { }
            </script>
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
              
                 //125=(dedecting other height like menu and footer)
                   var myHeight = document.body.clientHeight; 
                   myHeight =myHeight - 130;
                   document.getElementById('<%= RadGrid1.ClientID %>').style.height=myHeight;
              
//                if( screen.height > 768)
//                {
//                   //"90.7%";
//                    //document.getElementById('<%= RadGrid1.ClientID %>').style.height="86%";
//                 }
//                else
//                {
//                   //alert("2");
//                    //document.getElementById('<%= RadGrid1.ClientID %>').style.height="85.5%";
//                    document.getElementById('<%= RadGrid1.ClientID %>').style.height="79%";
//                }
              }
            
            </script>

         </radG:RadCodeBlock>
         <!-- ToolBar End -->
        

    <uc1:TopRightControl ID="TopRightControl1" runat="server"   />
    <!------------------------------ start ---------------------------------->

        <telerik:RadSplitter ID="RadSplitter1" Width="100%" Height="100%" runat="server"  
            Orientation="Horizontal" BorderSize="0" BorderStyle="None" PanesBorderSize="0"  BorderWidth="0px"  >
            <telerik:RadPane ID="Radpane1" runat="server" Scrolling="none" Height="32px" Width="100%"   MaxHeight="100" >
               
                        <!-- top -->
                        <table cellpadding="0" cellspacing="0"  width="100%"  border="0" background="../frames/images/toolbar/backs.jpg"  Height="32px">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                        <tr>
                                            <td>
                                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Submit Payroll</b></font>
                                            </td>
                                            <td align="center"  >
                                                <tt class="bodytxt" style="color:White;">Year :</tt>
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
                                                     <asp:DropDownList Width="100px"  OnDataBound="deptID_databound"  CssClass="textfields"
                                                        ID="deptID" DataTextField="DeptName" DataValueField="ID" DataSourceID="SqlDataSource3"
                                                        runat="server" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                &nbsp;<tt><asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid" 
                                                    runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                                                </tt>
                                            </td>
                                            <td> <%--onclick="return btndetail_onclick()"--%>
                                                <input type="button"  runat="server" id="btndetail" class="textfields" onclick="showreport(this);"
                                                 value="Summary Rpt" />
                                            </td>
                                            <td>
                                                 <input type="button" ID="btnPayrollDetail" class="textfields" 
                                                    Width="70px" value="Detail Rpt" onclick="showPayrollDetails(this);"
                                                    runat="server" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnPayroll" CssClass="textfields" Width="100px" Text="View All Payslips"
                                        OnClick="btnPayroll_Click" runat="server"></asp:Button>
                                            </td>
                                            <td align="center" class="bodytxt" style="color:Red;font-size:10px; font-weight:bold;" ><asp:Label ID="lblLoading" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
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
                                    function DisableButton() {
                                        document.getElementById("<%=btnsubapprove.ClientID %>").disabled = true;
                                    }
                                    window.onbeforeunload = DisableButton;
                                    
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
                                        var month           = document.getElementById('cmbMonth').value;
                                        var year            = document.getElementById('cmbYear').value;
                                        var res             = SMEPayroll.Payroll.SubmitPayroll.btndetail_Click(month, year);
                                        window.open(res.value, '_blank', '');
                                        return false;
                                    }
                                    
                                    function showpayroll(e)
                                    {
                                        var month           = document.getElementById('cmbMonth').value;
                                        var year            = document.getElementById('cmbYear').value;
                                        var res             = SMEPayroll.Payroll.SubmitPayroll.btnPayroll_Click(month, year);
                                        window.open(res.value, '_blank', '');
                                        return false;
                                    }
                                    
                                      function showPayrollDetails(e) {
                                                var month = document.getElementById('cmbMonth').value;
                                                var year = document.getElementById('cmbYear').value;
                                                var res = SMEPayroll.Payroll.SubmitPayroll.btnPayrollDetail_Click(month, year);
                                                window.open(res.value, '_blank', '');
                                                return false;
                                            }


                                    
                                  function ShowInsert(row)
                                  {          
                                    window.radopen(row, "DetailGrid");
                                    return false;
                                  }

                                  function ShowInsertForm(row)
                                  {          
                            //        var month = document.getElementById('cmbMonth').value;
                            //        var year = document.getElementById('cmbYear').value;
                            //        var rowVal =RadGrid1.MasterTableView.GetCellByColumnUniqueName(RadGrid1.MasterTableView.Rows[row], "Emp_Code").innerHTML; 
                            //        window.radopen("EmployeePayReport.aspx"+"?qsEmpID="+rowVal+"&qsMonth="+month+"&qsYear="+year, "DetailGrid");
                                    return false;
                                  }

                                        </script>

                                    </asp:PlaceHolder>
                                       
                        <!-- top end -->
                                
            </telerik:RadPane>
            <telerik:RadPane  ID="gridPane2" runat="server" Width="100%" Height="100%"   Scrolling="None" BorderWidth="0px">
                             <!-- grid -->
                             
                             <radG:RadToolBar  ID="tbRecord" runat="server" Width="100%" Skin="Office2007" UseFadeEffect="True"  Height="30px"
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
                             
                            <radG:RadGrid ID="RadGrid1"  AllowPaging="true" PageSize="50" runat="server" 
                            AllowMultiRowSelection="true" Skin="Outlook" Width="100%" AutoGenerateColumns="False"
                            AllowFilteringByColumn="True" OnItemDataBound="RadGrid1_ItemDataBound" 
                            EnableHeaderContextMenu="true"   
                            Height="500px"
                            ItemStyle-Wrap="false"
                            AlternatingItemStyle-Wrap="false"
                            PagerStyle-AlwaysVisible="True" 
                            GridLines="Both" 
                            AllowSorting="true"  
                            OnItemCreated="RadGrid1_ItemCreated"
                            OnGridExporting="RadGrid1_GridExporting"
                            Font-Size="11"
                            Font-Names="Tahoma" 
                            HeaderStyle-Wrap="false"    
                             >
                            <MasterTableView DataKeyNames="FullName,Emp_Code,Basic,Netpay,TotalAdditions,TotalDeductions,
                                            Hourly_Rate,OT1Rate,OT2Rate,NHHrs,OT1Hrs, OT2Hrs,NH,OT1,OT2,Days_Work,DeptName,
                                            OT ,CPFOrdinaryCeil,CPFAdditionNet ,CPFGross ,EmployeeCPFAmt ,EmployerCPFAmt ,CPFAmount,
                                            CPF ,EmpCPFtype ,PRAge ,CPFCeiling ,FundType , FundAmount,UnPaidLeaves,TotalUnPaid,ActualBasic,Pay_Mode,EmployeeGiro,EmployerGiro,GiroBank,FundGrossAmount,GrossWithAddition, CPFCeiling, SDLFundGrossAmount, CMOW,LYOW,CYOW,CPFAWCIL,EST_AWCIL,ACTCIL,AWCM,AWB4CM,AWCM_AWB4CM,AWSUBJCPF,time_card_no,SDF_REQUIRED, PayProcessFH,Daily_Rate,DaysWorkedRate"
                                DataSourceID="SqlDataSource1" TableLayout="Auto" PagerStyle-Mode="Advanced">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy"  Wrap="false" Height="25px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="25px" VerticalAlign="middle" />
                                <ItemStyle Height="25px" VerticalAlign="middle" />
                                <Columns>
                                    <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn" HeaderText="103">
                                        <ItemTemplate>
                                            <asp:Image ID="Image2" ImageUrl="../frames/images/EMPLOYEE/Grid- employee.png" runat="Server" />
                                        </ItemTemplate>
                                       <%-- <ItemStyle Width="2px" />--%>
                                       <HeaderStyle Width="50px" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridClientSelectColumn UniqueName="GridClientSelectColumn">
                                    <%--<ItemStyle Width="2px" />--%>
                                    <HeaderStyle Width="50px" />
                                    </radG:GridClientSelectColumn>
                                    <radG:GridBoundColumn DataField="Emp_Code" Display="false" HeaderText="Employee Code"
                                        SortExpression="Emp_Code" ReadOnly="True" UniqueName="Emp_Code">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="FullName" AutoPostBackOnFilter="true" CurrentFilterFunction="contains"
                                        HeaderText="Employee Name" SortExpression="FullName" ReadOnly="True" UniqueName="FullName" ShowFilterIcon="False"  ItemStyle-Wrap="false"  HeaderStyle-Wrap="false" HeaderStyle-Width="200px">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="OT2Rate" HeaderText="OT2Rate" SortExpression="OT2Rate"
                                        UniqueName="OT2Rate">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="DeptName" AutoPostBackOnFilter="true" CurrentFilterFunction="contains"
                                        HeaderText="Department" SortExpression="DeptName" UniqueName="DeptName" ShowFilterIcon="False" ItemStyle-Wrap="false" >
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="Hourly_Rate" HeaderText="NHRate"
                                        SortExpression="Hourly_Rate" UniqueName="Hourly_Rate">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="OT1Rate" HeaderText="OT1Rate" SortExpression="OT1Rate"
                                        UniqueName="OT1Rate">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="NHHrs" HeaderText="NHHrs" SortExpression="NHHrs"
                                        UniqueName="NHHrs">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="OT1Hrs" HeaderText="OT1Hrs" SortExpression="OT1Hrs"
                                        UniqueName="OT1Hrs">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="OT2Hrs" HeaderText="OT2Hrs" SortExpression="OT2Hrs"
                                        UniqueName="OT2Hrs">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="Days_Work" HeaderText="Days_Work"
                                        SortExpression="Days_Work" UniqueName="Days_Work">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="OT" HeaderText="OT" SortExpression="OT"
                                        UniqueName="OT">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="CPF" HeaderText="CPF" SortExpression="CPF"
                                        UniqueName="CPF">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="CPFOrdinaryCeil" HeaderText="CPFOrdinaryCeil"
                                        SortExpression="CPFOrdinaryCeil" UniqueName="CPFOrdinaryCeil">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="CPFAdditionNet" HeaderText="CPFAdditionNet"
                                        SortExpression="CPFAdditionNet" UniqueName="CPFAdditionNet">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="EmployeeCPFAmt" HeaderText="EmployeeCPFAmt"
                                        SortExpression="EmployeeCPFAmt" UniqueName="EmployeeCPFAmt">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="EmployerCPFAmt" HeaderText="EmployerCPFAmt"
                                        SortExpression="EmployerCPFAmt" UniqueName="EmployerCPFAmt">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="CPFAmount" HeaderText="CPFAmount"
                                        SortExpression="CPFAmount" UniqueName="CPFAmount">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="PRAge" HeaderText="PRAge" SortExpression="PRAge"
                                        UniqueName="PRAge">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="FundType" HeaderText="FundType"
                                        SortExpression="FundType" UniqueName="FundType">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="FundAmount" HeaderText="FundAmount"
                                        SortExpression="FundAmount" UniqueName="FundAmount">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn AllowFiltering="False" DataField="Basic" HeaderText="Basic Pay"
                                        SortExpression="Basic" UniqueName="Basic"  ItemStyle-Wrap="false">
                                       <%-- Width="70px"--%> 
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="RIGHT" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn AllowFiltering="False" DataField="TotalAdditionsWONH" HeaderText="Additions"
                                        SortExpression="TotalAdditionsWONH" UniqueName="TotalAdditionsWONH">
                                        <ItemStyle HorizontalAlign="right" />
                                        <HeaderStyle HorizontalAlign="RIGHT" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" AllowFiltering="False" DataField="TotalAdditions"
                                        HeaderText="Additions" SortExpression="TotalAdditions" UniqueName="TotalAdditions">
                                        <ItemStyle HorizontalAlign="right" />
                                        <HeaderStyle HorizontalAlign="RIGHT" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn AllowFiltering="False" DataField="NH" HeaderText="NH" SortExpression="NH"
                                        UniqueName="NH">
                                        <%--Width="50px"--%>
                                        <ItemStyle  HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="RIGHT" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn AllowFiltering="False" DataField="OT1" HeaderText="OT1" SortExpression="OT1"
                                        UniqueName="OT1">
                                      <%--  Width="50px"--%>
                                        <ItemStyle  HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="RIGHT" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn AllowFiltering="False" DataField="OT2" HeaderText="OT2" SortExpression="OT2"
                                        UniqueName="OT2">
                                        <%-- Width="50px"--%>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="RIGHT" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn AllowFiltering="False" DataField="TotalDeductions" HeaderText="Deductions"
                                        SortExpression="TotalDeductions" UniqueName="TotalDeductions">
                                        <%--Width="70px"--%>
                                        <ItemStyle  HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="RIGHT" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn AllowFiltering="False" DataField="Netpay" HeaderText="Netpay"
                                        SortExpression="Netpay" UniqueName="Netpay">
                                        <%--Width="70px" --%>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="RIGHT" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="UnPaidLeaves" HeaderText="UnPaidLeaves"
                                        SortExpression="UnPaidLeaves" UniqueName="UnPaidLeaves">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="TotalUnPaid" HeaderText="TotalUnPaid"
                                        SortExpression="TotalUnPaid" UniqueName="TotalUnPaid">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="FundGrossAmount" HeaderText="FundGrossAmount"
                                        SortExpression="FundGrossAmount" UniqueName="FundGrossAmount">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="GrossWithAddition" HeaderText="GrossWithAddition"
                                        SortExpression="GrossWithAddition" UniqueName="GrossWithAddition">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="SDLFundGrossAmount" HeaderText="SDLFundGrossAmount"
                                        SortExpression="SDLFundGrossAmount" UniqueName="SDLFundGrossAmount">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="MediumURL" HeaderText="MediumURL"
                                        SortExpression="MediumURL" UniqueName="MediumURL">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="CMOW" HeaderText="" SortExpression="CMOW"
                                        UniqueName="CMOW">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="LYOW" HeaderText="" SortExpression="LYOW"
                                        UniqueName="LYOW">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="CYOW" HeaderText="" SortExpression="CYOW"
                                        UniqueName="CYOW">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="CPFAWCIL" HeaderText="" SortExpression="CPFAWCIL"
                                        UniqueName="CPFAWCIL">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="EST_AWCIL" HeaderText="" SortExpression="EST_AWCIL"
                                        UniqueName="EST_AWCIL">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="ACTCIL" HeaderText="" SortExpression="ACTCIL"
                                        UniqueName="ACTCIL">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="AWCM" HeaderText="" SortExpression="AWCM"
                                        UniqueName="AWCM">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="AWB4CM" HeaderText="" SortExpression="AWB4CM"
                                        UniqueName="AWB4CM">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="AWCM_AWB4CM" HeaderText="" SortExpression="AWCM_AWB4CM"
                                        UniqueName="AWCM_AWB4CM">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="AWSUBJCPF" HeaderText="" SortExpression="AWSUBJCPF"
                                        UniqueName="AWSUBJCPF">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" DataField="SDF_REQUIRED" HeaderText="" SortExpression="SDF_REQUIRED"
                                        UniqueName="SDF_REQUIRED">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn ShowFilterIcon="False" UniqueName="ID" HeaderText="Time Card ID"
                                        CurrentFilterFunction="contains" AutoPostBackOnFilter="true" DataField="time_card_no">
                                        <%--Width="10px"--%>
                                        <ItemStyle  />
                                        <HeaderStyle HorizontalAlign="left" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Display="false" UniqueName="PayProcessFH" DataField="PayProcessFH">
                                    </radG:GridBoundColumn>
                                    <radG:GridTemplateColumn AllowFiltering="False" HeaderText="" UniqueName="Image">
                                        <ItemTemplate>
                                            <asp:HyperLink Text="Detail" ID="Image3" runat="server"></asp:HyperLink>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
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
                                    <radG:GridBoundColumn UniqueName="ic_pp_number" HeaderText="IC/FIN Number"  DataField="ic_pp_number" Display="false"  AllowFiltering="false" >
                                    </radG:GridBoundColumn>
                                    
                                    
                                </Columns>
                            </MasterTableView>
                              <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            <Selecting AllowRowSelect="true" />
                                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="false"
                                                AllowColumnResize="True" ClipCellContentOnResize="true"   ></Resizing>
                                            <%--<Scrolling UseStaticHeaders="true" AllowScroll="true" ScrollHeight="500px" SaveScrollPosition="True"  />--%>
                                            <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="500px" SaveScrollPosition="True" />
                                        </ClientSettings>             
                           
                    </radG:RadGrid>
                    <%-- SelectCommand="Sp_DeductionPerOfGross"--%><%--SelectCommand="sp_GeneratePayRollAdv"--%>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="sp_GeneratePayRollAdv" 
                        
                        InsertCommand="sp_payroll_add" SelectCommandType="StoredProcedure" InsertCommandType="StoredProcedure"     >
                        <SelectParameters>
                            <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                            <asp:ControlParameter ControlID="cmbYear" Name="year" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:SessionParameter Name="UserID" SessionField="EmpCode" Type="Int32" /> 
                            <asp:ControlParameter ControlID="cmbMonth" Name="month" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:SessionParameter Name="stdatemonth" SessionField="PayStartDay" Type="Int32" />
                            <asp:SessionParameter Name="endatemonth" SessionField="PayEndDay" Type="Int32" />
                            <asp:SessionParameter Name="stdatesubmonth" SessionField="PaySubStartDay" Type="Int32" />
                            <asp:SessionParameter Name="endatesubmonth" SessionField="PaySubEndDay" Type="Int32" />
                            <asp:ControlParameter ControlID="cmbMonth" Name="monthidintbl" PropertyName="SelectedValue" Type="Int32" />
                             <asp:ControlParameter ControlID="deptID" Name="DeptId" PropertyName="SelectedValue"   Type="string" />                             
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Emp_Code" Type="String" />
                            <asp:Parameter Name="basic_pay" Type="Decimal" />
                            <asp:Parameter Name="overtime" Type="Decimal" />
                            <asp:Parameter Name="overtime2" Type="Decimal" />
                            <asp:Parameter Name="total_additions" Type="Decimal" />
                            <asp:Parameter Name="total_deductions" Type="Decimal" />
                            <asp:Parameter Name="status" Type="String" />                                                
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="SELECT DeptName,ID FROM dbo.DEPARTMENT WHERE COMPANY_ID= @company_id">
                    <SelectParameters>
                        <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                    </SelectParameters>
                    </asp:SqlDataSource>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" background="../frames/images/toolbar/backs.jpg"  Height="32px" id="TabId" runat="server"  >
                        <tr>
                            <td  class="colheading"><b>Action:</b></td>
                            <td style="width:80%;color:White;" >
                                <tt class="bodytxt">Please make sure that you have settled all the leaves, additions,deductions
                                for above listed employees.<br />
                                
                                Once the payroll is approved, ALL Transactions will be locked for security reasons
                                (For Example: Leaves,Additions,Deductions) </tt>
                            </td>
                            <td align="left">
                             
                                    <asp:Button ID="btnsubapprove" OnClick="btnsubapprove_click"  
                                     runat="server" Text="Submit for approval" class="textfields" Style="width: 180px;
                                     height: 22px" />
                                
                            </td>
                        </tr>
                    </table>
            <!-- End grid -->  
            </telerik:RadPane>
 
        </telerik:RadSplitter>
 
     
     <!-------------------- end -------------------------------------->  
      
       
    <asp:Label ID="dataexportmessage" runat="server" Visible="false" ForeColor="red"
        CssClass="bodytxt">No Records to export!</asp:Label>
           
        
           
           
        <radW:RadWindowManager ID="RadWindowManager1" runat="server">
            <Windows>
                <radW:RadWindow ID="DetailGrid" runat="server" Title="User List Dialog" Top="10px"
                    Height="740px" Width="960px" Left="20px" Modal="true" />
            </Windows>
        </radW:RadWindowManager>
        <!-- IF GENERAL SOLUTION :- USE sp_GeneratePayRoll -->
        <!-- IF BIOMETREICS :- USE sp_GeneratePayRoll_TimeSheet -->
        <!-- IF CLVAVON :- USE [sp_GeneratePayRoll_Clavon] -->
        <!-- Gap to fill the bottom -->
        <!-- footer -->
        
        
    </form>
</body>
</html>
