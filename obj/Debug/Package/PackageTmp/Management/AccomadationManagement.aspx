<%@ Page Language="C#" AutoEventWireup="true" Codebehind="AccomadationManagement.aspx.cs"
    Inherits="SMEPayroll.Management.AccomadationManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
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

    <script language="javascript"  type="text/javascript"  src="../Frames/Script/CommonValidations.js" >           
    </script>
    
    <script language="javascript">
            function ValidationCheck()
            {
                var snewMSG = "";
	            //Shashank Starts-Date 11/01/2010
	            var msg =   "Address Setup-Accomadtion Name";
	            
	            var srcData="";
	            //Control Validation		    
	            //validateData(srcCtrl,destSrc,opType,srcData,msg,con)
	            var variable  = document.getElementById("txtAccName");	
	            var variable1 = document.getElementById("txtAmount");
	            var variable2 = document.getElementById("txtpostalcode");
	            
	            var variable3= document.getElementById("txtMpersonPhone");
	            var variable4 = document.getElementById("txtMperson2Phone");
	            var variable5 = document.getElementById("txtAsstPhone");
	            var variable6 = document.getElementById("txtArchPhone");
	            var variable7 = document.getElementById("txtArchFax");
	            
	            //Facilities
	            var variable8  = document.getElementById("txtCookingCost");
	            var variable9  = document.getElementById("txtLaundryCharge");
	            var variable10 = document.getElementById("txtACcharge");
	            var variable11 = document.getElementById("txtCapacity");
	            var variable12 = document.getElementById("txtTotalRooms");
	            var variable13 = document.getElementById("txtSingleBed");
	            var variable14 = document.getElementById("txtDoubleBed");
	            var variable15 = document.getElementById("txtTripleBed");
	            var variable16 = document.getElementById("txtEmpRent");
	            
	            //Approval
	            var variable17 = document.getElementById("txtNeaApprCapacity");
	            var variable18 = document.getElementById("txtPubCapacity");
	            var variable19 = document.getElementById("txtPropertyRent");
	            var variable20 = document.getElementById("txtProCapacity");
	            
                var srcCtrl=variable.id;
	            //srcCtrl=srcCtrl+','+vaiable6.id+','+vaiable7.id+','+ vaiable8.id+','+ vaiable9.id;	            
                var strirmsg = validateData(srcCtrl,'','MandatoryAll',srcData,msg,'');                
                if(strirmsg!="")  
                {
                  snewMSG += strirmsg;
                  snewMSG = "Following fields are missing.\n" + snewMSG + "\n"; 
                }
                
                strirmsg="";
                strirmsg=CheckNumeric(variable1.value,"Address Setup-Rental Amount");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                 
                strirmsg="";
                strirmsg=CheckNumeric(variable2.value,"\nAddress Setup-Postal Code");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                    
                strirmsg="";
                strirmsg=CheckNumeric(variable3.value,"\nAddress Setup- Main Person 1 Contact Number");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                    
                strirmsg="";
                strirmsg=CheckNumeric(variable4.value,"\nAddress Setup- Main Person 2 Contact Number");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                
                strirmsg="";
                strirmsg=CheckNumeric(variable5.value,"\nAddress Setup- Assistant Contact Number");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                    
                strirmsg="";
                strirmsg=CheckNumeric(variable6.value,"\nAddress Setup- Company Phone");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                    
                strirmsg="";
                strirmsg=CheckNumeric(variable7.value,"\nAddress Setup- Company Fax");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                    
                strirmsg="";
                strirmsg=CheckNumeric(variable8.value,"\nFacilities- Cooking Cost");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                 
                strirmsg="";
                strirmsg=CheckNumeric(variable9.value,"\nFacilities- LaundryCharge");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                
                strirmsg="";
                strirmsg=CheckNumeric(variable10.value,"\nFacilities- Aircon Charges");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                
                strirmsg="";
                strirmsg=CheckNumeric(variable11.value,"\nFacilities- Capacity");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                
                strirmsg="";
                strirmsg=CheckNumeric(variable12.value,"\nFacilities- Total Numer Of Romms");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                
                strirmsg="";
                strirmsg=CheckNumeric(variable13.value,"\nFacilities- Single Bed");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                
                strirmsg="";
                strirmsg=CheckNumeric(variable14.value,"\nFacilities- Double Bed");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                
                strirmsg="";
                strirmsg=CheckNumeric(variable15.value,"\nFacilities-Triple Bed");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                
                strirmsg="";
                strirmsg=CheckNumeric(variable16.value,"\nFacilities-Rent");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                //Approval 
                strirmsg="";
                strirmsg=CheckNumeric(variable17.value,"\Approval-Capacity NEA");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                 
                 strirmsg="";
                strirmsg=CheckNumeric(variable18.value,"\nApproval-Capacity PUB");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                    
                strirmsg="";
                strirmsg=CheckNumeric(variable19.value,"\nApproval-Land Month Rent");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                    
                    
                strirmsg="";
                strirmsg=CheckNumeric(variable20.value,"\nApprover-Capacity Property");
                if(strirmsg!="")                        
                    snewMSG+=strirmsg;
                
                if(snewMSG!="")
                {
                    alert(snewMSG);
                    return false;  
                }else
                {   
                    return true;  
                }
            }
                
                function showHideControls(obj)
                {

                if(obj.id == 'rdCoook')
                {
                   radio = document.form1.elements['rdGas'];
                if (radio[0].checked)
                    {
                        Ctrl = document.getElementById('rdGasType');
                        Ctrl.disabled=false;
                         Ctrl= document.getElementById('txtCookingCost');
                        Ctrl.disabled=false;
                        Ctrl.value='';
                       // Ctrl.style.display="none"; 
                      
                    }
                    else
                    { 
                     Ctrl = document.getElementById('rdGasType');
                        Ctrl.disabled=true;
                         Ctrl= document.getElementById('txtCookingCost');
                         Ctrl.value=0;
                       // Ctrl.style.display=""; //Showing Text Box
                       
                       Ctrl.disabled=true;
                    }
                }

                if(obj.id == 'rdLaundry')
                {
                   radio = document.form1.elements['rdLaundry'];
                if (radio[0].checked)
                    {
                         Ctrl= document.getElementById('txtLaundryCharge');
                        Ctrl.disabled=false;
                        Ctrl.value='';
                       // Ctrl.style.display="none"; 
                      
                    }
                    else
                    { 
                     
                         Ctrl= document.getElementById('txtLaundryCharge');
                         Ctrl.value=0;
                       // Ctrl.style.display=""; //Showing Text Box
                       
                       Ctrl.disabled=true;
                    }
                }
                if(obj.id == 'rdAc')
                {
                   radio = document.form1.elements['rdAc'];
                if (radio[0].checked)
                    {
                         Ctrl= document.getElementById('txtACcharge');
                        Ctrl.disabled=false;
                        Ctrl.value='';
                       // Ctrl.style.display="none"; 
                      
                    }
                    else
                    { 
                     
                         Ctrl= document.getElementById('txtACcharge');
                         Ctrl.value=0;
                       // Ctrl.style.display=""; //Showing Text Box
                       
                       Ctrl.disabled=true;
                    }
                }
                if(obj.id == 'rdPropType')
                {
                   radio = document.form1.elements['rdPropType'];
                if (radio[1].checked)
                    {
                         Ctrl= document.getElementById('txtPropertyRent');
                         Ctrl.disabled=false;
                    }
                    else 
                    {
                         Ctrl= document.getElementById('txtPropertyRent');
                        Ctrl.disabled=true;
                    
                       // Ctrl.style.display="none"; 
                      
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
        <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Accomadation Info</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right" style="height: 25px">
                                <asp:Button ID="Button1" runat="server" OnClick="btnsave_Click" Text="Save" Width="70px"
                                    Style="width: 80px; height: 22px"  OnClientClick="return ValidationCheck()"  />
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <radG:RadFormDecorator ID="RadFormDecorator1" runat="server" Skin="Outlook" DecoratedControls="all" />
        <asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
        <input type="hidden" id="oHidden" name="oHidden" runat="server" />
        <input type="hidden" id="HiddenAcc" name="oHidden" runat="server" />
        <div class="exampleWrapper">
            <radG:RadTabStrip ID="tbsComp" runat="server" SelectedIndex="0" MultiPageID="tbsCompany"
                Orientation="VerticalLeft" Style="float: left">
                <Tabs>
                    <radG:RadTab TabIndex="1" runat="server" AccessKey="P" Text="Address Setup" PageViewID="tbsAddar"
                        Selected="True">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="2" runat="server" AccessKey="P" Text="Facilities" PageViewID="tbspreferences">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="3" runat="server" AccessKey="I" Text="Approval" PageViewID="tbsir8a">
                    </radG:RadTab>
                </Tabs>
            </radG:RadTabStrip>
            <radG:RadMultiPage runat="server" ID="tbsCompany" SelectedIndex="0" Width="80%" Height="100%"
                CssClass="multiPage">
                <radG:RadPageView ID="tbsAddar" runat="server" Height="640px" Width="100%">
                    <table class="tbl" border="0">
                        <tr valign="top">
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" style="table-layout: auto; width: 100%;">
                                    <tr>
                                        <td style="width: 1%">
                                            &nbsp;
                                        </td>
                                        <td style="width: 98%">
                                            <table style="width: 100%;" class="tbl" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top">
                                                        <table border="0" class="tbl" cellspacing="0" cellpadding="0" width="100%">
                                                            <tr>
                                                                <td style="width: 50%">
                                                                </td>
                                                                <td style="width: 50%">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (A) Accomadation
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Accomodation Name:
                                                                </td>
                                                                <td>
                                                                    Rental / Owned :
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <asp:TextBox ID="txtAccName" Width="300px" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButtonList ID="rdRent" onClick="showHideControls(this);" runat="server"
                                                                        RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="1">Rental</asp:ListItem>
                                                                        <asp:ListItem Value="2" Selected="True">Owned</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <tt class="bodytxt">Amount :</tt>
                                                                    <asp:TextBox ID="txtAmount" Text="0" Width="60px" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (B) Address
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Address Line 1:
                                                                </td>
                                                                <td>
                                                                    Address Line 2:
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <asp:TextBox ID="txtAccaddress" Width="300px" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtAccaddress2" runat="server" Width="300px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Postal Code:
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtpostalcode" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (C) Contact
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Main Person 1 Name:
                                                                </td>
                                                                <td>
                                                                    Main Person 1 Contact No:
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtMpersonName" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtMpersonPhone" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Main Person 2 Name:
                                                                </td>
                                                                <td>
                                                                    Main Person 2 Contact No:
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtMperson2Name" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtMperson2Phone" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Assistant:
                                                                </td>
                                                                <td>
                                                                    Assistant Contact No:
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtAsstName" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtAsstPhone" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (C) Architect Information
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Company Name:
                                                                </td>
                                                                <td>
                                                                    Company Address:
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtArchCompName" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtArchCompAdd" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Company Phone:
                                                                </td>
                                                                <td>
                                                                    Company Fax:
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtArchPhone" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtArchFax" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Contct Person:
                                                                </td>
                                                                <td>
                                                                    Contct Person Email:
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtArchContactPerson" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtArchEmail" runat="server" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="width: 1%">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </radG:RadPageView>
                <radG:RadPageView class="tbl" runat="server" ID="tbspreferences" Height="640px" Width="100%">
                    <table class="tbl" border="0">
                        <tr valign="top">
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" style="table-layout: auto; width: 100%;">
                                    <tr>
                                        <td style="width: 1%">
                                            &nbsp;
                                        </td>
                                        <td style="width: 98%">
                                            <table style="width: 100%;" class="tbl" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top">
                                                        <table border="0" class="tbl" cellspacing="0" cellpadding="0" width="100%">
                                                            <tr>
                                                                <td style="width: 50%">
                                                                </td>
                                                                <td style="width: 50%">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (B) Facilities
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Cooking :
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <asp:RadioButtonList ID="rdCoook" runat="server" onClick="showHideControls(this);"
                                                                        RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="1">Available</asp:ListItem>
                                                                        <asp:ListItem Value="2" Selected="True">Not Available</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButtonList ID="rdGasType" runat="server" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="1">Gas Cooking</asp:ListItem>
                                                                        <asp:ListItem Value="2" Selected="True">Electrical Cooking</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    Amount :
                                                                    <asp:TextBox ID="txtCookingCost" Text="0" Width="60px" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                            </tr>
                                                            <tr>
                                                                <tr class="trstandbottom">
                                                                    <td>
                                                                        Laundry :
                                                                    </td>
                                                                    <td>
                                                                        Charges :
                                                                    </td>
                                                                </tr>
                                                                <tr class="trstandtop">
                                                                    <td>
                                                                        <asp:RadioButtonList ID="rdLaundry" onClick="showHideControls(this);" runat="server"
                                                                            RepeatDirection="Horizontal">
                                                                            <asp:ListItem Value="1">Available</asp:ListItem>
                                                                            <asp:ListItem Value="2" Selected="True">Not Available</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtLaundryCharge" runat="server" Width="60px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr class="trstandbottom">
                                                                    <td>
                                                                        Air Con :
                                                                    </td>
                                                                    <td>
                                                                        Charges :
                                                                    </td>
                                                                </tr>
                                                                <tr class="trstandtop">
                                                                    <td>
                                                                        <asp:RadioButtonList ID="rdAc" onClick="showHideControls(this);" runat="server" RepeatDirection="Horizontal">
                                                                            <asp:ListItem Value="1">Available</asp:ListItem>
                                                                            <asp:ListItem Value="2" Selected="True">Not Available</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACcharge" runat="server" Width="60px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Total No Of Rooms:
                                                                </td>
                                                                <td>
                                                                    Capacity :
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtTotalRooms" Width="60px" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtCapacity" Width="60px" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td colspan="2">
                                                                    <table width="100%">
                                                                        <td align="left" style="width: 38%">
                                                                            Single Bed :
                                                                        </td>
                                                                        <td align="center" style="width: 33%">
                                                                            Double Bed :</td>
                                                                        <td align="center" style="width: 29%">
                                                                            Triple Bed :</td>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <table width="100%">
                                                                        <td align="left" style="width: 38%">
                                                                            <asp:TextBox ID="txtSingleBed" Width="60px" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td align="center" style="width: 33%">
                                                                            <asp:TextBox ID="txtDoubleBed" Width="60px" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td align="center" style="width: 29%">
                                                                            <asp:TextBox ID="txtTripleBed" Width="60px" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                               <tr class="trstandbottom">
                                                                <td colspan="2">
                                                                    <table width="100%">
                                                                        <td align="left" style="width: 38%">
                                                                            Rent :
                                                                        </td>
                                                                        <td align="center" style="width: 33%">
                                                                           </td>
                                                                        <td align="center" style="width: 29%">
                                                                            </td>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <table width="100%">
                                                                        <td align="left" style="width: 38%">
                                                                            <asp:TextBox ID="txtEmpRent" Width="60px" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td align="center" style="width: 33%">
                                                                         
                                                                        </td>
                                                                        <td align="center" style="width: 29%">
                                                                         
                                                                        </td>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="width: 1%">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </radG:RadPageView>
                <radG:RadPageView class="tbl" runat="server" ID="tbsir8a" Height="640px" Width="100%">
                    <table class="tbl" border="0">
                        <tr valign="top">
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" style="table-layout: auto; width: 100%;">
                                    <tr>
                                        <td style="width: 1%">
                                            &nbsp;
                                        </td>
                                        <td style="width: 98%">
                                            <table style="width: 100%;" class="tbl" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top">
                                                        <table border="0" class="tbl" cellspacing="0" cellpadding="0" width="100%">
                                                            <tr>
                                                                <td style="width: 50%">
                                                                </td>
                                                                <td style="width: 50%">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (C) Approvals
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    NEA
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <asp:RadioButtonList ID="rdNea" runat="server" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="1" Selected="True">Yes</asp:ListItem>
                                                                        <asp:ListItem Value="2">No</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Date Of Approval :
                                                                </td>
                                                                <td>
                                                                    Date Of Expiry :
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <radG:RadDatePicker Width="160px" Calendar-ShowRowHeaders="false" MinDate="01-01-1900"
                                                                        ID="rdNeaApprovalDate" runat="server">
                                                                        <DateInput ID="DateInput1" runat="server" Skin="" DateFormat="dd/MM/yyyy">
                                                                        </DateInput>
                                                                    </radG:RadDatePicker>
                                                                </td>
                                                                <td>
                                                                    <radG:RadDatePicker Width="160px" Calendar-ShowRowHeaders="false" MinDate="01-01-1900"
                                                                        ID="rdNeaExpiryDt" runat="server">
                                                                        <DateInput ID="DateInput2" runat="server" Skin="" DateFormat="dd/MM/yyyy">
                                                                        </DateInput>
                                                                    </radG:RadDatePicker>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Approval Ref No:
                                                                </td>
                                                                <td>
                                                                    Approval Capacity :
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtNeaAppRef" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtNeaApprCapacity" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    PUB
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <asp:RadioButtonList ID="rdPub" runat="server" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="1" Selected="True">Yes</asp:ListItem>
                                                                        <asp:ListItem Value="2">No</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Date Of Approval :
                                                                </td>
                                                                <td>
                                                                    Date Of Expiry :
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <radG:RadDatePicker Width="160px" Calendar-ShowRowHeaders="false" MinDate="01-01-1900"
                                                                        ID="rdPubApprDate" runat="server">
                                                                        <DateInput ID="PubInput" runat="server" Skin="" DateFormat="dd/MM/yyyy">
                                                                        </DateInput>
                                                                    </radG:RadDatePicker>
                                                                </td>
                                                                <td>
                                                                    <radG:RadDatePicker Width="160px" Calendar-ShowRowHeaders="false" MinDate="01-01-1900"
                                                                        ID="rdPubExpiryDate" runat="server">
                                                                        <DateInput ID="PubInput2" runat="server" Skin="" DateFormat="dd/MM/yyyy">
                                                                        </DateInput>
                                                                    </radG:RadDatePicker>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Approval Ref No:
                                                                </td>
                                                                <td>
                                                                    Approval Capacity :
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtPubAppRef" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtPubCapacity" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    Property
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <asp:RadioButtonList ID="rdPropType" runat="server" onClick="showHideControls(this);"
                                                                        RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="1" Selected="True">URA</asp:ListItem>
                                                                        <asp:ListItem Value="2">JTC</asp:ListItem>
                                                                        <asp:ListItem Value="2">Private</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                                <td>
                                                                    Land Monthly Rent :
                                                                    <input type="text" id="txtPropertyRent" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Date Of Approval :
                                                                </td>
                                                                <td>
                                                                    Date Of Expiry :
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <radG:RadDatePicker Width="160px" Calendar-ShowRowHeaders="false" MinDate="01-01-1900"
                                                                        ID="dtPropertyApprDate" runat="server">
                                                                        <DateInput ID="DateInput3" runat="server" Skin="" DateFormat="dd/MM/yyyy">
                                                                        </DateInput>
                                                                    </radG:RadDatePicker>
                                                                </td>
                                                                <td>
                                                                    <radG:RadDatePicker Width="160px" Calendar-ShowRowHeaders="false" MinDate="01-01-1900"
                                                                        ID="dtPropertyExpDate" runat="server">
                                                                        <DateInput ID="DateInput4" runat="server" Skin="" DateFormat="dd/MM/yyyy">
                                                                        </DateInput>
                                                                    </radG:RadDatePicker>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Approval Ref No:
                                                                </td>
                                                                <td>
                                                                    Approval Capacity :
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtProRef" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtProCapacity" runat="server" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="width: 1%">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </radG:RadPageView>
            </radG:RadMultiPage>
        </div>
    </form>
</body>
</html>
