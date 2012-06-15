<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="publicholidays.ascx.cs" Inherits="SMEPayroll.Leaves.publicholidays" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<center>
<table cellpadding="0" cellspacing="0" style="width: 610px; font-size: 9pt; font-family: verdana;">    
    <tr>
        <td colspan="4" style="font-weight: bold; font-size: 9pt; color: #000000; font-family: verdana;
            height: 28px; background-color: #e9eed4; text-align: center">
            <asp:Label ID="Label1" runat="server" Text='<%# (Container as Telerik.Web.UI.GridItem).OwnerTableView.IsItemInserted ? "Adding the details" : "Editing the details" %>' Font-Names="Verdana" Font-Size="9pt"></asp:Label>
        </td>
    </tr>
    <tr>
    <td> 
    <asp:TextBox  Visible="false" ID="id" Text='<%# DataBinder.Eval(Container,"DataItem.ID")%>' runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr bgcolor="<% =sOddRowColor%>">
        <td style="font-weight: bold; font-size: 8pt; width: 119px; color: #000000; font-family: verdana;
             text-align: left">
        </td>
        <td style="font-weight: bold; font-size: 9pt; width: 119px; color: #000000; font-family: verdana;
             text-align: left">
            Date:</td>
        <td style="font-weight: bold; font-size: 8pt; width: 119px; color: #000000; font-family: verdana;
            text-align: left">
            <radCln:RadDatePicker Calendar-ShowRowHeaders="false"   ID="RadDatePicker1"  DbSelectedDate='<%# DataBinder.Eval(Container,"DataItem.holiday_date")%>' runat="server" Width="169px">
                <DateInput Skin="" DateFormat="dd-MM-yyyy">
                </DateInput>
            </radCln:RadDatePicker>
        </td>
        <td style="font-weight: bold; font-size: 8pt; width: 119px; color: #000000; font-family: verdana;
            text-align: left">
        </td>
    </tr>
    <tr >
        <td style="font-weight: bold; font-size: 8pt; width: 119px; color: #000000; font-family: verdana;
            text-align: left">
        </td>
        <td style="font-weight: bold; font-size: 9pt; width: 119px; color: #000000; font-family: verdana;
             text-align: left">
           Name:</td>
        <td style="font-weight: bold; font-size: 8pt; width: 119px; color: #000000; font-family: verdana;
             text-align: left">
            <asp:TextBox ID="txtpublicholiname"  Text='<%# DataBinder.Eval(Container,"DataItem.holiday_name")%>' runat="server"></asp:TextBox></td>
        <td style="font-weight: bold; font-size: 8pt; width: 119px; color: #000000; font-family: verdana;
              text-align: left">
        </td>
    </tr>
    
    <tr bgcolor="<% =sOddRowColor%>">
        <td align="right" colspan="2" style="font-size: 9pt; font-family: verdana; height: 24px">
            <asp:Button ID="btnUpdate" runat="server" CommandName='<%# (Container as Telerik.Web.UI.GridItem).OwnerTableView.IsItemInserted ? "PerformInsert" : "Update" %>'
                Text='<%# (Container as Telerik.Web.UI.GridItem).OwnerTableView.IsItemInserted ? "Insert" : "Update" %>' OnClientClick="return ValidateHolidayInfo()" /></td>
        <td align="left" colspan="2" style="font-size: 9pt; font-family: verdana; height: 24px">
            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" 
                Text="Cancel" Width="55px" />
        </td>
    </tr>
    <tr>
        <td colspan="4" style="font-weight: bold; font-size: 9pt; color: #ffffff; font-family: verdana;
            height: 28px; background-color: #e9eed4; text-align: center">
        </td>
    </tr>
</table>
</center>

<script language="javascript" src="../Frames/Script/CommonValidations.js">
</script>

<script language="javascript" type="text/javascript">
    function ValidateHolidayInfo()
    {
            //RadDatePicker1
            //txtpublicholiname
            var message="";            
            var variable1   =   document.getElementById("<%= txtpublicholiname.ClientID %>");
            var variable2   =   document.getElementById("<%= RadDatePicker1.ClientID %>");
            var msg ="View Public Holiday List- Holiday Name";
            var srcData ="";        
            var srcCtrl =variable1.id;

            var strirmsg = validateData(srcCtrl,'','MandatoryAll',srcData,msg,'');
            if (variable2.value=='')
            {
                strirmsg = strirmsg + "View Public Holiday List- Holiday Date";
            }
            //alert(date);
            if(strirmsg!="")
            {
                message = "Following fields are missing.\n\n" + strirmsg + "\n";           
            }
            //Show Message Box
            if(message!="")
            {
                alert(message);
                return false;  
            }else
            {   
                return true;
            }
    }
</script>