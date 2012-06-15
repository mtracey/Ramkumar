<%@ Control Language="C#" AutoEventWireup="true" Codebehind="CPFFiles.ascx.cs" Inherits="SMEPayroll.Company.CPFFiles" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
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
                <asp:TextBox ID="txtROC" Text='<%# DataBinder.Eval(Container,"DataItem.roc")%>' Width="145px"
                    runat="server" MaxLength="12"></asp:TextBox>&nbsp;-
                <asp:TextBox ID="txtType" Text='<%# DataBinder.Eval(Container,"DataItem.type")%>'
                    Width="45px" runat="server" MaxLength="3"></asp:TextBox>&nbsp;-
                <asp:TextBox ID="txtSlNo" Text='<%# DataBinder.Eval(Container,"DataItem.srno")%>'
                    Width="45px" runat="server" MaxLength="3"></asp:TextBox>
            </td>
        </tr>        
        <tr bgcolor="#e9eed4">
            <td style="height: 30px" colspan="4">
                <asp:Button ID="btnUpdate" runat="server" CommandName='<%# (Container as Telerik.Web.UI.GridItem).OwnerTableView.IsItemInserted ? "PerformInsert" : "Update" %>'
                    Text='<%# (Container as Telerik.Web.UI.GridItem).OwnerTableView.IsItemInserted ? "Insert" : "Update" %>'
                    OnClientClick="return ValidateCSNSetup()"  />
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" Width="55px" />
            </td>
        </tr>
    </table>
</center>
<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtROC"
    Display="None" ErrorMessage="Company ROC" InitialValue=""></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtType"
    Display="None" ErrorMessage="Company Type" InitialValue=""></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSlNo"
    Display="None" ErrorMessage="Company Serial No." InitialValue=""></asp:RequiredFieldValidator>--%>
<%--
//Bug ID: 2
//Fix By: Santy Kumar
//Date  : June 5th 2009
//Remark: Fixed for the CPF 9 Digit and 10 Digit case. When 9 digit then add space in CPF File Generation
--%>
<%--<asp:RegularExpressionValidator ID="MinimumValue" runat="server" ControlToValidate="txtROC" 
ErrorMessage="Minimum length for Company CPF is 9" ValidationExpression=".{9}.*" Display="None" />
<%--//End   : 2--%>
<%--<asp:RegularExpressionValidator ID="AlphanuericROC" runat="server" ControlToValidate="txtROC"
    ErrorMessage="Company CPF No. should be Alphanumeric" ValidationExpression="\w+([-+.]\w+)*"
    Display="None" />
<asp:ValidationSummary HeaderText="The following fields are missing/incorrect:" ID="ValidationSummary1"
    runat="server" DisplayMode="List" ShowMessageBox="True" ShowSummary="False" />--%>
<script language="javascript" type="text/javascript">
    function ValidateCSNSetup()
    {     
        var sMsg_new=""; 
        // var sMsg=""; *
        var variable1=document.getElementById("<%= txtROC.ClientID %>");       
        var variable2=document.getElementById("<%= txtType.ClientID %>");  
        var variable3=document.getElementById("<%= txtSlNo.ClientID %>");  
        //Shashank Starts-Date 11/04/2010		    
        /** Mandatory Fields Based Upon Simple No Value OR Combobox Values Like NA OR -SELECT-*/
        var msg ="CSN Setup-Company ROC,CSN Setup-Company Type,CSN Setup-Company Serial No.";
        var srcData ="";        
        var srcCtrl =variable1.id +','+ variable2.id+','+variable3.id;
        var strirmsg = validateData(srcCtrl,'','MandatoryAll',srcData,msg,'');
        if(strirmsg!="")
        {
           sMsg_new = "Following fields are missing.\n\n" + strirmsg + "\n";
        }        
        //Check For Company ROC AlphaNumeric Only
        strirmsg="";
        strirmsg = alphanumeric(variable1,"CSN Setup-Company ROC");
        if(strirmsg!="")                        
            sMsg_new+=strirmsg+"\n";
        
        //Check For Company ROC AlphaNumeric Only
        strirmsg="";
        strirmsg = alphanumeric(variable2,"CSN Setup-Company Type");
        if(strirmsg!="")                        
            sMsg_new+=strirmsg+"\n";
            
        //Check For Company ROC AlphaNumeric Only
        strirmsg="";
        strirmsg = alphanumeric(variable3,"CSN Setup-Company Serial No.");
        if(strirmsg!="")                        
            sMsg_new+=strirmsg+"\n";
            
        //Check Data For Maximum Length 8 for CompanyCode
        strirmsg="";
        strirmsg = CheckMaxMinLength(variable1.value.length,"8","<=","CSN Setup-Company CPF");                        
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