<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="SMEPayroll.Frames.Help" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>HELP</title>
    <link href="../help/style_blue.css" type="text/css" rel="stylesheet"/>
    <link href="../help/pagestyles.css" type="text/css" rel="stylesheet"/>
    <link href="../help/AppStyles.css" type="text/css" rel="stylesheet"/>
    <link href="../help/TableLayoutCss.css" type="text/css" rel="stylesheet"/>

</head>
<body >
    <form id="form1" runat="server">
    <div id="divContent" runat="server" style="font-family:Tahoma;font-size:small" >       
    </div>
    <div style="font-family:Tahoma;font-size:small">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </div> 
    <div  id="divhelp" runat="server"   visible="false" >
        <table style="width: 600px; height: 219px;">
         <tbody>
                    <tr>
                        <td><img alt="" src="Images/EMPLOYEE/employee.png" />&nbsp;</td>
                        <td>
                        <table>
                            <tbody>
                                <tr>
                                    <td><strong>Compnent&nbsp;Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
                                    <td style="width: 182px"><strong>Version&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
                                    <td style="width: 250px"><strong>Release Date</strong></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;SmePayroll&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td style="width: 182px">
                                        <asp:Label ID="lblVersionSme" runat="server"></asp:Label>
                                    </td>
                                    <td style="width: 250px">
                                        <asp:Label ID="lblSMEreleasedate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;IRAS&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td style="width: 182px">
                                        <asp:Label ID="lblVersionIras" runat="server"></asp:Label>
                                    </td>
                                    <td style="width: 250px">
                                        <asp:Label ID="lblIrasreleasedate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;Internet Explorer</td>
                                    <td style="width: 182px">
                                        <asp:Label ID="lblIE" runat="server"></asp:Label>
                                    </td>
                                    <td style="width: 98px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;.Net Framework</td>
                                    <td style="width: 182px">
                                        <asp:Label ID="lblFW" runat="server"></asp:Label>
                                    </td>
                                    <td style="width: 250px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;Operating System</td>
                                    <td style="width: 182px">
                                        <asp:Label ID="lblOs" runat="server"></asp:Label>
                                    </td>
                                    <td style="width: 250px">&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                        &nbsp; <span style="font-family: tahoma;">
                        <div class="pagelist"><hr />
                        </div>
                        <div style="text-align: justify;" class="pagelist"><span style="color: #a5a5a5;">Warning: This program is protected by copyright law.Unauthorized reproduction or distribution of this program, or any portion of it, may result in severe civil and criminal penalties, and will be prosecuted to the maximum extend possible under the law.</span></div>
                        </span>
                        <div style="text-align: justify;" class="pagelist"></div>
                        </td>
                    </tr>
                </tbody>
        </table>
    </div>

    </form>
</body>
</html>
