<%@ Control Language="C#" AutoEventWireup="true" Codebehind="usertemplate.ascx.cs"
    Inherits="SMEPayroll.Users.usertemplate" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
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
<table border="0" cellpadding="2" cellspacing="2" style="width: 100%;">
    <tr>
        <td colspan="6" style="font-weight: bold; font-size: 9pt; font-family: verdana; height: 28px;
            background-color: #e9eed4; text-align: center">
            <asp:Label ID="Label1" runat="server" Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Adding a New User" : "Editing an User Details" %>'></asp:Label></td>
    </tr>
    <tr>
        <td class="bodytxt" align="right">
            User name:
        </td>
        <td class="bodytxt">
            <asp:TextBox ID="txtUserName" Enabled='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? (1==1) : !(1==1)%>'
                Text='<%# DataBinder.Eval( Container, "Dataitem.UserName" ) %>' runat="server"
                Width="108px" Font-Names="Verdana" Font-Size="8pt"></asp:TextBox>
        </td>
        <td class="bodytxt" align="right">
            Password:
        </td>
        <td class="bodytxt">
            <asp:TextBox ID="txtPwd" runat="server" Text='<%# SMEPayroll.encrypt.SyDecrypt(SMEPayroll.Utility.ToString(DataBinder.Eval(Container, "DataItem.Password"))) %>'
                Width="160px" Font-Names="Verdana" Font-Size="8pt" TextMode="Password"></asp:TextBox>
        </td>
        <td class="bodytxt" align="right">
            Confirm Pwd:
        </td>
        <td class="bodytxt">
            <asp:TextBox ID="txtConPwd" runat="server" TextMode="Password" Text='<%# SMEPayroll.encrypt.SyDecrypt(SMEPayroll.Utility.ToString(DataBinder.Eval(Container, "DataItem.Password"))) %>'
                Width="160px" Font-Names="Verdana" Font-Size="8pt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="bodytxt" align="right">
            Email:
        </td>
        <td class="bodytxt">
            <asp:TextBox ID="txtEmail" runat="server" Text='<%# DataBinder.Eval( Container, "DataItem.Email" ) %>'
                Width="160px" Font-Names="Verdana" Font-Size="8pt"></asp:TextBox>
        </td>
        <td class="bodytxt" align="right">
            User Group:
        </td>
        <td class="bodytxt">
            <asp:DropDownList ID="drpUserGrp" runat="server" Font-Names="Verdana" Font-Size="8pt">
            </asp:DropDownList>
        </td>
        <td class="bodytxt" align="right">
            Status:
        </td>
        <td class="bodytxt">
            <asp:DropDownList ID="drpUserStatus" runat="server" Font-Names="Verdana" Font-Size="8pt">
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td colspan="6" align="center">
            <asp:Button ID="btnUpdate" Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Insert" : "Update" %>'
                runat="server" CommandName='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "PerformInsert" : "Update" %>'  Width="100px" OnClientClick="return ValidateUserSetupInfo();">
            </asp:Button>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                CommandName="Cancel" Width="100px"></asp:Button>
        </td>
    </tr>
</table>
<script language="javascript" type="text/javascript">
    function ValidateUserSetupInfo()
    {
        var sMsg=""; 
        var variable1=document.getElementById("<%= txtEmail.ClientID %>");                     
        var variable2=document.getElementById("<%= txtPwd.ClientID %>");             
        var variable3=document.getElementById("<%= txtConPwd.ClientID %>"); 
        
        if(variable1!=null)
        {
            //Validates Email Address for Prefernce Setup Alerts
            strirmsg="";
            strirmsg = ValidateEmail(variable1.value,"User Setup-Email Address");
            sMSG="";
            if(strirmsg!="")
                sMSG+=strirmsg+"\n";
        }
        
        //Validates Email Address for Prefernce Setup Alerts
        strirmsg="";
        strirmsg = ValidateCompare(variable2.value,variable3.value,"User Setup-Password");
        if(strirmsg!="")
                sMSG+=strirmsg+"\n";
        
        if(sMSG=="")
        {
            return true;
            
        }else if(sMSG!="")
        {
            alert(sMSG);
            return false;
        }
    }
</script>