<%@ Page Language="C#" AutoEventWireup="true" Codebehind="LeaveRequest.aspx.cs" Inherits="SMEPayroll.Leaves.LeaveRequest"
    EnableViewState="true" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />
    <style type="text/css">
   
    </style>

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

    <script language="javascript" type="text/javascript">
        function ValidateForm() {
            var applyleaveyear = document.getElementById('cmbLeaveYear').value;
            var applyleaveon = document.getElementById('rdGetLeaveOnDated').value;
            var strmsg = '';
            if (document.getElementById('drpleave').value == '0')
                strmsg = strmsg + ' Leave Application Form -Please select Leave Type. \n';

            if (!document.getElementById('RadDatePicker1').value)
                strmsg = strmsg + ' Leave Application Form -Please Enter From Date. \n';

            if (!document.getElementById('RadDatePicker2').value)
                strmsg = strmsg + ' Leave Application Form -Please Enter To Date. \n';

            if (strmsg.length > 0) {
                alert(strmsg);
                return false;
            }
            if (!document.getElementById('RadDatePicker1').value || !document.getElementById('RadDatePicker2').value || document.getElementById('drpleave').value == '-select-')
                return false;
            else {
                var stDate = document.getElementById('RadDatePicker1').value;
                var enDate = document.getElementById('RadDatePicker2').value;

                if (stDate > enDate) {
                    alert('From Date can not be greater than To date, please enter correct dates');
                    return false;
                }
                else {
                    if (stDate.substring(0, 4) != enDate.substring(0, 4)) {
                        alert('Leaves applied should fall with in same year.');
                        return false;
                    }

                    var username = document.getElementById("drpname").value;
                    var leaveType = document.getElementById('drpleave').value;
                    var bEnableHalfDay = document.form1.chkHalfDayLeave.checked;
                    var timesession = document.getElementById('ddltime').value;
                    if (bEnableHalfDay == true) {
                        if (stDate != enDate) {
                            alert('Half Day can be only selected for a single/one day.');
                            return false;
                        }
                    }


                    var res = SMEPayroll.Leaves.LeaveRequest.getLeavesValidity(stDate, enDate, leaveType, bEnableHalfDay, applyleaveyear, applyleaveon, timesession, username);
                    var resVal = res.value;
                    res.value = null;
                    var resValAr = resVal.split(',');
                    var sMsg = '';
                    var ddlname = document.getElementById("drpname");
                    var ddlnametxt = ddlname.options[ddlname.selectedIndex].text;

                    var ddlleave = document.getElementById("drpleave");
                    var ddlleavetxt = ddlleave.options[ddlleave.selectedIndex].text;

                    if (resValAr[0] != 'yes') {
                        var lblleave = document.getElementById('lblLeaveText');

                        if (resValAr[1] == '')
                        { alert('There are no leaves in the selected date range.'); return false; }

                        if (resValAr[1] == '-100')
                        { alert('Employee cannot apply leave before Joining date.'); return false; }

                        if (resValAr[1] == '-101')
                        { alert('During this period Leaves have already been applied, Try some other dates.'); return false; }

                        if (resValAr[1] == '-102')
                        { alert('Cannot apply unpaid leave for the Payroll processed, action is not allowed.'); return false; }

                        if (resValAr[1] == '-103')
                        { alert('Apply Leave Between From ' + lblleave.innerHTML); return false; }

                        if (resValAr[1] == '-104')
                        { alert('Cannot apply Leave Prior to 24 months.'); return false; }

                        if (resValAr[1] == '-105') {
                            var sql = 'Leaves has not been trasnfered in next year. Or \n';
                            sql = sql + 'Leaves cannot be applied on these future date.';
                            alert(sql);
                            return false;
                        }
                        if (resValAr[1] == '-106') {
                            var sql = 'Employee has been already assigned with Project between this date range \n';
                            sql = sql + 'Leaves cannot be applied on these future date.';
                            alert(sql);
                            return false;
                        }
                        if (parseFloat(resValAr[2]) > 0) {
                            sMsg = '\nThere is ' + resValAr[2] + ' Public Holdiays in the selected date range.';
                        }

                        var dblpaidleave = 0;
                        dblpaidleave = parseFloat(resValAr[1]) - parseFloat(resValAr[0]);


                        if (dblpaidleave > 0) {
                            sMsg = "You are applying for " + ddlnametxt + "'s " + ddlleavetxt + " of " + resValAr[1] + " Days. \nThere will be " + dblpaidleave + " PAID Leaves & " + resValAr[0] + " UN-PAID leaves." + sMsg + "\n";
                            sMsg = sMsg + "Balance Leave Available will be: " + resValAr[3] + " Days. \nDo you want to proceed?";
                        }
                        else {
                            sMsg = "You are applying for " + ddlnametxt + "'s " + ddlleavetxt + " of " + resValAr[1] + " Days. \nThere will be " + resValAr[0] + " UN-PAID leaves." + sMsg + "\n";
                            sMsg = sMsg + "Balance Leave Available will be: " + resValAr[3] + " Days. \nDo you want to proceed?";
                        }
                        var bAnswer = confirm(sMsg);
                        if (bAnswer)
                            return true;
                        else
                            return false;
                    }
                    else {
                        if (parseInt(resValAr[2]) > 0) {
                            sMsg = '\nThere is ' + resValAr[2] + ' Public Holdiays in the selected date range.';
                        }

                        if (resValAr[1] == '')
                        { alert('There are no leaves in the selected date range..\n' + sMsg); return false; }
                        else {
                            sMsg = "You are applying for " + ddlnametxt + "'s " + ddlleavetxt + " of " + resValAr[1] + " PAID Leaves." + sMsg + "\n";
                            sMsg = sMsg + "Balance Leave Available will be: " + resValAr[3] + " Days. \nDo you want to proceed?";
                            var bAnswer = confirm(sMsg);
                            if (bAnswer)
                                return true;
                            else
                                return false;
                        }
                    }
                }
            }
        }      
    </script>

</head>
<body style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Leave Application Form</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td align="right" style="height: 25px">
                                <input id="Button1" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <radG:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="all"
            Skin="Outlook">
        </radG:RadFormDecorator>
        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

            <script type="text/javascript">
                //                    function RowDblClick(sender, eventArgs)
                //                    {
                //                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                //                    }
            </script>

        </radG:RadCodeBlock>
        <table cellspacing="1" cellpadding="1" border="0" width="100%" class="tbl1">
            <tr style="height: 100%; width: 100%">
                <td width="2%" align="Left">
                </td>
                <td class="trstandbottom" width="20%" align="Left">
                    Apply Leaves:</td>
                <td class="trstandbottom" width="20%" align="Left">
                    Employee Name:</td>
                <td class="trstandbottom" width="20%" align="Left">
                    Apply Leave Type:</td>
                <td class="trstandbottom" width="20%" align="Left">
                    Approver</td>
                <td class="trstandbottom" width="10%" align="Left">
                    Joining Date:</td>
            </tr>
            <tr>
                <td width="2%" align="Left">
                </td>
                <td width="20%" class="trstandtop">
                    <asp:DropDownList ID="cmbLeaveYear" CssClass="trstandtop" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="cmbLeaveYear_SelectedIndexChanged">
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
                <td width="20%" class="trstandtop">
                    <asp:DropDownList ID="drpname" CssClass="trstandtop" AutoPostBack="true" runat="server"
                        OnSelectedIndexChanged="drpname_SelectedIndexChanged" Width="170px">
                    </asp:DropDownList>
                </td>
                <td width="20%" class="trstandtop">
                    <asp:DropDownList CssClass="trstandtop" ID="drpleave" runat="server" Width="131px">
                    </asp:DropDownList>
                </td>
                <td width="20%" class="trstandtop">
                    <asp:Label ID="lblsupervisor" CssClass="trstandtop" runat="server" Width="183px"
                        Height="20px"></asp:Label>
                </td>
                <td width="20%" class="trstandtop">
                    <asp:Label ID="lblJoinDate" CssClass="trstandtop" runat="server" Width="183px" Height="20px"></asp:Label>
                </td>
            </tr>
            <tr style="height: 100%; width: 100%">
                <td width="2%" align="Left">
                </td>
                <td class="trstandbottom" width="20%" align="Left">
                    Leave From:</td>
                <td class="trstandbottom" width="20%" align="Left">
                    Leave To:</td>
                <td class="trstandbottom" width="20%" align="Left">
                    Apply Half Day Leave:</td>
                <td class="trstandbottom" width="20%" align="Left">
                    Employee Group:</td>
                <td class="trstandbottom" width="10%" align="Left">
                    Confirm Date:</td>
            </tr>
            <tr>
                <td width="2%" align="Left">
                </td>
                <td width="20%" class="trstandtop">
                    <radCln:RadDatePicker ID="RadDatePicker1" runat="server" CssClass="trstandtop" Calendar-ShowRowHeaders="false"
                        DateInput-Enabled="false" Width="133px">
                        <DateInput Skin="Default" DateFormat="dd/MM/yyyy" />
                    </radCln:RadDatePicker>
                </td>
                <td width="20%">
                    <radCln:RadDatePicker CssClass="trstandtop" Calendar-ShowRowHeaders="false" ID="RadDatePicker2"
                        runat="server" DateInput-Enabled="false" Width="133px">
                        <DateInput Skin="" DateFormat="dd/MM/yyyy">
                        </DateInput>
                    </radCln:RadDatePicker>
                </td>
                <td width="20%">
                    <asp:DropDownList ID="ddltime" CssClass="trstandtop" runat="server">
                        <asp:ListItem Value="AM">AM</asp:ListItem>
                        <asp:ListItem Value="PM">PM</asp:ListItem>
                    </asp:DropDownList>
                    <input class="trstandbottom" type="checkbox" id="chkHalfDayLeave" runat="server" />
                </td>
                <td class="trstandtop">
                    <tt class="trstandtop"><asp:Label ID="lblempgroup" CssClass="trstandtop" Height="20px" runat="server"></asp:Label>
                        </tt>
                </td>
                <td width="20%" class="trstandtop">
                    <asp:Label ID="lblConfirm" CssClass="trstandtop" runat="server" Width="183px" Height="20px"></asp:Label></td>
            </tr>
            <tr style="height: 100%; width: 100%">
                <td width="2%" align="Left">
                </td>
                <td class="trstandbottom" width="20%" align="Left">
                    Apply Leave On:</td>
                <td class="trstandbottom" width="20%" align="Left" colspan="2">
                    Remarks:</td>
                <td class="trstandbottom" width="20%" align="Left">
                    Leave Model:
                </td>
                <td class="trstandbottom">
                    Work Days in Week:</td>
            </tr>
            <tr style="height: 100%; width: 100%">
                <td width="2%" align="Left">
                </td>
                <td width="20%" align="Left" class="trstandtop">
                    <radCln:RadDatePicker CssClass="trstandtop" AutoPostBack="true" Calendar-ShowRowHeaders="false"
                        ID="rdGetLeaveOnDated" runat="server" DateInput-Enabled="FALSE" Width="133px"
                        OnSelectedDateChanged="rdGetLeaveOnDated_SelectedDateChanged">
                        <DateInput Skin="" DateFormat="dd/MM/yyyy">
                        </DateInput>
                    </radCln:RadDatePicker>
                </td>
                <td width="20%" align="Left" class="trstandtopMultiRow" colspan="2">
                    <asp:TextBox ID="txtRemarks" Width="400" Font-Names="Tahoma" Font-Size="11px" TextMode="MultiLine"
                        Wrap="true" runat="server"></asp:TextBox></td>
                <td width="20%" align="Left" class="trstandtop">
                    <asp:Label ID="lblLeaveModel" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lblLeaveText" runat="server" Text=""></asp:Label>
                </td>
                <td width="20%" class="trstandtop">
                    <asp:Label ID="lblWorkDays" CssClass="trstandtop" runat="server" Width="183px" Height="20px"></asp:Label></td>
            </tr>
            
            <!-- -->
            <tr style="height: 10px;" id="DocId" runat="server">
               <td align="Left" colspan="6">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="4%" align="Left"> </td>
                            <td class="trstandbottom">Upload Document
                            <radG:RadUpload ID="RadUpload1" InitialFileInputsCount="1" runat="server" ControlObjectsVisibility="ClearButtons"
                            MaxFileInputsCount="1" OverwriteExistingFiles="True" Width="350px" />
                            </td>
                        </tr>
                    </table>
               </td> 
            </tr>
            <!-- -->
            
            <tr style="height: 10px;">
                <td width="2%" align="Left" colspan="6">
                    <hr />
                </td>
            </tr>
            <tr align="center">
                <td colspan="6" align="center">
                    <asp:Button ID="imgbtnsave" runat="server" Text="Submit Leave Request" OnClick="imgbtnsave_Click"
                        Height="22px" Width="150px" CssClass="textfields" OnClientClick="return ValidateForm();" />
                </td>
            </tr>
        </table>
        <table cellspacing="0" cellpadding="1" border="0" width="99%" class="tbl2">
            <tr>
                <td colspan="2" align="center">
                    <radG:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource2" GridLines="None"
                        Skin="Outlook" Width="95%">
                        <mastertableview autogeneratecolumns="False" datasourceid="SqlDataSource2" TableLayout="Auto" >
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
                                <radG:GridBoundColumn DataField="Type" HeaderText="Type" SortExpression="Type" UniqueName="Type">
                                    <HeaderStyle HorizontalAlign="left" />
                                    <ItemStyle HorizontalAlign="left" Width="160px" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="LeavesAllowed" DataType="System.Double" HeaderText="*CYL"
                                    SortExpression="LeavesAllowed" UniqueName="LeavesAllowed">
                                    <HeaderStyle HorizontalAlign="right" />
                                    <ItemStyle HorizontalAlign="right" Width="75px" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="LY_Leaves_Bal" DataType="System.Double" HeaderText="*LYCF"
                                    SortExpression="LY_Leaves_Bal" UniqueName="LY_Leaves_Bal">
                                    <HeaderStyle HorizontalAlign="right" />
                                    <ItemStyle HorizontalAlign="right" Width="75px" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="LeavesEarned" DataType="System.Double" HeaderText="*CYLE"
                                    SortExpression="LeavesEarned" UniqueName="LeavesEarned">
                                    <HeaderStyle HorizontalAlign="right" />
                                    <ItemStyle HorizontalAlign="right"  Width="75px" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="PaidLeaves" DataType="System.Double" HeaderText="Paid Leaves"
                                    SortExpression="PaidLeaves" UniqueName="PaidLeaves">
                                    <HeaderStyle HorizontalAlign="right" />
                                    <ItemStyle HorizontalAlign="right"  Width="75px"/>
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="UnpaidLeaves" DataType="System.Double" HeaderText="Unpaid Leaves"
                                    SortExpression="UnpaidLeaves" UniqueName="UnpaidLeaves">
                                    <HeaderStyle HorizontalAlign="right" />
                                    <ItemStyle HorizontalAlign="right"  Width="85px"/>
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="PendingLeaves" DataType="System.Double" HeaderText="Pending Leaves"
                                    SortExpression="PendingLeaves" UniqueName="PendingLeaves">
                                    <HeaderStyle HorizontalAlign="right" />
                                    <ItemStyle HorizontalAlign="right"  Width="90px"/>
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="TotalLeavesTaken" DataType="System.Double" HeaderText="Leaves Taken"
                                    SortExpression="TotalLeavesTaken" UniqueName="TotalLeavesTaken">
                                    <HeaderStyle HorizontalAlign="right"  Width="80px"/>
                                    <ItemStyle HorizontalAlign="right" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="ActualLeavesAvailable" DataType="System.Double"
                                    HeaderText="Balance Leaves" SortExpression="ActualLeavesAvailable" UniqueName="ActualLeavesAvailable">
                                    <HeaderStyle Font-Bold="true" HorizontalAlign="right" />
                                    <ItemStyle Font-Bold="true" HorizontalAlign="right"  Width="90px"/>
                                </radG:GridBoundColumn>
                            </Columns>
                        </mastertableview>
                        <clientsettings enablerowhoverstyle="true" allowcolumnsreorder="true" reordercolumnsonclient="true">
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                AllowColumnResize="True"  ClipCellContentOnResize="False"></Resizing>
                        </clientsettings>
                    </radG:RadGrid>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="sp_GetEmployeeLeavePolicy"
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drpname" Name="empid" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:ControlParameter ControlID="cmbLeaveYear" Name="year" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:ControlParameter ControlID="rdGetLeaveOnDated" Name="applydateon" PropertyName="SelectedDate"
                                Type="datetime" />
                            <asp:Parameter Name="filter" Type="int16" DefaultValue="-1" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr height="30px"><td colspan="2"><tt class="bodytxt"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*CYL=Current Year Leaves&nbsp;&nbsp;&nbsp;&nbsp;*LYCF=Last Year Carry Forward&nbsp;&nbsp;&nbsp;&nbsp;*CYLE=Current Year Leaves Earned</b></tt></td></tr>
            <tr class="bodytxt"  height="30px">
                <td colspan="2">
                    <tt class="bodytxt">
                        <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label id="lblMsg1" runat="server"  ForeColor="Red" ></asp:Label>
                        </b>
                    </tt>
                 </td>
            </tr>
        </table>
        
        <center>
            <asp:Label ID="lblmsg" CssClass="bodytxt" ForeColor="red" runat="server"></asp:Label>
        </center>
        
  <%--      <radA:RadAjaxManager ID="RadAjaxManager1" runat="server"  >
            <AjaxSettings>
                <radA:AjaxSetting AjaxControlID="drpname">
                    <UpdatedControls>
                        <radA:AjaxUpdatedControl ControlID="drpleave" />
                        <radA:AjaxUpdatedControl ControlID="lblsupervisor" />
                        <radA:AjaxUpdatedControl ControlID="lblempgroup" />
                        <radA:AjaxUpdatedControl ControlID="RadGrid1" />
                        <radA:AjaxUpdatedControl ControlID="lblmsg" />
                        <radA:AjaxUpdatedControl ControlID="imgbtnsave" />
                        <radA:AjaxUpdatedControl ControlID="lblJoinDate" />
                        <radA:AjaxUpdatedControl ControlID="lblConfirm" />
                        <radA:AjaxUpdatedControl ControlID="lblWorkDays" />
                        <radA:AjaxUpdatedControl ControlID="lblLeaveModel" />
                        <radA:AjaxUpdatedControl ControlID="lblLeaveText" />
                        <radA:AjaxUpdatedControl ControlID="lblMsg1" />                        
                    </UpdatedControls>
                </radA:AjaxSetting>
            </AjaxSettings>
        </radA:RadAjaxManager>--%>
        
        <!-- Gap to fill the bottom -->
        <!-- footer -->
    </form>
</body>
</html>
