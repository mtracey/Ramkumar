<%@ Page Language="C#" AutoEventWireup="true" Codebehind="AssignAccomadation.aspx.cs"
    Inherits="SMEPayroll.Management.AssignAccomadation" %>

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
function expando(){
window.parent.expandf()

}
document.ondblclick=expando 

-->
    </script>

    <script language="javascript" type="text/javascript">
      function ValidateForm()
      {
        var sMSG = "";
        var ctrlDt;
        var ctrlDt2;
                ctrlDt = document.getElementById('drpDormetry');
                if(ctrlDt.value=='- Select -')
                    sMSG += "Please Select Dormetry \n \n";	
                if(document.form1.drpCheckIN.value=='-1')
                    sMSG += "Please Select Either Check In / Check Out \n \n";	
                ctrlDt = document.getElementById('RadDatePicker2');
                 if(ctrlDt.value=='')
                     {
                       sMSG += "Accomadation Date should not be blank \n \n";	
                     }
                     if (sMSG == "")
                     {
                        var empCode= document.form1.drpname.value;
                        ctrlDt = document.getElementById('drpCheckIN');
                        var res1=SMEPayroll.Management.AssignAccomadation.validateCheckInCheckOut(empCode,ctrlDt.value);
                        if(res1.value=='False')
                        {
                            sMSG +="Please Select Check In";
                            alert(sMSG); 
                            return false;
                        }
                        ctrlDt = document.getElementById('RadDatePicker2');
                         ctrlDt2 = document.getElementById('drpCheckIN');
                        var res=SMEPayroll.Management.AssignAccomadation.verifyCheckInDate(ctrlDt.value,empCode,ctrlDt2.value);
                        if(res.value=='False')
                        {
                            sMSG +="Invalid Checkin / CheckOut Date,Please Select Future Date  \n \n";
                            alert(sMSG); 
                            return false;
                        }
                        else{
                        if(document.form1.drpCheckIN.value=='2')
                         {
                            var ctrl=document.getElementById('drpDormetry');
                            
                            var res=SMEPayroll.Management.AssignAccomadation.validateDormetry(empCode,ctrl.value,'2');
                            if(res.value=='False')
                             {
                                sMSG +="Please Select Check In";
                                  alert(sMSG);
                                return false;
                            }
                            
                         }
                         if(document.form1.drpCheckIN.value=='1')
                         {
                            var ctrl=document.getElementById('drpDormetry');
                            
                            var res=SMEPayroll.Management.AssignAccomadation.validateDormetry(empCode,ctrl.value,'1');
                           
                            if(res.value=='False')
                             {
                                sMSG +="Invalid Check In";
                                  alert(sMSG);
                                return false;
                            }
                            
                         }
                         
                         return true;
                        }
                     }
                        else
                        {
                            sMSG = "Following fields are missing.\n\n" + sMSG; 
                            alert(sMSG); 
                            return false;
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Accomadation Assignment Form</b></font>
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
            Skin="Outlook"></radG:RadFormDecorator>
        <table cellspacing="1" cellpadding="1" border="0" width="95%" class="tbl">
            <tr style="height: 100%; width: 100%">
            </tr>
            <tr style="height: 100%; width: 100%">
                <td width="5%" align="Left">
                </td>
                <td width="20%" align="Left">
                    <tt class="trstandbottom">Employee Name:</tt>&nbsp;</td>
                <td width="20%" align="Left">
                    <tt class="trstandbottom">Select Accomadation: </tt>&nbsp;</td>
                <td width="20%" align="Left">
                    <tt class="trstandbottom">Check In / Check Out:</tt></td>
                <td width="20%" align="Left">
                    <tt class="trstandbottom">Accomadation Date: </tt></td>
            </tr>
            <tr>
                <td width="5%" align="Left">
                </td>
                <td width="20%" class="trstandtop">
                    <asp:DropDownList ID="drpname" CssClass="trstandtop" AutoPostBack="true" runat="server"
                         Width="170px">
                    </asp:DropDownList>
                </td>
                <td width="20%" class="trstandtop">
                    <asp:DropDownList ID="drpDormetry" CssClass="trstandtop" OnDataBound="drpDormetry_DataBound"
                        runat="server">
                    </asp:DropDownList>
                </td>
                <td width="20%" class="trstandtop">
                    <asp:DropDownList ID="drpCheckIN" CssClass="trstandtop" runat="server">
                        <asp:ListItem Text="Select" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Check In" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Check Out" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="20%" class="trstandtop">
                    <radCln:RadDatePicker CssClass="trstandtop" Calendar-ShowRowHeaders="false" ID="RadDatePicker2"
                        runat="server" DateInput-Enabled="false" Width="133px">
                        <DateInput Skin="" DateFormat="dd/MM/yyyy">
                        </DateInput>
                    </radCln:RadDatePicker>
                </td>
            </tr>
     
       
            <tr style="height: 100%; width: 100%">
                <td width="5%" align="Left">
                </td>
                <td width="20%" align="Left">
                </td>
                <td width="60%" colspan="3" align="Left" class="trstandtopMultiRow">
                </td>
            </tr>
            <tr align="center">
                <td colspan="5" align="center">
                    <asp:Button ID="imgbtnsave" runat="server" Text="Assign Accomadation" OnClick="imgbtnsave_Click"
                        Height="22px" Width="150px" CssClass="textfields" OnClientClick="return ValidateForm();" />
                </td>
            </tr>
        </table>
        <table cellspacing="0" cellpadding="1" border="0" width="99%" class="tbl">
            <tr>
                <td style="width: 2%">
                </td>
                <td colspan="2">
                    <radG:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource2" OnDeleteCommand="RadGrid1_DeleteCommand"
                        OnPreRender="RadGrid1_PreRender" OnItemCreated="RadGrid1_ItemCreated" GridLines="None" Skin="Outlook" Width="93%"   >
                     
                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" >
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
                                <radG:GridBoundColumn DataField="EmpCode" DataType="System.String" HeaderText="EmpCode"
                                    SortExpression="EmpCode" Display="false" UniqueName="EmpCode">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="AccomadationCode" Display="false" Visible="false"
                                    DataType="System.String" HeaderText="AccomadationCode" SortExpression="AccomadationCode"
                                    UniqueName="AccomadationCode">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="AccomadationName" DataType="System.String" HeaderText="Accomadation Name"
                                    SortExpression="AccomadationName" UniqueName="AccomadationName">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="EffectiveCheckInDate" DataType="System.String" HeaderText="EffectiveCheckInDate"
                                    SortExpression="EffectiveCheckInDate" UniqueName="EffectiveCheckInDate">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="EffectiveCheckOutDate" DataType="System.String"
                                    HeaderText="EffectiveCheckOutDate" SortExpression="EffectiveCheckOutDate" UniqueName="EffectiveCheckOutDate">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="CheckInStatus" DataType="System.String" HeaderText="Check In Status"
                                    SortExpression="CheckInStatus" UniqueName="CheckInStatus">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="AssignedBy" DataType="System.String" HeaderText="AssignedBy"
                                    SortExpression="AssignedBy" UniqueName="AssignedBy">
                                    <ItemStyle Font-Bold="true" />
                                    <ItemStyle ForeColor="BurlyWood" />
                                    <HeaderStyle Font-Bold="true" />
                                </radG:GridBoundColumn>
                                <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                    ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                    UniqueName="DeleteColumn">
                                    <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton" />
                                </radG:GridButtonColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                        </ClientSettings>
                    </radG:RadGrid>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="sp_GetEmpCheckInCheckOutDetails"
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drpname" Name="empCode" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:Parameter DefaultValue="-1" Name="NoRecords" Type="int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <radA:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <radA:AjaxSetting AjaxControlID="drpname">
                    <UpdatedControls>
                        <radA:AjaxUpdatedControl ControlID="RadGrid1" />
                    </UpdatedControls>
                </radA:AjaxSetting>
            </AjaxSettings>
        </radA:RadAjaxManager>
        <center>
            <asp:Label ID="lblmsg" CssClass="bodytxt" ForeColor="red" runat="server"></asp:Label>
        </center>
        <!-- Gap to fill the bottom -->
        <!-- footer -->
    </form>
</body>
</html>
