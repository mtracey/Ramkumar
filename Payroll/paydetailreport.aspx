<%@ Import Namespace = "SMEPayroll" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paydetailreport.aspx.cs" Inherits="SMEPayroll.Payroll.paydetailreport" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Payroll Detail Report</title>
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
<body>
    <form id="form1" runat="server">
    <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <br />
        <table cellpadding="0"  cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Pay Detail Report</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right"style="height: 25px">
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
    <table cellpadding="1" cellspacing="0" width="95%" border="0">
	<tr>
		<td>														
		<table cellpadding="0" cellspacing="0" border="1" width="100%" bordercolor=LightGrey>
		<tr>			
			
			<td height="20" align="center" width = "15%" ><tt class="bodytxt">&nbsp;&nbsp;<b>Employee Name</b></tt></td>
			<td height="20" align="center" width = "8%"><tt class="bodytxt">&nbsp;&nbsp;<b>Actual Basic</b></tt></td>			
			<td height="20" align="center" width = "5%"><tt class="bodytxt">&nbsp;&nbsp;<b>OT1</b></tt></td>			
			<td height="20" align="center" width = "5%"><tt class="bodytxt">&nbsp;&nbsp;<b>OT2</b></tt></td>
			<td height="20" align="center" width = "7%"><tt class="bodytxt">&nbsp;&nbsp;<b>Total Additions</b></tt></td>
			<td height="20" align="center" width = "7%"><tt class="bodytxt">&nbsp;&nbsp;<b>Gross Pay(CPF)</b></tt></td>			
			<td height="20" align="center" width = "7%"><tt class="bodytxt">&nbsp;&nbsp;<b>Gross&nbsp;&nbsp; Pay</b></tt></td>			
			<td height="20" align="center" width = "7%"><tt class="bodytxt">&nbsp;&nbsp;<b>Employee CPF</b></tt></td>	
			<td height="20" align="center" width = "7%"><tt class="bodytxt">&nbsp;&nbsp;<b>Employer CPF</b></tt></td>
			<td height="20" align="center" width = "7%"><tt class="bodytxt">&nbsp;&nbsp;<b>Fund Type</b></tt></td>
			<td height="20" align="center" width = "8%"><tt class="bodytxt">&nbsp;&nbsp;<b>Fund Amount</b></tt></td>				
			<td height="20" align="center" width = "8%"><tt class="bodytxt">&nbsp;&nbsp;<b>Total Deductions</b></tt></td>
			<td height="20" align="center" width = "17%"><tt class="bodytxt">&nbsp;&nbsp;<b>Net<br/>Pay</b></tt></td>										
		</tr>	
		<% if (payrolllist != null) 
		{
			string sRowColor = "";
            for (int i = 0; i < payrolllist.Count; i++)
			{
                SMEPayroll.Payroll.paylist opaylist = (SMEPayroll.Payroll.paylist)payrolllist[i];
				if (i % 2 == 0 )
                    sRowColor = sOddRowColor;
				else
					sRowColor = sEvenRowColor;
		%>	
		<tr>
			
			<td align = "left" valign="middle"  >&nbsp; <tt class="bodytxt"> <%=opaylist.empname%> </tt> </td>
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt"> <%=opaylist.basicpay%> &nbsp;</tt> </td>			
			<td align = "right" valign="middle">&nbsp; <tt class="bodytxt"> <%=opaylist.ot1%> </tt>&nbsp; </td>
			<td  align = "right" valign="middle">&nbsp; <tt class="bodytxt"> <%=opaylist.ot2%> </tt>&nbsp; </td>
			<td align = "right" valign="middle">&nbsp; <tt class="bodytxt"> <%=opaylist.total_additions%>&nbsp;</tt> </td>
			<td align = "right" valign="middle">&nbsp; <tt class="bodytxt"> <%=opaylist.cpfGrossPay%>&nbsp; </tt> </td>	
			<td align = "right" valign="middle">&nbsp; <tt class="bodytxt"> <%=opaylist.grosspay%>&nbsp; </tt> </td>	
			<td align = "right" valign="middle">&nbsp; <tt class="bodytxt"> <%=opaylist.employeecpf%>&nbsp; </tt> </td>	
			<td align = "right" valign="middle">&nbsp; <tt class="bodytxt"> <%=opaylist.employercpf%>&nbsp; </tt> </td>	
			<td align = "center" valign="middle">&nbsp; <tt class="bodytxt"> <%=opaylist.fundtype%>&nbsp; </tt> </td>
			<td align = "right" valign="middle">&nbsp; <tt class="bodytxt"> <%=opaylist.fundamt%> &nbsp;</tt> </td>
		 <td align = "right" valign="middle">&nbsp; <tt class="bodytxt"> <%=opaylist.total_deductions%>&nbsp; </tt> </td>
			<td align = "right" valign="middle">&nbsp; <tt class="bodytxt"> <%=opaylist.netpay%>&nbsp; </tt> </td>
		
		</tr>
		<%
			}%>

		<tr style="font-weight:bold">
			<td align = "right" valign="middle"  >&nbsp;<tt class="bodytxt"> Total :&nbsp;&nbsp;</tt> </td>
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt"> <%=tot_basicpay.ToString("#0.00")%> &nbsp;</tt> </td>			
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt"> <%=tot_ot1.ToString("#0.00")%>&nbsp; </tt> </td>			
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt"> <%=tot_ot2.ToString("#0.00")%>&nbsp; </tt> </td>			
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt"> <%=tot_total_additions.ToString("#0.00")%>&nbsp; </tt> </td>			
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt"> <%=tot_grosspay.ToString("#0.00")%>&nbsp;</tt> </td>			
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt"><%=tot_cpfGrossPay.ToString("#0.00")%> &nbsp; </tt> </td>			
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt"> <%=tot_employeecpf.ToString("#0.00")%>&nbsp; </tt> </td>			
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt"> <%=tot_employercpf.ToString("#0.00")%>&nbsp; </tt> </td>			
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt">&nbsp;</tt> </td>			
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt"> <%=tot_fundamt.ToString("#0.00")%>&nbsp; </tt> </td>			
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt"> <%=tot_total_deductions.ToString("#0.00")%>&nbsp; </tt> </td>			
			<td align = "right" valign="middle" >&nbsp; <tt class="bodytxt"> <%=tot_netpay.ToString("#0.00")%>&nbsp; </tt> </td>			
		</tr>         
         <%
		}
		%>
		</table>
		</td>
	</tr>
	</table>
	
    </form>
</body>
</html>
