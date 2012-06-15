// JScript File
// Author:Shashank
// Date :28-OCT-2010

var message_common="";
//Validate Mandatory Fields
function validateData(srcCtrl,destSrc,opType,srcData,msg,con)
{
    message_common="";  
    //Mandatory Fields Array Of Controls
    //srcCtrl:ArrayOfControls(CommaSeperated),destSrc:"",
    //opType:"MandatoryAll",srcData:"",msg:"Following fields are missing"  
    if(opType=="MandatoryAll")
    {
        var dsblectrl_Array = srcCtrl.split(",");        
        var Msg_Array=msg.split(",");                
        for(var i=0;i<dsblectrl_Array.length;i++)
        {
            var srcCtrl = document.getElementById(dsblectrl_Array[i]);
            switch(srcCtrl.type)
            {
               case "select-one":                 
                 if(
                      srcCtrl.value.toUpperCase()=='S'
                      ||srcCtrl.value.toUpperCase()=='-SELECT-'
                      ||srcCtrl.value.toUpperCase()=='NA'
                      ||srcCtrl.value.toUpperCase()=='-1'
                      ||srcCtrl.value.toUpperCase()=='-2'                      
                      ||srcCtrl.value.toUpperCase()==''
                      ||srcCtrl.value.toUpperCase()=='-select-'
                  )
                 {
                    if(srcCtrl.id=='cmbPayMode')
                    {
                        if(srcCtrl.value.toUpperCase()=='-SELECT-')
                        {
                            message_common+=Msg_Array[i] +"\n";
                        }                        
                    }
                    else
                    {
                        message_common+=Msg_Array[i] +"\n";
                    }
                 }          
                 break;
                case "text":
                    if(srcCtrl.value=='')
                    {
                    message_common+=Msg_Array[i]+"\n";
                    }          
                    break;
            }
        }
    }
    else if(opType=="Dependent") // Based Upon Source Control,Destination control value Validates
    {
        switch(srcCtrl.type)
        {
              case "select-one":          
                //For Mandator Fields
                 if(opType=="Dependent")
                 {
                      switch(destSrc.type)
                      {
                        //Destination TextBox /Source Dropdown
                        case "text":  
                          //alert(srcCtrl.value.toUpperCase());                          
                          if(trim(destSrc.value) =="")
                          {
                            if(con=='NE')
                            {   
                                if(srcCtrl.value.toUpperCase()!=srcData)
                                message_common+=msg;
                            }else if(con=='EQ')
                            {
                                if(srcCtrl.value.toUpperCase()==srcData)
                                message_common+=msg;
                            }
                          }                          
                          break;
                        //Destination DropdownBox /Source Dropdown
                        case "select-one":
                          if(srcCtrl.value.toUpperCase()!='-SELECT-')
                          {
                            if(srcCtrl.value.toUpperCase()=='SINGAPORE' && destSrc.value.toUpperCase()=='-SELECT-')
                            {
                                message_common+="State";
                            }
                          }
                          break;
                     }
                 }else if(opType=="DisableAll")
                 {
                    // Disable Control List based up on the Main Input control ...
                    if(srcCtrl.value.toUpperCase()!='-SELECT-' && srcCtrl.value.toUpperCase()==srcData)
                        DisableAll(destSrc);
                        
                 }else if(opType=="ClearAll") //Clear All Data From Destination control lists.
                 {
                    if(srcCtrl.value.toUpperCase()!='-SELECT-' && srcCtrl.value.toUpperCase()==srcData)
                        ClearAll(destSrc);
                 }
                 break; 
                 break;
               case "checkbox" :
               //Check For Date Comaprision Source Control value Should be less than Destination ctrl value
                 if(opType=="DisableAll")
                 {  
                      if(srcData =='CHECKED' && srcCtrl.checked ==true)
                      {
                            DisableAll(destSrc);        
                      }
                 }else if(opType=="ClearAll") //Clear All Data From Destination control lists.
                 {
                    if(srcData =='CHECKED' && srcCtrl.checked ==true)
                      {
                            ClearAll(destSrc);        
                      }
                 }
                 break;                         
        }
    }
    if(message_common=="")
    {
       return message_common;
    }
    else if(opType=="MandatoryAll" || opType=="Dependent")
    {
        //alert(message_common);
         return message_common;
    }
    else
    {  
        if(message_common!='disable' || message_common!='ClearAll') 
            //alert(message_common);
        return "";
    }
}

//Disable Control List (Array)
function DisableAll(destSrc)
{
    //Disable Control List based up on the Main Input control
    var dsblectrl_Array=destSrc.split(",");                
    for(var i=0;i<dsblectrl_Array.length;i++)
    {
        var ctrl = document.getElementById(dsblectrl_Array[i]);                    
        ctrl.disabled="true";                    
    }
    message_common+="disable";
}

//Hide Control List (Array) //GIRO FORM 
function HideShowControls(varaiblelist)
{
    //Disable Control List based up on the Main Input control    
    var control_Array =  varaiblelist.split(",");    
    
    var ctrl = document.getElementById(control_Array[0]);
    var ctrl_DBS = document.getElementById(control_Array[1]);    
    var ctrl_MIZU = document.getElementById(control_Array[2]);    
    var ctrl_MIZU1 = document.getElementById(control_Array[3]);    
    
    //Labels 
    var ctrl_DBS1 = document.getElementById(control_Array[4]);    //4
    var ctrl_DBS2 = document.getElementById(control_Array[5]);    //4
    
    var ctrl_MIZU_1  = document.getElementById(control_Array[6]);   //9 
    var ctrl_MIZU_2  = document.getElementById(control_Array[7]);    //9
    var ctrl_MIZU1_1 = document.getElementById(control_Array[8]);    //9
    var ctrl_MIZU1_2 = document.getElementById(control_Array[9]);    //9
    
    var selIndex = ctrl.selectedIndex;    
    comboValue = ctrl.options[selIndex].value;
    
    ctrl_DBS.style.display = 'none'; //none ele_ref.style.display = 'block'; 
    ctrl_MIZU.style.display = 'none'; //none ele_ref.style.display = 'block';
    ctrl_MIZU1.style.display = 'none'; //none ele_ref.style.display = 'block';
    
    ctrl_DBS1.style.display = 'none'; //none ele_ref.style.display = 'block'; 
    ctrl_DBS2.style.display = 'none'; //none ele_ref.style.display = 'block'; 
    
    ctrl_MIZU_1.style.display= 'none';
    ctrl_MIZU_2.style.display= 'none';
    ctrl_MIZU1_1.style.display= 'none';
    ctrl_MIZU1_2.style.display= 'none';
    
    if(comboValue=="4")
    {
        ctrl_DBS.style.display = 'block'; //none ele_ref.style.display = 'block'; 
        ctrl_MIZU.style.display = 'none'; //none ele_ref.style.display = 'block';
        ctrl_MIZU1.style.display = 'none'; //none ele_ref.style.display = 'block';
        //alert('hi');
        //Labels
        ctrl_DBS1.style.display = 'block'; //none ele_ref.style.display = 'block'; 
        ctrl_DBS2.style.display = 'block';
        
    }else if(comboValue=="9")
    {
        //alert(comboValue + "InForth:");
        ctrl_DBS.style.display = 'none'; //none ele_ref.style.display = 'block'; 
        ctrl_MIZU.style.display = 'block'; //none ele_ref.style.display = 'block';
        ctrl_MIZU1.style.display = 'block'; //none ele_ref.style.display = 'block';
        //alert('hi');
        ctrl_MIZU_1.style.display= 'block';
        ctrl_MIZU_2.style.display= 'block';
        ctrl_MIZU1_1.style.display= 'block';
        ctrl_MIZU1_2.style.display= 'block';
    }
}

//Clear The Contents of Destination control arrays
function ClearAll(destSrc)
{
    // Disable Control List based up on the Main Input control ...
    var dsblectrl_Array=destSrc.split(",");                
    for(var i=0;i<dsblectrl_Array.length;i++)
    {
        var ctrl = document.getElementById(dsblectrl_Array[i]);
        if(ctrl.type=="text")
        {
            ctrl.value="";
        }else if (ctrl.type=="select-one")
        {
            var theDropDown = document.getElementById(ctrl.id);
            var numberOfOptions = theDropDown.options.length;            
            for (i=0; i<numberOfOptions; i++) 
            {   
               theDropDown.remove(0);
            }
        }        
    }
    message_common+="ClearAll";
}

//Common Functions
/******************Trim Data ***************************************************************/
// Removes leading whitespaces
function LTrim( value ) 
{	
	var re = /\s*((\S+\s*)*)/;
	return value.replace(re, "$1");	
}
// Removes ending whitespaces
function RTrim( value ) 
{
	var re = /((\s*\S+)*)\s*/;
	return value.replace(re, "$1");	
}

function trim(s) 
{   
    return removeSpaces(s); 
} 

function removeSpaces(string) 
{
    return string.split(' ').join('');
}

/*********************************************************************************************/
//Check Values For Alpha numeric
function alphanumeric(ctrl,msg)
{
    message_common="";
    var alPhanumaric = trim(ctrl.value);    
    if(alPhanumaric!="")
    {
        for(var j=0; j<alPhanumaric.length; j++)
        {
            var alphaa = alPhanumaric.charAt(j);
            var hh = alphaa.charCodeAt(0);
            if((hh > 47 && hh<58) || (hh > 64 && hh<91) || (hh > 96 && hh<123))
            {
                message_common=""; 
            }
            else
            {
               message_common= msg + " - Please do not enter special characters like %^&*";
            }
        }    
    }
    return message_common;
}
/*******************************************************************************************/
//Check For Alphabeats
function CheckAlphachar(value,msg)
{	
    message_common="";
    var value = removeSpaces(value);    
    if(value!="")
    {
        //alert(trim(value));
        regExpression = /^[A-Za-z]*$/;
        if(!regExpression.test(value))
        {
            message_common= msg + " - Please Enter only characters";
        }
   }
   return message_common;
}
/*******************************************************************************************/
//Check Values For Dates Compare Dates
function CompareDate(val1,val2,msg,op)
{
    message_common="";
    if(val1!="" && val2!="")
    {
        if(op=="")
        {
            if(val1 >val2)
            {
                message_common= msg;            
            }
        }else if(op=="EQ")
        {
             if(val1 >=val2)
            {
                message_common= msg;            
            }
        }
    }
    return message_common;
}
/**********************************************************************************************/
    //Compare Date with Today's Date
    function CompareDateToday(compareDateVal,yearsToCompare,operation,msg)
    {
        var todayDate=new Date();  
          message_common="";       
        if (compareDateVal != null) 
        {
           var yeardifference = todayDate.getFullYear()- compareDateVal.getFullYear(); 
           if(operation=="<")
            {
              if ( yeardifference < yearsToCompare)
              {
                  message_common = msg + yearsToCompare +  " years.\n";
              }
           }else if(operation==">")
           {
              if ( yeardifference > yearsToCompare)
              {
                  message_common = msg + yearsToCompare +  " years.\n";
              }
           }
        }
        return message_common;
    }
/**********************************************************************************************/
    //Check MaxLength Control Value ,CheckValue,Operation like >,<,>=,<=
    function CheckMaxMinLength(ctrlValue,checkValue,op,msg)
    {
        if(ctrlValue>0)
        {
            message_common="";        
            if(op==">")
            {
                if(ctrlValue >checkValue)
                {
                    message_common=msg + "  Length Should not be more than " + checkValue + " characters!\n"; 
                }
            }else if(op==">=")
            {
                if(ctrlValue>=checkValue)
                {
                    message_common=msg  + "  Length Should not be more than or equal " + checkValue + " characters!\n";
                }
            }else if(op=="<")
            {
                if(ctrlValue <checkValue)
                {
                    message_common=msg  + "  Length Should not be less than or equal " + checkValue + " characters!\n";
                }
            }else if(op=="<=")
            {   
                if(ctrlValue <=checkValue)
                {
                    message_common=msg  + "  Length Should not be less than or equal " + checkValue + " characters!\n";
                }
            }
        }
        return message_common;
    }
/********************************************************************************/
//Check Numeric value for the control ...
function CheckNumeric(strString,msg)
{
   message_common=""; 
   var strValidChars = "0123456789.-";
   var strChar;
   var blnResult = true;
   //if (strString.length == 0) return false;
   if(strString!="")
   {
       //  test strString consists of valid characters listed above
        for (i = 0; i < strString.length && blnResult == true; i++)
        {
            strChar = strString.charAt(i);
            if (strValidChars.indexOf(strChar) == -1)
            {
             blnResult = false;
            }
        }
   }
   if(!blnResult)
   {
        message_common = msg + "-Please check - non numeric value!";
   }
   return message_common;
}
/********************************************************************************/
// Validate An Email 
function ValidateEmail(str,message) 
{
        message_common="";
        if(str!="")
        {
            var validemail="True";
            var at="@";
            var dot=".";
            var lat=str.indexOf(at);
            var lstr=str.length;
            var ldot=str.indexOf(dot);
            
            if (str.indexOf(at)==-1){
               validemail="False";
            }
            if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
               validemail="False";
            }
            if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
                validemail="False";
            }
            if (str.indexOf(at,(lat+1))!=-1){
                validemail="False";
            }
            if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
                validemail="False";
            }
            if (str.indexOf(dot,(lat+2))==-1){
                validemail="False";
            }		
            if (str.indexOf(" ")!=-1){
                validemail="False";
            }
            if(validemail=="False")
            {
                if(message!="")
                {  
                    message_common = message + '-' + "Please Enter Valid Email!";
                }            
           }
       } 
       return message_common;
}
/********************************************************************************/
// Validate WebSite 
function ValidateWebAddress(incomingString,message)
{ 
    message_common="";
    if(incomingString!="")
    {   
        var companyUrl = incomingString;    
	    var RegExp = /^(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$/;
	    if(RegExp.test(companyUrl))    
	    {         
            message_common="";
	    } else
	    {
		    if(message!="")
            {  
               message_common = message + '-' + "Please Enter Valid Web SiteAddress!";
            }     
	    } 	
	}
	return message_common;
} 
/******************** Data Validation End ****************************************/
//Compare the Values in Two Controls
function ValidateCompare(val1,val2,msg)
{
   var message="";
   if(trim(val1)!="" && trim(val2)!="")
   {
       if(trim(val1)!=trim(val2))
       {
            message=msg + " Please check both values";
       }
    }
   return message;
}
/********************************************************************************/
function MandatoryData(value,Name)
{
    var message="";    
    if(trim(value)=="")
    {
        message="Following fields are missing \n" + Name;
    }
    return message;
}
/********************************************************************************/
//Return Data From HTML Object 
function GetDataFromHtml(Object)
{
     var data="";
     var name =Object.innerHTML;       
     if(name!="")
     {
        data=name;
     }
     else
     {
        name =Object.outerHTML; 
        var formcontent=name.split(" ");                                    
        var value = formcontent[3].split("=");         
        if(value[0]=='value')
        {
          data=value[1];
          //alert(value[1]);
        }
//        if(formcontent.length==5)
//        {
//            data="";
//            alert(formcontent.length);
//        }
    }
    return data;
}
/********************************************************************************/
function ValidmultiEmail(email_field) 
{
    var email = email_field.split(',');
    var message1;    
    for (var i = 0; i < email.length; i++) 
    {
        var emailMsg = "";        
        emailMsg = ValidateEmail(email[i],"AAA");        
        if (emailMsg!="") 
        {
            message1="false";
        }
        else
        {
            message1="true";    
        }
    }
    return message1;
} 
/********************************************************************************/
