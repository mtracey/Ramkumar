<%@ Control Language="C#" AutoEventWireup="true" Codebehind="MedicalControl.ascx.cs"
    Inherits="SMEPayroll.Management.MedicalControl" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>

<script language="JAVASCRIPT">
function GetClientId(strid)
{
     var count=document.forms [ 0 ] . length ;
     var i = 0 ;
     var eleName;
     for (i = 0 ;  i < count ;  i++ )
     {
       eleName = document.forms [ 0 ] . elements [ i ] .id;
       pos=eleName.indexOf ( strid ) ;
       if(pos >= 0)  break;           
     }
    return eleName;
 }
function disableMe()
{
//
var ctrl= document.getElementById(GetClientId('dlOption'))
var opt = ctrl.options[ctrl.selectedIndex].text; 
 
 if(opt=='Fixed')
 {
 ctrl= document.getElementById(GetClientId('dlFormulaType'))
 ctrl.disabled=true;
  ctrl= document.getElementById(GetClientId('txtFormula'))
ctrl.value='';
 ctrl.disabled=false;
 }
 else if(opt=='Variable')
 {
 ctrl= document.getElementById(GetClientId('dlFormulaType'))
 ctrl.disabled=true;
 ctrl= document.getElementById(GetClientId('txtFormula'))
 ctrl.value=0;
 ctrl.disabled=true;
 
 }
 else
 {

 ctrl= document.getElementById(GetClientId('dlFormulaType'))
 ctrl.disabled=false;
  
  ctrl= document.getElementById(GetClientId('txtFormula'))
ctrl.value='';
 ctrl.disabled=false;
 }

}
 
function validateMe()
 {
    var sMSG="";
   var ctrl= document.getElementById(GetClientId('txtROC'));
   if(ctrl.value.length <9)
   {
   sMSG +="Company ROC length should be minimum 9 Characters"+ "\n";
   }
   ctrl= document.getElementById(GetClientId('txtType'));
   if(ctrl.value.length <3)
   {
   sMSG +="Company TYPE length should be minimum 3 Characters"+ "\n";
   }
   
    ctrl= document.getElementById(GetClientId('txtSlNo'));
   if(ctrl.value.length <2)
   {
   sMSG +="Company SLNO length should be minimum 3 Characters"+ "\n";
   }
     ctrl= document.getElementById(GetClientId('dlOption'));
    var opt = ctrl.options[ctrl.selectedIndex].text; 
    if(opt=='-Select-')
    {
     sMSG +="Invalid Formula Option"+ "\n";
    }
   //txtROC
    if(opt=='Percentage')
    {
    ctrl= document.getElementById(GetClientId('dlFormulaType'))
    opt = ctrl.options[ctrl.selectedIndex].text;
        if(opt=='-Select-')
        {
        sMSG +="Invalid Formula Type"+ "\n";
        }
    }
  ctrl= document.getElementById(GetClientId('txtFormula'))
  if (ctrl.value == "")
  {
   sMSG = sMSG + "Please enter numeric value in Formula Value" + "\n";
  }
   if (isNaN(ctrl.value) == true)
    {
      sMSG = sMSG + "Please enter numeric value in Formula Value" + "\n";
    }
      ctrl= document.getElementById(GetClientId('txtAmtLimit'));
       if (ctrl.value == "")
  {
   sMSG = sMSG + "Please enter numeric value in Amount Limit" + "\n";
  }
   if (isNaN(ctrl.value) == true)
    {
      sMSG = sMSG + "Please enter numeric value in Amount Limit" + "\n";
    }
    ctrl= document.getElementById(GetClientId('dlRounding'))
    opt = ctrl.options[ctrl.selectedIndex].text;
        if(opt=='-Select-')
        {
        sMSG +="Invalid Rounding option"+ "\n";
        }
   if (sMSG == "")
{
    return true;
}
 else{
    sMSG = "Following fields are missing.\n\n" + sMSG; 
    alert(sMSG); 
    return false;
 }
 }
</script>

<center>
    <table border="1" cellpadding="0" cellspacing="0" style="font-size: 9pt; font-family: Tahoma;
        width: 100%">
        <tr style="font-weight: bold; font-size: 9pt; color: #000000; background-color: #e9eed4;
            text-align: center; height: 30px">
            <td colspan="4">
                <asp:Label ID="lblTitle" class="bodytxt" runat="server" Text='<%# (Container as Telerik.Web.UI.GridItem).OwnerTableView.IsItemInserted ? "Adding the details" : "Editing the details" %>'
                    Font-Names="Verdana" Font-Size="9pt"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 15%">
            </td>
            <td style="width: 85%">
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <tt class="bodytxt">CSN:</tt>
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txtROC" Width="145px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.ROC")%>'
                    MaxLength="12"></asp:TextBox>&nbsp;-
                <asp:TextBox ID="txtType" Width="45px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.TYPE")%>'
                    MaxLength="3"></asp:TextBox>&nbsp;-
                <asp:TextBox ID="txtSlNo" Width="45px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.SLNO")%>'
                    MaxLength="2"></asp:TextBox>
                <tt class="bodytxt">(ROC-TYPE-SLNO)</tt>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <tt class="bodytxt">Formula Option:</tt>
            </td>
            <td style="text-align: left">
                <asp:DropDownList ID="dlOption" OnDataBound="dlFormulaOption_DataBound" OnChange="disableMe();" runat="server">
                    <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Fixed" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Percentage" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Variable" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <tt class="bodytxt">Formula Type:</tt>
            </td>
            <td style="text-align: left">
                <asp:DropDownList ID="dlFormulaType" OnDataBound="dlFormulaType_DataBound" runat="server">
                    <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Percentage Of Basic Salary" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Percentage Of Net Salary" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Percentage Of Gross Salary" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <tt class="bodytxt">Formula Value:</tt>
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txtFormula" Width="45px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Formula")%>'
                    MaxLength="4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <tt class="bodytxt">Amount Limit:</tt>
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txtAmtLimit" Width="45px" Text='<%# DataBinder.Eval(Container,"DataItem.AMCSLimit")%>' MaxLength="6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <tt class="bodytxt">Rounding Option:</tt>
            </td>
            <td style="text-align: left">
                <asp:DropDownList ID="dlRounding"  OnDataBound="dlRoundOption_DataBound" runat="server">
                    <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Drop Decimals" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Round Amount" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr bgcolor="#e9eed4">
            <td style="height: 30px" colspan="4">
                <asp:Button ID="btnUpdate" OnClientClick="return validateMe();" runat="server" CommandName='<%# (Container as Telerik.Web.UI.GridItem).OwnerTableView.IsItemInserted ? "PerformInsert" : "Update" %>'
                    Text='<%# (Container as Telerik.Web.UI.GridItem).OwnerTableView.IsItemInserted ? "Insert" : "Update" %>' />
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" Width="55px" />
            </td>
        </tr>
    </table>
</center>
