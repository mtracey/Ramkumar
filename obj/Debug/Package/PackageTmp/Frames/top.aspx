<%@ Page Language="c#" Codebehind="top.aspx.cs" AutoEventWireup="false" Inherits="SMEPayroll.frames.top" %>

<%@ Import Namespace="SMEPayroll" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" href="../Style/PMSStyle.css" type="text/css" />
    <title>bottom</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />

    <script language="javascript" type="text/javascript">
        function compclick()
        {
            var vCompid = document.getElementById("txtComp").value;
            window.top.parent.frames[2].location = "../Company/AddCompanyNew.aspx?compid=" + vCompid;
        }
        function homeclick()
        {
            var vCompid = document.getElementById("txtComp").value;
            window.top.parent.frames[2].location = "../Main/Home.aspx";
        }
    </script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" bgcolor="black" background="../frames/images/toolbar/tops.jpg"
    scroll="no">
    <form id="form1" runat="server">
        <table id="Table1" style="width: 100%;" cellspacing="0" cellpadding="0" border="0">
            <input type="hidden" id="txtComp" name="txtComp" value="35" runat="server" />
            <tr valign="baseline">
                <td align="right">
                    <img style="vertical-align: bottom" alt="" src="../frames/images/toolbar/User.png"
                        border="0" /></td>
                <td class="bodytxt" style="color: White; font-size: 12px; text-align: left">
                    &nbsp;User Name:
                    <%=sEmpName%>
                </td>
                <td align="right">
                    <img style="vertical-align: bottom" alt="" src="../frames/images/toolbar/User Login.png"
                        border="0" /></td>
                <td class="bodytxt" style="color: White; font-size: 12px; text-align: left">
                    &nbsp;Login ID:
                    <%=sUserName%>
                </td>
                <td align="right">
                    <img style="vertical-align: bottom" alt="" src="../frames/images/toolbar/UserRights.png"
                        border="0" /></td>
                <td class="bodytxt" style="color: White; font-size: 12px; text-align: left">
                    &nbsp;User Rights:
                    <%=sgroupname%>
                </td>
                <td align="right">
                    <img style="vertical-align: bottom" alt="" src="../frames/images/toolbar/Company.png"
                        border="0" /></td>
                <td class="bodytxt" style="color: White; font-size: 12px; text-align: left">
                    &nbsp;Company Name:
                    <asp:LinkButton Font-Size="12px" ForeColor="White" runat="server" ID="id1" OnClientClick="javascript:compclick();"><%=companyname%></asp:LinkButton></td>
                <%if (Session["ANBPRODUCT"] != null)
                  {%>
                <%if (Session["ANBPRODUCT"].ToString() == "SME")
                  {%>
                <td style="width: 25%; text-align: right">
                    <img style="vertical-align: bottom" alt="" src="../frames/images/toolbar/User.png"
                        border="0" /><asp:LinkButton Font-Size="12px" ForeColor="White" runat="server" ID="LinkButton1"
                            OnClientClick="javascript:homeclick();">Home</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;
                    <img style="vertical-align: bottom" alt="" src="../frames/images/toolbar/Signout.png"
                        border="0" /></td>
                <td align="left" valign="bottom">
                    &nbsp;<a style="color: White; font-size: 12px" href="../Login.aspx" target="_parent">Logout
                    </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <%}%>
                <%if ((Session["ANBPRODUCT"].ToString() == "WMS") ||  (Session["ANBPRODUCT"].ToString() == "WMSI"))
                  {%>
                <td style="width: 25%; text-align: right">
                    <img style="vertical-align: bottom" alt="" src="../frames/images/toolbar/User.png"
                        border="0" /><asp:LinkButton Font-Size="12px" ForeColor="White" runat="server" ID="LinkButton2"
                            OnClientClick="javascript:homeclick();">Home</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;
                    <img style="vertical-align: bottom" alt="" src="../frames/images/toolbar/Signout.png"
                        border="0" /></td>
                <td align="left" valign="bottom">
                    &nbsp;<a style="color: White; font-size: 12px" href="../LoginWMS.aspx" target="_parent">Logout
                    </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <%}%>
                <%}%>
            </tr>
        </table>
    </form>
</body>
</html>
