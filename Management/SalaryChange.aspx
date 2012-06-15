<%@ Page Language="C#" AutoEventWireup="true" Codebehind="SalaryChange.aspx.cs" Inherits="SMEPayroll.Management.SalaryChange" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

    <script language="JavaScript1.2"> 
        <!-- 

        if (document.all)
        window.parent.defaultconf=window.parent.document.body.cols
        function expando()
        {
        window.parent.expandf()

        }
        document.ondblclick=expando 

        -->

    </script>
  
</head>
<body style="margin-left: auto">
    <form id="form1" runat="server">
       <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
           <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">
             <script language="javascript" type="text/javascript">
                function Validation()
                {
                    if(document.getElementById('<%=rdFrom.ClientID %>').value=="")
                    {
                      alert("Please Enter Effective Date");
                      return false;
                    }
                    else if(document.getElementById('<%=drpList.ClientID %>').value=="-1")
                    {
                      alert("Please Select Formula");
                      return false;
                    }
                    else if(document.getElementById('<%=drpList.ClientID %>').value=="Percentage" && document.getElementById('<%=txtAmount.ClientID %>').value=="")
                    {
                      alert("Please Enter the  Percentage");
                      return false;
                    }
                     else if(document.getElementById('<%=drpList.ClientID %>').value=="Fixed" && document.getElementById('<%=txtAmount.ClientID %>').value=="")
                    {
                      alert("Please Enter the  Fixed Amount");
                      return false;
                    }
                    return true;
                }
            </script>
        </radG:RadCodeBlock>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" bgcolor="ffffff" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" width="100%" bgcolor="4D5459" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4" style="height: 23px">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Salary Update</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="E5E5E5">
                            <td align="right" style="height: 35px">
                                  <tt class="bodytxt">Effective Date:</tt> <telerik:RadDatePicker ID="rdFrom" runat="server">
                                    </telerik:RadDatePicker>
                                 <tt class="bodytxt">Formula:</tt> 
                                   <asp:DropDownList ID="drpList" runat="server" CssClass="textfields" AutoPostBack="true" OnSelectedIndexChanged="drpList_SelectedIndexChanged">
                                        <asp:ListItem Text="--Select--" Value="-1"> </asp:ListItem>
                                        <asp:ListItem Text="% of Basic Salary" Value="Percentage"> </asp:ListItem>
                                        <asp:ListItem Text="Fixed Amount" Value="Fixed"> </asp:ListItem>
                                        <asp:ListItem Text="Manual" Value="Manual"> </asp:ListItem>
                                    </asp:DropDownList>
                                 
                                     <asp:TextBox ID="txtAmount" runat="server"  Visible="false"  Width="50px"></asp:TextBox>
                                     
                                 <asp:ImageButton ID="imgbtnView" OnClick="imgbtnView_Click" OnClientClick="return Validation();" runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                                
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
                    <td>
                        <radG:RadGrid ID="RadGrid1" AllowMultiRowEdit="True" AllowFilteringByColumn="true"
                            Skin="Outlook" Width="99%" runat="server" GridLines="None" AllowPaging="true"
                            AllowMultiRowSelection="true" PageSize="50" OnItemDataBound="RadGrid1_ItemDataBound"
                              OnItemCommand="RadGrid1_ItemCommand" >
                            <MasterTableView CommandItemDisplay="bottom" EditMode="InPlace" AutoGenerateColumns="False"
                                AllowAutomaticUpdates="true" AllowAutomaticInserts="true" AllowAutomaticDeletes="true"
                                TableLayout="Auto" DataKeyNames="emp_code">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                <CommandItemTemplate>
                                    <%--to get the button in the grid header--%>
                                    <div class="textfields" style="text-align: center">
                                        <asp:Button ID="btnUpdate" runat="server" class="textfields" Style="width: 80px;
                                            height: 22px" Text="Update" CommandName="UpdateAll" />
                                    </div>
                                </CommandItemTemplate>
                                <Columns>
                                    <radG:GridClientSelectColumn UniqueName="GridClientSelectColumn"  HeaderStyle-Width="10%">
                                    </radG:GridClientSelectColumn>
                                    <radG:GridBoundColumn DataField="emp_code" Display="false" DataType="System.Int32"
                                        HeaderText="emp_code" SortExpression="emp_code" UniqueName="emp_code">
                                    </radG:GridBoundColumn>
                                     <radG:GridBoundColumn ReadOnly="True" DataField="TimeCardId" DataType="System.String"
                                            UniqueName="Time_Card_NO" Visible="true" SortExpression="Time_Card_NO" HeaderText="Time Card NO">
                                        </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="emp_name" HeaderText="Employee Name" SortExpression="emp_name"
                                        UniqueName="emp_name" AutoPostBackOnFilter="true" CurrentFilterFunction="contains">
                                        <ItemStyle Width="50%" />
                                    </radG:GridBoundColumn>
                                     <radG:GridBoundColumn DataField="Dept" HeaderText="Department" SortExpression="Dept"
                                        UniqueName="Dept" AutoPostBackOnFilter="true" CurrentFilterFunction="contains">
                                        <ItemStyle Width="20%" />
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn ReadOnly="True" DataField="Trade"
                                            UniqueName="Trade" Visible="true" SortExpression="Trade" HeaderText="Trade">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="basicPay" HeaderText="basic Pay" SortExpression="basicPay"
                                        UniqueName="basicPay">
                                        <ItemStyle Width="10%" HorizontalAlign="Right" />
                                    </radG:GridBoundColumn>
                                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="NewbasicPay"
                                        UniqueName="NewbasicPay" HeaderText="New Basic pay" AllowFiltering="false">
                                        <ItemStyle HorizontalAlign="center" />
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtNewBasicpay" onkeyup="javascript:return validatenumbers(this);"
                                                onkeydown="javascript:storeoldval(this.value);" Style="text-align: right" Width="50px"
                                                runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.NewBasicpay")%>'></asp:TextBox>
                                         <%--     <asp:RegularExpressionValidator ID="vldNH" ControlToValidate="txtNewBasicpay" Display="Dynamic"
                                ErrorMessage="*"   ValidationExpression="^\d{0,6}(\.\d{1,2})?$" runat="server"> 
                            </asp:RegularExpressionValidator>--%>
                            
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </radG:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                            <ClientSettings Selecting-AllowRowSelect="true" EnableRowHoverStyle="true" AllowColumnsReorder="true"
                                ReorderColumnsOnClient="true">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                            </ClientSettings>
                        </radG:RadGrid><%--ValidationExpression="^[-+]?(?!^0*\.0*$)^\d{1,3}(\.\d{1,3})?$"--%>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
