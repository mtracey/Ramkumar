<%@ Page Language="C#" AutoEventWireup="true" Codebehind="EmployeYearEarn.aspx.cs" Inherits="SMEPayroll.employee.EmployeYearEarn" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="RadInput.Net2" Namespace="Telerik.WebControls" TagPrefix="radI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

    <script type="text/javascript" language="javascript">
	    function validateform()
	    {
            var sMSG = "";
            if ( !document.form1.rdFrom.value)
            {
                sMSG = sMSG + "Please Enter Start Date\n";	
            }

            if ( !document.form1.rdEnd.value)
            {
                sMSG = sMSG + "Please Enter End Date\n";	
            }


		    if (sMSG == "")
			    return true;
		    else
		    {
			    alert(sMSG); 
			    return false;
	        }

		}
        
        function storeoldval(val)
        {
            document.getElementById('txthid').value = val;
        }
		
		function validatenumbers(ths)
		{
		    var val = ths.value;
		    var str;
		       
		    if (val <= 999999 || val == '-')
		    {
		        if (val.indexOf(".") != -1 ) 
		        {
		            str= val.substring(val.indexOf(".")+1);		           
		            if (str.length > 2)
		            {
		                ths.value = document.getElementById('txthid').value;
                        alert("Should be in Format. Maximum 2 digits Allowed");                        
		            }
		            else
		            {
		                if (str.length == 2)
		                {
		                    if (str > 99)
		                    {
		                        ths.value = document.getElementById('txthid').value;
		                        alert("Should be in Format. Maximum 99 cents Allowed");
		                    }
		                }
		                else
		                {
		                    if (str > 9)
		                    {
		                        ths.value = document.getElementById('txthid').value;
		                         alert("Should be in Format. Maximum 99 cents Allowed");	                        
		                    }
		                }
		            }
		        }
		     }
		     else
		     {
                ths.value = document.getElementById('txthid').value;
                alert("Numeric Value cannot be more than 999999");
                
		     }
		}
    </script>

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
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
        <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">

            <script type="text/javascript">
            <!--
              function ChangeMonth(varmonth)
              {

              }
            -->
            </script>

        </telerik:RadCodeBlock>
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <input type="hidden" id="txthid" runat="server" value="0" />
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="6">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Year of Assessment</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right">
                                <tt class="bodytxt">Year of Assesment :</tt>
                                <asp:DropDownList ID="cmbYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbYear_selectedIndexChanged"
                                    Style="width: 65px" CssClass="textfields">
                                    <asp:ListItem Value="2007">2007</asp:ListItem>
                                    <asp:ListItem Value="2008">2008</asp:ListItem>
                                    <asp:ListItem Value="2009">2009</asp:ListItem>
                                    <asp:ListItem Value="2010">2010</asp:ListItem>
                                    <asp:ListItem Value="2011">2011</asp:ListItem>
                                    <asp:ListItem Value="2012">2012</asp:ListItem>
                                    <asp:ListItem Value="2013">2013</asp:ListItem>
                                    <asp:ListItem Value="2014">2014</asp:ListItem>
                                    <asp:ListItem Value="2015">2015</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 15%">
                                <tt>
                                    <asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid" runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
                                </tt>
                            </td>
                            <td align="right">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px;" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6"  class="bodytxt" style="color:Red"> Process Atlest One Month Payroll </td>
                        </tr>
                    </table>
                </td>
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
        <center>
            <asp:Label ID="lblerror" ForeColor="red" class="bodytxt" runat="server"></asp:Label></center>
        <br />
        <radG:RadGrid ID="RadGrid1" AllowMultiRowEdit="True" AllowFilteringByColumn="true"
            OnItemCreated="RadGrid1_ItemCreated" OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="Radgrid1_databound"
            Skin="Outlook" Width="99%" runat="server" GridLines="None"
            AllowPaging="true" AllowMultiRowSelection="true" PageSize="50">
            <MasterTableView CommandItemDisplay="bottom" DataKeyNames="ID,Emp_ID"
                EditMode="InPlace" AutoGenerateColumns="False" AllowAutomaticUpdates="true" AllowAutomaticInserts="true"
                AllowAutomaticDeletes="true" DataSourceID="SqlDataSource1" TableLayout="Auto" >
                <FilterItemStyle HorizontalAlign="left" />
                <HeaderStyle ForeColor="Navy" />
                <ItemStyle BackColor="White" Height="20px" />
                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                <CommandItemTemplate>
                    <%--to get the button in the grid header--%>
                    <div class="textfields" style="text-align: center">
                        <asp:Button ID="btnsubmit" runat="server" class="textfields" Style="width: 80px;
                            height: 22px" Text="Submit" CommandName="UpdateAll" />
                    </div>
                </CommandItemTemplate>
                <Columns>
                    <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                        <ItemTemplate>
                            <asp:Image ID="Image2" ImageUrl="../frames/images/EMPLOYEE/Grid- employee.png" runat="Server" />
                        </ItemTemplate>
                        <ItemStyle Width="2px" />
                    </radG:GridTemplateColumn>
                    <radG:GridBoundColumn DataField="ID" Display="false" DataType="System.Int32" HeaderText="ID"
                        SortExpression="ID" UniqueName="ID">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="Emp_ID" Display="false" DataType="System.Int32" HeaderText="Emp_ID"
                        SortExpression="Emp_ID" UniqueName="Emp_ID">
                    </radG:GridBoundColumn>
                    <radG:GridBoundColumn DataField="emp_name" HeaderText="Employee Name" SortExpression="emp_name"
                        UniqueName="emp_name" AutoPostBackOnFilter="true" CurrentFilterFunction="contains">
                        <ItemStyle Width="20%" />
                    </radG:GridBoundColumn>
                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="GrossPay"
                        UniqueName="GrossPay" HeaderText="GrossPay" AllowFiltering="false">
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <asp:TextBox ID="txtGrossPay" onkeyup="javascript:return validatenumbers(this);" onkeydown="javascript:storeoldval(this.value);"
                                Style="text-align: right" Width="40px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.GrossPay")%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="vld1" ControlToValidate="txtGrossPay" Display="Dynamic"
                                ErrorMessage="*" ValidationExpression="^[-+]?(?!^0*\.0*$)^\d{1,6}(\.\d{1,6})?$" runat="server"> 
                            </asp:RegularExpressionValidator>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </radG:GridTemplateColumn>
                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="Bonus"
                        UniqueName="Bonus" HeaderText="Bonus" AllowFiltering="false">
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <asp:TextBox ID="txtBonus" onkeyup="javascript:return validatenumbers(this);" onkeydown="javascript:storeoldval(this.value);"
                                Style="text-align: right" Width="40px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Bonus")%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="vld2" ControlToValidate="txtBonus" Display="Dynamic"
                                ErrorMessage="*" ValidationExpression="^[-+]?(?!^0*\.0*$)^\d{1,6}(\.\d{1,6})?$" runat="server"> 
                            </asp:RegularExpressionValidator>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </radG:GridTemplateColumn>
                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="DirectorFee"
                        UniqueName="DirectorFee" HeaderText="DirectorFee" AllowFiltering="false">
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <asp:TextBox ID="txtDirectorFee" onkeyup="javascript:return validatenumbers(this);" onkeydown="javascript:storeoldval(this.value);"
                                Style="text-align: right" Width="40px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.DirectorFee")%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="vld3" ControlToValidate="txtDirectorFee" Display="Dynamic"
                                ErrorMessage="*" ValidationExpression="^[-+]?(?!^0*\.0*$)^\d{1,6}(\.\d{1,6})?$" runat="server"> 
                            </asp:RegularExpressionValidator>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </radG:GridTemplateColumn>
                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="Commission"
                        UniqueName="Commission" HeaderText="Commission" AllowFiltering="false">
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <asp:TextBox ID="txtCommission" onkeyup="javascript:return validatenumbers(this);" onkeydown="javascript:storeoldval(this.value);"
                                Style="text-align: right" Width="40px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Commission")%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="vld4" ControlToValidate="txtCommission" Display="Dynamic"
                                ErrorMessage="*" ValidationExpression="^[-+]?(?!^0*\.0*$)^\d{1,6}(\.\d{1,6})?$" runat="server"> 
                            </asp:RegularExpressionValidator>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </radG:GridTemplateColumn>
                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="Pension"
                        UniqueName="Pension" HeaderText="Pension" AllowFiltering="false">
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <asp:TextBox ID="txtPension" onkeyup="javascript:return validatenumbers(this);" onkeydown="javascript:storeoldval(this.value);"
                                Style="text-align: right" Width="40px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Pension")%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="vld5" ControlToValidate="txtPension" Display="Dynamic"
                                ErrorMessage="*" ValidationExpression="^[-+]?(?!^0*\.0*$)^\d{1,6}(\.\d{1,6})?$" runat="server"> 
                            </asp:RegularExpressionValidator>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </radG:GridTemplateColumn>
                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="TransAllow"
                        UniqueName="TransAllow" HeaderText="TransAllow" AllowFiltering="false">
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <asp:TextBox ID="txtTransAllow" onkeyup="javascript:return validatenumbers(this);" onkeydown="javascript:storeoldval(this.value);"
                                Style="text-align: right" Width="40px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.TransAllow")%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="vld6" ControlToValidate="txtTransAllow" Display="Dynamic"
                                ErrorMessage="*" ValidationExpression="^[-+]?(?!^0*\.0*$)^\d{1,6}(\.\d{1,6})?$" runat="server"> 
                            </asp:RegularExpressionValidator>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </radG:GridTemplateColumn>
                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="EntAllow"
                        UniqueName="EntAllow" HeaderText="EntAllow" AllowFiltering="false">
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <asp:TextBox ID="txtEntAllow" onkeyup="javascript:return validatenumbers(this);" onkeydown="javascript:storeoldval(this.value);"
                                Style="text-align: right" Width="40px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.EntAllow")%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="vld7" ControlToValidate="txtEntAllow" Display="Dynamic"
                                ErrorMessage="*" ValidationExpression="^[-+]?(?!^0*\.0*$)^\d{1,6}(\.\d{1,6})?$" runat="server"> 
                            </asp:RegularExpressionValidator>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </radG:GridTemplateColumn>
                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="OtherAllow"
                        UniqueName="OtherAllow" HeaderText="OtherAllow" AllowFiltering="false">
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <asp:TextBox ID="txtOtherAllow" onkeyup="javascript:return validatenumbers(this);" onkeydown="javascript:storeoldval(this.value);"
                                Style="text-align: right" Width="40px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.OtherAllow")%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="vld8" ControlToValidate="txtOtherAllow" Display="Dynamic"
                                ErrorMessage="*" ValidationExpression="^[-+]?(?!^0*\.0*$)^\d{1,6}(\.\d{1,6})?$" runat="server"> 
                            </asp:RegularExpressionValidator>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </radG:GridTemplateColumn>
                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="EmployeeCPF"
                        UniqueName="EmployeeCPF" HeaderText="EmployeeCPF" AllowFiltering="false">
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <asp:TextBox ID="txtEmployeeCPF" onkeyup="javascript:return validatenumbers(this);" onkeydown="javascript:storeoldval(this.value);"
                                Style="text-align: right" Width="40px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.EmployeeCPF")%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="vld9" ControlToValidate="txtEmployeeCPF" Display="Dynamic"
                                ErrorMessage="*" ValidationExpression="^[-+]?(?!^0*\.0*$)^\d{1,6}(\.\d{1,6})?$" runat="server"> 
                            </asp:RegularExpressionValidator>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </radG:GridTemplateColumn>
                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="Funds"
                        UniqueName="Funds" HeaderText="Funds" AllowFiltering="false">
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <asp:TextBox ID="txtFunds" onkeyup="javascript:return validatenumbers(this);" onkeydown="javascript:storeoldval(this.value);"
                                Style="text-align: right" Width="40px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Funds")%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="vld10" ControlToValidate="txtFunds" Display="Dynamic"
                                ErrorMessage="*" ValidationExpression="^[-+]?(?!^0*\.0*$)^\d{1,6}(\.\d{1,6})?$" runat="server"> 
                            </asp:RegularExpressionValidator>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </radG:GridTemplateColumn>
                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="MBMF"
                        UniqueName="MBMF" HeaderText="MBMF" AllowFiltering="false">
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <asp:TextBox ID="txtMBMF" onkeyup="javascript:return validatenumbers(this);" onkeydown="javascript:storeoldval(this.value);"
                                Style="text-align: right" Width="40px" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.MBMF")%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="vld11" ControlToValidate="txtMBMF" Display="Dynamic"
                                ErrorMessage="*" ValidationExpression="^[-+]?(?!^0*\.0*$)^\d{1,6}(\.\d{1,6})?$" runat="server"> 
                            </asp:RegularExpressionValidator>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </radG:GridTemplateColumn>
                    <radG:GridClientSelectColumn UniqueName="GridClientSelectColumn">
                    </radG:GridClientSelectColumn>
                </Columns>
            </MasterTableView>
            <ClientSettings Selecting-AllowRowSelect="true" EnableRowHoverStyle="true" AllowColumnsReorder="true"
                ReorderColumnsOnClient="true">
                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
            </ClientSettings>
        </radG:RadGrid>
        <center>
            <asp:Label ID="lblMessage" Visible="false" class="bodytxt" runat="server" Text="Please Click only once to Submit"></asp:Label>        
        </center>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="sp_emp_yearearn"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter Name="year" Type="Int32" ControlID="cmbYear" />
                <asp:SessionParameter Name="company_id" SessionField="compid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <!-- IF GENERAL SOLUTION :- USE sp_emp_overtime -->
        <!-- IF BIOMETREICS :- USE sp_emp_overtime1 -->
    </form>
</body>
</html>
