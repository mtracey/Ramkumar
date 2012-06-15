<%@ Page Language="C#" AutoEventWireup="true" Codebehind="PendingApproval.aspx.cs"
    Inherits="SMEPayroll.Leaves.PendingApproval" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Import Namespace="SMEPayroll" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />
    <style type="text/css">
        .SpecialDay 
        {
            background-color: Silver !important;
              
        }
    
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
	background: transparent;
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
        
      <%--  <radG:RadAjaxManager ID="RadAjaxManager1" runat="server">
             <AjaxSettings>
                    <radG:AjaxSetting AjaxControlID="RadCalendar1">
                        <UpdatedControls>
                            <radG:AjaxUpdatedControl ControlID="RadCalendar1"></radG:AjaxUpdatedControl>
                        </UpdatedControls>
                    </radG:AjaxSetting>
                </AjaxSettings>
        </radG:RadAjaxManager>--%>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Approve / Reject Leaves Request</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td align="left" valign="middle" style="height: 25px; width: 109px;">
                                <tt class="bodytxt"><b style="vertical-align: middle">&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" Font-Bold="true"  runat="server" Text="Supervisor Name :" Width="110px" Height="16px"
                                        CssClass="bodytxt"></asp:Label></b></tt>
                            </td>
                            
                            <td>
                                <b>
                                    <asp:Label ID="lblsuper" runat="server" Text="Label" Width="220px" Height="16px"
                                        CssClass="bodytxt"></asp:Label></b>
                            </td>
                            <td valign="middle" align="right">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" style="width: 80px;
                                    height: 22px" />
                            </td>
                        </tr>
                    </table>
        </td> </tr> </table>
        
        <radG:RadFormDecorator ID="RadFormDecorator1" Font-Names="Tahoma" runat="server"
            Skin="Outlook" DecoratedControls="all" />
        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

            <script type="text/javascript">
                    function RowDblClick(sender, eventArgs)
                    {
                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                    }
                     function MyClick(sender, e)  
                    {  
                        var inputs = document.getElementById("<%= RadGrid1.MasterTableView.ClientID %>").getElementsByTagName("input");  

                        for(var i = 0, l = inputs.length; i < l; i++)  
                        {  
                        var input = inputs[i];  
                        if(input.type != "radio" || input == sender)  
                        continue;  
                        input.checked = false;  
                        //document.getElementById("divRemarks").innerText =input.name;
                    }  
        }  
            </script>

        </radG:RadCodeBlock>
        <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <radG:RadGrid ID="RadGrid1" OnItemDataBound="RadGrid1_ItemDataBound" runat="server"
                        DataSourceID="SqlDataSource1" GridLines="None" Skin="Outlook" Width="99%"  EnableHeaderContextMenu="true"  AllowFilteringByColumn="true" >
                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="trx_id,type,remarks,emp_name" DataSourceID="SqlDataSource1">
                            <FilterItemStyle HorizontalAlign="left" />
                            <HeaderStyle ForeColor="Navy" />
                            <ItemStyle BackColor="White" Height="20px" />
                            <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                            <Columns>
                                <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="10px" />
                                </radG:GridTemplateColumn>
                                <radG:GridTemplateColumn HeaderText="Select" UniqueName="TemplateColumn1" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="remarkRadio" AutoPostBack="true" OnCheckedChanged="remarkRadio_CheckedChanged"
                                            GroupName="rad" runat="server"    onclick="MyClick(this,event)" />
                                    </ItemTemplate>
                                </radG:GridTemplateColumn>
                                <radG:GridBoundColumn DataField="emp_id" Visible="false" DataType="System.Int32" AllowFiltering="false"
                                    HeaderText="Code" SortExpression="emp_id" UniqueName="emp_id">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="emp_name" DataType="System.String" HeaderText=" Employee Name" AllowFiltering="false"
                                    SortExpression="emp_name" UniqueName="emp_name">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="leave_type" Visible="false" DataType="System.Int32" AllowFiltering="false"
                                    HeaderText="Leave Type" SortExpression="leave_type" UniqueName="leave_type">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="type" DataType="System.String" HeaderText="Leave Type" AllowFiltering="false"
                                    SortExpression="type" UniqueName="type">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="start_date" DataType="System.DateTime" HeaderText="Duration From" AllowFiltering="false"
                                    SortExpression="start_date" UniqueName="start_date">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="end_date" DataType="System.DateTime" HeaderText="To" AllowFiltering="false"
                                    SortExpression="end_date" UniqueName="end_date">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="ApplicationDate" DataType="System.DateTime" HeaderText="Application Date" AllowFiltering="false"
                                    SortExpression="ApplicationDate" UniqueName="ApplicationDate">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="remarks" DataType="System.String" HeaderText="remarks" AllowFiltering="false"
                                    ReadOnly="True" SortExpression="remarks" UniqueName="remarks" Visible="False">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="paid_leaves" HeaderText="Paid" SortExpression="paid_leaves" AllowFiltering="false"
                                    UniqueName="paid_leaves">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="unpaid_leaves" HeaderText="Unpaid" SortExpression="unpaid_leaves" AllowFiltering="false"
                                    UniqueName="unpaid_leaves">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="sumLeaves" HeaderText="Total" SortExpression="sumLeaves" AllowFiltering="false"
                                    UniqueName="sumLeaves">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="timesession" HeaderText="Time Session" SortExpression="TimeSession" AllowFiltering="false"
                                    UniqueName="TimeSession">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Approver" HeaderText="Approver" SortExpression="Approver" AllowFiltering="false"
                                    UniqueName="Approver">
                                </radG:GridBoundColumn>
                                 <radG:GridBoundColumn DataField="emp_code" DataType="System.Int32" HeaderText="emp_code" SortExpression="emp_code" AllowFiltering="false"
                                    UniqueName="emp_code" Visible="false">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="trx_id" DataType="System.Int32" HeaderText="trx_id" AllowFiltering="false"
                                    ReadOnly="True" SortExpression="trx_id" UniqueName="trx_id" Visible="False">
                                </radG:GridBoundColumn>
                                
                                
                                <radG:GridBoundColumn DataField="TimeCardId" HeaderText="Time Card ID"    ShowFilterIcon="False" CurrentFilterFunction="StartsWith" AllowFiltering="true" AutoPostBackOnFilter="true"
                                    ReadOnly="True" SortExpression="TimeCardId" UniqueName="TimeCardId">
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
                                <radG:GridBoundColumn DataField="Department" HeaderText="Department" AllowFiltering="false"
                                    ReadOnly="True" SortExpression="Department" UniqueName="Department" Display="false">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Designation" HeaderText="Designation" AllowFiltering="false"
                                    ReadOnly="True" SortExpression="Designation" UniqueName="Designation" Display="false">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn UniqueName="ic_pp_number" HeaderText="IC/FIN Number"  DataField="ic_pp_number" Display="false"  AllowFiltering="false" >
                                </radG:GridBoundColumn>


                               <radG:GridTemplateColumn HeaderText="Attached Document" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="h1" runat="server" Target="_blank" Text='<%# ((Convert.ToString(Eval("Path")).Length)>0) ? "Doc":" " %>' NavigateUrl='<%# Eval("Path")%>'></asp:HyperLink>
                                    </ItemTemplate>
                                </radG:GridTemplateColumn>

                                
                            </Columns>
                        </MasterTableView>
                        <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                        </ClientSettings>
                    </radG:RadGrid></td>
            </tr>
        </table>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="sp_pending_approval"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue=" " Name="approver" SessionField="Emp_Name" Type="String" />
                <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                <asp:ControlParameter ControlID="textbox1" Name="txt" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table style="width: 646px; height: 116px">
            <tr id="rowApp" runat="server" visible="false">
                <td class="bodytxt"">
                    <label id="lblApprovalinfo1" runat="server" style="color:Red;font-weight:bold" >
                    </label>
                </td>                            
            </tr>
            <%if ((Utility.AllowedAction1(Session["Username"].ToString(), "Approve and Reject Leaves")) || (Utility.AllowedAction1(Session["Username"].ToString(), "Approve and Reject Leaves for all")))
              {%>
            <tr>
                <td class="bodytxt"">
                    Employee Remarks:</td>
            </tr>
            <tr>
                <td colspan="2">
                    <input id="txtEmpRemarks" disabled="disabled" style="height: 36px; width: 581px;"
                        name="txtEmpRemarks" runat="server" /></td>
            </tr>
            <tr>
                <td class="bodytxt" colspan="2">
                    Supervisor Remarks:
                </td>
            </tr>
            <tr class="trstandtop">
                <td colspan="2" style="vertical-align: top; text-align: left;">
                    <asp:TextBox runat="server" ID="txtremarks" Height="36px" TextMode="MultiLine" Width="581px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <asp:Button runat="server" ID="btnapprove" Text="Approve" OnClick="btnapprove_Click"
                        Style="width: 80px; height: 22px" />
                </td>
                <td style="text-align: left">
                    <asp:Button runat="server" ID="btnreject" Text="Reject" OnClick="btnreject_Click"
                        Style="width: 80px; height: 22px" />
                </td>
                <td>
                </td>
            </tr>
            <%}%>
        </table>
         <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        
        <table>
            <tr>
                <td>
                     <radG:RadCalendar ID="RadCalendar1" runat="server"  Visible="false"
                                        AutoPostBack="true">
                                    <%--<HeaderTemplate>
                                          <asp:Image ID="HeaderImage" runat="server" Width="757" Height="94" Style="display: block" />
                                    </HeaderTemplate>--%>
                                    <%--<FooterTemplate>
                                        <asp:Image ID="FooterImage" runat="server" Width="757" Height="70" Style="display: block" />
                                    </FooterTemplate>--%>                                   
                                    <CalendarDayTemplates>
                                        <radG:DayTemplate ID="DateTemplate" runat="server">
                                            <Content>
                                                <div >
                                                     L
                                                </div>                                                
                                            </Content>
                                        </radG:DayTemplate>                                        
                                    </CalendarDayTemplates>                                 
                    </radG:RadCalendar>
                      
                </td>
            </tr>
            <tr>
                <asp:LinkButton ID="lnlReport"  Text="ViewScheduler"  Visible="false"   runat="server" PostBackUrl="~/Reports/Scheduler.aspx"></asp:LinkButton>
            </tr>
        </table>
        
    </form>
</body>
</html>