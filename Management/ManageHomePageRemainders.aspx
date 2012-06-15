<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageHomePageRemainders.aspx.cs" Inherits="SMEPayroll.Management.ManageHomePageRemainders" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Import Namespace="SMEPayroll" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

    <script language="JavaScript1.2" type="text/javascript"> 





   function isNumericKeyStroke(evt) {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
    }
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
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Home Page Remainders</b></font>
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
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td style="height:10px"></td>
                </tr>
                <tr>
                    <td  align="center">
                        <radG:RadGrid ID="RadGrid1" AllowMultiRowEdit="True" AllowFilteringByColumn="false"
                            Skin="Outlook" Width="40%" runat="server" GridLines="None" AllowPaging="true"
                            AllowMultiRowSelection="true" PageSize="50"  >
                            <MasterTableView CommandItemDisplay="bottom" EditMode="InPlace" AutoGenerateColumns="False"
                                AllowAutomaticUpdates="true" AllowAutomaticInserts="true" AllowAutomaticDeletes="true"
                                TableLayout="Auto" DataKeyNames="ID">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                <CommandItemTemplate>
                                    <div class="textfields" style="text-align: center">
                                        <asp:Button ID="btnUpdate" runat="server" class="textfields" Style="width: 80px;
                                            height: 22px" Text="Update" CommandName="UpdateAll" />
                                    </div>
                                </CommandItemTemplate>
                                <Columns>
                                    <radG:GridClientSelectColumn UniqueName="GridClientSelectColumn">
                                    </radG:GridClientSelectColumn>
                                     <radG:GridBoundColumn DataField="ColID" Display="false" DataType="System.Int32"
                                        HeaderText="Gid" SortExpression="ColID" UniqueName="ColID" >
                                    </radG:GridBoundColumn>
                                     <radG:GridBoundColumn DataField="Category_Name" HeaderText="Category Name" SortExpression="Category_Name"
                                        UniqueName="Category_Name" AutoPostBackOnFilter="false" CurrentFilterFunction="contains">
                                        <ItemStyle Width="80%" HorizontalAlign="Left" />
                                    </radG:GridBoundColumn>
                                    
                                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="Category_Name"
                                        UniqueName="Category_Name" HeaderText="Remainder Days" AllowFiltering="false">
                                        <ItemStyle HorizontalAlign="center" />
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtReminDays"  Style="text-align: left" Width="95%"
                                                runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Days")%>' MaxLength="3" onkeypress="return isNumericKeyStroke(event)" ></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle Width="45%" />
                                    </radG:GridTemplateColumn>
                                    
                                </Columns>
                            </MasterTableView>
                            <ClientSettings Selecting-AllowRowSelect="true" EnableRowHoverStyle="true" AllowColumnsReorder="true"
                                ReorderColumnsOnClient="true">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                            </ClientSettings>
                        </radG:RadGrid>
                    </td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
