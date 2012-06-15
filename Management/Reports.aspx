<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Reports.aspx.cs" Inherits="SMEPayroll.Management.Reports" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Import Namespace="SMEPayroll" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
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

</head>
<body style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Reports Management</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td align="right" style="height: 25px">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View CPF information"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/toolbar/formsCPF.jpg" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../CPF/SubmitCPF.aspx" class="nav"><b>CPF </b></a>
                            <br />
                            <tt class="bodytxt">Create CPF file to be submitted to the CPF Board every month.</tt><br />
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%} %>
                        <td colspan="2">
                        </td>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View IRAS information"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/toolbar/formsIR8A.jpg" /></td>
                        <td style="width: 41%; text-align: left"><%--href="../Management/ManageIR8A.aspx"--%>
                            <a   onclick="OpenIRAS1();" href="#" class="nav"><b>IRAS </b></a>
                            <br />
                            <tt class="bodytxt">View & Print IR8A information (To be submitted to IRAS end of the
                                year).</tt><br />
                        </td>
                        <%}%>
                    </tr>
                </table>
            </center>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Giro information"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/toolbar/formsgGIRO.jpg" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Reports/Girofile.aspx" class="nav"><b>Bank Giro </b></a>
                            <br />
                            <tt class="bodytxt">Create Bank Giro file to be submitted to the bank.</tt><br />
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%}%>
                        <td colspan="2">
                        </td>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "generate ledger"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/reports/B-Reports 4.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Payroll/GenerateLedger.aspx" class="nav"><b>Generate Ledger</b></a>
                            <br />
                            <tt class="bodytxt">Right to Generate Ledger for Additions/Deduction/Salary/CPF/Funds/SDL</tt></td>
                        <%}%>
                    </tr>
                </table>
            </center>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Custom Reports"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/Reports/B-CustomReports.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Reports/CustomReportMainPage.aspx" class="nav"><b>Custom Reports Writer
                            </b></a>
                            <br />
                            <tt class="bodytxt">View various reports like Salary summary report, Levy report, CPF
                                report, etc.</tt></td>
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%}%>
                        <td colspan="2">
                        </td>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View CPF information"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/Admin/B-Additionalmedisave.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/ManageAMC.aspx" class="nav"><b>Additional Medisave Contribution
                                Scheme</b></a>
                            <br />
                            <tt class="bodytxt">Manage Medisave Addition,Deletion,Update.</tt><br />
                        </td>
                        <%}%>
                    </tr>
                </table>
            </center>
            <br />
            
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Custom Reports"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/Reports/B-CustomReports.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Reports/Copy of Girofile.aspx" class="nav"><b>Cheque/Cash Export
                            </b></a>
                            <br />
                            <tt class="bodytxt">Cheque/Cash Export Data For chequePro
                                </tt></td>
                       
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%}%>
                        <td colspan="2">
                        </td>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View CPF informationeeee"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/Admin/B-Additionalmedisave.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/ManageAMC.aspx" class="nav"><b>Additional Medisave Contribution
                                Scheme</b></a>
                            <br />
                            <tt class="bodytxt">Manage Medisave Addition,Deletion,Update.</tt><br />
                        </td>
                        <%}%>
                    </tr>
                </table>
            </center>
            <br />
            
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View Custom Consolidate Reports") && HttpContext.Current.Session["CurrentCompany"].ToString() == "1" && HttpContext.Current.Session["GroupName"].ToString().ToUpper() == "SUPER ADMIN")
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/Reports/B-CustomReports.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Reports/CustomConMainPage.aspx" class="nav"><b>Consolidated Reports Writer
                            </b></a>
                            <br />
                            <tt class="bodytxt">View various Consolidate reports like Salary summary report, Levy report, CPF
                                report, etc.</tt></td>
                        
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%}%>
                        <td colspan="2">
                        </td>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "View CPF information11111"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/Admin/B-Additionalmedisave.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/ManageAMC.aspx" class="nav"><b>Additional Medisave Contribution
                                Scheme</b></a>
                            <br />
                            <tt class="bodytxt">Manage Medisave Addition,Deletion,Update.</tt><br />
                        </td>
                        <%}%>
                    </tr>
                </table>
            </center>
        </div>
    </form>
    <script language="javascript" type="text/javascript">
          function OpenIRAS1()
        {
     
            var message = document.getElementById("txtMsg");            
            if(message.value=="V")
            {
                var newURL;
                var url = window.location.href;                 
                var mySplitResult = url.split("/");
                var i;
                for(i = 0; i < mySplitResult.length-2; i++)
                {
                        if(i==0)
                        {
                          newURL=mySplitResult[i]+"//";
                        }                
                        else if(mySplitResult[i]!="")
                        {
                          newURL=newURL+mySplitResult[i]+"/";
                        }
                }                  
                var url= newURL + "IRAS/Login.aspx";
                window.open(url); 
            }
            else if (message.value=="I")
            {
                alert('Maintenance Expire');
            }
        }
    </script>
</body>
</html>
