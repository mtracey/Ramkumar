<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ItemsManagement.aspx.cs"
    Inherits="SMEPayroll.Management.ItemsManagement" %>
    <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Import Namespace="SMEPayroll" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        
        <table cellpadding="0"  cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Items Management</b></font>
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
        <div>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Item Category"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/ITEM/B-ItemCategory.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/ManageItemCategory.aspx" class="nav"><b>Manage Item Category</b></a><br />
                            <tt class="bodytxt">Manage your Item Category information.</tt><br />
                        </td>
                        <%}%>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Item Sub Category"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/ITEM/B-Itemsubcategory.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/ManageItemSubCategory.aspx" class="nav"><b>Manage Item Sub Category</b></a><br />
                            <tt class="bodytxt">Manage your Item Sub Category information.</tt><br />
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%} %>
                    </tr>
                </table>
            </center>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "UOM"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/ITEM/B-ItemUnitofMeasure.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/ManageUOM.aspx" class="nav"><b>Manage UOM</b></a><br />
                            <tt class="bodytxt">Manage your UOM information.</tt><br />
                        </td>
                        <%}
                        if (Utility.AllowedAction1(Session["Username"].ToString(), "Item Parameter"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/ITEM/B-ItemParameter.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/ManageParameter.aspx" class="nav"><b>Manage Parameter</b></a><br />
                            <tt class="bodytxt">Manage your Parameter information.</tt><br />
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%} %>
                    </tr>
                </table>
            </center>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Store"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/ITEM/B-ItemStore.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/ManageStore.aspx" class="nav"><b>Manage Store</b></a><br />
                            <tt class="bodytxt">Manage your Store information.</tt><br />
                        </td>
                        <%}%>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Supplier"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/ITEM/B-Supplier.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/ManageSupplier.aspx" class="nav"><b>Manage Supplier</b></a><br />
                            <tt class="bodytxt">Manage your Supplier information.</tt><br />
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%} %>
                    </tr>
                </table>
            </center>
            <br />
            <center>
                <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse"
                    width="90%">
                    <tr>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Item"))
                          {%>
                        <td align="left" style="width: 9%">
                            <img alt="" src="../frames/images/ITEM/B-Item.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Management/ManageItem.aspx" class="nav"><b>Manage Item</b></a><br />
                            <tt class="bodytxt">Manage your Item information.</tt><br />
                        </td>
                        <%}%>
                        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "Supplierasdasd"))
                          {%>
                        <td width="9%" align="left">
                            <img alt="" src="../frames/images/ITEM/B-manageuserrights.png" /></td>
                        <td style="width: 41%; text-align: left">
                            <a href="../Company/ShowCompanies.aspx" class="nav"><b>Manage Item</b></a><br />
                            <tt class="bodytxt">Manage your Item information.</tt><br />
                        </td>
                        <%}
                          else
                          {%>
                        <td colspan="2">
                        </td>
                        <%} %>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>
