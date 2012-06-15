<%@ Page Language="C#" AutoEventWireup="true" Codebehind="AddCompanyNew.aspx.cs"
    Inherits="SMEPayroll.Company.AddCompanyNew" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radCln" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title></title>
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
    <script language="javascript" src="../Frames/Script/CommonValidations.js">
    </script>
    <script language="javascript" type="text/javascript">
            function gup( name )
            { 
            
          
             name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");  
             var regexS = "[\\?&]"+name+"=([^&#]*)"; 
             var regex = new RegExp( regexS );  
             var results = regex.exec( window.location.href );  
             if( results == null )    return "";  
             else    return results[1];             
           }
          function ClientTabSelectedHandler(sender, eventArgs)
          {
 
             var tabStrip = sender;
             var tab = eventArgs.Tab;
             var tabid=tab.ID;
             var qs=gup('compid');                       
             if((tab.Text=='GiroSetup')&&(qs==""))
             {
             alert('This setup will be enabled only after adding the company details');
             }       
         }
        
        
           
//            function onSelectedIndexChanged(sender,eventArgs)
//            {        
//                    var item = eventArgs.get_item();
//                    // alert the new item text and value.
//                    //var label = document.getElementById("Label1");
//                    //var txtMinutes = document.getElementById("txtMinutes");                  
//                   var label  = document.getElementById("Label1");           
//                   var txtMinutes  = document.getElementById("txtMinutes");           
//                   
//                    if(item.get_text()=='Yes')
//                    {
//                         alert(1); 
//                          label.style.display = 'inherit'; 
//                          txtMinutes.style.display = 'inherit';
//                    }   
//                    else
//                    {
//                           alert(1); 
//                          label.style.display = 'none'; 
//                          txtMinutes.style.display = 'none'; 
//                    }                 
//            }

        
        

function checkNumeric(objName,minval,maxval,comma,period,hyphen,fieldName, msg)
{
// only allow 0-9 be entered, plus any values passed
// (can be in any order, and don't have to be comma, period, or hyphen)
// if all numbers allow commas, periods, hyphens or whatever,
// just hard code it here and take out the passed parameters
var alertsay='';
var checkOK = "0123456789" + comma + period + hyphen;
var checkStr = objName;
var allValid = true;
var decPoints = 0;
var allNum = "";


for (i = 0;  i < checkStr.value.length;  i++)
{
ch = checkStr.value.charAt(i);
for (j = 0;  j < checkOK.length;  j++)
if (ch == checkOK.charAt(j))
break;
if (j == checkOK.length)
{
allValid = false;
break;
}
if (ch != ",")
allNum += ch;
}


if (!allValid)
{	
alertsay = msg;
return (alertsay);
}

// set the minimum and maximum
var chkVal = allNum;
var prsVal = parseInt(allNum);

if (chkVal != "" && !(prsVal >= minval && prsVal <= maxval))
{
alertsay = "Please enter a value greater than or "
alertsay = alertsay + "equal to \"" + minval + "\" and less than or "
alertsay = alertsay + "equal to \"" + maxval + "\" in the \"" + fieldName + "\" field. \n"
}

return (alertsay);
}

         
          function ChkCPFRefNo()
          {
             
             
             
            
         
                var newsMSG = "";
                //Check New Validations -Start
                var msg ="Address Setup-Prefix Code Required,Address Setup-Company Name Required!";
		        
		    
		        var srcData="";
		        //Control Validation		    
		        //validateData(srcCtrl,destSrc,opType,srcData,msg,con)
		        var vaiable  = document.getElementById("txtCompCode");
		        var vaiable1 = document.getElementById("txtCompName");
		        var vaiable2 = document.getElementById("txtpostalcode");
		        var vaiable3= document.getElementById ("txtCompPhone");
		        var vaiable4= document.getElementById ("txtCompfax");
		        var vaiable5= document.getElementById("txtCompemail");//Email		    
		        var vaiable6= document.getElementById("txtwebsite");//WebSite
		        var vaiable7= document.getElementById("cmbccleave");//Email
		        var vaiable8= document.getElementById("cmbccclaim");//Email
		        var vaiable9= document.getElementById("txtccmail");//Email
		        
		        var vaiable10= document.getElementById("txtCompperson");//AN
		        var vaiable11= document.getElementById("txtdesign");//AN
		        var vaiable12= document.getElementById("txtcompany_roc");//AN
		        var vaiable13= document.getElementById("txtauth_emai");//Email Address
		        
		        var vaiable14= document.getElementById("txtemailsender_address");//Email Address		        
		        var vaiable15= document.getElementById("txtemailsender_domain");//Email Address
		        var vaiable16= document.getElementById("txtsmtpport");//Email Address
		    		    
                var srcCtrl=vaiable.id +','+vaiable1.id;
		        //alert(vaiable.id);
                var strirmsg = validateData(srcCtrl,'','MandatoryAll',srcData,msg,'');
                if(strirmsg!="")
                    newsMSG = "Following fields are missing.\n" + strirmsg + "\n"; 
                
                
                //r
                //validation for timesheet((d) Setting)
                if(document.getElementById("cbxEmailAlert").value=="Yes")
                {
                  if(document.getElementById("drpEmpProc1").value=="Processer")
                  {
                      if(document.getElementById("txtProcesserEmail").value=="")
                      {
                         newsMSG += "Please Enter Processer Email";
                      }
                  }
                }
                
                
                //Check PrefixCode As Alpha Numeric Value 
                strirmsg=alphanumeric(vaiable,"Address Setup -Prefix Code");
                if(strirmsg!="")
                    newsMSG += strirmsg;                  
                //Check PrefixCode As should not >=6
                strirmsg=CheckMaxMinLength(vaiable.value.length,"5",">","\nAddress Setup -Prefix Code");
                if(strirmsg!="")
                    newsMSG += strirmsg;  
                //Postal code NUmeric
                strirmsg=CheckNumeric(vaiable2.value,"\nAddress Setup -Postal Code");
                if(strirmsg!="")
                    newsMSG += strirmsg;      
                    
                //Phone Number code NUmeric
                strirmsg=CheckNumeric(vaiable3.value,"\nAddress Setup -Phone Number");
                if(strirmsg!="")
                    newsMSG += strirmsg;
                    
                 //FAX Numeric
                strirmsg=CheckNumeric(vaiable4.value,"\nAddress Setup -Fax");
                if(strirmsg!="")
                    newsMSG += strirmsg;
                    
                //Email
                strirmsg=ValidateEmail(vaiable5.value,"\nAddress Setup -Email");
                if(strirmsg!="")
                    newsMSG += strirmsg;
                
                //Website 
                strirmsg=ValidateWebAddress(vaiable6.value,"\nAddress Setup -WebSite");
                if(strirmsg!="")
                    newsMSG += strirmsg;
                
                //************************************************************
                //Email ******************************************************
                        if(ValidmultiEmail(vaiable7.value)=="false")
                        {
                            strirmsg = "\n Preference Setup -CC For Leave Email -Please Enter Valid Email!";
                            if(strirmsg!="")
                                newsMSG += strirmsg;
                        }
                        
                        //Email ***
                        if(ValidmultiEmail(vaiable8.value)=="false")
                        {
                            strirmsg = "\n Preference Setup -CC For Claims Email -Please Enter Valid Email!";
                            if(strirmsg!="")
                                newsMSG += strirmsg;
                        }
                        
                        //Email ***
                        if(ValidmultiEmail(vaiable9.value)=="false")
                        {
                            strirmsg = "\n Preference Setup -CC For Payroll Email -Please Enter Valid Email!";
                            if(strirmsg!="")
                                newsMSG += strirmsg;
                        }
                //************************************************************
                    
                //Alpha numeric                
                strirmsg=alphanumeric(vaiable10,"\nIR8A Setup-Authorized Person");
                if(strirmsg!="")
                    newsMSG += strirmsg;
                    
                //Alpha numeric                
                strirmsg=alphanumeric(vaiable11,"\nIR8A Setup -Authorized Person Designation");
                if(strirmsg!="")
                    newsMSG += strirmsg; 
                
                //Alpha numeric                
                strirmsg=alphanumeric(vaiable12,"\nIR8A Setup -Company ROC");
                if(strirmsg!="")
                    newsMSG += strirmsg; 
                
                 //Email 
                strirmsg=ValidateEmail(vaiable13.value,"\nIR8A Setup -Authorized Person");
                if(strirmsg!="")
                    newsMSG += strirmsg;
                    
                //Email *****
                strirmsg=ValidateEmail(vaiable14.value,"\nEmail Setup -Sender Address");
                if(strirmsg!="")
                    newsMSG += strirmsg;                        
               
                    
                //Email 
                strirmsg=ValidateEmail(vaiable15.value,"\nEmail Setup -Payroll Approver");
                if(strirmsg!="")
                    newsMSG += strirmsg;
    
                 //Numeric
                strirmsg=CheckNumeric(vaiable16.value,"\nEmail Setup - SMTP Port");
                if(strirmsg!="")
                    newsMSG += strirmsg;
                
                if (newsMSG == "")
                {
		            	return true;
		        }
		        else
		        {
			        
		            alert(newsMSG); 
			        return false;
	            }
                
                
                
                //Check New Validations -End
                var sMSG = "";
                if ( !document.employeeform.txtCompCode.value )
                {
                    sMSG += "Address Setup-Prefix Code Required!\n";	
                }
                else
                {
                    if (document.employeeform.txtCompCode.value.length >= 6)
                    {
                        sMSG += "Address Setup-Prefix Code Length should not be more than 5 characters!\n";	
                    }
                }
			
			
		 if ( !document.employeeform.txtCompName.value )
			sMSG += "Address Setup-Company Name Required!\n";
		   if (( !document.employeeform.cmbworkingdays.value )||(document.employeeform.cmbworkingdays.value=='-select-'))
		   {
			sMSG += "Preferences Setup-Working Days Setup Required!\n";	
			}
			
			
			 

//		if ( !document.employeeform.txthrs_day.value )
//		{
//			sMSG += "Preferences Setup-Hours in a day is Required!\n";	
//	    }
//	    else
//	    {
//		    var objhr=document.employeeform.txthrs_day;
//		    sMSG += checkNumeric(objhr,1,12,'','','','Hours in a day','Preference Setup: Please enter numeric[no decimal] in Hours in a day');
//	    }
//	    
//	    if ( !document.employeeform.txtmin_day.value )
//		{
//	    }
//	    else
//	    {
//		    var objmi =document.employeeform.txtmin_day;
//		    sMSG += checkNumeric(objmi,1,60,'','','','Minutes in a day','Preference Setup: Please enter numeric[no decimal] in Minutes in a day');
//	    }		

       
		
       if (sMSG == "")
		    return true;
	    else
	    {
		    sMSG = "Following fields are missing.\n\n" + sMSG; 
	        alert(sMSG); 
		    return false;
        }
    }

      function ShowPayslip()
      {
        var str = document.employeeform.cmbpayslipformat.value;
        switch(str)
        {
            case 'Format 1':
                window.open("../Documents/Payslips/Payslip1.pdf");
                break;
            case 'Format 2':
                window.open("../Documents/Payslips/Payslip2.pdf");
                break;
            case 'Format 3':
                window.open("../Documents/Payslips/Payslip3.pdf");
                break;
            case 'Format 4':
                window.open("../Documents/Payslips/Payslip4.pdf");
                break;
            case 'Format 5':
                window.open("../Documents/Payslips/Payslip5.pdf");
                break;
        }
      }
function onrdtimesheetchange()
{
    var ctrl1 = document.getElementById('rdtimesheet');
    var ctrl2 = document.getElementById('rdtsremarks');
    
    if (ctrl1.value == "1")
    {
        ctrl2.disabled = false;
    }
    else
    {
        ctrl2.disabled = true;
        ctrl2.value = "0";
    }

}  

    
  
  function isProper(formField) 
{
    var result = true;
    var string = formField.length;
    var iChars = "*|,\":<>[]{}`\';()@&$#%";
    for (var i = 0; i < string; i++) 
    {
        if (iChars.indexOf(formField.charAt(i)) != -1)
        result = false;
    }
    return result;
}

         //...Check Email Details ... ...
            function CheckEmailDetails()
            {
                var flag='true';
                var newsMSG = "";
                //Check New Validations -Start
                var srcData="";
                var strirmsg="";
                var msg ="Email Setup-Sender Address,Email Setup-Payroll Approver Email,Email Setup-SMTP Port,Email Setup-SMTP Server,Email Setup-UserName";
                
                var vaiable14= document.getElementById("txtemailsender_address");//Email Address		        
                var vaiable15= document.getElementById("txtemailsender_domain");//Email Address
		        var vaiable16= document.getElementById("txtsmtpport");//Email Address
        		
		        var vaiable17= document.getElementById("txtsmtpserver");//Email Address		        
                var vaiable18= document.getElementById("txtemailuser");//Email Address		
        		    		    
                var srcCtrl=vaiable14.id +','+vaiable15.id+','+vaiable16.id+','+vaiable17.id+','+vaiable18.id;
		        //alert(vaiable.id);
                var strirmsg = validateData(srcCtrl,'','MandatoryAll',srcData,msg,'');
                if(strirmsg!="")
                        newsMSG = "Following fields are missing.\n" + strirmsg + "\n"; 
        		
                //Email *****
                strirmsg=ValidateEmail(vaiable14.value,"\nEmail Setup -Sender Address");
                if(strirmsg!="")
                    newsMSG += strirmsg;
                            
                //Email 
                strirmsg=ValidateEmail(vaiable15.value,"\nEmail Setup -Payroll Approver");
                if(strirmsg!="")
                    newsMSG += strirmsg;
            
                //Numeric
                strirmsg=CheckNumeric(vaiable16.value,"\nEmail Setup - SMTP Port");
                if(strirmsg!="")
                    newsMSG += strirmsg;

                if (newsMSG == "")
                {
                   return true;
		        }
		        else
		        {
		           alert(newsMSG); 
		           return false;
	            }
            }
            
    </script>
    
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
    <form id="employeeform" runat="server" method="post">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Add/Edit Company</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td>
                            </td>
                            <td align="center" style="height: 25px">
                                <asp:Label ID="lblerror" runat="server" ForeColor="red" class="bodytxt" Font-Bold="true"></asp:Label>
                            </td>
                            <td align="right" style="height: 25px">
                                <asp:Button ID="Button1" runat="server" OnClick="btnsave_Click" Text="Save" Width="70px"
                                    Style="width: 80px; height: 22px" OnClientClick="return ChkCPFRefNo();"  />
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
                <%--<td width="5%">
                    <img alt="" src="../frames/images/EMPLOYEE/Top-Employeegrp.png" /></td>--%>
            </tr>
        </table>
        <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" Skin="Outlook" DecoratedControls="all" />
        <asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
        <input type="hidden" value="0" id="theValue" />
        <input type="hidden" id="oHidden" name="oHidden" runat="server" />
        <div class="exampleWrapper">
            <telerik:RadTabStrip ID="tbsComp" runat="server" SelectedIndex="0" MultiPageID="tbsCompany"
                Orientation="VerticalLeft" Style="float: left">
                <Tabs>
                    <radG:RadTab TabIndex="1" runat="server" AccessKey="P" Text="&lt;u&gt;A&lt;/u&gt;ddress Setup"
                        PageViewID="tbsAddar" Selected="True">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="2" runat="server" AccessKey="P" Text="&lt;u&gt;P&lt;/u&gt;references Setup"
                        PageViewID="tbspreferences">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="3" runat="server" AccessKey="I" Text="&lt;u&gt;I&lt;/u&gt;R8A Setup"
                        PageViewID="tbsir8a">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="4" runat="server" AccessKey="G" Text="&lt;u&gt;G&lt;/u&gt;iro Setup"
                        PageViewID="tbsgiro">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="5" runat="server" AccessKey="E" Text="&lt;u&gt;E&lt;/u&gt;mail Setup"
                        PageViewID="tbsPayslip">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="6" runat="server" AccessKey="U" Text="&lt;u&gt;U&lt;/u&gt;ser Setup"
                        PageViewID="tbsuser">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="7" runat="server" AccessKey="C" Text="&lt;u&gt;C&lt;/u&gt;SN Setup"
                        PageViewID="tblCSN">
                    </radG:RadTab>
                    <radG:RadTab TabIndex="8" runat="server" AccessKey="T" Text="Cos&lt;u&gt;t&lt;/u&gt; Center"
                        PageViewID="tblCost">
                    </radG:RadTab>
                     <radG:RadTab TabIndex="9" runat="server" AccessKey="S" Text="TimeSheet"
                        PageViewID="tblTimeSheet">
                    </radG:RadTab>
                     <radG:RadTab TabIndex="10" runat="server" AccessKey="P" Text="PaySlipSetup"
                        PageViewID="tblPaySlipSetup">
                    </radG:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage runat="server" ID="tbsCompany" SelectedIndex="0" Width="80%"
                Height="100%" CssClass="multiPage">
                <telerik:RadPageView ID="tbsAddar" runat="server" Height="640px" Width="100%">
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
                                                                    (A) Company
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Prefix Code:
                                                                </td>
                                                                <td>
                                                                    Company Name:
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <asp:TextBox ID="txtCompCode" Width="300px" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtCompName" Width="300px" runat="server"></asp:TextBox>
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
                                                                    <asp:TextBox ID="txtcompaddress" Width="300px" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtcompaddress2" runat="server" Width="300px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    City:
                                                                </td>
                                                                <td>
                                                                    State:
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td style="height: 20px">
                                                                    <input type="text" id="txtCompcity" runat="server" />
                                                                </td>
                                                                <td style="height: 20px">
                                                                    <input type="text" id="txtCompstate" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Postal Code:
                                                                </td>
                                                                <td>
                                                                    Country:
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtpostalcode" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <div>
                                                                        <telerik:RadComboBox ID="cmbCountry" class="textfields" Font-Size="8pt" runat="server"
                                                                            Height="200px" Width="200px" EmptyMessage="Choose a Region" MarkFirstMatch="true"
                                                                            EnableLoadOnDemand="true">
                                                                        </telerik:RadComboBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (C) Contact
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Email:
                                                                </td>
                                                                <td>
                                                                    Phone:
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtCompemail" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtCompPhone" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Fax:
                                                                </td>
                                                                <td>
                                                                    Website:
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtCompfax" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtwebsite" runat="server" />
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
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbspreferences" Height="750px"
                    Width="100%">
                    <table class="tbl" border="0">
                        <tr valign="top">
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" style="table-layout: auto; width: 100%;">
                                    <tr>
                                        <td style="width: 1%">
                                            &nbsp;
                                        </td>
                                        <td style="width: 98%">
                                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top">
                                                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                            <tr style="display:none" >
                                                                <td class="tdstand" colspan="4" style="display:none">
                                                                    (A) Workingday Setup
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom" style="display:none" >
                                                                <td>
                                                                    No Of Working Days:*
                                                                </td>
                                                                <td>
                                                                    Timesheet Required:
                                                                </td>
                                                                <td colspan="2">
                                                                    Timesheet Remarks:</td>
                                                            </tr>
                                                            <tr class="trstandtop" style="display:none" >
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbworkingdays1" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="5" Value="5" />
                                                                            <telerik:RadComboBoxItem Text="5.5" Value="5.5" />
                                                                            <telerik:RadComboBoxItem Text="6" Value="6" />
                                                                            <telerik:RadComboBoxItem Text="7" Value="7" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                    <select id="rdtimesheet1" onchange="javascript:onrdtimesheetchange();" runat="server"
                                                                        class="textfields" style="width: 120px">
                                                                        <option value="1" selected="selected">Yes</option>
                                                                        <option value="2">No</option>
                                                                    </select>
                                                                </td>
                                                                <td colspan="2">
                                                                    <select id="rdtsremarks1" runat="server" class="textfields" style="width: 120px">
                                                                        <option value="0" selected="selected">No</option>
                                                                        <option value="1">Yes</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (A) Leave Model
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Leave Model:
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbLeaveModel" runat="server" Width="220px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="Fixed Yearly - Normal" Value="1" />
                                                                            <telerik:RadComboBoxItem Text="Fixed Yearly - Prorated" Value="7" />
                                                                            <telerik:RadComboBoxItem Text="Fixed Yearly - Prorated (Floor)" Value="2" />
                                                                            <telerik:RadComboBoxItem Text="Fixed Yearly - Prorated (Ceiling)" Value="5" />
                                                                            <telerik:RadComboBoxItem Text="Yearly of Service - Normal" Value="3" />
                                                                            <telerik:RadComboBoxItem Text="Yearly of Service - Prorated" Value="8" />
                                                                            <telerik:RadComboBoxItem Text="Yearly of Service - Prorated (Floor)" Value="4" />
                                                                            <telerik:RadComboBoxItem Text="Yearly of Service - Prorated (Ceiling)" Value="6" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (B)  Leave Forfeit  
                                                                </td>
                                                            </tr>
                                                             <tr class="trstandbottom">
                                                                <td>
                                                                    Date:
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                             <tr class="trstandbottom">
                                                                <td>
                                                                     <radCln:RadDatePicker Calendar-ShowRowHeaders="false" MinDate="01-01-1900" ID="radLFort"
                                                                        runat="server">
                                                                        <DateInput ID="DateInput7" runat="server" Skin="" DateFormat="dd/MM/yyyy">
                                                                        </DateInput>
                                                                    </radCln:RadDatePicker>
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="btnLeaveFF" runat="server" Text="Forfeit Leaves" Enabled="false" />
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (C) Email Alerts
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Alert For Leaves:
                                                                </td>
                                                                <td>
                                                                    CC For Leave:
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbemailleave" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="Yes" Value="Yes" />
                                                                            <telerik:RadComboBoxItem Text="No" Value="No" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="cmbccleave" style="width:350px"  runat="server" />
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Alert For Claims:
                                                                </td>
                                                                <td>
                                                                    CC For Claims:
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbclaim" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="Yes" Value="Yes" />
                                                                            <telerik:RadComboBoxItem Text="No" Value="No" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="cmbccclaim" runat="server" style="width:350px"  />
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Alert For Payroll:
                                                                </td>
                                                                <td>
                                                                    CC For Payroll:
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbemailpay" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="Yes" Value="Yes" />
                                                                            <telerik:RadComboBoxItem Text="No" Value="No" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtccmail" runat="server" style="width:350px" />
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (D) Rounding Decimal
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Basic Pay/Unpaid Leaves:
                                                                </td>
                                                                <td>
                                                                    Additions (Claims, Overtime,Variables, Other Additions):&nbsp;&nbsp;
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbLeaveRoundoff" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="0" Value="0" />
                                                                            <telerik:RadComboBoxItem Text="2" Value="2" />
                                                                            <telerik:RadComboBoxItem Text="3" Value="3" />
                                                                            <telerik:RadComboBoxItem Text="N/A" Value="-1" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                    <span style="vertical-align: middle">
                                                                        <telerik:RadComboBox ID="cmbAdditionsRoundoff" runat="server" Width="100px" EmptyMessage="-select-"
                                                                            MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                            <Items>
                                                                                <telerik:RadComboBoxItem Text="0" Value="0" />
                                                                                <telerik:RadComboBoxItem Text="2" Value="2" />
                                                                                <telerik:RadComboBoxItem Text="3" Value="3" />
                                                                                <telerik:RadComboBoxItem Text="N/A" Value="-1" />
                                                                            </Items>
                                                                        </telerik:RadComboBox>
                                                                    </span>
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Deductions:
                                                                </td>
                                                                <td>
                                                                    Net Pay:
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbDeductionsRoundoff" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="0" Value="0" />
                                                                            <telerik:RadComboBoxItem Text="2" Value="2" />
                                                                            <telerik:RadComboBoxItem Text="3" Value="3" />
                                                                            <telerik:RadComboBoxItem Text="N/A" Value="-1" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                    <span style="vertical-align: middle">
                                                                        <telerik:RadComboBox ID="cmbNetPayRoundoff" runat="server" Width="100px" EmptyMessage="-select-"
                                                                            MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                            <Items>
                                                                                <telerik:RadComboBoxItem Text="0" Value="0" />
                                                                                <telerik:RadComboBoxItem Text="2" Value="2" />
                                                                                <telerik:RadComboBoxItem Text="3" Value="3" />
                                                                                <telerik:RadComboBoxItem Text="N/A" Value="-1" />
                                                                            </Items>
                                                                        </telerik:RadComboBox>
                                                                    </span>
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (E) CPF Ceiling
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Monthly CPF Ceiling:
                                                                </td>
                                                                <td>
                                                                    Annual CPF Ceiling:
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtmonthly_cpf_ceil" runat="server" disabled="disabled" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" disabled="disabled" id="txtannual_cpf_ceil" runat="server" />
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtopHidden" style="display:none">
                                                                <td>
                                                                    <input type="text" id="txthrs_day" runat="server" style="width: 50px" />
                                                                    <input type="text" id="txtmin_day" runat="server" style="width: 50px" />
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                             <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (F) Approval Process
                                                                </td>
                                                             </tr>
                                                             
                                                              <tr class="trstandbottom">
                                                                <td>
                                                                    Payroll Approval:
                                                                </td>
                                                                <td>
                                                                    Leave Approval :
                                                                </td>
                                                                <td colspan="2" align="left">
                                                                    Claims Approval :
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButtonList ID="radListPayrollApp" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" >
                                                                        <asp:ListItem Selected="True" Value="1">Required</asp:ListItem>
                                                                        <asp:ListItem Value="0">NotRequired</asp:ListItem>
                                                                    </asp:RadioButtonList >
                                                                </td>
                                                                
                                                                 <td>
                                                                    <asp:RadioButtonList  ID="radListLeaveApp" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" Enabled=false >
                                                                        <asp:ListItem Selected="True" Value="1">Required</asp:ListItem>
                                                                        <asp:ListItem Value="0">NotRequired</asp:ListItem>
                                                                    </asp:RadioButtonList >
                                                                </td>
                                                                
                                                                 <td>
                                                                    <asp:RadioButtonList ID="radListClaimApp" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" Enabled=false >
                                                                        <asp:ListItem Selected="True" Value="1">Required</asp:ListItem>
                                                                        <asp:ListItem Value="0">NotRequired</asp:ListItem>
                                                                    </asp:RadioButtonList >
                                                                </td>
                                                            
                                                            </tr>
                                                            
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (G) Payroll
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Payroll Type:
                                                                </td>
                                                                <td>
                                                                    WorkFlow :
                                                                </td>
                                                                <td colspan="2" align="left">
                                                                    WorkFlow For
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbPayrollType" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="Monthly" Value="1" />
                                                                            <telerik:RadComboBoxItem Text="Bi-Monthly" Value="2" />
                                                                            <telerik:RadComboBoxItem Text="Both" Value="0" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButtonList ID="rdWorkFlow" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" >
                                                                        <asp:ListItem Selected="True" Value="-1">None</asp:ListItem>
                                                                        <asp:ListItem Value="1">WorkFlow1</asp:ListItem>
                                                                        <asp:ListItem Value="2">WorkFlow2</asp:ListItem>
                                                                    </asp:RadioButtonList >
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:CheckBoxList ID="chkWF" runat="server" RepeatDirection="Horizontal" >
                                                                        <asp:ListItem Enabled="false">Employee</asp:ListItem>
                                                                        <asp:ListItem Enabled="false">Leave</asp:ListItem>
                                                                        <asp:ListItem Enabled="false">Claim</asp:ListItem>
                                                                        <asp:ListItem>Payroll</asp:ListItem>
                                                                        <asp:ListItem Enabled="false">Report</asp:ListItem>
                                                                        <asp:ListItem Enabled="false">TimeSheet</asp:ListItem>
                                                                    </asp:CheckBoxList>
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Foreign Worker Levy(FWL)
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    <asp:CheckBox ID="chkWL" runat="server" Checked="true"  Text ="Foreign Worker Levy(FWL)" />
                                                                </td>
                                                            </tr>
                                                            
                                                            
                                                             <%if (Request.QueryString["compid"] == "1")
                                                             {%>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (G) Company Type
                                                                </td>
                                                            </tr>
                                                            
                                                           
                                                            
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Master Company:
                                                                </td>
                                                                <td>
                                                                    Temporary Employee:
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                             
                                                            <tr>
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbIsMaster" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true"    >
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="No" Value="0" />
                                                                            <telerik:RadComboBoxItem Text="Yes" Value="1" />                                                                            
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbtempEmp" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true"    >
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="No" Value="0" />
                                                                            <telerik:RadComboBoxItem Text="Yes" Value="1" />                                                                            
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <%}%>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            <tr style="display:none" >
                                                                <td class="tdstand" colspan="4">
                                                                    (G) Timesheet & Project Setup
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom" style="display:none" >
                                                                <td>
                                                                    Project Assignment:
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr style="display:none" >
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbAssignType1" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="" Value="0" />
                                                                            <telerik:RadComboBoxItem Text="One Time" Selected="true" Value="1" />
                                                                            <telerik:RadComboBoxItem Text="Daily" Value="2" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td colspan="2">
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
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsir8a" Height="640px" Width="100%">
                    <table class="tbl" border="0">
                        <tr valign="top">
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" style="table-layout: auto; width: 100%;">
                                    <tr>
                                        <td style="width: 1%">
                                            &nbsp;
                                        </td>
                                        <td style="width: 98%">
                                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top">
                                                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                            <tr>
                                                                <td style="width: 50%">
                                                                </td>
                                                                <td style="width: 50%">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (A) IR8A Information
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Authorized person:
                                                                </td>
                                                                <td>
                                                                    Authorized person Designation:
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtCompperson" runat="server" style="width: 211px" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" maxlength="50" id="txtdesign" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Authorized person's Email-ID:
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtauth_emai" runat="server" style="width: 211px" />
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Company ROC:
                                                                </td>
                                                                <td>
                                                                    Company Type
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <asp:TextBox ID="txtcompany_roc" Width="211px" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadComboBox ID="drpcompany_type" DataTextField="text" DataValueField="id"
                                                                        DataSourceID="xmldtCompType" class="textfields" Font-Size="8pt" runat="server"
                                                                        Height="200px" Width="200px" EmptyMessage="Choose a Company" MarkFirstMatch="true"
                                                                        EnableLoadOnDemand="true">
                                                                    </telerik:RadComboBox>
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
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsgiro" Height="640px" Width="100%">
                    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                        <tr bgcolor="<%=sOddRowColor%>">
                            <td>
                                <tt class="bodytxt"><strong>Giro Setup:</strong></tt>
                            </td>
                        </tr>
                    </table>
                    <center>
                        <radG:RadGrid ID="RadGrid1" GridLines="None" AutoGenerateColumns="False" Skin="Outlook"
                            AllowPaging="True" PageSize="20" AllowFilteringByColumn="false" OnUpdateCommand="RadGrid1_UpdateCommand"
                            OnInsertCommand="RadGrid1_InsertCommand" OnNeedDataSource="RadGrid1_NeedDataSource"
                            runat="server" Width="715px">
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id, giroid" CommandItemDisplay="Bottom">
                                <ExpandCollapseColumn Visible="False">
                                    <HeaderStyle Width="19px"></HeaderStyle>
                                </ExpandCollapseColumn>
                                <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </RowIndicatorColumn>
                                <Columns>
                                    <radG:GridBoundColumn Visible="false" DataField="giroid" HeaderText="giroid" SortExpression="giroid"
                                        UniqueName="giroid">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="desc" HeaderText="Bank Name" SortExpression="bank_name"
                                        UniqueName="desc">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="bank_code" HeaderText="Bank Code" SortExpression="code"
                                        UniqueName="code">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Visible="false" DataField="bank_branch" HeaderText="Bank Branch"
                                        SortExpression="bank_branch" UniqueName="bank_branch">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="bank_branch" HeaderText="Branch Code" SortExpression="branchcode"
                                        UniqueName="branchcode">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Visible="false" DataField="branchid" HeaderText="Branch ID"
                                        SortExpression="branchid" UniqueName="branchid">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="company_id" ReadOnly="true" Display="false" HeaderText="company_id"
                                        SortExpression="company_id" UniqueName="company_id">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="value_date" DataType="System.Datetime" HeaderText="Value Date"
                                        ReadOnly="True" SortExpression="value_date" UniqueName="value_date" Visible="False">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="id" DataType="System.Int32" HeaderText="id" ReadOnly="True"
                                        SortExpression="id" UniqueName="id" Visible="False">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="bank_accountno" HeaderText="Bank AccNo" SortExpression="bank_accountno"
                                        UniqueName="bank_accountno">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn Visible="false" DataField="company_bankcode" HeaderText="company_bankcode"
                                        SortExpression="company_bankcode" UniqueName="company_bankcode">
                                    </radG:GridBoundColumn>
                                    <radG:GridEditCommandColumn ButtonType="ImageButton">
                                    </radG:GridEditCommandColumn>
                                </Columns>
                                <CommandItemSettings AddNewRecordText="Add New Bank details" />
                                <EditFormSettings UserControlName="giro.ascx" EditFormType="WebUserControl">
                                </EditFormSettings>
                            </MasterTableView>
                        </radG:RadGrid>
                    </center>
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsPayslip" Height="640px" Width="100%">
                    <table class="tbl" border="0">
                        <tr valign="top">
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" style="table-layout: auto; width: 100%;">
                                    <tr>
                                        <td style="width: 1%">
                                            &nbsp;
                                        </td>
                                        <td style="width: 98%">
                                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top">
                                                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                            <tr>
                                                                <td style="width: 50%">
                                                                </td>
                                                                <td style="width: 50%">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (A) SMTP Mail Server Default Settings
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Sender Address:
                                                                </td>
                                                                <td>
                                                                    SMTP Server
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtemailsender_address" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtsmtpserver" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    SMTP Port
                                                                </td>
                                                                <td>
                                                                    SSL Enabled
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtsmtpport" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <telerik:RadComboBox ID="ddlssl" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="Yes" Value="Yes" />
                                                                            <telerik:RadComboBoxItem Selected="true" Text="No" Value="No" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    User
                                                                </td>
                                                                <td>
                                                                    Password
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtemailuser" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <input type="password" class="textfields" id="txtemailpwd" runat="server" />
                                                                    <asp:Button ID="txtTestEmail" runat="server" OnClick="txtTestEmail_Click" OnClientClick="return CheckEmailDetails()" Text="Test-Email"
                                                                        CssClass="textfields" Width="80px" Height="22px" />
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Payroll Approver Email
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <input type="text" id="txtemailsender_domain" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="Button3" runat="server" OnClick="txtTestEmail_Click" Text="Test-Email"
                                                                        CssClass="textfields" Width="80px" Height="22px" Visible="False" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (B) Email Alert Template
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td colspan="2">
                                                                    <table width="100%">
                                                                        <td style="width: 20%">
                                                                            Leave request Message:
                                                                        </td>
                                                                        <td colspan="3" valign="middle">
                                                                            <textarea id="txtemail_sendername" runat="server" style="width: 350px; height: 60px"
                                                                                class="textfields" value="Greetings,
Leave application submitted by: @emp_name.
Type of leave applied:@leave_type.
Leave balance as of today: @leave_balance.
Period of leave application: @from_date to @to_date.
Paid leave:@paid_leaves, Unpaid leave:@unpaid_leaves.
AM or PM (applicable only for 0.5 day leave): @timesession

Thanks and Regards
Advanced & Best Technologies Pte Ltd
Office: 6837 2336 | 6223 7996 Fax: 6220 4532 
www.anbgroup.com
                            "></textarea>
                                                                        </td>
                                                                        <td>
                                                                            Do not Delete or Update @emp_name,@from_date,@to_date
                                                                        </td>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td colspan="2">
                                                                    <table width="100%">
                                                                        <td style="width: 20%">
                                                                            Leave Update Message:
                                                                        </td>
                                                                        <td colspan="3" valign="middle">
                                                                            <textarea id="txtemail_replyaddress" runat="server" style="width: 350px; height: 60px"
                                                                                class="textfields" value="Greetings, @approver has @status your applied leaves from @from_date to @to_date REMARKS: @reason;                           
Thanks and Regards
Advanced & Best Technologies Pte Ltd
Office: 6837 2336 | 6223 7996 Fax: 6220 4532 
www.anbgroup.com
                            "></textarea>
                                                                        </td>
                                                                        <td>
                                                                            Do not Delete or Update @emp_name,@from_date,@to_date
                                                                        </td>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td colspan="2">
                                                                    <table width="100%">
                                                                        <td style="width: 20%">
                                                                            Leave Deleted Message:
                                                                        </td>
                                                                        <td colspan="3" valign="middle">
                                                                            <textarea id="txtemail_leavedel" runat="server" style="width: 350px; height: 60px"
                                                                                class="textfields" value="Greetings,  Leave Applied Deleted of: @emp_name.  Type of Leave Applied:@leave_type.  Period of Leave Application: @from_date to @to_date.  Paid leave:@paid_leaves, Unpaid leave:@unpaid_leaves. Status: @status.
Thanks and Regards
Advanced & Best Technologies Pte Ltd
Office: 6837 2336 | 6223 7996 Fax: 6220 4532 
www.anbgroup.com
                            "></textarea>
                                                                        </td>
                                                                        <td>
                                                                            Do not Delete or Update @emp_name,@from_date,@to_date
                                                                        </td>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td colspan="2">
                                                                    <table width="100%">
                                                                        <td style="width: 20%">
                                                                            Submit Payroll Message:
                                                                        </td>
                                                                        <td colspan="3" valign="middle">
                                                                            <textarea id="txtemail_replyname" runat="server" style="width: 350px; height: 60px"
                                                                                class="textfields" value="Greetings, Payroll for the period  @month / @year has been submitted  by @hr for your appropal.
Please review the payroll and update the status.

Thanks and Regards
Advanced & Best Technologies Pte Ltd
Office: 6837 2336 | 6223 7996 Fax: 6220 4532 
www.anbgroup.com
                            "></textarea>
                                                                        </td>
                                                                        <td>
                                                                            Do not Delete or Update @emp_name,@from_date,@to_date
                                                                        </td>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td colspan="2">
                                                                    <table width="100%">
                                                                        <td style="width: 20%">
                                                                            Claim Request Message:
                                                                        </td>
                                                                        <td colspan="3" valign="middle">
                                                                            <textarea id="txtclaim_sendername" runat="server" style="width: 350px; height: 60px"
                                                                                class="textfields" value="Greetings,@emp_name has requested claim for the month of  @month @year; 

Thanks and Regards
Advanced & Best Technologies Pte Ltd
Office: 6837 2336 | 6223 7996 Fax: 6220 4532 
www.anbgroup.com
                            "></textarea>
                                                                        </td>
                                                                        <td>
                                                                            Do not Delete or Update @emp_name,@from_date,@to_date
                                                                        </td>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td colspan="2">
                                                                    <table width="100%">
                                                                        <td style="width: 20%">
                                                                            Claim Update Message:
                                                                        </td>
                                                                        <td colspan="3" valign="middle">
                                                                            <textarea id="txtemailclaim_replyname" runat="server" style="width: 350px; height: 60px"
                                                                                class="textfields" value="Greetings, @approver has @status your applied claim for the month of @month @year;                           

Thanks and Regards
Advanced & Best Technologies Pte Ltd
Office: 6837 2336 | 6223 7996 Fax: 6220 4532 
www.anbgroup.com
                            "></textarea>
                                                                        </td>
                                                                        <td>
                                                                            Do not Delete or Update @emp_name,@from_date,@to_date
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
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tbsuser" Height="640px" Width="100%">
                    <radG:RadGrid ID="RadGrid2" PageSize="10" runat="server" GridLines="None" EnableAJAX="True"
                        OnPreRender="RadGrid2_PreRender" OnNeedDataSource="RadGrid2_NeedDataSource" OnUpdateCommand="RadGrid2_UpdateCommand"
                        OnItemDataBound="RadGrid2_ItemDataBound" OnItemCommand="RadGrid2_ItemCommand"
                        AutoGenerateColumns="False" Skin="Outlook" AllowFilteringByColumn="True" AllowMultiRowSelection="true"
                        Width="100%" AllowPaging="True">
                        <MasterTableView TableLayout="Fixed" CommandItemDisplay="bottom" DataKeyNames="UserName,emp_code,Email">
                            <CommandItemTemplate>
                            </CommandItemTemplate>
                            <Columns>
                                <radG:GridBoundColumn UniqueName="emp_code" Visible="false" DataField="emp_code">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn HeaderStyle-Width="200px" UniqueName="emp_name" CurrentFilterFunction="contains"
                                    AutoPostBackOnFilter="true" HeaderText="Employee Name" DataField="emp_name">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn ShowFilterIcon="true" UniqueName="UserName" CurrentFilterFunction="contains"
                                    AutoPostBackOnFilter="true" HeaderText="Username" DataField="UserName">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn ShowFilterIcon="true" Visible="false" UniqueName="GroupID"
                                    HeaderText="GroupID" DataField="GroupID">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn ShowFilterIcon="true" Visible="false" HeaderStyle-Width="80px"
                                    UniqueName="StatusId" HeaderText="StatusId" DataField="StatusId">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn ShowFilterIcon="true" HeaderStyle-Width="110px" UniqueName="Status"
                                    CurrentFilterFunction="contains" AutoPostBackOnFilter="true" HeaderText="Status"
                                    DataField="Status">
                                    <ItemStyle Width="5%" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn ShowFilterIcon="true" UniqueName="GroupName" CurrentFilterFunction="contains"
                                    AutoPostBackOnFilter="true" HeaderText="Group name" DataField="GroupName">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn ShowFilterIcon="true" UniqueName="computer_name" HeaderText="Computer name"
                                    Visible="False" DataField="computer_name">
                                </radG:GridBoundColumn>
                                <radG:GridTemplateColumn ShowFilterIcon="true" CurrentFilterFunction="contains" AutoPostBackOnFilter="true"
                                    ItemStyle-HorizontalAlign="Center" DataField="Email" UniqueName="Email" HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:TextBox Enabled="false" ID="txtEmail" Width="120px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Email")%>'></asp:TextBox>
                                    </ItemTemplate>
                                    <ItemStyle Width="70%" />
                                </radG:GridTemplateColumn>
                                <radG:GridBoundColumn DataField="Password" HeaderText="Password" Visible="false"
                                    SortExpression="Password" MaxLength="15" UniqueName="Password">
                                </radG:GridBoundColumn>
                                <radG:GridTemplateColumn HeaderStyle-Width="80px" AllowFiltering="False" UniqueName="UniqueEmail">
                                    <ItemTemplate>
                                        <tt class="bodytxt">
                                            <asp:Button ID="btnSendMail" Text="Send Email" CommandName="SendSingleEmail" Enabled="True"
                                                runat="server" />
                                    </ItemTemplate>
                                </radG:GridTemplateColumn>
                                <radG:GridEditCommandColumn ButtonType="ImageButton" HeaderStyle-Width="30px" UniqueName="EditColumn">
                                </radG:GridEditCommandColumn>
                            </Columns>
                            <CommandItemTemplate>
                                <div style="text-align: center">
                                    <asp:Button runat="server" ID="UpdateAll" Text="Send Emails For All" CommandName="UpdateAll" />
                                </div>
                            </CommandItemTemplate>
                            <EditFormSettings UserControlName="../Users/usertemplate.ascx" EditFormType="WebUserControl">
                            </EditFormSettings>
                        </MasterTableView>
                    </radG:RadGrid>
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tblCSN" Height="640px" Width="100%">
                    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                        <tr bgcolor="<%=sOddRowColor%>">
                            <td>
                                <tt class="bodytxt"><strong>CSN Setup:</strong></tt></td>
                        </tr>
                    </table>
                    <br />
                    <center>
                        <radG:RadGrid ID="RadGrid4" runat="server" GridLines="None" Skin="Outlook" Width="715px"
                            OnInsertCommand="RadGrid4_InsertCommand" OnNeedDataSource="RadGrid4_NeedDataSource"
                            OnUpdateCommand="RadGrid4_UpdateCommand" OnDeleteCommand="RadGrid4_DeleteCommand">
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id,CSN" CommandItemDisplay="Bottom">
                                <ExpandCollapseColumn Visible="False">
                                    <HeaderStyle Width="19px"></HeaderStyle>
                                </ExpandCollapseColumn>
                                <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </RowIndicatorColumn>
                                <Columns>
                                    <radG:GridBoundColumn Visible="false" DataField="id" UniqueName="id">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="CSN" HeaderText="CSN" SortExpression="csn_number">
                                    </radG:GridBoundColumn>
                                    <radG:GridEditCommandColumn ButtonType="ImageButton">
                                    </radG:GridEditCommandColumn>
                                    <radG:GridButtonColumn ConfirmText="Delete this record?" ButtonType="ImageButton"
                                        ImageUrl="../frames/images/toolbar/Delete.gif" CommandName="Delete" Text="Delete"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle Width="50px" />
                                    </radG:GridButtonColumn>
                                </Columns>
                                <CommandItemSettings AddNewRecordText="Add New CSN details" />
                                <EditFormSettings UserControlName="CPFFiles.ascx" EditFormType="WebUserControl">
                                </EditFormSettings>
                            </MasterTableView>
                        </radG:RadGrid>
                    </center>
                </telerik:RadPageView>
                <telerik:RadPageView ID="tblCost" runat="server" Height="640px" Width="100%">
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
                                                                <td class="tdstand" colspan="4">
                                                                    (A) GL Code
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="trstandbottom" colspan="4">
                                                                    <table border="0" cellpadding="0" cellspacing="0" style="table-layout: auto; width: 100%;">
                                                                        <tr class="trstandbottom">
                                                                            <td>
                                                                                Salary GL:
                                                                            </td>
                                                                            <td>
                                                                                Employee CPF GL:
                                                                            </td>
                                                                            <td>
                                                                                Employer CPF GL:
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="trstandtop">
                                                                            <td>
                                                                                <input type="text" id="txtSalaryGL" runat="server" />
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" id="txtEmpCPFGL" runat="server" />
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" id="txtEmpyCPFGL" runat="server" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="trstandbottom">
                                                                            <td>
                                                                                Fund GL:
                                                                            </td>
                                                                            <td>
                                                                                SDL GL:
                                                                            </td>
                                                                            <td>
                                                                                Comp Account GL:
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="trstandtop">
                                                                            <td>
                                                                                <input type="text" id="txtFundGL" runat="server" />
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" id="txtSDLGL" runat="server" />
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" id="txtacccompGL" runat="server" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="trstandbottom">
                                                                            <td>
                                                                                Unpaid Leaves GL:
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="trstandtop">
                                                                            <td>
                                                                                <input type="text" id="txtunpaidGL" runat="server" />
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
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
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView class="tbl" runat="server" ID="tblTimeSheet" Height="640px"
                    Width="100%">
                    <table class="tbl" border="0">
                        <tr valign="top">
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" style="table-layout: auto; width: 100%;">
                                    <tr>
                                        <td style="width: 1%">
                                            &nbsp;
                                        </td>
                                        <td style="width: 98%">
                                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top">
                                                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (A) Workingday Setup
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    No Of Working Days:*
                                                                </td>
                                                                <td>
                                                                    Timesheet Required:
                                                                </td>
                                                                <td colspan="2">
                                                                    Timesheet Remarks:</td>
                                                            </tr>
                                                            <tr class="trstandtop">
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbworkingdays" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="5" Value="5" />
                                                                            <telerik:RadComboBoxItem Text="5.5" Value="5.5" />
                                                                            <telerik:RadComboBoxItem Text="6" Value="6" />
                                                                            <telerik:RadComboBoxItem Text="7" Value="7" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                    <select id="rdtimesheet" onchange="javascript:onrdtimesheetchange();" runat="server"
                                                                        class="textfields" style="width: 120px">
                                                                        <option value="1" selected="selected">Yes</option>
                                                                        <option value="2">No</option>
                                                                    </select>
                                                                </td>
                                                                <td colspan="2">
                                                                    <select id="rdtsremarks" runat="server" class="textfields" style="width: 120px">
                                                                        <option value="0" selected="selected">No</option>
                                                                        <option value="1">Yes</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (B) Timesheet & Project Setup
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Project Assignment: {Re login for settings to take effect.}
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbAssignType" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="" Value="0" />
                                                                            <telerik:RadComboBoxItem Text="One Time" Selected="true" Value="1" />
                                                                            <telerik:RadComboBoxItem Text="Daily" Value="2" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td colspan="2">
                                                                </td>
                                                            </tr>
                                                             <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    (C) Roster Settings
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Public Holiday:
                                                                </td>
                                                                <td>
                                                                    Sunday :
                                                                </td>
                                                                <td >
                                                                    Roster Not Assign
                                                                </td>                                                                
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbPublicHoliday" runat="server" Width="150px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">                                                                        
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbSunday" runat="server" Width="150px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">                                                                        
                                                                    </telerik:RadComboBox>
                                                                    
                                                                </td>
                                                                <td>
                                                                     <telerik:RadComboBox ID="cmbRosterNa" Enabled="false" runat="server" Width="150px" EmptyMessage="-select-" 
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">                                                                        
                                                                    </telerik:RadComboBox>    
                                                                
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    FirstIn Last Out:
                                                                </td>
                                                                <td>
                                                                    Rounding
                                                                </td>
                                                                <td colspan="2" >
                                                                    
                                                                </td>                                                                
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                     <asp:CheckBoxList  Visible="True" ID="chkFiFo" runat="server" CssClass="bodytxt"  RepeatColumns="1" RepeatDirection="Horizontal" RepeatLayout="Table"  >
                                                                            <asp:ListItem  Text="FirstInLastOut" Value="FIFO" Selected="False" ></asp:ListItem>                                    
                                                                      </asp:CheckBoxList>
                                                                </td>
                                                                <td>
                                                                     <telerik:RadComboBox ID="cmbRound" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="0" Value="0" />
                                                                            <telerik:RadComboBoxItem Text="5" Value="5" />
                                                                            <telerik:RadComboBoxItem Text="10" Value="10" />
                                                                            <telerik:RadComboBoxItem Text="15" Value="15" />
                                                                            <telerik:RadComboBoxItem Text="20" Value="20" />
                                                                            <telerik:RadComboBoxItem Text="25" Value="25" />
                                                                            <telerik:RadComboBoxItem Text="30" Value="30" />
                                                                            <telerik:RadComboBoxItem Text="35" Value="35" />
                                                                            <telerik:RadComboBoxItem Text="40" Value="40" />
                                                                            <telerik:RadComboBoxItem Text="45" Value="45" />
                                                                            <telerik:RadComboBoxItem Text="50" Value="50" />
                                                                            <telerik:RadComboBoxItem Text="55" Value="55" />                                                                            
                                                                        </Items>
                                                                    </telerik:RadComboBox>  
                                                                </td>
                                                                <td colspan="2" >
                                                                    
                                                                </td>                                                                
                                                            </tr>
                                                            
                                                        </table>
                                                    </td>
                                                    <td style="width: 1%">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <!-- new -->
                                                <tr>
                                                    <td class="tdstand" >
                                                       (D)Settings
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height:10px"></td>
                                                </tr>
                                                <tr>
                                                    <td align="left" >
                                                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                            <tr class="trstandbottom">
                                                                <td style="width: 25%">
                                                                       Alert For TimeSheet:
                                                                       <telerik:RadComboBox ID="cbxEmailAlert" runat="server" Width="100px" EmptyMessage="-select-" OnSelectedIndexChanged="CboxSendEmail_CheckedChanged"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true" AutoPostBack="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="Yes" Value="Yes" />
                                                                            <telerik:RadComboBoxItem Text="No" Value="No" />
                                                                        </Items>
                                                                       </telerik:RadComboBox>
                                                                </td>
                                                                <td style="width: 25%">
                                                                     <asp:Label ID="lbldrpEmpProc" runat="server" Text="Alert Sent to:" Visible="false"></asp:Label>
                                                                     <telerik:RadComboBox ID="drpEmpProc1" runat="server" Width="100px" EmptyMessage="-select-" OnSelectedIndexChanged="drpEmpProc_SelectedIndexChanged"
                                                                       MarkFirstMatch="false" Font-Names="Tahoma"  AutoPostBack="true" EnableLoadOnDemand="false">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="Employee" Value="Employee"  />
                                                                            <telerik:RadComboBoxItem Text="Processer" Value="Processer" />
                                                                        </Items>
                                                                       </telerik:RadComboBox>
                                                                </td>
                                                                <td style="width: 50%"><asp:Label ID="lblEmail" runat="server" Text="Email:" Visible="false"></asp:Label> <asp:TextBox ID="txtProcesserEmail" runat="server" Visible="false" Width="350px" ></asp:TextBox>   </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <!-- new end -->
                                                 <tr>
                                                    <td class="tdstand" >
                                                       (D)Advance Time-Sheet
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" >
                                                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr class="trstandbottom">
                                                                    <td style="width: 8%">
                                                                         Advance TimeSheet
                                                                           <telerik:RadComboBox ID="radAdvanceTs" runat="server" Width="100px" EmptyMessage="-select-" 
                                                                            MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true" AutoPostBack="true"  OnSelectedIndexChanged="radAdvanceTs_SelectedIndexChanged"  >

                                                                            <Items>
                                                                                <telerik:RadComboBoxItem Text="Yes" Value="Yes" />
                                                                                <telerik:RadComboBoxItem Text="No" Value="No" Selected="true" />
                                                                            </Items>
                                                                            
                                                                           </telerik:RadComboBox>
                                                                    </td>
                                                                    <td style="width: 25%">
                                                                         <asp:Label ID="Label1" runat="server" Text="Minutes" Visible="true"></asp:Label>
                                                                         <radG:RadNumericTextBox Width="50px" Visible="true" NumberFormat-GroupSeparator="" ID="txtMinutes"
                                                                           runat="server" MinValue="0" MaxValue="59" NumberFormat-AllowRounding="true" Value="30"
                                                                           NumberFormat-DecimalDigits="0" IncrementSettings-InterceptArrowKeys="true">
                                                                         </radG:RadNumericTextBox>
                                                                    </td>                                                                    
                                                                </tr>
                                                            </table>
                                                     </td>
                                                </tr>
                                                
                                                
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                
                
                
                <telerik:RadPageView class="tbl" runat="server" ID="tblPaySlipSetup" Height="750px"
                    Width="100%">
                    <table class="tbl" border="0">
                        <tr valign="top">
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" style="table-layout: auto; width: 100%;">
                                    <tr>
                                        <td style="width: 1%">
                                            &nbsp;
                                        </td>
                                        <td style="width: 98%">
                                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                               
                                                <tr>
                                                    <td valign="top">
                                                        <table border="0" cellspacing="0" cellpadding="0" width="100%"> 
                                                                                                                       
                                                            <tr>
                                                                <td class="tdstand" colspan="4">
                                                                    Payslip
                                                                </td>
                                                            </tr>
                                                            <tr class="trstandbottom">
                                                                <td>
                                                                    Basic Pay/Unpaid Leaves:
                                                                </td>
                                                                <td>
                                                                    Email ePayslip:
                                                                </td>
                                                                <td colspan="2">
                                                                    ePayslip Password Protected:
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbpayslipformat" runat="server" Width="100px" AutoPostBack="true" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                                <telerik:RadComboBoxItem Text="Format 1" Value="1" />
                                                                                <telerik:RadComboBoxItem Text="Format 2" Value="2" />
                                                                                <telerik:RadComboBoxItem Text="Format 3" Value="3" />
                                                                                <telerik:RadComboBoxItem Text="Format 4" Value="4" />
                                                                                <telerik:RadComboBoxItem Text="Format 5" Value="5" />
                                                                                <telerik:RadComboBoxItem Text="Format 6" Value="6" />
                                                                                <telerik:RadComboBoxItem Text="Customize-1" Value="7" />
                                                                                <telerik:RadComboBoxItem Text="Customize-4" Value="8" Visible="false" />
                                                                                <telerik:RadComboBoxItem Text="Customize-5" Value="9"  Visible="false"/>
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                    <input type="button" id="Button5" name="btnShowPayslip" value="Show Payslip"
                                                                        runat="server" style="width: 80px" class="textfields" onclick="ShowPayslip();" />
                                                                </td>
                                                                <td>
                                                                    <telerik:RadComboBox ID="cmbEmailPaySlip" runat="server" Width="100px" EmptyMessage="-select-"
                                                                        MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="Yes" Value="Y" />
                                                                            <telerik:RadComboBoxItem Text="No" Value="N" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                                <td colspan="2">
                                                                    <telerik:RadComboBox ID="cmbEPayPwd" Enabled="false" runat="server" Width="100px"
                                                                        EmptyMessage="-select-" MarkFirstMatch="true" Font-Names="Tahoma" EnableLoadOnDemand="true">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="Yes" Value="Yes" />
                                                                            <telerik:RadComboBoxItem Text="No" Value="No" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                </td>
                                                            </tr>
                                                            <tr>                                                           
                                                                <td class="tdstand" colspan="4">
                                                                    Payslip Configuration
                                                                </td>
                                                            </tr>   
                                                            
                                                            <tr class="tdstand" >
                                                                <td colspan="4">
                                                                    <table width="100%" id="tblPaySlipSetup1" visible="false" runat="server">
                                                                        <tr>
                                                                            <td class="tdstand" colspan="2">LabelName</td>
                                                                            <td class="tdstand" colspan="1">Visible</td>
                                                                            <td class="tdstand" colspan="1">ActualName</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td   colspan="2" >
                                                                                    <asp:Label ID="lblPayName" runat="server" Text="Name"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayNameYesNo" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayName" Width="300px" Text="Name" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr>   
                                                                        <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayIDNO" runat="server" Text="IdNo"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayIDNOYesNo" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayIDNO" Width="300px" Text="IdNo" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr>   
                                                                        
                                                                        <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPaySALMONTH" runat="server" Text="Salary For Month"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPaySalMonthYesNo" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPaySALMONTH" Width="300px" Text="SalaryForMonth" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr>   
                                                                        
                                                                        <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayYEAR" runat="server" Text="Year"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayYear" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayYEAR" Width="300px" Text="PayYear" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr>    
                                                                        
                                                                        <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayEARNINGS" runat="server" Text="Earnings"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayEarnings" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayEARNINGS" Width="300px" Text="Earnings" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr>   
                                                                        
                                                                        <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayDEDUCTIONS" runat="server" Text="Deductions"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayDeductions" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayDEDUCTIONS" Width="300px" Text="Deductions" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr>   
                                                                        
                                                                         <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayTOTALGROSS" runat="server" Text="TotalGross"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayTotalGross" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayTOTALGROSS" Width="300px" Text="TotalGross" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr>  
                                                                        
                                                                        <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayCPFGROSS" runat="server" Text="CpfGross"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayCpfGross" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayCpfGross" Width="300px" Text="CpfGross" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr>    
                                                                        
                                                                         <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayEMPLOYERCPF" runat="server" Text="EmployerCpf"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayEmployerCpf" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayEMPLOYERCPF" Width="300px" Text="EmployerCpf" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr>    
                                                                        
                                                                        
                                                                        <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayETOTALDEDUCTION" runat="server" Text="TotalDeduction"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayTotalDeduction" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayTOTALDEDUCTION" Width="300px" Text="TotalDeduction" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr>    
                                                                        
                                                                        
                                                                         <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayNETPAYMENT" runat="server" Text="NetPayment"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayNETPAYMENT" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayNETPAYMENT" Width="300px" Text="NetPayment" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr> 
                                                                        
                                                                        
                                                                         <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayYEARTODATE" runat="server" Text="Year To Date"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayYEARTODATE" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayYEARTODATE" Width="300px" Text="YearToDate" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr>    
                                                                        
                                                                        
                                                                        <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayYEATODATEEMPLOYERCPF" runat="server" Text="Year To Date EmployerCPF"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayYEATODATEEMPLOYERCPF" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayYEATODATEEMPLOYERCPF" Width="300px" Text="YearToDateEmployerCPF" runat="server"></asp:TextBox>
                                                                                </td>                                                                        
                                                                        </tr>
                                                                        
                                                                        <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblpayDEPTNAME" runat="server" Text="Department Name"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayDEPTNAME" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td> 
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayDepartmentName" Width="300px" Text="DepartMentName" runat="server"></asp:TextBox>
                                                                                </td>                                                                              
                                                                        </tr>  
                                                                        
                                                                        <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayTrade" runat="server" Text="Trade"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayTrade" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td> 
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayTrade" Width="300px" Text="Trade Name" runat="server"></asp:TextBox>
                                                                                </td>                                                                              
                                                                        </tr>  
                                                                        
                                                                         <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblPayDesignation" runat="server" Text="Designation"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="1">
                                                                                        <telerik:RadComboBox ID="radPayDesignation" runat="server" >
                                                                                                 <Items>
                                                                                                    <telerik:RadComboBoxItem Text="Yes" Selected="true" Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="No" Value="2" />                                                                             
                                                                                                 </Items>                                                                               
                                                                                         </telerik:RadComboBox>
                                                                                </td> 
                                                                                <td  colspan="1">
                                                                                    <asp:TextBox ID="txtPayDesignation" Width="300px" Text="Designation" runat="server"></asp:TextBox>
                                                                                </td>                                                                              
                                                                        </tr>      
                                                                        
                                                                         <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblLOGOMGT" runat="server" Text="Logo Management"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="3">
                                                                                        <telerik:RadComboBox ID="radPayLOGOMGT" runat="server" Width="60%" >
                                                                                                 <Items>
                                                                                                     <telerik:RadComboBoxItem Text="Option1-CompanyImage-AddressAndLogo"  Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="Option2-Company-Logo-Address" Selected="true" Value="2" />
                                                                                                     <telerik:RadComboBoxItem Text="Option3-Company-Address-Logo"  Value="3" />
                                                                                                     <telerik:RadComboBoxItem Text="Option4-Company Name"  Value="4" />
                                                                                                 </Items>                                                                               
                                                                                       </telerik:RadComboBox>
                                                                                </td>                                                                                
                                                                        </tr>  
                                                                        <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblLEAVEDETAILS" runat="server" Text="LeaveDetails"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="3">
                                                                                        <telerik:RadComboBox ID="radPayLEAVEDETAILS" runat="server" Width="60%" >
                                                                                                 <Items>
                                                                                                     <telerik:RadComboBoxItem Text="Simple(AL-CL)"  Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="Details(Annual Leave)" Selected="true" Value="2" />                                                                                                     
                                                                                                 </Items>                                                                               
                                                                                       </telerik:RadComboBox>
                                                                                </td>                                                                                
                                                                        </tr>                                                         
                                                                        
                                                                        <tr>
                                                                                <td  colspan="2" >
                                                                                    <asp:Label ID="lblEARNINGDETAILS" runat="server" Text="EarningSection"></asp:Label>                                                                     
                                                                                </td>
                                                                                <td  colspan="3">
                                                                                        <telerik:RadComboBox ID="radPayEARNINGDETAILS" runat="server" Width="60%" >
                                                                                                 <Items>
                                                                                                     <telerik:RadComboBoxItem Text="Label(NH-OT1-OT2)"  Value="1" />
                                                                                                     <telerik:RadComboBoxItem Text="Summary"  Value="2" />
                                                                                                     <telerik:RadComboBoxItem Text="Details" Selected="true"  Value="3" />
                                                                                                 </Items>                                                                               
                                                                                       </telerik:RadComboBox>
                                                                                </td>                                                                                
                                                                        </tr>                                                         
                                                                        
                                                                    </table>                                                                
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                
                
            </telerik:RadMultiPage>
        </div>      
        <asp:RadioButtonList Visible="false" ID="RdApproval" runat="server" RepeatDirection="Horizontal"
            Height="11px" Width="121px">
            <asp:ListItem Enabled="false" Value="1">Yes</asp:ListItem>
            <asp:ListItem Value="0" Enabled="false" Selected="True">No</asp:ListItem>
        </asp:RadioButtonList>
        <asp:XmlDataSource ID="xmldtCompType" runat="server" DataFile="~/XML/xmldata.xml"
            XPath="SMEPayroll/Company/CompanyType"></asp:XmlDataSource>
        <asp:RequiredFieldValidator ID="rfvcode" runat="server" ControlToValidate="txtCompCode"
            Display="None" ErrorMessage="Address Setup-Prefix Code Required!" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvpayapprove" runat="server" ErrorMessage="Payroll Approval Setup Required!"
            ControlToValidate="RdApproval" SetFocusOnError="True" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvannualcpfceil" runat="server" ErrorMessage='Preferences Setup-"Annual Cpf Ceiling" is Required!'
            BorderStyle="None" ControlToValidate="txtannual_cpf_ceil" Display="None"></asp:RequiredFieldValidator>
        &nbsp;
        <asp:RequiredFieldValidator ID="rfvnoworkdays" runat="server" InitialValue="-select-"
            ErrorMessage="Preferences Setup-Working Days Setup Required!" ControlToValidate="cmbworkingdays"
            Display="None"></asp:RequiredFieldValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
            ShowMessageBox="true" ShowSummary="False" />
    </form>
</body>
</html>
