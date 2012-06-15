<%@ Page Language="C#" AutoEventWireup="true" Codebehind="RosterSettings.aspx.cs"
    Inherits="SMEPayroll.Management.RosterSettings" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMEPayroll</title>
    <style type="text/css">  
  
    .SelectedDaysCss a
    {   
        color: White !Important;   
        font-weight: bold !Important;   
        background-color: Gray !Important;   
    }  
  
</style>
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

</head>
<body style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadCodeBlock>
                <script type="text/javascript" language="javascript">
                    function chktrig(e)
                    {
                    }
                     function ValueChanged(sender, args)   
                    {  
                        //var panelBar = document.getElementById("RadPanelBar1").FindItemByValue("ctrlPanel");                        
                        //var rtpEarlyInTime1 = document.getElementById("<%= RadPanelBar1.FindItemByValue("ctrlPanel").FindControl("rtpEarlyInTime").ClientID %>"); 
                        //rtpEarlyInTime1.value  = args.get_newValue();
                        //alert(args.get_newValue());
                        //alert(rtpEarlyInTime1.value);
                    }  
                </script>

        </radG:RadCodeBlock>
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Roster Settings</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td style="width: 10%; text-align: right"  class="bodytxt"  >
                                Roster Name :&nbsp;</td>
                            <td class="bodytxt" >
                                <asp:DropDownList Width="300px" ID="ddlRoster" runat="server" CssClass="bodytxt"   AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlRoster_SelectedIndexChanged">
                                </asp:DropDownList></td>
                            <td align="right" style="height: 25px">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

            <script type="text/javascript">

                function RowDblClick(sender, eventArgs)
                {
                   
                    //alert(document.getElementById("RadPanelBar1_i0_i0_rtpInTime_dateInput"));
                    
//                    var masterTable = sender.get_masterTableView();
//                    alert(eventArgs.getDataKeyValue("InTime"));
//                    
//                    var date1 = new Date();
//                    date1.setHours(5, 0, 0, 0);
//                    timePicker.set_minDate(date1);

                    //sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                }
                
                
         
                
                
            </script>

        </radG:RadCodeBlock>
        
        
        <div>
              <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1"   AnimationDuration="1500"  runat="server" Transparency="10" BackColor="#E0E0E0" InitialDelayTime="500">
                    <asp:Image ID="Image1"  runat="server" ImageUrl="~/Frames/Images/ADMIN/WebBlue.gif" AlternateText="Loading"></asp:Image>
             </telerik:RadAjaxLoadingPanel>
        
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" >
                    <AjaxSettings>                    
                        <telerik:AjaxSetting AjaxControlID="btnCopy">
                                    <UpdatedControls>
                                        <telerik:AjaxUpdatedControl ControlID="RadCalendar1" LoadingPanelID="RadAjaxLoadingPanel1"/>
                                        <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1"/>                                        
                                        <telerik:AjaxUpdatedControl ControlID="lblMsg" LoadingPanelID="RadAjaxLoadingPanel1"/>
                                    </UpdatedControls>
                        </telerik:AjaxSetting>
                        
                        <telerik:AjaxSetting AjaxControlID="RadDatePicker1">
                                    <UpdatedControls>
                                        <telerik:AjaxUpdatedControl ControlID="RadCalendar1" LoadingPanelID="RadAjaxLoadingPanel1"/>
                                        <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1"/>
                                        <telerik:AjaxUpdatedControl ControlID="lblMsg" LoadingPanelID="RadAjaxLoadingPanel1"/>
                                    </UpdatedControls>
                        </telerik:AjaxSetting>
                        
                        
                        
                    </AjaxSettings>
                    
                    
            </telerik:RadAjaxManager>
            
            <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                    <td colspan="2">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                            </tr>
                            <tr>
                                <td colspan="2" class="bodytxt">
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="Select Emp_Code,(Emp_Name + ' ' + Emp_Lname) Emp_Name From Employee Where Emp_Name is not null And StatusID=1 And Company_ID=@company_id">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <radG:RadPanelBar runat="server" ID="RadPanelBar1" Width="95%">                                        
                                        <Items>
                                            <radG:RadPanelItem Expanded="False" Text="Add Entry In Rosters" Width="100%">
                                                <Items>
                                                    <radG:RadPanelItem Value="ctrlPanel">
                                                        <ItemTemplate>
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td rowspan="1" align="center" colspan="1">
                                                                        <radG:RadCalendar ID="RadCalendar1" TabIndex="10000" runat="server" Skin="Outlook"
                                                                            EnableMultiSelect="true" ShowOtherMonthsDays="false" FirstDayOfWeek="Monday"
                                                                            ShowRowHeaders="false">
                                                                        </radG:RadCalendar>
                                                                    </td>
                                                                    <td rowspan="1" align="center" colspan="1">       
                                                                        <asp:Button ID="btnCopy" runat="server"  Text="CopyRoster"  Enabled=false  OnClick="btnCopy_Click"/>
                                                                        <radG:RadDatePicker ID="RadDatePicker1" runat="server"  >
                                                                            <DateInput DateFormat="MMMM yyyy"></DateInput>
                                                                            <Calendar>
                                                                                <FastNavigationSettings TodayButtonCaption="current date"  />
                                                                            </Calendar>                                                                            
                                                                        </radG:RadDatePicker> 
                                                                        <%--<telerik:RadCalendar ID="RadCalendar2" runat="server" AutoPostBack="true" MultiViewColumns="2"
                                                                                          MultiViewRows="2" EnableMultiSelect="false" OnPreRender="RadCalendar1_PreRender">
                                                                          </telerik:RadCalendar>
                                                                        --%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                            <tr>
                                                                                <td valign="top">
                                                                                    <table cellpadding="3" cellspacing="0" border="0" width="99%" style="height: 50%">
                                                                                        <tr>
                                                                                            <td style="vertical-align: top">
                                                                                                <table cellpadding="3" cellspacing="0" border="1" width="99%" style="height: 50%">
                                                                                                    <tr>
                                                                                                        <td colspan="4" align="center" class="bodytxt">
                                                                                                            <b>Roster Control</b>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            Flexible:&nbsp;</td>
                                                                                                        <td class="bodytxt" align="left">
                                                                                                            <asp:DropDownList ID="drpFlex" runat="server" AutoPostBack="true" class="textfields" OnSelectedIndexChanged="drpFlex_SelectedIndexChanged">
                                                                                                                <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                                                                                                <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                                                            </asp:DropDownList>
                                                                                                            &nbsp;&nbsp;&nbsp;
                                                                                                        </td>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            In Minutes:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                                                        <td class="bodytxt" align="left">
                                                                                                            <radG:RadNumericTextBox Width="50px" NumberFormat-GroupSeparator="" ID="rdFlexHours"
                                                                                                                runat="server" MinValue="0" MaxValue="1300" NumberFormat-AllowRounding="true"
                                                                                                                NumberFormat-DecimalDigits="0" IncrementSettings-InterceptArrowKeys="true">
                                                                                                            </radG:RadNumericTextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                         <td class="bodytxt" align="right">
                                                                                                            BreakTime After(Min):&nbsp;</td>
                                                                                                        <td class="bodytxt" align="left">
                                                                                                            <radG:RadNumericTextBox Width="50px" Value="240" NumberFormat-GroupSeparator="" ID="radBreakTimeAfterFlexi"
                                                                                                                runat="server" MinValue="1" MaxValue="1440" NumberFormat-AllowRounding="true" 
                                                                                                                NumberFormat-DecimalDigits="0" IncrementSettings-InterceptArrowKeys="true">
                                                                                                            </radG:RadNumericTextBox></td>
                                                                                                            &nbsp;&nbsp;&nbsp;
                                                                                                        </td>
                                                                                                    
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td>
                                                                                                <table cellpadding="3" cellspacing="0" border="1" width="99%" style="height: 50%">
                                                                                                    <tr>
                                                                                                        <td colspan="4" align="center" class="bodytxt">
                                                                                                            <b>Other Settings</b>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr  >
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            Transfer Hrs: &nbsp;</td>
                                                                                                        <td colspan="3">
                                                                                                            <asp:DropDownList ID="drpTransfer" runat="server" DataSourceID="SqlDataSource3" DataTextField="TranferName"
                                                                                                                DataValueField="ID" class="textfields">
                                                                                                            </asp:DropDownList>
                                                                                                            <div style="display: none">
                                                                                                                <radG:RadNumericTextBox Width="50px" NumberFormat-GroupSeparator="" ID="txtBoxClockInBef"
                                                                                                                    runat="server" MinValue="1" MaxValue="1439" NumberFormat-AllowRounding="true"
                                                                                                                    NumberFormat-DecimalDigits="0" IncrementSettings-InterceptArrowKeys="true">
                                                                                                                </radG:RadNumericTextBox>
                                                                                                            </div>
                                                                                                            <div style="display: none">
                                                                                                                <radG:RadNumericTextBox Width="50px" NumberFormat-GroupSeparator="" ID="txtBoxClockOutBef"
                                                                                                                    runat="server" MinValue="1" MaxValue="1439" NumberFormat-AllowRounding="true"
                                                                                                                    NumberFormat-DecimalDigits="0" IncrementSettings-InterceptArrowKeys="true">
                                                                                                                </radG:RadNumericTextBox>
                                                                                                            </div>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    
                                                                                                     <tr>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            Public Holiday: &nbsp;</td>
                                                                                                        <td colspan="3">
                                                                                                            <asp:DropDownList ID="drpPH" runat="server" DataSourceID="SqlDataSource3" DataTextField="TranferName"
                                                                                                                DataValueField="ID" class="textfields">
                                                                                                            </asp:DropDownList>                                                                                                            
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    
                                                                                                    <tr>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            Sunday : &nbsp;</td>
                                                                                                        <td colspan="3">
                                                                                                            <asp:DropDownList ID="drpSunday" runat="server" DataSourceID="SqlDataSource3" DataTextField="TranferName"
                                                                                                                DataValueField="ID" class="textfields">
                                                                                                            </asp:DropDownList>                                                                                                            
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    <tr>
                                                                                                        <td class="bodytxt"   align="right">
                                                                                                            No Roster Assign : &nbsp;</td>
                                                                                                        <td colspan="3">
                                                                                                            <asp:DropDownList ID="drpNoRoster" runat="server" Enabled="false" DataSourceID="SqlDataSource3" DataTextField="TranferName"
                                                                                                                DataValueField="ID" class="textfields">
                                                                                                            </asp:DropDownList>                                                                                                            
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    
                                                                                                    <tr>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            Rounding : &nbsp;</td>
                                                                                                        <td colspan="3">
                                                                                                            <asp:DropDownList ID="drpROund" runat="server"  class="textfields">                                                                                                                    
                                                                                                                    <asp:ListItem  Text="0"     Value="0" /> 
                                                                                                                    <asp:ListItem  Text="5"     Value="5" /> 
                                                                                                                    <asp:ListItem  Text="10"    Value="10" /> 
                                                                                                                    <asp:ListItem  Text="15"    Value="15" /> 
                                                                                                                    <asp:ListItem  Text="30"    Value="30" />                                                                                                                    
                                                                                                            </asp:DropDownList>                                                                                                            
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            First In Last Out : &nbsp;</td>
                                                                                                        <td colspan="3">
                                                                                                             <asp:CheckBoxList  Visible="True" ID="chkFiFo" runat="server" CssClass="bodytxt"  RepeatColumns="1" RepeatDirection="Horizontal" RepeatLayout="Table" >
                                                                                                                     <asp:ListItem   Value="FILO" Selected="False" ></asp:ListItem>                                    
                                                                                                             </asp:CheckBoxList>                                                                                                          
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: top">
                                                                                                <table cellpadding="3" cellspacing="0" border="1" width="99%" style="height: 99%">
                                                                                                    <tr>
                                                                                                        <td colspan="4" align="center" class="bodytxt">
                                                                                                            <b>Time Settings</b></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            In Time:&nbsp;</td>
                                                                                                        <td>
                                                                                                            <radG:RadTimePicker Width="80px" ID="rtpInTime" runat="server" Skin="Outlook" TabIndex="0"  >
                                                                                                                 <DateInput runat="server"  >  
                                                                                                                    <ClientEvents OnValueChanged="ValueChanged"   />  
                                                                                                                 </DateInput>                                                                                                                  
                                                                                                            </radG:RadTimePicker>
                                                                                                            &nbsp;</td>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            Out Time:&nbsp;</td>
                                                                                                        <td>
                                                                                                            <radG:RadTimePicker Width="80px" ID="rtpOutTime" runat="server" Skin="Outlook" TabIndex="0">
                                                                                                            </radG:RadTimePicker>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            <asp:Label ID="lblEarlyin" Text="Early In By:" runat="server" ></asp:Label>
                                                                                                            &nbsp;</td>
                                                                                                        <td>
                                                                                                            <radG:RadTimePicker Width="80px" ID="rtpEarlyInTime" runat="server" Skin="Outlook"
                                                                                                                TabIndex="0">
                                                                                                            </radG:RadTimePicker>
                                                                                                        </td>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            <asp:Label ID="lblEarlyOut" Text="Early Out By:" runat="server" ></asp:Label>
                                                                                                            &nbsp;</td>
                                                                                                        <td>
                                                                                                            <radG:RadTimePicker Width="80px" ID="rtpEarlyOutTime" runat="server" Skin="Outlook"
                                                                                                                TabIndex="0">
                                                                                                                
                                                                                                            </radG:RadTimePicker>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                             <asp:Label ID="lblLateIn" Text="Late In By:" runat="server" ></asp:Label>
                                                                                                            &nbsp;</td>
                                                                                                        <td>
                                                                                                            <radG:RadTimePicker Width="80px" ID="rtpLateInTime" runat="server" Skin="Outlook">
                                                                                                            </radG:RadTimePicker>
                                                                                                        </td>
                                                                                                        <td colspan="4">
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td style="vertical-align: top">
                                                                                                <table cellpadding="3" cellspacing="0" border="1" width="99%" style="height: 99%">
                                                                                                    <tr>
                                                                                                        <td colspan="4" align="center" class="bodytxt">
                                                                                                            <b>Break Time Settings</b></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            NH After:&nbsp;</td>
                                                                                                        <td>
                                                                                                            <radG:RadTimePicker Width="80px" ID="rtpBreakTimeNH" runat="server" Skin="Outlook"
                                                                                                                TabIndex="0">
                                                                                                            </radG:RadTimePicker>
                                                                                                        </td>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            OT After:&nbsp;</td>
                                                                                                        <td>
                                                                                                            <radG:RadTimePicker Width="80px" ID="rtpBreakTimeOT" runat="server" Skin="Outlook"
                                                                                                                TabIndex="0">
                                                                                                            </radG:RadTimePicker>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            Break Time NH:&nbsp;</td>
                                                                                                        <td>
                                                                                                            <radG:RadNumericTextBox Width="50px" NumberFormat-GroupSeparator="" ID="txtBreakTime"
                                                                                                                runat="server" MinValue="0" MaxValue="600" NumberFormat-AllowRounding="true"
                                                                                                                NumberFormat-DecimalDigits="0" IncrementSettings-InterceptArrowKeys="true">
                                                                                                            </radG:RadNumericTextBox>&nbsp;&nbsp;<span class="bodytxt">Min</span> 
                                                                                                        </td>
                                                                                                        <td class="bodytxt" align="right">
                                                                                                            Break Time OT:&nbsp;</td>
                                                                                                        <td>
                                                                                                            <radG:RadNumericTextBox Width="50px" NumberFormat-GroupSeparator="" ID="txtBreakTimeOT"
                                                                                                                runat="server" MinValue="0" MaxValue="600" NumberFormat-AllowRounding="true"
                                                                                                                NumberFormat-DecimalDigits="0" IncrementSettings-InterceptArrowKeys="true">
                                                                                                            </radG:RadNumericTextBox>&nbsp;&nbsp;<span class="bodytxt">Min</span> 
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <table cellpadding="3" cellspacing="0" border="1" width="90%" style="height: 50%;
                                                                                        display: none">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <div style="display: none">
                                                                                                    <radG:RadNumericTextBox Width="50px" NumberFormat-GroupSeparator="" ID="txtBoxClockInAft"
                                                                                                        runat="server" MinValue="1" MaxValue="1439" NumberFormat-AllowRounding="true"
                                                                                                        NumberFormat-DecimalDigits="0" IncrementSettings-InterceptArrowKeys="true">
                                                                                                    </radG:RadNumericTextBox>
                                                                                                </div>
                                                                                                <div style="display: none">
                                                                                                    <radG:RadNumericTextBox Width="50px" NumberFormat-GroupSeparator="" ID="txtBoxClockOutAft"
                                                                                                        runat="server" MinValue="1" MaxValue="1439" NumberFormat-AllowRounding="true"
                                                                                                        NumberFormat-DecimalDigits="0" IncrementSettings-InterceptArrowKeys="true">
                                                                                                    </radG:RadNumericTextBox>
                                                                                                </div>
                                                                                                <div style="display: none">
                                                                                                    <radG:RadTimePicker Width="80px" ID="rtpLateOutTime" runat="server" Skin="Outlook">
                                                                                                    </radG:RadTimePicker>
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" align="center" class="bodytxt">
                                                                        <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" Text="Add" />
                                                                        <asp:Button ID="btnCancel" runat="server" OnClick="btnClear_Click" Text="Clear" /><br />
                                                                        <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="red"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </radG:RadPanelItem>
                                                </Items>
                                            </radG:RadPanelItem>
                                            <radG:RadPanelItem Expanded="True" Text="Roster Information" Width="100%">
                                                <Items>
                                                    <radG:RadPanelItem Value="ctrlPanel2">
                                                        <ItemTemplate>
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:Button ID="btnDelete" OnClientClick="return confirm('Are you sure you want to delete Selected Records.?');"
                                                                            runat="server" OnClick="btnDelete_Click" Text="Delete" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                        <radG:RadGrid ID="RadGrid1" runat="server" Width="98%" AllowFilteringByColumn="false"
                                                                            AllowSorting="true" Skin="Outlook" MasterTableView-CommandItemDisplay="bottom"
                                                                            MasterTableView-AllowAutomaticUpdates="true" MasterTableView-AutoGenerateColumns="false"
                                                                            MasterTableView-AllowAutomaticInserts="true" MasterTableView-AllowMultiColumnSorting="true"
                                                                            GroupHeaderItemStyle-HorizontalAlign="left" ClientSettings-EnableRowHoverStyle="true"
                                                                            ClientSettings-AllowColumnsReorder="true" ClientSettings-ReorderColumnsOnClient="true"
                                                                            ClientSettings-AllowDragToGroup="true" ShowGroupPanel="true" OnGroupsChanging="RadGrid1_GroupsChanging"
                                                                            OnSortCommand="RadGrid1_SortCommand1" AllowMultiRowSelection="true" PageSize="50"
                                                                            AllowPaging="true" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged">
                                                                            <PagerStyle Mode="NextPrevAndNumeric" />
                                                                            <SelectedItemStyle CssClass="SelectedRow" />
                                                                            <MasterTableView CommandItemDisplay="none" DataKeyNames="ID,InTime" ClientDataKeyNames="ID,InTime,OutTime,EarlyInBy,LateInBy,EarlyOutBy,LateOutBy,ClockInBefore,ClockInAfter,ClockOutBefore,ClockOutAfter,BreakTimeNH,BreakTimeOT, BreakTimeNHhr, BreakTimeOThr, FlexibleWorkinghr">
                                                                                <FilterItemStyle HorizontalAlign="left" />
                                                                                <HeaderStyle ForeColor="Navy" />
                                                                                <ItemStyle BackColor="White" Height="20px" />
                                                                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                                                                <Columns>
                                                                                    <radG:GridClientSelectColumn UniqueName="Assigned">
                                                                                    </radG:GridClientSelectColumn>
                                                                                    <radG:GridBoundColumn DataField="ID" HeaderStyle-ForeColor="black" HeaderText="ID"
                                                                                        UniqueName="ID" Display="false">
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="Roster_ID" HeaderStyle-ForeColor="black" HeaderText="Roster_ID"
                                                                                        UniqueName="Roster_ID" Display="false">
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="Roster_Day" HeaderStyle-ForeColor="black" HeaderText="Day"
                                                                                        UniqueName="Roster_Day">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="Roster_Date" HeaderStyle-ForeColor="black" HeaderText="Date"
                                                                                        UniqueName="Roster_Date">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="InTime" HeaderStyle-ForeColor="black" HeaderText="In Time"
                                                                                        UniqueName="InTime">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="OutTime" HeaderStyle-ForeColor="black" HeaderText="Out Time"
                                                                                        UniqueName="OutTime">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="EarlyInBy" HeaderStyle-ForeColor="black" HeaderText="Early In Time"
                                                                                        UniqueName="EarlyInBy">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="EarlyOutBy" HeaderStyle-ForeColor="black" HeaderText="Early Out Time"
                                                                                        UniqueName="EarlyOutBy">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="LateInBy" HeaderStyle-ForeColor="black" HeaderText="Late In Time"
                                                                                        UniqueName="LateInBy">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="LateOutBy" HeaderStyle-ForeColor="black" HeaderText="Late Out Time"
                                                                                        Display="false" UniqueName="LateOutBy">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="BreakTimeNHHr" HeaderStyle-ForeColor="black" HeaderText="Brk Time NH Hr"
                                                                                        UniqueName="BreakTimeNHHr">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="BreakTimeOTHr" HeaderStyle-ForeColor="black" HeaderText="Brk Time OT Hr"
                                                                                        UniqueName="BreakTimeOTHr">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn Display="false" DataField="ClockInBefore" HeaderStyle-ForeColor="black"
                                                                                        HeaderText="Clock In Before" UniqueName="ClockInBefore">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn Display="false" DataField="ClockInAfter" HeaderStyle-ForeColor="black"
                                                                                        HeaderText="Clock In After" UniqueName="ClockInAfter">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn Display="false" DataField="ClockOutBefore" HeaderStyle-ForeColor="black"
                                                                                        HeaderText="Clock Out Before" UniqueName="ClockOutBefore">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn Display="false" DataField="ClockOutAfter" HeaderStyle-ForeColor="black"
                                                                                        HeaderText="Clock Out After" UniqueName="ClockOutAfter">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="BreakTimeNH" HeaderStyle-ForeColor="black" HeaderText="Break Time In NH"
                                                                                        UniqueName="BreakTimeNH">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="BreakTimeOT" HeaderStyle-ForeColor="black" HeaderText="Break Time In OT"
                                                                                        UniqueName="BreakTimeOT">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="FlexibleWorkinghr" HeaderStyle-ForeColor="black" HeaderText="Flex Work Hr"
                                                                                        UniqueName="FlexibleWorkinghr">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    <radG:GridBoundColumn DataField="TransferIn" HeaderStyle-ForeColor="black" HeaderText="Transfer In"
                                                                                        UniqueName="TransferIn">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    
                                                                                     <radG:GridBoundColumn DataField="FIFO" HeaderStyle-ForeColor="black" HeaderText="FirstIn Last out"
                                                                                        UniqueName="FIFO">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    
                                                                                     <radG:GridBoundColumn DataField="Rounding" HeaderStyle-ForeColor="black" HeaderText="Rounding"
                                                                                        UniqueName="Rounding">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    
                                                                                     <radG:GridBoundColumn DataField="BreakTimeAfter" HeaderStyle-ForeColor="black" HeaderText="Break TimeAfter(Flexi)"
                                                                                        UniqueName="BreakTimeAfter">
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </radG:GridBoundColumn>
                                                                                    
                                                                                    
                                                                                    
                                                                                </Columns>
                                                                                <EditFormSettings ColumnNumber="2">
                                                                                    <FormTableItemStyle Wrap="False"></FormTableItemStyle>
                                                                                    <FormCaptionStyle CssClass="EditFormHeader"></FormCaptionStyle>
                                                                                    <FormMainTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="3"
                                                                                        BackColor="White" Width="100%" />
                                                                                    <FormTableStyle BorderColor="black" BorderWidth="0" CellSpacing="0" CellPadding="2"
                                                                                        Height="110px" BackColor="White" />
                                                                                    <FormTableAlternatingItemStyle BorderColor="blue" BorderWidth="1" Wrap="False"></FormTableAlternatingItemStyle>
                                                                                    <EditColumn ButtonType="ImageButton" InsertText="Add New Project" UpdateText="Update"
                                                                                        UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                                                                    </EditColumn>
                                                                                    <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                                                                </EditFormSettings>
                                                                            </MasterTableView>
                                                                            <ClientSettings>
                                                                                <Selecting AllowRowSelect="true" />
                                                                                <Resizing AllowRowResize="false" EnableRealTimeResize="false" ResizeGridOnColumnResize="false"
                                                                                    AllowColumnResize="false"></Resizing>
                                                                                <ClientEvents OnRowDblClick="RowDblClick" />
                                                                            </ClientSettings>
                                                                        </radG:RadGrid>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </radG:RadPanelItem>
                                                </Items>
                                            </radG:RadPanelItem>
                                        </Items>
                                    </radG:RadPanelBar>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="Select * From HourTransfer">
                                    </asp:SqlDataSource>
                                    <asp:XmlDataSource ID="xmldtTimesheet" runat="server" DataFile="~/XML/xmldata.xml"
                                        XPath="SMEPayroll/Timesheet/HourCalc"></asp:XmlDataSource>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
