<%@ Control Language="C#" AutoEventWireup="true" Codebehind="Bankedit.ascx.cs" Inherits="SMEPayroll.Management.Bankedit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radCln" %>
<center>
    <table cellpadding="0" cellspacing="0" style="width: 610px; font-size: 9pt; font-family: Tahoma;">
        <tr>
        </tr>
        <tr>
            <td colspan="5" style="color: #000000; height: 28px; background-color: #e9eed4; text-align: center">
                <asp:Label ID="Label1" runat="server" Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Adding a New Record" : "Editing Record" %>'
                    Width="297px"></asp:Label></td>
        </tr>
        <tr bgcolor="<% =sOddRowColor%>">
            <td>
            </td>
            <td style="height: 31px; text-align: left">
                <tt class="bodytxt"><b>Bank Code</b></tt><tt class="required">*</tt></td>
            <td align="left">
                <asp:TextBox ID="txtbankcode" Width="100px" Text='<%# DataBinder.Eval( Container, "DataItem.bank_code" ) %>'
                    runat="server" class="textfields"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv1" runat="server" Display="None" ErrorMessage="Please Enter BankCode"
                    ControlToValidate="txtbankcode"></asp:RequiredFieldValidator>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="height: 31px; text-align: left">
                <tt class="bodytxt"><b>Bank Name</b></tt><tt class="required">*</tt></td>
            <td align="left">
                <asp:TextBox ID="txtbankname" Width="245px" Text='<%# DataBinder.Eval( Container, "DataItem.desc" ) %>'
                    runat="server" class="textfields"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv2" runat="server" Display="None" ErrorMessage="Please Enter BankName"
                    ControlToValidate="txtbankname"></asp:RequiredFieldValidator>
            </td>
            <td>
            </td>
        </tr>
        <tr bgcolor="#e9eed4">
            <td>
            </td>
            <td>
            </td>
            <td>
                <asp:Button ID="btnUpdate" runat="server" CommandName='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "PerformInsert" : "Update" %>'
                    Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Insert" : "Update" %>'
                    Width="70px" OnClientClick="return ValidateData();" />
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" Width="70px" />
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height: 27px; background-color: #e9eed4; text-align: center">
                &nbsp;<asp:ValidationSummary ID="vsm1" runat="server" DisplayMode="List" ShowMessageBox="True"
                    ShowSummary="False" />
                &nbsp;
            </td>
        </tr>
    </table>
</center>

<script language="javascript"  type="text/javascript"  src="../Frames/Script/CommonValidations.js" >
</script>
<script type="text/javascript">
        //Validate data for Alphanumeric and Mandatory fields
        function ValidateData()
        {
            var sMsg_new=""; 
            // var sMsg=""; *
            var variable1=document.getElementById("<%= txtbankcode.ClientID %>");   
            var variable2=document.getElementById("<%= txtbankname.ClientID%>");   
            
            //Shashank Starts-Date 11/04/2010		                
            var msg ="MNG Settings-BankCode,MNG Settings-BankName";
            var srcData ="";        
            var srcCtrl =variable1.id+","+ variable2.id;
            var strirmsg = validateData(srcCtrl,'','MandatoryAll',srcData,msg,'');
            if(strirmsg!="")
            {
               sMsg_new = "Following fields are missing.\n\n" + strirmsg + "\n";
            }        
            
            strirmsg="";
            strirmsg = CheckNumeric(variable1.value,"MNG Settings-BankCode");
            if(strirmsg!="")                        
                sMsg_new+=strirmsg+"\n";
                
            strirmsg="";
            strirmsg = alphanumeric(variable2,"MNG Settings-BankName");
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