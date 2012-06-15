<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Banks.aspx.cs" Inherits="SMEPayroll.Management.Banks" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
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
    <script language="javascript" type="text/javascript">

    function ValidateForm()
    {
        var sMSG = "";
        var txthid=document.getElementById('txtRadId').value + "_";

		if(document.getElementById(txthid + 'txtbankname').value.length<=0)
		sMSG += "Please Enter Bank Name \n";

		if (isProper(document.getElementById(txthid + 'txtbankname').value) == false)
	    {
			sMSG += "Please enter valid Bank Name \n";	
	    }
	    
	   if (sMSG == "")
			return true;
		else
		{
		    alert(sMSG); 
			return false;
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>List of Banks</b></font>
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
        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

            <script type="text/javascript">
                    function RowDblClick(sender, eventArgs)
                    {
                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                    }
            </script>

        </radG:RadCodeBlock>
        <div>
            <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                    <td>
                        <radG:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowPaging="true"
                            PageSize="20" GridLines="None" Skin="Outlook" Width="93%" OnInsertCommand="RadGrid1_InsertCommand"
                            OnUpdateCommand="RadGrid1_UpdateCommand" OnNeedDataSource="RadGrid1_NeedDataSource" AllowSorting="true"   >
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" CommandItemDisplay="Bottom"
                                CommandItemSettings-AddNewRecordText="Add New Bank">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                <Columns>
                                    <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" ImageUrl="../frames/images/ADMIN/Grid-settings.png" runat="Server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10px" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridBoundColumn ReadOnly="True" Visible="False" DataField="ID" DataType="System.Int32"
                                        UniqueName="ID" SortExpression="ID" HeaderText="ID">
                                        <ItemStyle Width="100px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="bank_code" UniqueName="bank_code" CurrentFilterFunction="Contains"
                                        AutoPostBackOnFilter="True" SortExpression="bank_code" HeaderText="BankCode" >
                                        <ItemStyle Width="100px" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="desc" UniqueName="BankName" CurrentFilterFunction="Contains"
                                        AutoPostBackOnFilter="True" SortExpression="BankName" HeaderText="BankName">
                                    </radG:GridBoundColumn>
                                    <radG:GridEditCommandColumn ButtonType="ImageButton">
                                        <ItemStyle Width="30px" />
                                    </radG:GridEditCommandColumn>
                                </Columns>
                                <ExpandCollapseColumn Visible="False">
                                    <HeaderStyle Width="19px" />
                                </ExpandCollapseColumn>
                                <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <EditFormSettings UserControlName="Bankedit.ascx" EditFormType="WebUserControl">
                                    <EditColumn UniqueName="EditCommandColumn">
                                    </EditColumn>
                                </EditFormSettings>
                            </MasterTableView>
                            <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                            </ClientSettings>
                        </radG:RadGrid></td>
                </tr>
            </table>
            <input type="hidden" runat="server" id="txtRadId" />
        </div>
    </form>
</body>
</html>
