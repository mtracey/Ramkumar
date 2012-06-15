<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GroupTemplate.ascx.cs" Inherits="SMEPayroll.Users.GroupTemplate" %>
<%@ Register TagPrefix="radG" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<table cellpadding="0" cellspacing="0" style="width: 100%">
    <tr>
    </tr>
    <tr>
        <td colspan="4" style="font-weight: bold; font-size: 9pt; color: #000000; font-family: verdana;
            height: 28px; background-color:#E9EED4;  text-align:center">
            <asp:Label ID="Label1" runat="server" Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Adding  New Group" : "Editing  Group Details" %>'></asp:Label></td>
    </tr>
    <tr bgcolor="<% =sOddRowColor%>">
        <td colspan="4" style="font-weight: bold; font-size: 9pt; color: #000099; font-family: verdana;
            height: 30px;  text-align: right">
        </td>
    </tr>
   
    <tr>
        <td style="font-weight: bold; font-size: 9pt; width: 51px; color: #000099; font-family: verdana;
            height: 30px; text-align: right">
        </td>
        <td style="font-weight: bold; font-size: 8pt; width: 169px; color: #000000; font-family: verdana;
            height: 39px;  text-align: left">
            GroupName</td>
        <td style="font-weight: bold; font-size: 8pt; width: 90px; color: #000099; font-family: verdana;
            height: 39px;  text-align: left">
            <asp:TextBox ID="txtgroupname" runat="server" 
                Font-Names="Verdana" Font-Size="8pt" Text='<%# DataBinder.Eval( Container, "Dataitem.GroupName" ) %>'
                Width="108px"></asp:TextBox></td>
        <td style="font-weight: bold; font-size: 9pt; width: 179px; color: #000099; font-family: verdana;
            height: 30px;  text-align: right">
        </td>
    </tr>
    <tr >
        <td align="right" colspan="2">
            <asp:Button ID="btnUpdate" runat="server" CommandName='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "PerformInsert" : "Update" %>'
                Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Insert" : "Update" %>'  OnClientClick="return ValidateData()"/>
        </td>
        <td align="left" colspan="2">
            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel" Width="61px" />
        </td>
    </tr>
    <tr>
        <td colspan="4" style="font-weight: bold; font-size: 9pt; color: #000000; font-family: verdana;
            height: 28px; background-color: #e9eed4; text-align: center">
        </td>
    </tr>
</table>
    <script language="javascript"  type="text/javascript"  src="../Frames/Script/CommonValidations.js" >
    </script>
    <script type="text/javascript">
        function RowDblClick(sender, eventArgs)
        {
            sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
        }
        //Validate data for Alphanumeric and Mandatory fields
        function ValidateData()
        {
            var sMsg_new=""; 
            // var sMsg=""; *
            var variable1=document.getElementById("<%= txtgroupname.ClientID %>");                               
            //Shashank Starts-Date 11/04/2010		    
            /** Mandatory Fields Based Upon Simple No Value OR Combobox Values Like NA OR -SELECT-*/
            var msg ="MNG Security-GroupName";
            var srcData ="";        
            var srcCtrl =variable1.id;
            var strirmsg = validateData(srcCtrl,'','MandatoryAll',srcData,msg,'');
            if(strirmsg!="")
            {
               sMsg_new = "Following fields are missing.\n\n" + strirmsg + "\n";
            }        
            //Check For Company ROC AlphaNumeric Only
            strirmsg="";
            strirmsg = alphanumeric(variable1,"MNG Security-GroupName");
            if(strirmsg!="")                        
                sMsg_new+=strirmsg+"\n";
            
            if(sMsg_new!="")
            {
                alert(sMsg_new);
                return false;  
            }else
            {   
                return true;  
            }
        }
   </script>
