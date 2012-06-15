<%@ Page Language="C#" AutoEventWireup="true" Codebehind="CustomReportMainPage.aspx.cs"
    Inherits="SMEPayroll.Reports.CustomReportMainPage" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>SMEPayroll</title>
    
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
    
    <script language="javascript" src="../Frames/Script/jquery-1.3.2.min.js"></script>
        
    <script language="javascript"  type="text/javascript"  src="../Frames/Script/CommonValidations.js" >
    </script>
    
    <script type="text/javascript" language="javascript">  
        function Validate()
        {
            //Application date 
            var strirmsg="";
            var sMSG="";            
            strirmsg = CompareDate(document.employeeform.dtp1.value,document.employeeform.dtp2.value,
                    "Start Date Can not be greater than End Date\n","");
            if(strirmsg!="")
                sMSG += strirmsg;
            
            if (sMSG == "")
            {
	            return true;
            }
            else
            {
	            alert(sMSG); 
	            return false;
            }
        }
        function Validate_Add()
        {
            //Application date 
            var strirmsg="";
            var sMSG="";        
            strirmsg = CompareDate(document.employeeform.RadDatePicker1.value,document.employeeform.RadDatePicker2.value,
                    "Start Date Can not be greater than End Date\n","");
            if(strirmsg!="")
                sMSG += strirmsg;
                            
            if (sMSG == "")
            {
	            return true;
            }
            else
            {
	            alert(sMSG); 
	            return false;
            }
        }
        
        function Validate_Ded()
        {
            //Application date 
            var strirmsg="";
            var sMSG="";        
            strirmsg = CompareDate(document.employeeform.RadDatePicker5.value,document.employeeform.RadDatePicker6.value,
                    "Start Date Can not be greater than End Date\n","");
            if(strirmsg!="")
                sMSG += strirmsg;
                            
            if (sMSG == "")
            {
	            return true;
            }
            else
            {
	            alert(sMSG); 
	            return false;
            }
        }
        
        
        function Validate_Claims()
        {
            //Application date 
            var strirmsg="";
            var sMSG="";        
            strirmsg = CompareDate(document.employeeform.RadDatePicker7.value,document.employeeform.RadDatePicker8.value,
                    "Start Date Can not be greater than End Date\n","");
            if(strirmsg!="")
                sMSG += strirmsg;
                            
            if (sMSG == "")
            {
	            return true;
            }
            else
            {
	            alert(sMSG); 
	            return false;
            }
        }
        
        function Validation()
        {
            var cb1 = document.getElementById("cmbFromMonth");
            var cb2 = document.getElementById("cmbToMonth");
            
            if(cb1.options[cb1.selectedIndex].value==cb2.options[cb2.selectedIndex].value)
            {
                alert("Please Select Different Months to Compare");
                return false;
            }
            else
            {
                return true;
            }
        }
        
    </script>

    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />
    <style type="text/css">
    INPUT {
    FONT-SIZE: 8pt;	
    FONT-FAMILY: Tahoma
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
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Custom Report Writer</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td align="center">
                                <asp:Label ID="lblerror" Text="" ForeColor="red" runat="server"></asp:Label>
                            </td>
                            <td align="right" style="height: 25px">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div class="exampleWrapper">
            <telerik:RadTabStrip ID="tbsComp" runat="server" SelectedIndex="4" MultiPageID="tbsCompany"
                Style="float: left">
                <Tabs>
                    <radG:RadTab TabIndex="1" runat="server" AccessKey="E" Text="&lt;u&gt;E&lt;/u&gt;mployee"
                        PageViewID="tbsEmp">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="2" runat="server" AccessKey="P" Text="&lt;u&gt;P&lt;/u&gt;ayroll"
                        PageViewID="tbsPay">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="3" runat="server" AccessKey="A" Text="&lt;u&gt;A&lt;/u&gt;dditions"
                        PageViewID="tbsAdditions">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="4" runat="server" AccessKey="D" Text="&lt;u&gt;D&lt;/u&gt;eductions"
                        PageViewID="tbsDeductions">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="5" runat="server" AccessKey="C" Text="&lt;u&gt;C&lt;/u&gt;laims"
                        PageViewID="tbsClaims" Selected="True">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="6" runat="server" AccessKey="G" Text="&lt;u&gt;G&lt;/u&gt;rouping"
                        PageViewID="tbsGroups">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="7" runat="server" AccessKey="L" Text="&lt;u&gt;L&lt;/u&gt;eaves"
                        PageViewID="tbsLeaves">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="8" runat="server" AccessKey="T" Text="&lt;u&gt;T&lt;/u&gt;imesheet"
                        PageViewID="tbsTimesheet">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="9" runat="server" AccessKey="K" Text="Email Trac&lt;u&gt;k&lt;/u&gt;ing"
                        PageViewID="tbsEmail">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="10" runat="server" AccessKey="X" Text="E&lt;u&gt;x&lt;/u&gt;piry"
                        PageViewID="tbsExpiry" Selected="True">
                    </radG:RadTab>
                     <radG:RadTab TabIndex="11" runat="server" AccessKey="X" Text="Variance"
                        PageViewID="tbsCompliance" Selected="True">
                    </radG:RadTab>
                     <radG:RadTab TabIndex="12" runat="server" AccessKey="N" Text="TimeSheetPayment"
                        PageViewID="tbsTsPay" Selected="True">
                    </radG:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage runat="server" ID="tbsCompany" SelectedIndex="4" Width="95%"
                Height="480px" CssClass="multiPage">
                <telerik:RadPageView class="tbl" runat="server" ID="tbsEmp" Height="480px" Width="100%">
                    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                        <tr bgcolor="<%=sOddRowColor%>">
                            <td style="width: 49%" align="center" class="bodytxt">
                                Please Select Department :
                                <asp:DropDownList CssClass="bodytxt" ID="dlDept" OnDataBound="dlDept_databound" OnSelectedIndexChanged="dlDept_selectedIndexChanged"
                                    AutoPostBack="true" DataValueField="id" DataTextField="DeptName" DataSourceID="SqlDataSource4"
                                    runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 2%" align="center" class="bodytxt">
                            </td>
                            <td style="width: 49%" align="center" class="bodytxt">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid1" runat="server" Visible="false" GridLines="None" Skin="Outlook"
                                    Width="100%" AllowFilteringByColumn="True" AllowMultiRowSelection="True">
                                    <MasterTableView AllowAutomaticUpdates="True" Visible="false" AutoGenerateColumns="False"
                                        DataKeyNames="Emp_Code">
                                        <FilterItemStyle HorizontalAlign="Left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="Emp_Code" DataType="System.Int32"
                                                UniqueName="Emp_Code" SortExpression="Emp_Code" HeaderText="Emp_Code">
                                            </radG:GridBoundColumn>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn DataField="Name" AutoPostBackOnFilter="True" UniqueName="Name"
                                                SortExpression="Name" HeaderText="Employee Name">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" />
                                        <Scrolling EnableVirtualScrollPaging="true" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid2" runat="server" GridLines="None" Skin="Outlook" Width="100%"
                                    AllowFilteringByColumn="true" AllowMultiRowSelection="true">
                                    <MasterTableView AllowAutomaticUpdates="True" AutoGenerateColumns="False" DataKeyNames="ALIAS_NAME,RELATION">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn Display="true" ReadOnly="True" DataField="ALIAS_NAME" DataType="System.String"
                                                UniqueName="ALIAS_NAME" Visible="true" SortExpression="ALIAS_NAME" HeaderText="Option Name">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="RELATION" DataType="System.String" AllowFiltering="true"
                                                AutoPostBackOnFilter="true" UniqueName="RELATION" Visible="false" SortExpression="RELATION"
                                                HeaderText="RELATION">
                                                <ItemStyle HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="true">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="true" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="trstandtop" colspan="3">
                                <asp:Button ID="generateRpt" Text="Generate Report" OnClick="GenerateRpt_Click"  runat="server" />
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsPay" Height="480px" Width="100%">
                    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                        <tr bgcolor="<%=sOddRowColor%>">
                            <td style="width: 49%" align="center" class="bodytxt">
                                Please Select Department :
                                <asp:DropDownList CssClass="bodytxt" ID="ddlPayDept" OnDataBound="dlDept_databound"
                                    OnSelectedIndexChanged="dlDept_selectedIndexChanged" AutoPostBack="true" DataValueField="id"
                                    DataTextField="DeptName" DataSourceID="SqlDataSource4" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 2%" align="center" class="bodytxt">
                            </td>
                            <td style="width: 49%" align="center" class="bodytxt">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid3" runat="server" GridLines="None" Visible="false" Skin="Outlook"
                                    Width="100%" AllowFilteringByColumn="True" AllowMultiRowSelection="True">
                                    <MasterTableView AllowAutomaticUpdates="True" Visible="false" AutoGenerateColumns="False"
                                        DataKeyNames="Emp_Code">
                                        <FilterItemStyle HorizontalAlign="Left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="Emp_Code" DataType="System.Int32"
                                                UniqueName="Emp_Code" SortExpression="Emp_Code" HeaderText="Emp_Code">
                                            </radG:GridBoundColumn>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn DataField="Name" AutoPostBackOnFilter="True" UniqueName="Name"
                                                SortExpression="Name" HeaderText="Employee Name">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid4" runat="server" GridLines="None" Skin="Outlook" Width="100%"
                                    AllowFilteringByColumn="true" AllowMultiRowSelection="true">
                                    <MasterTableView AllowAutomaticUpdates="True" AutoGenerateColumns="False" DataKeyNames="ALIAS_NAME,RELATION">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn Display="true" ReadOnly="True" DataField="ALIAS_NAME" DataType="System.String"
                                                UniqueName="ALIAS_NAME" Visible="true" SortExpression="ALIAS_NAME" HeaderText="Option Name">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="RELATION" DataType="System.String" AllowFiltering="true"
                                                AutoPostBackOnFilter="true" UniqueName="RELATION" Visible="false" SortExpression="RELATION"
                                                HeaderText="RELATION">
                                                <ItemStyle HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="true">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="true" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                        </tr>
                        <tr>
                            <td class="bodytxt" style="width: 49%">
                                Select From Date:
                                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" ID="dtp1" runat="server">
                                    <DateInput Skin="" DisplayDateFormat="dd-MM-yyyy">
                                    </DateInput>
                                </radCln:RadDatePicker>
                                <asp:RequiredFieldValidator ID="rfvdtp1" ValidationGroup="ValidationSummary1" runat="server"
                                    ControlToValidate="dtp1" Display="None" ErrorMessage="Please Enter Start date."
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td class="bodytxt" style="width: 49%">
                                Select End Date:
                                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" ID="dtp2" runat="server">
                                    <DateInput Skin="" DisplayDateFormat="dd-MM-yyyy">
                                    </DateInput>
                                </radCln:RadDatePicker>
                                <asp:RequiredFieldValidator ID="rfvdtp2" ValidationGroup="ValidationSummary1" runat="server"
                                    ControlToValidate="dtp2" Display="None" ErrorMessage="Please Enter End date."
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="trstandtop" colspan="3">
                                <asp:Button ID="Button1" Text="Generate Payroll Report" OnClick="GeneratePayroll_Click" OnClientClick="return Validate()"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsAdditions" Height="480px"
                    Width="100%">
                    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                        <tr bgcolor="<%=sOddRowColor%>">
                            <td style="width: 49%" align="center" class="bodytxt">
                                Please Select Department :
                                <asp:DropDownList CssClass="bodytxt" ID="dlAdditions" OnDataBound="dlDept_databound"
                                    OnSelectedIndexChanged="dlDept_selectedIndexChanged" AutoPostBack="true" DataValueField="id"
                                    DataTextField="DeptName" DataSourceID="SqlDataSource4" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 2%" align="center" class="bodytxt">
                            </td>
                            <td style="width: 49%" align="center" class="bodytxt">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid5" runat="server" GridLines="None" Visible="false" Skin="Outlook"
                                    Width="100%" AllowFilteringByColumn="True" AllowMultiRowSelection="True">
                                    <MasterTableView AllowAutomaticUpdates="True" Visible="false" AutoGenerateColumns="False"
                                        DataKeyNames="Emp_Code">
                                        <FilterItemStyle HorizontalAlign="Left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="Emp_Code" DataType="System.Int32"
                                                UniqueName="Emp_Code" SortExpression="Emp_Code" HeaderText="Emp_Code">
                                            </radG:GridBoundColumn>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn DataField="Name" AutoPostBackOnFilter="True" UniqueName="Name"
                                                SortExpression="Name" HeaderText="Employee Name">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid6" runat="server" GridLines="None" Skin="Outlook" Width="100%"
                                    AllowFilteringByColumn="true" AllowMultiRowSelection="true">
                                    <MasterTableView AllowAutomaticUpdates="True" AutoGenerateColumns="False" DataKeyNames="id,description">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn Display="true" ReadOnly="True" DataField="id" DataType="System.String"
                                                UniqueName="id" Visible="false" SortExpression="id" HeaderText="id">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="description" DataType="System.String" AllowFiltering="true"
                                                AutoPostBackOnFilter="true" UniqueName="description" Visible="true" SortExpression="description"
                                                HeaderText="Descriptions">
                                                <ItemStyle HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="true">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="true" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:RadioButtonList RepeatDirection="Horizontal" ID="rdAdditions"
                                    runat="server">
                                    <asp:ListItem Value="1" Selected="True">Summary</asp:ListItem>
                                    <asp:ListItem Value="2">Detail</asp:ListItem>
                                    <asp:ListItem Value="3">Summary Un-Processed</asp:ListItem>
                                    <asp:ListItem Value="4">Detail Un-Processed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="bodytxt" style="width: 49%">
                                Select Start Date:
                                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" ID="RadDatePicker1" runat="server">
                                    <DateInput Skin="" DisplayDateFormat="dd-MM-yyyy">
                                    </DateInput>
                                </radCln:RadDatePicker>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td class="bodytxt" style="width: 49%">
                                Select End Date:
                                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" ID="RadDatePicker2" runat="server">
                                    <DateInput Skin="" DisplayDateFormat="dd-MM-yyyy">
                                    </DateInput>
                                </radCln:RadDatePicker>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="trstandtop" colspan="3">
                                <asp:Button ID="generateAddRpt" Text="Generate Additions Report" OnClick="GenerateAddtions_Click" OnClientClick="return Validate_Add()"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsDeductions" Height="400px"
                    Width="100%">
                    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                        <tr bgcolor="<%=sOddRowColor%>">
                            <td style="width: 49%" align="center" class="bodytxt">
                                Please Select Department :
                                <asp:DropDownList CssClass="bodytxt" ID="dlDeptDeductions" OnDataBound="dlDept_databound"
                                    OnSelectedIndexChanged="dlDept_selectedIndexChanged" AutoPostBack="true" DataValueField="id"
                                    DataTextField="DeptName" DataSourceID="SqlDataSource4" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 2%" align="center" class="bodytxt">
                            </td>
                            <td style="width: 49%" align="center" class="bodytxt">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid9" runat="server" GridLines="None" Visible="false" Skin="Outlook"
                                    Width="100%" AllowFilteringByColumn="True" AllowMultiRowSelection="True">
                                    <MasterTableView AllowAutomaticUpdates="True" Visible="false" AutoGenerateColumns="False"
                                        DataKeyNames="Emp_Code">
                                        <FilterItemStyle HorizontalAlign="Left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="Emp_Code" DataType="System.Int32"
                                                UniqueName="Emp_Code" SortExpression="Emp_Code" HeaderText="Emp_Code">
                                            </radG:GridBoundColumn>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn DataField="Name" AutoPostBackOnFilter="True" UniqueName="Name"
                                                SortExpression="Name" HeaderText="Employee Name">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid10" runat="server" GridLines="None" Skin="Outlook" Width="100%"
                                    AllowFilteringByColumn="true" AllowMultiRowSelection="true">
                                    <MasterTableView AllowAutomaticUpdates="True" AutoGenerateColumns="False" DataKeyNames="id,description">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn Display="true" ReadOnly="True" DataField="id" DataType="System.String"
                                                UniqueName="id" Visible="false" SortExpression="id" HeaderText="id">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="description" DataType="System.String" AllowFiltering="true"
                                                AutoPostBackOnFilter="true" UniqueName="description" Visible="true" SortExpression="description"
                                                HeaderText="Description">
                                                <ItemStyle HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="true">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="true" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:RadioButtonList RepeatDirection="Horizontal" ID="rdDeductions"
                                    runat="server">
                                    <asp:ListItem Value="1" Selected="True">Summary</asp:ListItem>
                                    <asp:ListItem Value="2">Detail</asp:ListItem>
                                    <asp:ListItem Value="3">Summary Un-Processed</asp:ListItem>
                                    <asp:ListItem Value="4">Detail Un-Processed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="bodytxt" style="width: 49%">
                                Select Start Date:
                                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" ID="RadDatePicker5" runat="server">
                                    <DateInput Skin="" DisplayDateFormat="dd-MM-yyyy">
                                    </DateInput>
                                </radCln:RadDatePicker>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td class="bodytxt" style="width: 49%">
                                Select End Date:
                                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" ID="RadDatePicker6" runat="server">
                                    <DateInput Skin="" DisplayDateFormat="dd-MM-yyyy">
                                    </DateInput>
                                </radCln:RadDatePicker>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="trstandtop" colspan="3">
                                <asp:Button ID="Button4" Text="Generate Deductions Report" OnClick="GenerateDeductions_Click" OnClientClick="return Validate_Ded()"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsClaims" Height="480px" Width="100%">
                    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                        <tr bgcolor="<%=sOddRowColor%>">
                            <td style="width: 49%" align="center" class="bodytxt">
                                Please Select Department :
                                <asp:DropDownList CssClass="bodytxt" ID="dlClaimsDept" OnDataBound="dlDept_databound"
                                    OnSelectedIndexChanged="dlDept_selectedIndexChanged" AutoPostBack="true" DataValueField="id"
                                    DataTextField="DeptName" DataSourceID="SqlDataSource4" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 2%" align="center" class="bodytxt">
                            </td>
                            <td style="width: 49%" align="center" class="bodytxt">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid11" runat="server" GridLines="None" Visible="false" Skin="Outlook"
                                    Width="100%" AllowFilteringByColumn="True" AllowMultiRowSelection="True">
                                    <MasterTableView AllowAutomaticUpdates="True" Visible="false" AutoGenerateColumns="False"
                                        DataKeyNames="Emp_Code">
                                        <FilterItemStyle HorizontalAlign="Left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="Emp_Code" DataType="System.Int32"
                                                UniqueName="Emp_Code" SortExpression="Emp_Code" HeaderText="Emp_Code">
                                            </radG:GridBoundColumn>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn DataField="Name" AutoPostBackOnFilter="True" UniqueName="Name"
                                                SortExpression="Name" HeaderText="Employee Name">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid12" runat="server" GridLines="None" Skin="Outlook" Width="100%"
                                    AllowFilteringByColumn="true" AllowMultiRowSelection="true">
                                    <MasterTableView AllowAutomaticUpdates="True" AutoGenerateColumns="False" DataKeyNames="id,description">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn Display="true" ReadOnly="True" DataField="id" DataType="System.String"
                                                UniqueName="id" Visible="false" SortExpression="id" HeaderText="id">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="description" DataType="System.String" AllowFiltering="true"
                                                AutoPostBackOnFilter="true" UniqueName="description" Visible="true" SortExpression="description"
                                                HeaderText="Description">
                                                <ItemStyle HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="true">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="true" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:RadioButtonList RepeatDirection="Horizontal" ID="rdClaim"
                                    runat="server">
                                    <asp:ListItem Value="1" Selected="True">Summary</asp:ListItem>
                                    <asp:ListItem Value="2">Detail</asp:ListItem>
                                    <asp:ListItem Value="3">Summary Un-Processed</asp:ListItem>
                                    <asp:ListItem Value="4">Detail Un-Processed</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="bodytxt" style="width: 49%">
                                Select Start Date:
                                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" ID="RadDatePicker7" runat="server">
                                    <DateInput Skin="" DisplayDateFormat="dd-MM-yyyy">
                                    </DateInput>
                                </radCln:RadDatePicker>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td class="bodytxt" style="width: 49%">
                                Select End Date:
                                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" ID="RadDatePicker8" runat="server">
                                    <DateInput Skin="" DisplayDateFormat="dd-MM-yyyy">
                                    </DateInput>
                                </radCln:RadDatePicker>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="trstandtop" colspan="3">
                                <asp:Button ID="Button5" Text="Generate Claims Report" OnClick="GenerateClaims_Click" OnClientClick="return Validate_Claims()"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsGroups" Height="400px" Width="100%">
                    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                        <tr bgcolor="<%=sOddRowColor%>">
                        </tr>
                        <tr>
                            <td style="width: 49%">
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td style="width: 49%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top" class="bodytxt" style="width: 49%;">
                                Select A Group :<asp:DropDownList ID="ddlCategory" AutoPostBack="TRUE" OnSelectedIndexChanged="ddlCategory_selectedIndexChanged"
                                    runat="server" Width="30%">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid8" runat="server" Visible='false' GridLines="None" Skin="Outlook" Width="100%"
                                    AllowFilteringByColumn="true" AllowMultiRowSelection="true">
                                    <MasterTableView AllowAutomaticUpdates="True" Visible="False" AutoGenerateColumns="False" DataKeyNames="OptionId,Category">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn Display="true" ReadOnly="True" DataField="OptionId" DataType="System.String"
                                                UniqueName="OptionId" Visible="false" SortExpression="OptionId" HeaderText="Option">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="Category" DataType="System.String" AllowFiltering="true"
                                                AutoPostBackOnFilter="true" UniqueName="Category" Visible="true" SortExpression="Category"
                                                HeaderText="Category">
                                                <ItemStyle HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="true">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="true" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="trstandtop" colspan="3">
                                <asp:Button ID="Button3" Text="Generate Grouping Report" OnClick="GenerateGrouping_Click"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsLeaves" Height="450px" Width="100%">
                    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                        <tr bgcolor="<%=sOddRowColor%>">
                            <td style="width: 49%" align="center" class="bodytxt">
                                Please Select Department :
                                <asp:DropDownList CssClass="bodytxt" ID="dlLeavesDept" OnDataBound="dlDept_databound"
                                    OnSelectedIndexChanged="dlDept_selectedIndexChanged" AutoPostBack="true" DataValueField="id"
                                    DataTextField="DeptName" DataSourceID="SqlDataSource4" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 2%" align="center" class="bodytxt">
                            </td>
                            <td style="width: 49%" align="center" class="bodytxt">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid7" runat="server" GridLines="None" Visible="false" Skin="Outlook"
                                    Width="100%" AllowFilteringByColumn="True" AllowMultiRowSelection="True">
                                    <MasterTableView AllowAutomaticUpdates="True" Visible="false" AutoGenerateColumns="False"
                                        DataKeyNames="Emp_Code">
                                        <FilterItemStyle HorizontalAlign="Left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="Emp_Code" DataType="System.Int32"
                                                UniqueName="Emp_Code" SortExpression="Emp_Code" HeaderText="Emp_Code">
                                            </radG:GridBoundColumn>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn DataField="Name" AutoPostBackOnFilter="True" UniqueName="Name"
                                                SortExpression="Name" HeaderText="Employee Name">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid13" runat="server" DataSourceID="SqlDataSource3" GridLines="None"
                                    Skin="Outlook" Width="100%" AllowFilteringByColumn="True" AllowMultiRowSelection="True">
                                    <MasterTableView AllowAutomaticUpdates="True" DataSourceID="SqlDataSource3" AutoGenerateColumns="False"
                                        DataKeyNames="id">
                                        <FilterItemStyle HorizontalAlign="Left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="ID" DataType="System.Int32"
                                                UniqueName="ID" SortExpression="ID" HeaderText="ID">
                                            </radG:GridBoundColumn>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn DataField="[Type]" AutoPostBackOnFilter="True" UniqueName="[Type]"
                                                SortExpression="[Type]" HeaderText="Leave Type">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <table border="0" cellpadding="2" cellspacing="2" style="width: 30%">
                                    <tr>
                                        <td width="20%">
                                            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rdRepOption"
                                                runat="server" OnSelectedIndexChanged="rdRepOption_SelectedIndexChanged">
                                                <asp:ListItem Value="1" Selected="True">Summary</asp:ListItem>
                                                <asp:ListItem Value="2">Detail</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td class="bodytxt" width="5%">
                                            Year:</td>
                                        <td width="20%">
                                            <asp:DropDownList ID="drpYear" DataTextField="text" DataValueField="id" DataSourceID="xmldtYear"
                                                class="textfields" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="bodytxt" style="text-align: right" width="5%">
                                            <asp:Label ID="lblStart" runat="server" Text="Start:"></asp:Label></td>
                                        <td width="50%" style="text-align: left">
                                            <asp:DropDownList ID="drpMonthStart" DataTextField="text" DataValueField="id" DataSourceID="xmldtMonth"
                                                class="textfields" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="bodytxt" width="5%" style="text-align: right">
                                            <asp:Label ID="lblEnd" runat="server" Text="End:" Visible="true"></asp:Label></td>
                                        <td width="50%" style="text-align: left">
                                            <asp:DropDownList Visible="true" ID="drpMonthEnd" DataTextField="text" DataValueField="id"
                                                DataSourceID="xmldtMonth" class="textfields" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="trstandtop" colspan="3">
                                            <asp:Button ID="btnGenLeaveRep" Text="Generate Leave Report" OnClick="btnGenLeaveRep_Click"
                                                runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsTimesheet" Height="750px"
                    Width="100%">
                    <table id="table1" cellpadding="0" cellspacing="0" border="0" width="95%">
                        <tr>
                            <td>
                                <tt class="bodytxt">
                                    <asp:RadioButtonList RepeatDirection="Horizontal" OnSelectedIndexChanged="rdOptionList_SelectedIndexChanged"
                                        AutoPostBack="true" ID="rdOptionList" runat="server">
                                        <asp:ListItem Value="1" Selected="true">Project Wise</asp:ListItem>
                                        <asp:ListItem Value="2">Employee Wise</asp:ListItem>
                                    </asp:RadioButtonList>
                                </tt>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <table id="table2" cellpadding="0" cellspacing="0" border="0" width="100%">
                                    <tr>
                                        <td class="bodytxt" valign="middle" align="LEFT">
                                            <tt class="bodytxt">
                                                <asp:Label ID="lblname" runat="server" Text="Project Name:"></asp:Label>
                                            </tt>
                                            <asp:DropDownList Width="150px" OnDataBound="drpSubProjectID_databound" ID="drpSubProjectID"
                                                DataTextField="Sub_Project_Name" DataValueField="Child_ID" BackColor="white"
                                                CssClass="bodytxt" DataSourceID="SqlDataSource333" runat="server" AutoPostBack="true">
                                            </asp:DropDownList>
                                            <radG:RadComboBox Visible="false" ID="RadComboBoxEmpPrj" runat="server" Height="200px"
                                                Width="150px" AutoPostBack="true" DropDownWidth="375px" EmptyMessage="Select a Employee"
                                                HighlightTemplatedItems="true" EnableLoadOnDemand="true" OnItemsRequested="RadComboBoxEmpPrj_ItemsRequested"
                                                OnSelectedIndexChanged="RadComboBoxEmpPrj_SelectedIndexChanged">
                                                <HeaderTemplate>
                                                    <table style="width: 350px" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td style="width: 120px;">
                                                                Emp Name</td>
                                                            <td style="width: 80px;">
                                                                Card No</td>
                                                            <td style="width: 80px;">
                                                                IC NO</td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table style="width: 350px" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td style="width: 120px;">
                                                                <%# DataBinder.Eval(Container, "Text")%>
                                                            </td>
                                                            <td style="width: 80px;">
                                                                <%# DataBinder.Eval(Container, "Attributes['Time_Card_No']")%>
                                                            </td>
                                                            <td style="width: 80px;">
                                                                <%# DataBinder.Eval(Container, "Attributes['ic_pp_number']")%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </radG:RadComboBox>
                                        </td>
                                        <td class="bodytxt">
                                            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rdRepOptionTime" runat="server">
                                                <asp:ListItem Value="99" Selected="True">Summary</asp:ListItem>
                                                <asp:ListItem Value="100">Detail</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td class="bodytxt" valign="middle" align="left">
                                            <tt class="bodytxt">From:</tt>
                                            <telerik:RadDatePicker ID="rdFrom" runat="server">
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td class="bodytxt" valign="middle" align="left">
                                            <tt class="bodytxt">To:</tt>
                                            <telerik:RadDatePicker ID="rdTo" runat="server">
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnGo" OnClick="btnGo_Click" runat="server" Text="Process" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">
                                <br />
                                 <%--DataKeyNames="Child_ID"--%>
                                <radG:RadGrid Visible="false" ID="RadGrid111" runat="server" GridLines="None" Skin="Outlook"
                                    Width="40%" AllowFilteringByColumn="true" AllowMultiRowSelection="true" OnPageIndexChanged="RadGrid111_PageIndexChanged"
                                    PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages">
                                    <MasterTableView CommandItemDisplay="None" AllowAutomaticUpdates="True" AllowAutomaticDeletes="True"
                                        AutoGenerateColumns="False" AllowAutomaticInserts="True" 
                                       
                                        AllowPaging="true" PageSize="500">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="ID" DataType="System.Int32"
                                                UniqueName="ID" Visible="true" SortExpression="ID" HeaderText="ID">
                                                <ItemStyle Width="0px" />
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn Display="true" DataField="Sub_Project_Name" DataType="System.String"
                                                UniqueName="Sub_Project_Name" Visible="true" SortExpression="Sub_Project_Name"
                                                HeaderText="Sub Project Name">
                                                <ItemStyle Width="30%" HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="true">
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                </radG:RadGrid>
                                <radG:RadGrid Visible="true" ID="RadGrid222" runat="server" DataSourceID="SqlDataSource111"
                                    GridLines="None" Skin="Outlook" Width="40%" AllowFilteringByColumn="true" AllowMultiRowSelection="true"
                                    OnPageIndexChanged="RadGrid222_PageIndexChanged" PagerStyle-AlwaysVisible="true"
                                    PagerStyle-Mode="NumericPages">
                                    <MasterTableView CommandItemDisplay="None" AllowAutomaticUpdates="True" DataSourceID="SqlDataSource111"
                                        AllowAutomaticDeletes="True" AutoGenerateColumns="False" AllowAutomaticInserts="True"
                                        DataKeyNames="Child_ID" AllowPaging="true" PageSize="500">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="Emp_ID" DataType="System.Int32"
                                                UniqueName="Emp_ID" Visible="true" SortExpression="Emp_ID" HeaderText="Emp_ID">
                                                <ItemStyle Width="0px" />
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn Display="false" DataField="Sub_Project_Name" DataType="System.String"
                                                UniqueName="Sub_Project_Name" Visible="true" SortExpression="Sub_Project_Name"
                                                HeaderText="Sub Project Name">
                                                <ItemStyle Width="30%" HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn DataField="EmpName" DataType="System.String" UniqueName="EmpName"
                                                Visible="true" SortExpression="EmpName" ShowFilterIcon="false" AutoPostBackOnFilter="true"
                                                HeaderText="Assigned Employee Name">
                                                <ItemStyle Width="90%" HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn Display="false" DataField="Remarks" DataType="System.String"
                                                UniqueName="Remarks" Visible="true" HeaderText="Remarks" AllowFiltering="false">
                                                <ItemStyle Width="30%" HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="true">
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                </radG:RadGrid>&nbsp;
                            </td>
                            <td valign="middle" align="right" colspan="3">
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsEmail" Height="450px" Width="100%">
                    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                        <tr bgcolor="<%=sOddRowColor%>">
                            <td style="width: 49%" align="Center" class="bodytxt">
                                Please Select Department :
                                <asp:DropDownList CssClass="bodytxt" ID="dlEmailDept" OnDataBound="dlDept_databound"
                                    OnSelectedIndexChanged="dlDept_selectedIndexChanged" AutoPostBack="true" DataValueField="id"
                                    DataTextField="DeptName" DataSourceID="SqlDataSource4" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 2%" align="Center" class="bodytxt">
                            </td>
                            <td style="width: 49%" align="Center" class="bodytxt">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid14" runat="server" Visible="false" GridLines="None" Skin="Outlook"
                                    Width="100%" AllowFilteringByColumn="True" AllowMultiRowSelection="True">
                                    <MasterTableView AllowAutomaticUpdates="True" Visible="false" AutoGenerateColumns="False"
                                        DataKeyNames="Emp_Code">
                                        <FilterItemStyle HorizontalAlign="Left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="Emp_Code" DataType="System.Int32"
                                                UniqueName="Emp_Code" SortExpression="Emp_Code" HeaderText="Emp_Code">
                                            </radG:GridBoundColumn>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn DataField="Name" AutoPostBackOnFilter="True" UniqueName="Name"
                                                SortExpression="Name" HeaderText="Employee Name">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" />
                                        <Scrolling EnableVirtualScrollPaging="true" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid15" runat="server" GridLines="None" Skin="Outlook" Width="100%"
                                    AllowFilteringByColumn="true" AllowMultiRowSelection="true">
                                    <MasterTableView AllowAutomaticUpdates="True" AutoGenerateColumns="False" DataKeyNames="rowid,AliasMonth">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn Display="false" ReadOnly="True" DataField="rowid" DataType="System.Int16"
                                                UniqueName="rowid" SortExpression="rowid" HeaderText="">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="AliasMonth" DataType="System.String" AllowFiltering="true"
                                                AutoPostBackOnFilter="true" UniqueName="AliasMonth" SortExpression="AliasMonth"
                                                HeaderText="Payroll Month">
                                                <ItemStyle HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="true">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="true" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="trstandtop" colspan="3">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rdOptionEmail" runat="server">
                                                <asp:ListItem Value="1" Selected="true">Email Payslip</asp:ListItem>
                                                <asp:ListItem Value="2">Others</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDocNo" runat="server"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="trstandtop" colspan="3">
                                <asp:Button ID="btnRptEmail" Text="Generate Report" OnClick="GenerateRptEmail_Click"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="trstandtop" colspan="3">
                                &nbsp;</td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsExpiry" Height="480px" Width="100%">
                    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                        <tr bgcolor="<%=sOddRowColor%>">
                            <td style="width: 49%" align="center" class="bodytxt">
                                Please Select Department :
                                <asp:DropDownList CssClass="bodytxt" ID="dlExpiryDept" OnDataBound="dlDept_databound"
                                    OnSelectedIndexChanged="dlDept_selectedIndexChanged" AutoPostBack="true" DataValueField="id"
                                    DataTextField="DeptName" DataSourceID="SqlDataSource4" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 2%" align="center" class="bodytxt">
                            </td>
                            <td style="width: 49%" align="center" class="bodytxt">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid16" runat="server" GridLines="None" Visible="false" Skin="Outlook"
                                    Width="100%" AllowFilteringByColumn="True" AllowMultiRowSelection="True">
                                    <MasterTableView AllowAutomaticUpdates="True" Visible="false" AutoGenerateColumns="False"
                                        DataKeyNames="Emp_Code">
                                        <FilterItemStyle HorizontalAlign="Left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn Display="False" ReadOnly="True" DataField="Emp_Code" DataType="System.Int32"
                                                UniqueName="Emp_Code" SortExpression="Emp_Code" HeaderText="Emp_Code">
                                            </radG:GridBoundColumn>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn DataField="Name" AutoPostBackOnFilter="True" UniqueName="Name"
                                                SortExpression="Name" HeaderText="Employee Name">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                            <td style="width: 2%">
                            </td>
                            <td style="width: 49%">
                                <radG:RadGrid ID="RadGrid17" runat="server" GridLines="None" Skin="Outlook" Width="100%"
                                    AllowFilteringByColumn="true" AllowMultiRowSelection="true">
                                    <MasterTableView AllowAutomaticUpdates="True" AutoGenerateColumns="False" DataKeyNames="id,description">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridClientSelectColumn UniqueName="Assigned">
                                                <ItemStyle Width="10%" />
                                            </radG:GridClientSelectColumn>
                                            <radG:GridBoundColumn Display="true" ReadOnly="True" DataField="id" DataType="System.String"
                                                UniqueName="id" Visible="false" SortExpression="id" HeaderText="id">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="description" DataType="System.String" AllowFiltering="true"
                                                AutoPostBackOnFilter="true" UniqueName="description" Visible="true" SortExpression="description"
                                                HeaderText="Description">
                                                <ItemStyle HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="true">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="true" />
                                    </ClientSettings>
                                </radG:RadGrid>
                            </td>
                        </tr>
                        <tr>
                            <td class="bodytxt" style="width: 49%">
                                Set Date:
                                <radCln:RadDatePicker Calendar-ShowRowHeaders="false" ID="RadDatePicker4" runat="server">
                                    <DateInput Skin="" DisplayDateFormat="dd-MM-yyyy">
                                    </DateInput>
                                </radCln:RadDatePicker>
                            </td>
                            <td style="width: 2%" colspan="2">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="trstandtop" colspan="3">
                                <asp:Button ID="btnExpiry" Text="Generate Claims Report" OnClick="GenerateExpiry_Click"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                
           <%--     tbsCompliance--%>
           
                 <telerik:RadPageView class="tbl" runat="server" ID="tbsCompliance" Height="750px"
                    Width="100%">
                    
                      <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel2"   AnimationDuration="1500"  runat="server" Transparency="10" BackColor="#E0E0E0" InitialDelayTime="500">
                            <asp:Image ID="Image2"  runat="server" ImageUrl="~/Frames/Images/ADMIN/WebBlue.gif" AlternateText="Loading"></asp:Image>
                      </telerik:RadAjaxLoadingPanel>      
                                              
                    <%--  <telerik:AjaxSetting AjaxControlID="cmbYear">
                            <UpdatedControls>                                          
                                 <telerik:AjaxUpdatedControl  ControlID="cmbFromMonth" LoadingPanelID="RadAjaxLoadingPanel2" >
                                 </telerik:AjaxUpdatedControl> 
                                 <telerik:AjaxUpdatedControl  ControlID="cmbToMonth" LoadingPanelID="RadAjaxLoadingPanel2" >
                                 </telerik:AjaxUpdatedControl> 
                            </UpdatedControls>
                     </telerik:AjaxSetting>--%>
                     
                    <table id="table3" cellpadding="0" cellspacing="0" border="0" width="95%">                    
                        <tr>
                            <td colspan="4">
                                <table id="table4" cellpadding="0" cellspacing="0" border="0" width="100%">
                                    
                                    <tr>
                                        <td>
                                            <tt  class="bodytxt">
                                                <asp:RadioButtonList ID="rdVar" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" >
                                                    <asp:ListItem Selected="True" Value="CostCenter" Text="CostCenter" ></asp:ListItem>
                                                    <asp:ListItem  Value="Employee" Text="Employee"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </tt>
                                        </td>
                                    
                                    </tr>
                                 
                                    <tr>
                                        <td  id="cost_var"  runat="server" >
                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                <tr>
                                                       <td align="right" style="width: 30%">
                                                            <tt class="bodytxt">Year :</tt>
                                                            <asp:DropDownList ID="cmbYear" runat="server" AutoPostBack="true" 
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
                                                            </asp:DropDownList>
                                                    </td>
                                    
                                                    <td style="width: 30%" valign="middle">
                                                    &nbsp;&nbsp; <tt class="bodytxt">From Month :</tt>
                                                    <asp:DropDownList ID="cmbFromMonth" runat="server" Style="width: 165px" CssClass="textfields">
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
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<tt>
                                                    
                                                    </tt>
                                                   </td>
                                                
                                                    <td style="width: 30%" valign="middle">
                                                    &nbsp;&nbsp; <tt class="bodytxt">To Month :</tt>
                                                    <asp:DropDownList ID="cmbToMonth" runat="server" Style="width: 165px" CssClass="textfields">
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
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<tt>
                                                    
                                                    </tt>
                                                </td>
                                                   <td style="width: 10%;" align="right">
                                                        <asp:Button ID="btnCompliance"  runat="server" Text="GenrateReport" OnClientClick="return Validation();" />
                                                    </td>  
                                                </tr>
                                            </table>
                                        </td>
                                     
                                      
                                      
                                    </tr>
                                    
                                    <!-- new ram-->
                                    <tr>
                                        <td colspan="4" id="Emp_var"  runat="server" visible="false" align="center">
                                           <table  cellpadding="0" cellspacing="0" border="0" width="50%">
                                                <tr>
                                                     <td class="bodytxt" valign="middle" align="left">
                                                        <tt class="bodytxt">From:</tt>
                                                        <radG:RadDatePicker ID="RadDatePicker_From" runat="server">
                                                        </radG:RadDatePicker>
                                                    </td>
                                                    <td class="bodytxt" valign="middle" align="left">
                                                        <tt class="bodytxt">To:</tt>
                                                        <radG:RadDatePicker ID="RadDatePicker_To" runat="server">
                                                        </radG:RadDatePicker>
                                                    </td>
                                                       <td style="width: 10%;" align="right">
                                                        <asp:Button ID="btnvVariance"  runat="server" Text="GenrateReport"  />
                                                    </td> 
                                                </tr>
                                           </table>
                                        </td>
                                    </tr>  
                                  
                                    <!-- new end -->
                                    
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">
                                <br />
                                 <%--DataKeyNames="Child_ID"--%>
                                <radG:RadGrid Visible="false" ID="radgridComplaince" runat="server" GridLines="None" Skin="Outlook"
                                    Width="40%" AllowFilteringByColumn="true" AllowMultiRowSelection="true" 
                                    PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages">
                                    <MasterTableView CommandItemDisplay="None" AllowAutomaticUpdates="True" AllowAutomaticDeletes="True"
                                        AutoGenerateColumns="False" AllowAutomaticInserts="True" 
                                       
                                        AllowPaging="true" PageSize="500">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn Display="true" DataField="Month" DataType="System.String"
                                                UniqueName="Month" Visible="true" SortExpression="Month"
                                                HeaderText="Month">
                                                <ItemStyle Width="30%" HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn Display="true" DataField="AmtLocal" DataType="System.String"
                                                UniqueName="AmtLocal" Visible="true" SortExpression="AmtLocal"
                                                HeaderText="AmtLocal">
                                                <ItemStyle Width="30%" HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn Display="true" DataField="Description" DataType="System.String"
                                                UniqueName="Description" Visible="true" SortExpression="Description"
                                                HeaderText="Description">
                                                <ItemStyle Width="30%" HorizontalAlign="left" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="true">
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                </radG:RadGrid>                               
                            </td>
                            <td valign="middle" align="right" colspan="3">
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>


                <telerik:RadPageView class="tbl" runat="server" ID="tbsTsPay" Height="750px"
                    Width="100%">
                    
                      <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel3"   AnimationDuration="1500"  runat="server" Transparency="10" BackColor="#E0E0E0" InitialDelayTime="500">
                            <asp:Image ID="Image3"  runat="server" ImageUrl="~/Frames/Images/ADMIN/WebBlue.gif" AlternateText="Loading"></asp:Image>
                      </telerik:RadAjaxLoadingPanel>      
                                              
                    <%--  <telerik:AjaxSetting AjaxControlID="cmbYear">
                            <UpdatedControls>                                          
                                 <telerik:AjaxUpdatedControl  ControlID="cmbFromMonth" LoadingPanelID="RadAjaxLoadingPanel2" >
                                 </telerik:AjaxUpdatedControl> 
                                 <telerik:AjaxUpdatedControl  ControlID="cmbToMonth" LoadingPanelID="RadAjaxLoadingPanel2" >
                                 </telerik:AjaxUpdatedControl> 
                            </UpdatedControls>
                     </telerik:AjaxSetting>--%>
                     
                    <table id="table5" cellpadding="0" cellspacing="0" border="0" width="95%">
                        
                        <tr>
                            <td colspan="4">
                                <table id="table6" cellpadding="0" cellspacing="0" border="0" width="70%">
                                    <tr>
                                        <td class="bodytxt" valign="middle" align="left">
                                            <tt class="bodytxt">From:</tt>
                                            <telerik:RadDatePicker ID="radDtpckTsFrom" runat="server">
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td class="bodytxt" valign="middle" align="left">
                                            <tt class="bodytxt">To:</tt>
                                            <telerik:RadDatePicker ID="radDtpckTsTo" runat="server">
                                            </telerik:RadDatePicker>
                                        </td>                                       
                                        <td>
                                            <tt class="bodytxt">Allowance Type</tt>
                                            <telerik:RadComboBox ID="radCmbTsPay"  runat="server"></telerik:RadComboBox>
                                        </td>
                                         <td>
                                            <asp:Button ID="btnTS"   runat="server" Text="Report" OnClick="btnTS_Click" />
                                        </td>

                                    </tr>
                                </table>
                            </td>
                        </tr>                        
                    </table>
                </telerik:RadPageView>


                
            </telerik:RadMultiPage>
        </div>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" IsSticky="true"
            Style="top: 160; left: 0; height: 100;" Skin="Outlook">
            <asp:Image ID="Image1" Visible="false" runat="server" ImageUrl="~/Frames/Images/Imports/Customloader.gif"
                ImageAlign="Middle"></asp:Image>
        </telerik:RadAjaxLoadingPanel>
        <asp:SqlDataSource ID="SqlDataSource333" runat="server" SelectCommand="Select P.ID Parent_ID, P.Project_ID Parent_Project_Unique, P.Project_Name Parent_Project_Name, S.ID Child_ID, S.Sub_Project_ID, S.Sub_Project_Name   From Project P Inner Join SubProject S On P.ID = S.Parent_Project_ID Where P.Company_Id= @company_id">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource222" runat="server" SelectCommand="Select Emp_Code, (Emp_Name+' '+Emp_LName) Emp_Name,'Assigned' = Case  When EC.Sub_Project_ID is null Then CAST(0 AS bit) Else CAST(1 AS bit) End From Employee EA Left Outer Join (Select EA.Emp_ID,EA.Sub_Project_ID From EmployeeAssignedToProject EA Inner Join SubProject SP On  EA.Sub_Project_ID = SP.ID  Inner Join Employee EM On EA.Emp_ID = EM.Emp_Code Where EM.Company_ID=@company_id And SP.ID=@SubProjectID  And EM.[StatusID]=1) EC On EA.Emp_Code = EC.Emp_ID Where EA.Company_ID=@company_id And EC.Sub_Project_ID is null And @SubProjectID > -1 AND EA.StatusID=1 And (EA.Time_Card_No is not null  And EA.Time_Card_No !='') Order By EA.Emp_Name">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                <asp:ControlParameter ControlID="drpSubProjectID" Name="SubProjectID" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--<asp:SqlDataSource ID="SqlDataSource111" runat="server" SelectCommand="Select * From(Select EA.ID Child_ID, EA.Sub_Project_ID, SP.Sub_Project_ID ID, SP.Sub_Project_Name, EA.Emp_ID, [EmpName] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End  From EmployeeAssignedToProject EA Inner Join SubProject SP On  EA.Sub_Project_ID = SP.ID Inner Join Employee EM On EA.Emp_ID = EM.Emp_Code Where EM.Company_ID= @company_id  And SP.ID= @SubProjectID  And EM.StatusID=1 Union Select Distinct 0 Child_ID, (Select ID From SubProject  SP Where SP.ID= @SubProjectID) ID, (Select Sub_Project_ID From SubProject  SP Where SP.ID= @SubProjectID) Sub_Project_ID, (Select Sub_Project_Name From SubProject  SP Where SP.ID= @SubProjectID) Sub_Project_ID,  (Select Emp_Code From Employee Where Time_Card_No=AL.UserID) Emp_ID,(Select (Emp_Name + ' ' + Emp_Lname) EmpName From Employee Where Time_Card_No=AL.UserID) Emp_ID From ACTATEK_LOGS_PROXY AL Where rtrim(TerminalSN) = (Select Sub_Project_ID From SubProject  SP Where SP.ID= @SubProjectID) And SOftDelete = 0) D Order By EmpName">--%>
        <asp:SqlDataSource ID="SqlDataSource111" runat="server" SelectCommand="Select * From( select EA.ID Child_ID,EA.Sub_Project_ID,(Select Sub_Project_ID From SubProject  SP Where SP.ID= @SubProjectID) ID,(select Sub_Project_Name from SubProject where id=@SubProjectID) Sub_Project_Name,Emp_Id,[EmpName] = Case When termination_date is null Then (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,''))  Else (isnull(EMP_NAME,'') +' ' + isnull(EMP_LNAME,'')) + '[Terminated]' End  from EmployeeAssignedToProject EA Inner Join Employee EM On EA.Emp_ID = EM.Emp_Code where EA.ID='166'Union Select Distinct 0 Child_ID,(Select ID From SubProject  SP Where SP.ID= @SubProjectID) ID,(Select Sub_Project_ID From SubProject  SP Where SP.ID= @SubProjectID) Sub_Project_ID, (Select Sub_Project_Name From SubProject  SP Where SP.ID= @SubProjectID) Sub_Project_ID,(Select Emp_Code From Employee Where Time_Card_No=AL.UserID) Emp_ID,(Select (Emp_Name + ' ' + Emp_Lname) EmpName From Employee Where Time_Card_No=AL.UserID) Emp_ID From ACTATEK_LOGS_PROXY AL Where rtrim(TerminalSN) = (Select Sub_Project_ID From SubProject  SP Where SP.ID= @SubProjectID) And SOftDelete = 0) D Order By EmpName">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                <asp:ControlParameter ControlID="drpSubProjectID" Name="SubProjectID" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:XmlDataSource ID="xmldtMonth" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Months/Month">
        </asp:XmlDataSource>
        <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year">
        </asp:XmlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="SELECT  ID,[TYPE] FROM Leave_Types WHERE CompanyID=-1 OR CompanyID= @company_id">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommand="SELECT Id,DeptName From Department D INNER Join Employee E On D.Id=E.Dept_Id Where  D.Company_Id= @company_id Group By Id,DeptName">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT  EMP_CODE,EMP_NAME +'' +EMP_LNAME AS NAME FROM dbo.employee WHERE termination_date IS NULL AND COMPANY_ID= @company_id ORDER BY EMP_NAME">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="select Alias_Name,Group_Source  from dbo.TABLEOBJATTRIB  where GroupColumn=1 and Group_Source is not null">
            <SelectParameters>
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
            ShowMessageBox="true" ShowSummary="False" />
        <asp:XmlDataSource ID="xmldtCompType" runat="server" DataFile="~/XML/xmldata.xml"></asp:XmlDataSource>
    </form>
</body>
</html>
