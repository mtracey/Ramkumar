<%@ Page Language="C#" AutoEventWireup="true" Codebehind="GenerateAMCScheme.aspx.cs"
    Inherits="SMEPayroll.Management.GenerateAMCScheme" %>

<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="RadInput.Net2" Namespace="Telerik.WebControls" TagPrefix="radI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />

    <script language="javascript" type="text/javascript">
        function ShowMsg()
        {
           var control = document.getElementById('msg');
            var sMsg = control.value;
            if (sMsg != '')
            {
                alert(sMsg);
                control.value="";
            }
        }
        
        function validateMe()
        {
             var ctrl= document.getElementById('dlCSN');
             var sMSG = "";
             if(ctrl.value=='0')
             {
               sMSG += "Please Select CSN \n \n";
             }
             if (sMSG == "")
             {  
              return true;
             }
             else
             {
               sMSG = "Following fields are missing.\n\n" + sMSG; 
               alert(sMSG); 
               return false;
             }
         
        }
        function disableMe()
        {  
        var Ctrl
//       Ctrl = document.getElementById('dlCSN');
//         Ctrl.disabled=true;
         Ctrl= document.getElementById('cmbYear');
         Ctrl.disabled=true;
          Ctrl= document.getElementById('cmbMonth');
         Ctrl.disabled=true;
//         Ctrl= document.getElementById('imgbtnfetch');
//         Ctrl.disabled=true;
         return true;
        }
    </script>

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
<body onload="ShowMsg();" style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4" style="height: 28px">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Create AMCS File</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right" style="width: 30%">
                                <tt class="bodytxt">Year :</tt>
                     <%--           <asp:DropDownList ID="cmbYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbYear_selectedIndexChanged"
                                    Style="width: 65px" CssClass="textfields"  >
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
                                       runat="server"  AutoPostBack="true" OnSelectedIndexChanged="cmbYear_selectedIndexChanged" >
                                      
                               </asp:DropDownList>
                               <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                
                           
                            </td>
                            <td style="width: 60%" valign="middle">
                                &nbsp;&nbsp; <tt class="bodytxt">Month :</tt>
                                <asp:DropDownList ID="cmbMonth" runat="server" Style="width: 165px" CssClass="textfields">
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
                                <tt class="bodytxt">CSN :</tt>
                                <asp:DropDownList ID="dlCSN" runat="server" Style="width: 165px" DataSourceID="SqlDataSource1"
                                    DataTextField="CSN" DataValueField="Id" CssClass="textfields">
                                </asp:DropDownList>
                                <tt>
                                    <asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid" OnClientClick="return validateMe();"
                                        runat="server" ImageUrl="~/frames/images/toolbar/go.ico" />
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
        <input type="hidden" id="msg" runat="server" />
        <center>
            <asp:Label ID="lblerror" ForeColor="red" class="bodytxt" runat="server"></asp:Label></center>
        <center>
            <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                    <td align="left">
                        <radG:RadGrid ID="RadGrid1" OnPreRender="RadGrid1_PreRender" AllowMultiRowEdit="True"
                            AllowFilteringByColumn="true" OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="Radgrid1_databound"
                            Skin="Outlook" Width="99%" runat="server" GridLines="None" AllowPaging="true"
                            AllowMultiRowSelection="true" PageSize="50">
                            <mastertableview commanditemdisplay="bottom" datakeynames="EmpId,EMpName,NRIC,OptionSelected,Formula,basicPay,netpay,Total_gross,start_period,end_period,AMCS_AMOUNT,Total_AMCS_AMOUNT"
                                editmode="InPlace" autogeneratecolumns="False">
                                <FilterItemStyle HorizontalAlign="left" />
                                <HeaderStyle ForeColor="Navy" />
                                <ItemStyle BackColor="White" Height="20px" />
                                <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                <CommandItemTemplate>
                                    <div style="text-align: center">
                                        <asp:Button ID="btnsubmit" runat="server" class="textfields" Style="width: 80px;
                                            height: 22px" Text="Compute" CommandName="Compute" />
                                        <asp:Button ID="btnCalcOverVar" runat="server" class="textfields" Style="width: 80px;
                                            height: 22px" Text="Submit" CommandName="Submit" />
                                    </div>
                                </CommandItemTemplate>
                                <Columns>
                                    <radG:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateColumn">
                                        <ItemTemplate>
                                            <asp:Image ID="Image2" ImageUrl="../frames/images/EMPLOYEE/Grid- employee.png" runat="Server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="2px" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridBoundColumn DataField="EMPID" Display="true" HeaderText="Employee Code"
                                        SortExpression="EMPID" ReadOnly="True" UniqueName="EmpId">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="EMPNAME" HeaderText="Employee Name" SortExpression="EMPNAME"
                                        UniqueName="EMPNAME">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="NRIC" Display="false" HeaderText="NRIC" SortExpression="NRIC"
                                        ReadOnly="false" UniqueName="NRIC">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="OptionSelected" HeaderText="Option Selected" SortExpression="OptionSelected"
                                        UniqueName="OptionSelected">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="BasicPay" Display="false" HeaderText="BasicPay"
                                        SortExpression="BasicPay" ReadOnly="false" UniqueName="basicPay">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="NetPay" Display="false" HeaderText="NetPay" SortExpression="NetPay"
                                        ReadOnly="false" UniqueName="netpay">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="Total_gross" Display="false" HeaderText="Total_gross"
                                        SortExpression="Total_gross" ReadOnly="false" UniqueName="Total_gross">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="Start_Period" Display="false" HeaderText="Start Period"
                                        SortExpression="Start_Period" ReadOnly="false" UniqueName="start_period">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="ENd_Period" Display="false" HeaderText="ENd Period"
                                        SortExpression="ENd_Period" ReadOnly="false" UniqueName="end_period">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="Formula" HeaderText="Formula" SortExpression="Formula"
                                        UniqueName="Formula">
                                    </radG:GridBoundColumn>
                                    <radG:GridTemplateColumn HeaderStyle-HorizontalAlign="center" DataField="AMCS_AMOUNT"
                                        UniqueName="AMCS_AMOUNT" HeaderText="AMCS_AMOUNT" AllowFiltering="false">
                                        <ItemStyle HorizontalAlign="center" />
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtovertime2" Width="80px" Style="text-align: right" runat="server"
                                                Text='<%# DataBinder.Eval(Container,"DataItem.AMCS_AMOUNT")%>'></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="vldAMT" ControlToValidate="txtovertime2" Display="Dynamic"
                                                ErrorMessage="*" ValidationExpression="^([0-9]*|\d*\.\d{1}?\d*)$" runat="server"> 
                                            </asp:RegularExpressionValidator>
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridBoundColumn DataField="Total_AMCS_AMOUNT" HeaderText="AMCS Paid Till Date" SortExpression="Total_AMCS_AMOUNT"
                                        UniqueName="Total_AMCS_AMOUNT">
                                    </radG:GridBoundColumn>
                                </Columns>
                            </mastertableview>
                            <clientsettings selecting-allowrowselect="false" enablerowhoverstyle="false" allowcolumnsreorder="false"
                                reordercolumnsonclient="true">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="false" ResizeGridOnColumnResize="false"
                                    AllowColumnResize="false"></Resizing>
                            </clientsettings>
                        </radG:RadGrid>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnGenerate" Visible="false" runat="server" class="textfields" Style="width: 80px;
                            height: 22px" Text="Generate" CommandName="Generate" OnClick="btnGenerate_Click" />&nbsp;&nbsp;&nbsp;
                        <asp:Label class="bodytxt" Visible="false" ID="lblCPFText" runat="server" Text="Total CPF Contribution:"></asp:Label>
                        <asp:Label class="bodytxt" Visible="false" ID="lblCPF" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="bodytxt">
                        <font color="#ff0000"><b>*If File is not Genereated After Submitting. In that case
                            Press and hold down the CTRL key while you Click on "Generate" Button.</b></font>
                    </td>
                </tr>
            </table>
        </center>
        <br />
        <table width="100%">
            <tr>
                <td>
                    <font class="bodytxt" color="red">&nbsp;&nbsp;&nbsp;&nbsp;</font>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="dataexportmessage" runat="server" Visible="false" ForeColor="red"
                        CssClass="bodytxt">&nbsp;&nbsp;&nbsp;&nbsp;Payroll Is Not Generated!</asp:Label></td>
            </tr>
        </table>
        <!-- IF GENERAL SOLUTION :- USE sp_emp_overtime -->
        <!-- IF BIOMETREICS :- USE sp_emp_overtime1 -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="Select 0 as ID ,'-Select-' As CSN Union  Select ID,CSN From MedicalCSN Where Comp_id=@compId">
            <SelectParameters>
                <asp:SessionParameter Name="Compid" SessionField="Compid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
