<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="giro.ascx.cs" Inherits="SMEPayroll.Company.giro" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="radG" %>
<center>
<table cellpadding="0" cellspacing="0" style="width: 610px; font-size: 9pt; font-family: Tahoma; height: 255px;">    
    <tr>
        <td colspan="4" style="font-weight: bold; font-size: 9pt; color: #000000;
            height: 28px; background-color: #e9eed4; text-align: center">
            <asp:Label ID="Label1" class="bodytxt" runat="server" Font-Names="Verdana" Font-Size="9pt"></asp:Label>
            
        </td>
    </tr>
    <tr >
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
           <tt class="bodytxt">  Bank Name:</tt>          
        </td>
        <td style="height: 33px">
          <asp:DropDownList id="drpbankname" OnDataBound="drpbankname_databound" class="textfields"  runat="server" Width="145px" ></asp:DropDownList></td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
    </tr>
    <tr bgcolor="<% =sOddRowColor%>">
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
            <tt class="bodytxt">
            Day:</tt></td>
        <td style="height: 33px">
        <asp:TextBox   ID="txtvaluedate" Text='<%# DataBinder.Eval(Container,"DataItem.value_date")%>' Width="145px" Enabled =true  runat="server"  ></asp:TextBox>
        </td>
        <td style="color:Red;height: 33px">
          <tt class="bodytxt">[cannot be a sunday or public holiday]</tt>
        </td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
    </tr>
    <tr >
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
              <tt class="bodytxt">
            Branch Code:</tt> </td>
        <td style="height: 33px">
           <%-- <asp:DropDownList ID="drpbankbranch" class="textfields"  runat="server" Width="145px">
            </asp:DropDownList>--%>
            <asp:TextBox ID="txtbranch" MaxLength="6" class="textfields" Text='<%# DataBinder.Eval(Container,"DataItem.bank_branch")%>' runat="server" Width="145px"></asp:TextBox>
            </td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
    </tr>
    <tr bgcolor="<% =sOddRowColor%>">
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
             <tt class="bodytxt">
            Bank AccNo:</tt></td>
        <td style="height: 33px">
            <asp:TextBox ID="txtbankaccno" Width="145px" MaxLength="15" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.bank_accountno")%>' class="textfields"></asp:TextBox></td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
    </tr>

   <tr>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
           <tt class="bodytxt">
            Account Name:</tt></td>
        <td style="height: 33px">
             <asp:TextBox id="txtgiroaccountname" Width="145px" Text='<%# DataBinder.Eval(Container,"DataItem.giro_acc_name")%>' runat="server" class="textfields"  ></asp:TextBox></td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
    </tr>
    <tr bgcolor="<% =sOddRowColor%>" >
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
           <tt class="bodytxt">
           <asp:Label runat="server" Text="Company Code provided by Bank:" ID="lblDBS"></asp:Label>
            </tt></td>
        <td style="height: 33px">
             <asp:TextBox id="compbankcode" MaxLength="15" Width="145px" Text='<%# DataBinder.Eval(Container,"DataItem.company_bankcode")%>' runat="server" class="textfields" Visible="True"  ></asp:TextBox></td>     
       <td style="color:Red;height: 33px">
          <tt class="bodytxt">            
            <asp:Label runat="server" Text="[Applicable for DBS Bank only]" ID="lblDBS1"/>
          </tt>
        </td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
    </tr>
    <tr bgcolor="<% =sOddRowColor%>"  >
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
          <tt class="bodytxt">
            <asp:Label runat="server" Text="Approver Code provided by Bank:" ID="lblMZ1"></asp:Label>          
          </tt>
        <td style="height: 33px">
            <asp:TextBox ID="txtApprover" runat="server" MaxLength="15" class="textfields" Text='<%# DataBinder.Eval(Container,"DataItem.approvercode")%>'
                Width="145px" Visible="True"></asp:TextBox></td>
        <td style="color: red; height: 33px">
          <tt class="bodytxt">          
            <asp:Label runat="server" Text="[Applicable for Mizuho Bank only]" ID="lblMZ11"/>
          </tt>
        </td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
    </tr>
    <tr bgcolor="<% =sOddRowColor%>">
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
          <tt class="bodytxt">          
            <asp:Label runat="server" Text="Operator Code provided by Bank:" ID="lblMZ2"/>
          </tt>
        <td style="height: 33px">
            <asp:TextBox ID="txtOperator" runat="server" MaxLength="15" class="textfields" Text='<%# DataBinder.Eval(Container,"DataItem.operatorcode")%>'
                Width="145px" Visible="True"></asp:TextBox></td>
        <td style="color: red; height: 33px">
          <tt class="bodytxt">
            <asp:Label runat="server" Text="[Applicable for Mizuho Bank only]" ID="lblMZ22"/>
          </tt>
        </td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
    </tr>
    <tr bgcolor=#e9eed4>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
         <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" OnClientClick="return ValidateGiriInfo();" />
            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" Width="55px" />
        </td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
        <td style="height: 33px">
        </td>
    </tr>
</table>
</center>
<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="drpbankname"
    Display="None" ErrorMessage="Bank Name" InitialValue="-1"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtvaluedate"
    Display="None" ErrorMessage="Value Date" SetFocusOnError="True"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtbranch"
    Display="None" ErrorMessage="Branch Code" SetFocusOnError="True"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtbankaccno"
    Display="None" ErrorMessage="Bank Acc No" SetFocusOnError="True"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtgiroaccountname"
    Display="None" ErrorMessage="Bank Acc Name" SetFocusOnError="True"></asp:RequiredFieldValidator>
<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtvaluedate"
    Display="None" ErrorMessage="Invalid Value Date" MaximumValue="31" MinimumValue="1"
    SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtbranch" Display="None"
    ErrorMessage="Invalid Branch Code" MaximumValue="111111111111111111111111111111111"
    MinimumValue="1" Type="Double"></asp:RangeValidator>
     <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtbankaccno" Display="None"
    ErrorMessage="Invalid Account No" MaximumValue="111111111111111111111111111111111"
    MinimumValue="1" Type="Double"></asp:RangeValidator>
<asp:RegularExpressionValidator ID="AlphanuericROC" runat="server" ControlToValidate="compbankcode" 
ErrorMessage="Company Code should be Alphanumeric" ValidationExpression="\w+([-+.]\w+)*" Display="None" /> 
<asp:ValidationSummary  HeaderText="The following fields are missing" ID="ValidationSummary1" runat="server" DisplayMode="List" 
    ShowMessageBox="True"  ShowSummary="False" />--%>

<script language="javascript" type="text/javascript">
    function ValidateGiriInfo()
    {
      var sMsg=""; 
     // var sMsg=""; *      
      var variable1=document.getElementById("<%= drpbankname.ClientID %>");             
      
      var variable2=document.getElementById("<%= txtvaluedate.ClientID %>");             
      //* AlphaNumeric      
      var variable3=document.getElementById("<%= txtbranch.ClientID %>");       
      
      //* AlphaNumeric      
      var variable4=document.getElementById("<%= txtbankaccno.ClientID %>");             
      
      var variable5=document.getElementById("<%= txtgiroaccountname.ClientID %>"); 
      
      //DBS Bank
      var variable6=document.getElementById("<%= compbankcode.ClientID %>");             
      //Mizuho  Bank
      var variable7=document.getElementById("<%= txtApprover.ClientID %>");
      var variable8=document.getElementById("<%= txtOperator.ClientID %>");
      
      //alert(variable1 + ',' +variable2+ ',' + variable3+ ','+ variable4 + ',' + variable5);
      
        var sMSG = "";    		            
        //Shashank Starts-Date 11/04/2010		    
        /** Mandatory Fields Based Upon Simple No Value OR Combobox Values Like NA OR -SELECT-*/
        var msg ="Giro Setup-BankName,Giro Setup-Day,Giro Setup-BranchCode,Giro Setup-BankAccNo,Giro Setup-Account Name";
        var srcData ="";        
        var srcCtrl =variable1.id +','+ variable2.id+','+variable3.id +',' + variable4.id + ',' + variable5.id;        
        
        //Check If  BankName is DBS/POSB then Company Provided By Bank is Mandatory         
        var selIndex = variable1.selectedIndex;             
        var comboValue = variable1.options[selIndex].value;  
         
        if(comboValue=="4")
        { 
          msg=msg+",Giro Setup-Company Code provided by Bank";
          srcCtrl=srcCtrl +","+variable6.id;
        }
        
        if(comboValue=="9")
        { 
          msg=msg+",Giro Setup-Approver Code provided by Bank,Giro Setup-Operator Code provided by Bank";
          srcCtrl=srcCtrl +","+variable7.id+","+variable8.id;
        }
        
        var strirmsg = validateData(srcCtrl,'','MandatoryAll',srcData,msg,'');
        if(strirmsg!="")
        {
           sMSG = "Following fields are missing.\n\n" + strirmsg + "\n";
        }
        
        //Check For Postal code Numeric Only    
        strirmsg="";
        strirmsg = CheckNumeric(variable2.value,"Giro Setup-Day");
        if(strirmsg!="")                        
            sMSG+=strirmsg+"\n";
            
        //Check For Postal code AlphaNumeric Only    
        strirmsg="";
        strirmsg = alphanumeric(variable3,"Giro Setup-Branch Code");
        if(strirmsg!="")                        
            sMSG+=strirmsg+"\n";
            
        //Check For Postal code AlphaNumeric Only    
        strirmsg="";
        strirmsg = alphanumeric(variable4,"Giro Setup-Bank AccNo");
        if(strirmsg!="")                        
            sMSG+=strirmsg+"\n";
        
        //Check For Postal code AlphaNumeric Only    
        strirmsg="";
        strirmsg = alphanumeric(variable5,"Giro Setup-Account Name");
        if(strirmsg!="")                        
            sMSG+=strirmsg+"\n";
         
         
         //Show Message Box
         if(sMSG!="")
         {
            alert(sMSG);
            return false;  
         }else
         {   
            return true;  
        }
    }
</script>

        