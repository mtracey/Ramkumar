<%@ Page Language="C#" AutoEventWireup="true" Codebehind="SubmitCPF.aspx.cs" Inherits="SMEPayroll.CPF.SubmitCPF" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CPF Submission</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

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
    
    <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
            <script language="javascript" type="text/javascript">
                         function getOuterHTML(obj) {
                    if (typeof (obj.outerHTML) == "undefined") {
                        var divWrapper = document.createElement("div");
                        var copyOb = obj.cloneNode(true);
                        divWrapper.appendChild(copyOb);
                        return divWrapper.innerHTML
                    }
                    else
                        return obj.outerHTML;
                }

                function PrintRadGrid(sender, args) {
                   if (args.get_item().get_text() == 'Print')
                     {
                        
                        var previewWnd = window.open('about:blank', '', '', false);
                        var sh = '<%= ClientScript.GetWebResourceUrl(RadGrid1.GetType(),String.Format("Telerik.Web.UI.Skins.{0}.Grid.{0}.css",RadGrid1.Skin)) %>';
                        var shBase = '<%= ClientScript.GetWebResourceUrl(RadGrid1.GetType(),"Telerik.Web.UI.Skins.Grid.css") %>';
                        var styleStr = "<html><head><link href = '" + sh + "' rel='stylesheet' type='text/css'></link>";
                        styleStr += "<link href = '" + shBase + "' rel='stylesheet' type='text/css'></link></head>";
                        var htmlcontent = styleStr + "<body>" + getOuterHTML($find('<%= RadGrid1.ClientID %>').get_element()) + "</body></html>";
                        previewWnd.document.open();
                        previewWnd.document.write(htmlcontent);
                        previewWnd.document.close();
                        previewWnd.print();
                        previewWnd.close();
                    }
                }
            
            
            </script>
    </telerik:RadCodeBlock>

    <script language="javascript" type="text/javascript">
    
    
   
    
    
    function isNumericKeyStrokeDecimal(evt)
    {
         var charCode = (evt.which) ? evt.which : event.keyCode 
         if ((charCode > 31 && (charCode < 48 || charCode > 57)) && (charCode !=46))
            return false;

         return true;
    }
    function isNumericKeyStroke(evt)
    {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
    }
    function GrandTotal()
    {
        document.form1.txtGrandTotal.value = parseFloat(TotalCPF);
        var TotalCPF = document.form1.txtTotalCPF.value;
        var CPFLatePayment = document.form1.txtCPFLatePayment.value;
        var FWL = document.form1.txtFWL.value;
        var FWLLatePayment = document.form1.txtFWLLatePayment.value;
        var SDL = document.form1.txtSDL.value;
        var DonationComChest = document.form1.txtDonationComChest.value;
        var MBMF = document.form1.txtMBMF.value;
        var SINDA = document.form1.txtSINDA.value;
        var CDAC = document.form1.txtCDAC.value;
        var ECF = document.form1.txtECF.value;
        
        TotalCPF = parseFloat(TotalCPF);
        CPFLatePayment = parseFloat(CPFLatePayment);
        FWL = parseFloat(FWL);
        FWLLatePayment = parseFloat(FWLLatePayment);
        SDL = parseFloat(SDL);
        DonationComChest = parseFloat(DonationComChest);
        MBMF = parseFloat(MBMF);
        SINDA = parseFloat(SINDA);
        CDAC = parseFloat(CDAC);
        ECF = parseFloat(ECF);
        
        if (isNaN(TotalCPF))
            TotalCPF = 0;                
        if (isNaN(CPFLatePayment))
            CPFLatePayment = 0;                
        if (isNaN(FWL))
            FWL = 0;                
        if (isNaN(FWLLatePayment))
            FWLLatePayment = 0;                
        if (isNaN(SDL))
            SDL = 0;                
        if (isNaN(DonationComChest))
            DonationComChest = 0;                
        if (isNaN(MBMF))
            MBMF = 0;                
        if (isNaN(SINDA))
            SINDA = 0;                
        if (isNaN(CDAC))
            CDAC = 0;                
        if (isNaN(ECF))
            ECF = 0;   
        document.form1.txtGrandTotal.value = TotalCPF + CPFLatePayment + FWL + FWLLatePayment + SDL + DonationComChest + MBMF + SINDA + CDAC + ECF;
    }
    function SubmitForm()
    {
        if (ValidateDate())
        {   
           document.form1.check.value='true';                    
           document.form1.submit();           
        }
    }
    function ViewDetails()
    {
        document.form1.check.value='viewdetails';                    
        document.form1.submit();   
    }
    function ValidateDoner()
    {
        var DonationComChest = document.form1.txtDonationComChest.value;
        var DonationComChestDC = document.form1.txtDCDonationComChest.value;
        var MBMF = document.form1.txtMBMF.value;
        var MBMFDC = document.form1.txtDCMBMF.value;
        var SINDA = document.form1.txtSINDA.value;
        var SINDADC = document.form1.txtDCSINDA.value;
        var CDAC = document.form1.txtCDAC.value;
        var CDACDC = document.form1.txtDCCDAC.value;
        var ECF = document.form1.txtECF.value;
        var ECFDC = document.form1.txtDCECF.value; 
        DonationComChest = parseFloat(DonationComChest);
        MBMF = parseFloat(MBMF);
        SINDA = parseFloat(SINDA);
        CDAC = parseFloat(CDAC);
        ECF = parseFloat(ECF);
        DonationComChestDC = parseFloat(DonationComChestDC);
        MBMFDC = parseFloat(MBMFDC);
        SINDADC = parseFloat(SINDADC);
        CDACDC = parseFloat(CDACDC);
        ECFDC = parseFloat(ECFDC);
        alert(MBMF);
        alert(MBMFDC);
        var sMSG = ""
        if (DonationComChest > 0 && DonationComChestDC < 0)
            sMSG +="Donation to community chest \n";
        if (MBMF > 0 && MBMFDC < 0)
            alert(MBMF);
           // sMSG +="MBMF \n";
        if (SINDA > 0 && SINDADC < 0)
            sMSG +="SINDA\n";
      if (CDAC > 0 && CDACDC < 0)
            sMSG +="CDAC \n";
      if (ECF > 0 && ECFDC < 0)
            sMSG +="ECF \n";
      if (sMSG == "")
        return true;
      else
      {sMSG = "Following Donner Count can not be Zero.\n" + sMSG;alert(sMSG);return false;}   
        
    }
    function Print()
    {
       window.print();
    }
    function ValidateDate()
    {
        var DonationComChest = document.form1.txtDonationComChest.value;
        var DonationComChestDC = document.form1.txtDCDonationComChest.value;
        var MBMF = document.form1.txtMBMF.value;
        var MBMFDC = document.form1.txtDCMBMF.value;
        var SINDA = document.form1.txtSINDA.value;
        var SINDADC = document.form1.txtDCSINDA.value;
        var CDAC = document.form1.txtCDAC.value;
        var CDACDC = document.form1.txtDCCDAC.value;
        var ECF = document.form1.txtECF.value;
        var ECFDC = document.form1.txtDCECF.value; 
        DonationComChest = parseFloat(DonationComChest);
        MBMF = parseFloat(MBMF);
        SINDA = parseFloat(SINDA);
        CDAC = parseFloat(CDAC);
        ECF = parseFloat(ECF);
        DonationComChestDC = parseFloat(DonationComChestDC);
        MBMFDC = parseFloat(MBMFDC);
        SINDADC = parseFloat(SINDADC);
        CDACDC = parseFloat(CDACDC);
        ECFDC = parseFloat(ECFDC);
        /*  Hidden values */
        var DonationComChest1 = document.form1.txtHDonationComChest.value;
        var DonationComChestDC1 = document.form1.txtHDCDonantionComChest.value;
        var MBMF1 = document.form1.txtHMBMF.value;
        var MBMFDC1 = document.form1.txtHDCMBMF.value;
        var SINDA1 = document.form1.txtHSINDA.value;
        var SINDADC1 = document.form1.txtHDCSINDA.value;
        var CDAC1 = document.form1.txtHCDAC.value;
        var CDACDC1 = document.form1.txtHDCCDAC.value;
        var ECF1 = document.form1.txtHECF.value;
        var ECFDC1 = document.form1.txtHDCECF.value; 
        DonationComChest1 = parseFloat(DonationComChest1);
        MBMF1 = parseFloat(MBMF1);
        SINDA1 = parseFloat(SINDA1);
        CDAC1 = parseFloat(CDAC1);
        ECF1 = parseFloat(ECF1);
        DonationComChestDC1 = parseFloat(DonationComChestDC1);
        MBMFDC1 = parseFloat(MBMFDC1);
        SINDADC1 = parseFloat(SINDADC1);
        CDACDC1 = parseFloat(CDACDC1);
        ECFDC1 = parseFloat(ECFDC1);        
        
        var sMSG = "";
        if (DonationComChest1 > DonationComChest)
            sMSG = "DonationComChest \n";
        if (DonationComChestDC1  > DonationComChestDC)
            sMSG += "DonationComChest Donner Count \n";
        if (MBMF1 > MBMF)
            sMSG += "MBMF \n";
        if (MBMFDC1 > MBMFDC)
            sMSG += "MBMF Donner Count \n";
        if (SINDA1 > SINDA)
            sMSG +="SINDA \n";
        if (SINDADC1 > SINDADC)
            sMSG +="SINDA Donner Count\n";
        if (CDAC1 > CDAC)
            sMSG +="CDAC \n";
        if (CDACDC1 > CDACDC)
            sMSG += "CDAC Donner Count \n";
        if (ECF1 > ECF)
           sMSG += "ECF \n";
        if (ECFDC1 > ECFDC)
           sMSG += "ECF Donner Count\n";
        
        if (sMSG == "")
            return true;
        else
        {sMSG = "Following Contribution can not be less than their calculated values \n" + sMSG;alert(sMSG); return false; }
                    
    }  
    </script>

</head>
<body onload="HideGrid()" style="margin-left: auto">
    <form id="form1" runat="server">
        <radG1:RadScriptManager ID="ScriptManager" runat="server">
        </radG1:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Generate CPF File</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td  align="right" class="bodytxt" >
                                <asp:CheckBox ID="chkCPFOld"  runat="server" Text="New Version" Checked="true" />
                            </td>
                            <td align="center">
                                <tt class="bodytxt">CPF Number :</tt>
                                <select id="cmbEmployerCPFAcctNumber" runat="server" class="textfields">
                                </select>
                                &nbsp;&nbsp;<tt class="bodytxt"> Month :</tt>
                                <asp:DropDownList ID="cmbMonth" runat="server" AutoPostBack="true" Style="width: 120px"
                                    CssClass="textfields">
                                    <asp:ListItem Selected="true" Value="-1">-select-</asp:ListItem>
                                    <asp:ListItem Value="1">January</asp:ListItem>
                                    <asp:ListItem Value="2">February</asp:ListItem>
                                    <asp:ListItem Value="3">March</asp:ListItem>
                                    <asp:ListItem Value="4">April</asp:ListItem>
                                    <asp:ListItem Value="5">May</asp:ListItem>
                                    <asp:ListItem Value="6">June</asp:ListItem>
                                    <asp:ListItem Value="7">July</asp:ListItem>
                                    <asp:ListItem Value="8">August</asp:ListItem>
                                    <asp:ListItem Value="9">September</asp:ListItem>
                                    <asp:ListItem Value="10">October</asp:ListItem>
                                    <asp:ListItem Value="11">November</asp:ListItem>
                                    <asp:ListItem Value="12">December</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;&nbsp;<tt class="bodytxt"> Year :</tt>
                   <%--             <asp:DropDownList ID="cmbYear" runat="server" AutoPostBack="true" Style="width: 65px"
                                    CssClass="textfields">
                                    <asp:ListItem Selected="true" Value="-1">-select-</asp:ListItem>
                                    <asp:ListItem Value="2007">2007</asp:ListItem>
                                    <asp:ListItem Value="2008">2008</asp:ListItem>
                                    <asp:ListItem Value="2009">2009</asp:ListItem>
                                    <asp:ListItem Value="2010">2010</asp:ListItem>
                                    <asp:ListItem Value="2011">2011</asp:ListItem>
                                    <asp:ListItem Value="2012">2012</asp:ListItem>
                                    <asp:ListItem Value="2013">2013</asp:ListItem>
                                    <asp:ListItem Value="2014">2014</asp:ListItem>
                                    <asp:ListItem Value="2015">2015</asp:ListItem>
                                </asp:DropDownList>--%>
                                
                                 <asp:DropDownList ID="cmbYear" Style="width: 65px" CssClass="textfields" DataTextField="text" DataValueField="id" DataSourceID="xmldtYear" 
                                       runat="server"  AutoPostBack="true" AppendDataBoundItems="true" >
                                       <asp:ListItem Selected="true" Value="-1">-select-</asp:ListItem>
                               </asp:DropDownList>
                               <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                
                                
                                &nbsp;&nbsp;&nbsp;&nbsp;<tt><asp:ImageButton ID="imgbtnfetch" runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                                </tt>
                            </td>
                            <td align="right" style="height: 25px">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <script type="text/javascript">
    function ShowGrid()
    {     
    }
    function HideGrid()
    {             
    }
        </script>

        <input type="hidden" id="txtHDonationComChest" name="txtHDonationComChest" runat="server" />
        <input type="hidden" id="txtHDCDonantionComChest" name="txtHDCDonantionComChest"
            runat="server" />
        <input type="hidden" id="txtHMBMF" name="txtHMBMF" runat="server" />
        <input type="hidden" id="txtHDCMBMF" name="txtHDCMBMF" runat="server" />
        <input type="hidden" id="txtHSINDA" name="txtHSINDA" runat="server" />
        <input type="hidden" id="txtHDCSINDA" name="txtHDCSINDA" runat="server" />
        <input type="hidden" id="txtHCDAC" name="txtHCDAC" runat="server" />
        <input type="hidden" id="txtHDCCDAC" name="txtHDCCDAC" runat="server" />
        <input type="hidden" id="txtHECF" name="txtHECF" runat="server" />
        <input type="hidden" id="txtHDCECF" name="txtHDCECF" runat="server" />
        <input type="hidden" id="check" name="check" runat="server" />
        <table border="0" cellpadding="2" cellspacing="0" style="width: 99%">
            <tr>
                <td style="height: 25px" width="50%" background="../frames/images/toolbar/backs.jpg">
                    <tt class="colheading"><b>&nbsp;&nbsp;&nbsp; Contribution Summary</b></tt></td>
                <td width="40%" background="../frames/images/toolbar/backs.jpg">
                </td>
                <td width="10%" background="../frames/images/toolbar/backs.jpg">
                    <asp:Button Visible="false" ID="btndetail" Height="25px" runat="server" Text="View Details"
                        OnClientClick="ViewDetails();" /></td>
            </tr>
        </table>
        <table border="0" bgcolor="<% =sBorderColor %>" cellpadding="2" cellspacing="2" style="width: 99%">
            <tr bgcolor="<%=sOddRowColor%>">
                <td width="20%" align="right">
                    &nbsp; <tt class="bodytxt" style="text-align: center">Total CPF Contributions: </tt>
                </td>
                <td width="30%">
                    <input id="txtTotalCPF" readonly type="text" class="textfields" runat="server" style="width: 150px" />
                    <tt class="bodytxt">&nbsp;$</tt></td>
                <td width="20%" align="right">
                </td>
                <td width="30%">
                </td>
            </tr>
            <tr bgcolor="<%=sOddRowColor%>">
                <td width="20%" align="right">
                    &nbsp; <tt class="bodytxt" style="text-align: center">CPF Late Payment Interest: </tt>
                </td>
                <td width="30%">
                    <input id="txtCPFLatePayment" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStrokeDecimal(event);" onkeyup="GrandTotal();"
                        maxlength="12" />
                    <tt class="bodytxt">&nbsp;$</tt></td>
                <td width="20%" align="right">
                </td>
                <td width="30%">
                </td>
            </tr>
            <tr bgcolor="<%=sOddRowColor%>">
                <td width="20%" align="right">
                    &nbsp; <tt class="bodytxt" style="text-align: center">Foreign Worker Levy(FWL): </tt>
                </td>
                <td width="30%">
                    <input id="txtFWL" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStrokeDecimal(event);" onkeyup="GrandTotal();"
                        maxlength="12" />
                    <tt class="bodytxt">&nbsp;$</tt></td>
                <td width="20%" align="right">
                </td>
                <td width="30%">
                </td>
            </tr>
            <tr bgcolor="<%=sOddRowColor%>">
                <td width="20%" align="right">
                    &nbsp; <tt class="bodytxt" style="text-align: center">FWL Late Payment Interest: </tt>
                </td>
                <td width="30%">
                    <input id="txtFWLLatePayment" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStrokeDecimal(event);" maxlength="12" onkeyup="GrandTotal();" />
                    <tt class="bodytxt">&nbsp;$</tt></td>
                <td width="20%" align="right">
                </td>
                <td width="30%">
                </td>
            </tr>
            <tr bgcolor="<%=sOddRowColor%>">
                <td width="20%" align="right">
                    &nbsp; <tt class="bodytxt" style="text-align: center">Skills Development Levy(SDL):
                    </tt>
                </td>
                <td width="30%">
                    <input id="txtSDL" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStrokeDecimal(event);" maxlength="12" onkeyup="GrandTotal();" />
                    <tt class="bodytxt">&nbsp;$</tt></td>
                <td width="20%" align="right">
                </td>
                <td width="30%">
                </td>
            </tr>
            <tr bgcolor="<%=sOddRowColor%>">
                <td width="20%" align="right">
                    &nbsp; <tt class="bodytxt" style="text-align: center">Donation to Community Chest: </tt>
                </td>
                <td width="30%">
                    <input id="txtDonationComChest" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStrokeDecimal(event);" maxlength="12" onkeyup="GrandTotal();" />
                    <tt class="bodytxt">&nbsp;$</tt></td>
                <td width="20%" align="right">
                    <tt class="bodytxt">Donor Count:</tt>
                </td>
                <td width="30%">
                    <input id="txtDCDonationComChest" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStroke(event);" maxlength="7" />
                    <tt class="bodytxt"></tt>
                </td>
            </tr>
            <tr bgcolor="<%=sOddRowColor%>">
                <td width="20%" align="right">
                    &nbsp; <tt class="bodytxt" style="text-align: center">Total MBMF Contributions: </tt>
                </td>
                <td width="30%">
                    <input id="txtMBMF" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStrokeDecimal(event);" maxlength="12" onkeyup="GrandTotal();" />
                    <tt class="bodytxt">&nbsp;$</tt></td>
                <td width="20%" align="right">
                    <tt class="bodytxt">Donor Count:</tt>
                </td>
                <td width="30%">
                    <input id="txtDCMBMF" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStroke(event);" maxlength="7" />
                    <tt class="bodytxt"></tt>
                </td>
            </tr>
            <tr bgcolor="<%=sOddRowColor%>">
                <td width="20%" align="right">
                    &nbsp; <tt class="bodytxt" style="text-align: center">Total SINDA Contributions: </tt>
                </td>
                <td width="30%">
                    <input id="txtSINDA" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStrokeDecimal(event);" maxlength="12" onkeyup="GrandTotal();" />
                    <tt class="bodytxt">&nbsp;$</tt></td>
                <td width="20%" align="right">
                    <tt class="bodytxt">Donor Count:</tt>
                </td>
                <td width="30%">
                    <input id="txtDCSINDA" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStroke(event);" maxlength="7" />
                    <tt class="bodytxt"></tt>
                </td>
            </tr>
            <tr bgcolor="<%=sOddRowColor%>">
                <td width="20%" align="right">
                    &nbsp; <tt class="bodytxt" style="text-align: center">Total CDAC Contributions: </tt>
                </td>
                <td width="30%">
                    <input id="txtCDAC" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStrokeDecimal(event);" maxlength="12" onkeyup="GrandTotal();" />
                    <tt class="bodytxt">&nbsp;$</tt></td>
                <td width="20%" align="right">
                    <tt class="bodytxt">Donor Count:</tt>
                </td>
                <td width="30%">
                    <input id="txtDCCDAC" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStroke(event);" maxlength="7" />
                    <tt class="bodytxt"></tt>
                </td>
            </tr>
            <tr bgcolor="<%=sOddRowColor%>">
                <td width="20%" align="right">
                    &nbsp; <tt class="bodytxt" style="text-align: center">Total ECF Contributions: </tt>
                </td>
                <td width="30%">
                    <input id="txtECF" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStrokeDecimal(event);" maxlength="12" onkeyup="GrandTotal();" />
                    <tt class="bodytxt">&nbsp;$</tt></td>
                <td width="20%" align="right">
                    <tt class="bodytxt">Donor Count:</tt>
                </td>
                <td width="30%">
                    <input id="txtDCECF" type="text" class="textfields" runat="server" style="width: 150px"
                        onkeypress="return isNumericKeyStroke(event);" maxlength="7" />
                    <tt class="bodytxt"></tt>
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="2" cellspacing="2" style="width: 99%">
            <tr>
                <td background="../frames/images/toolbar/backs.jpg">
                    <tt class="colheading"><b>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Grand Total:&nbsp;&nbsp;<input type="text"
                            id="txtGrandTotal" name="txtGrandTotal" class="textfields" runat="server" style="width: 150px"
                            readonly />
                    </b></tt>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnPrint" Visible="false" runat="server" Text="Print" OnClientClick="Print();" />
                </td>
            </tr>
        </table>
        <br />
        <div id="grid" runat="server">
              <radG1:RadToolBar ID="tbRecord" runat="server" Width="100%" Skin="Office2007" UseFadeEffect="True"  Height="30px"
                             OnButtonClick="tbRecord_ButtonClick" OnClientButtonClicking="PrintRadGrid" BorderWidth="0px" >
                            <Items>
                                <radG1:RadToolBarButton runat="server" CommandName="Print" ImageUrl="../Frames/Images/GRIDTOOLBAR/printer-s.png"
                                    Text="Print" ToolTip="Print">
                                </radG1:RadToolBarButton>
                                <radG1:RadToolBarButton IsSeparator="true">
                                </radG1:RadToolBarButton>
                                <radG1:RadToolBarButton runat="server" Text="">
                                    <ItemTemplate>
                                        <div>
                                            <table cellpadding="0" cellspacing="0" border="0" >
                                                <tr>
                                                    <td class="bodytxt" valign="middle" style="height:30px">
                                                        &nbsp;Export To:</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </radG1:RadToolBarButton>
                                <radG1:RadToolBarButton runat="server" CommandName="Excel" ImageUrl="../Frames/Images/GRIDTOOLBAR/excel-s.png"
                                    Text="Excel" ToolTip="Excel">
                                </radG1:RadToolBarButton>
                                <radG1:RadToolBarButton runat="server" CommandName="Word" ImageUrl="../Frames/Images/GRIDTOOLBAR/word-s.png"
                                    Text="Word" ToolTip="Word">
                                </radG1:RadToolBarButton>
                                <%--       <radG:RadToolBarButton runat="server" CommandName="PDF" ImageUrl="../Frames/Images/GRIDTOOLBAR/pdf-s.png" Text="PDF"    ToolTip="PDF"></radG:RadToolBarButton>--%>
                                <radG1:RadToolBarButton IsSeparator="true">
                                </radG1:RadToolBarButton>
                                <radG1:RadToolBarButton runat="server" CommandName="Refresh" ImageUrl="../Frames/Images/GRIDTOOLBAR/reset-s.png"
                                    Text="UnGroup" ToolTip="UnGroup">
                                </radG1:RadToolBarButton>
                        <%--        <radG:RadToolBarButton runat="server" CommandName="Refresh" ImageUrl="../Frames/Images/GRIDTOOLBAR/reset-s.png"
                                    Text="Clear Sorting" ToolTip="Clear Sorting">
                                </radG:RadToolBarButton>--%>
                                <radG1:RadToolBarButton IsSeparator="true">
                                </radG1:RadToolBarButton>
                                <radG1:RadToolBarButton runat="server" Text="Count">
                                    <ItemTemplate>
                                        <div>
                                            <table cellpadding="0" cellspacing="0" border="0" style="height:30px">
                                                <tr>
                                                    <td valign="middle">
                                                        <img src="../Frames/Images/GRIDTOOLBAR/count-s.png" border="0" alt="Count" /></td>
                                                    <td valign="middle">
                                                        <asp:Label ID="Label_count" runat="server" Text="" class="bodytxt"></asp:Label>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </radG1:RadToolBarButton>
                                <radG1:RadToolBarButton IsSeparator="true">
                                </radG1:RadToolBarButton>
                                <radG1:RadToolBarButton runat="server" ImageUrl="../Frames/Images/GRIDTOOLBAR/reset-s.png"
                                    Text="Reset to Default" ToolTip="Reset to Default">
                                </radG1:RadToolBarButton>
                                <radG1:RadToolBarButton runat="server" ImageUrl="../Frames/Images/GRIDTOOLBAR/save-s.png"
                                    Text="Save Grid Changes" ToolTip="Save Grid Changes">
                                </radG1:RadToolBarButton>
                                <%--<radG:RadToolBarButton runat="server" CommandName="Graph" ImageUrl="../Frames/Images/GRIDTOOLBAR/graph-s.png" Text="Graph" ToolTip="Graph" Enabled="false"></radG:RadToolBarButton>--%>
                            </Items>
                        </radG1:RadToolBar>   
                                            
            <telerik:RadGrid Visible="false" ID="RadGrid1" runat="server"
                GridLines="None" Skin="Default" Width="94%"  AllowPaging ="false" >
                <MasterTableView  AutoGenerateColumns="False">
                    <Columns>
                        <telerik:GridBoundColumn DataField="emp_name" HeaderText="Employee Name" UniqueName="emp_name"
                            SortExpression="emp_name">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="fund_type" HeaderText="Fund Type" UniqueName="fund_type"
                            SortExpression="fund_type">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="fund_amount" HeaderText="Fund Amount" DataFormatString="{0:N2}"
                            DataType="System.Decimal" UniqueName="fund_amount" SortExpression="fund_amount">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="empcpf" HeaderText="Employee CPF" DataFormatString="{0:N2}"
                            DataType="System.Decimal" UniqueName="empcpf" SortExpression="empcpf">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="employercpf" HeaderText="Employer CPF" DataFormatString="{0:N2}"
                            DataType="System.Decimal" UniqueName="employercpf" SortExpression="employercpf">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="cpfamount" HeaderText="CPFAmount" DataFormatString="{0:N2}"
                            DataType="System.Decimal" UniqueName="cpfamount" SortExpression="cpfamount">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Gross" HeaderText="Grosspay" DataFormatString="{0:N2}"
                            DataType="System.Decimal" UniqueName="netpay" SortExpression="netpay">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sdl" HeaderText="SDL" DataType="System.Decimal"
                            DataFormatString="{0:N2}" UniqueName="sdl" SortExpression="sdl">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <ExpandCollapseColumn Visible="False">
                        <HeaderStyle Width="19px"></HeaderStyle>
                    </ExpandCollapseColumn>
                    <RowIndicatorColumn Visible="False">
                        <HeaderStyle Width="20px"></HeaderStyle>
                    </RowIndicatorColumn>
                </MasterTableView>
            </telerik:RadGrid><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cmbMonth" Name="month" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="cmbYear" Name="year" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:SessionParameter Name="companyid" SessionField="Compid" Type="Int32" />
                    <asp:ControlParameter ControlID="cmbEmployerCPFAcctNumber" Name="csnno" PropertyName="Value"
                        Type="string" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <center>
            <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%">
                <tr>
                    <td>
                        <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBorderColor %>">
                            <tr>
                                <td bgcolor='<% =sBorderColor %>' align="center">
                                    <input type="button" id="btnSave" name="btnSave" runat="server" value="Generate CPF"
                                        class="textfields" style="width: 80px; height: 22px" onclick="SubmitForm();" />
                                    <input type="button" id="btnPaybillBack" name="btnPaybillBack" runat="server" value="Back"
                                        class="textfields" style="width: 80px; height: 22px" onclick="history.back();" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="bodytxt">
                                    <font color="#ff0000"><b>*If File is not Genereated After Submitting. In that case  Press and hold down the CTRL key while you Click on "Submit CPF" Button.</b></font>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </center>
        <radA:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <radA:AjaxSetting AjaxControlID="cmbMonth">
                    <UpdatedControls>
                        <radA:AjaxUpdatedControl ControlID="RadGrid1" />
                        <radA:AjaxUpdatedControl ControlID="txtHDonationComChest" />
                        <radA:AjaxUpdatedControl ControlID="txtHDCDonantionComChest" />
                        <radA:AjaxUpdatedControl ControlID="txtHMBMF" />
                        <radA:AjaxUpdatedControl ControlID="txtHDCMBMF" />
                        <radA:AjaxUpdatedControl ControlID="txtHSINDA" />
                        <radA:AjaxUpdatedControl ControlID="txtHDCSINDA" />
                        <radA:AjaxUpdatedControl ControlID="txtHCDAC" />
                        <radA:AjaxUpdatedControl ControlID="txtHDCCDAC" />
                        <radA:AjaxUpdatedControl ControlID="txtHECF" />
                        <radA:AjaxUpdatedControl ControlID="txtHDCECF" />
                        <radA:AjaxUpdatedControl ControlID="check" />
                        <radA:AjaxUpdatedControl ControlID="txtTotalCPF" />
                        <radA:AjaxUpdatedControl ControlID="txtCPFLatePayment" />
                        <radA:AjaxUpdatedControl ControlID="txtFWL" />
                        <radA:AjaxUpdatedControl ControlID="txtFWLLatePayment" />
                        <radA:AjaxUpdatedControl ControlID="txtSDL" />
                        <radA:AjaxUpdatedControl ControlID="txtDonationComChest" />
                        <radA:AjaxUpdatedControl ControlID="txtDCDonationComChest" />
                        <radA:AjaxUpdatedControl ControlID="txtMBMF" />
                        <radA:AjaxUpdatedControl ControlID="txtDCMBMF" />
                        <radA:AjaxUpdatedControl ControlID="txtSINDA" />
                        <radA:AjaxUpdatedControl ControlID="txtDCSINDA" />
                        <radA:AjaxUpdatedControl ControlID="txtCDAC" />
                        <radA:AjaxUpdatedControl ControlID="txtDCCDAC" />
                        <radA:AjaxUpdatedControl ControlID="txtECF" />
                        <radA:AjaxUpdatedControl ControlID="txtDCECF" />
                        <radA:AjaxUpdatedControl ControlID="txtGrandTotal" />
                    </UpdatedControls>
                </radA:AjaxSetting>
                <radA:AjaxSetting AjaxControlID="cmbYear">
                    <UpdatedControls>
                        <radA:AjaxUpdatedControl ControlID="RadGrid1" />
                        <radA:AjaxUpdatedControl ControlID="txtHDonationComChest" />
                        <radA:AjaxUpdatedControl ControlID="txtHDCDonantionComChest" />
                        <radA:AjaxUpdatedControl ControlID="txtHMBMF" />
                        <radA:AjaxUpdatedControl ControlID="txtHDCMBMF" />
                        <radA:AjaxUpdatedControl ControlID="txtHSINDA" />
                        <radA:AjaxUpdatedControl ControlID="txtHDCSINDA" />
                        <radA:AjaxUpdatedControl ControlID="txtHCDAC" />
                        <radA:AjaxUpdatedControl ControlID="txtHDCCDAC" />
                        <radA:AjaxUpdatedControl ControlID="txtHECF" />
                        <radA:AjaxUpdatedControl ControlID="txtHDCECF" />
                        <radA:AjaxUpdatedControl ControlID="txtTotalCPF" />
                        <radA:AjaxUpdatedControl ControlID="txtCPFLatePayment" />
                        <radA:AjaxUpdatedControl ControlID="txtFWL" />
                        <radA:AjaxUpdatedControl ControlID="txtFWLLatePayment" />
                        <radA:AjaxUpdatedControl ControlID="txtSDL" />
                        <radA:AjaxUpdatedControl ControlID="txtDonationComChest" />
                        <radA:AjaxUpdatedControl ControlID="txtDCDonationComChest" />
                        <radA:AjaxUpdatedControl ControlID="txtMBMF" />
                        <radA:AjaxUpdatedControl ControlID="txtDCMBMF" />
                        <radA:AjaxUpdatedControl ControlID="txtSINDA" />
                        <radA:AjaxUpdatedControl ControlID="txtDCSINDA" />
                        <radA:AjaxUpdatedControl ControlID="txtCDAC" />
                        <radA:AjaxUpdatedControl ControlID="txtDCCDAC" />
                        <radA:AjaxUpdatedControl ControlID="txtECF" />
                        <radA:AjaxUpdatedControl ControlID="txtDCECF" />
                        <radA:AjaxUpdatedControl ControlID="txtGrandTotal" />
                    </UpdatedControls>
                </radA:AjaxSetting>
            </AjaxSettings>
        </radA:RadAjaxManager>
    </form>
</body>
</html>
