<%@ Page Language="C#" AutoEventWireup="true" Codebehind="TimeSheetDocument.aspx.cs"
    Inherits="SMEPayroll.TimeSheet.TimeSheetDocument" %>

<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
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
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Timesheet</b></font>
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
        <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

            <script type="text/javascript">
                    function RowDblClick(sender, eventArgs)
                    {
                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                    }
            </script>

        </radG:RadCodeBlock>
        <table border="0" cellpadding="1" cellspacing="0" width="100%">
           
            <tr>
                <td style="width: 982px">
                    <table style="vertical-align: middle; width: 80%;" align="center" cellpadding="1"
                        cellspacing="0" border="0">                        
                        <tr>
                            <td class="bodytxt" colspan="1">
                                Select TimeSheet Type
                            </td>
                            <td style="" class="bodytxt" colspan="1">
                                <asp:RadioButton ID="rdTs" Text="Single Row" Checked="true" runat="server" GroupName="g1" AutoPostBack="false" />
                            </td>
                            <td class="bodytxt" colspan="2" >
                                <asp:RadioButton ID="rdTs1" Text="Multi Row" runat="server" GroupName="g1" AutoPostBack="false" />
                            </td>
                        </tr> 
                        
                       <tr>
                             <td class="bodytxt" colspan="1" >
                                   <label id="lblHlist" runat="server"  title=""  > Download TimeSheet Type</label>
                             </td>   
                             <td class="bodytxt" colspan="1">                               
                                <asp:HyperLink ID="FileDownload" runat="server" Text="Download Single Row TimeSheet"  NavigateUrl="http://www.smepayroll.com/download.htm" Target="_search" >
                                </asp:HyperLink>                             
                             </td>                                               
                             <td class="bodytxt" colspan="2">
                                <asp:HyperLink ID="FileDownload1" runat="server" Text="Download Multi Row TimeSheet"  NavigateUrl="http://www.smepayroll.com/download.htm" Target="_search" >
                                </asp:HyperLink>                             
                             </td>
                        </tr>       
                        
                                               
                        <tr>
                            <td style="text-align: right; width: 20%; height: 24px;">
                                <tt class="bodytxt">Month :</tt>
                            </td>
                            <td style="width: 30%; height: 24px;">
                                <tt class="bodytxt">
                                    <asp:DropDownList AutoPostBack="true" ID="drpMonth" runat="server" CssClass="textfields"
                                        OnSelectedIndexChanged="drpMonth_SelectedIndexChanged">
                                        <asp:ListItem Value="-1">Select</asp:ListItem>
                                        <asp:ListItem Value="01">January</asp:ListItem>
                                        <asp:ListItem Value="02">February</asp:ListItem>
                                        <asp:ListItem Value="03">March</asp:ListItem>
                                        <asp:ListItem Value="04">April</asp:ListItem>
                                        <asp:ListItem Value="05">May</asp:ListItem>
                                        <asp:ListItem Value="06">June</asp:ListItem>
                                        <asp:ListItem Value="07">July</asp:ListItem>
                                        <asp:ListItem Value="08">August</asp:ListItem>
                                        <asp:ListItem Value="09">September</asp:ListItem>
                                        <asp:ListItem Value="10">October</asp:ListItem>
                                        <asp:ListItem Value="11">November</asp:ListItem>
                                        <asp:ListItem Value="12">December</asp:ListItem>
                                    </asp:DropDownList></tt>
                                <asp:RequiredFieldValidator ID="rfvMonth" runat="server" ErrorMessage="Please Select Month"
                                    ControlToValidate="drpMonth" Display="Static" InitialValue="Select">*</asp:RequiredFieldValidator></td>
                            <td style="text-align: right; width: 20%; height: 24px;">
                                <tt class="bodytxt">Year :</tt>
                            </td>
                            <td style="width: 30%; height: 24px;">
                        <%--        <asp:DropDownList AutoPostBack="true" ID="cmbYear" runat="server" Style="width: 65px"
                                    CssClass="textfields" OnSelectedIndexChanged="cmbYear_SelectedIndexChanged">
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
                                       runat="server"  AutoPostBack="true" OnSelectedIndexChanged="cmbYear_SelectedIndexChanged" >
                                      
                               </asp:DropDownList>
                               <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                
                                
                            </td>
                        </tr>

                        <tr>
                            <td style="width: 20%; height: 24px; text-align: right">
                                <tt class="bodytxt">Select File :</tt>
                            </td>
                            <td colspan="3" style="height: 24px">
                                <input id="FileUpload" runat="server" name="FileUpload" style="width: 90%" type="file" /><asp:RequiredFieldValidator
                                    ID="rfvFileUpload" runat="server" ControlToValidate="FileUpload" Display="Static"
                                    ErrorMessage="Please Select File">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                        ID="revFileUpload" runat="Server" ControlToValidate="FileUpload" ErrorMessage="Please Select Excel/CSV Files"
                                        ValidationExpression=".+\.(([xX][lL][sS])|([cC][sS][vV]))">*</asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 24px; text-align: center">
                                <asp:Button ID="CmdUpload" runat="server" OnClick="CmdUpload_Click" Text="Upload"
                                    value="Upload" /></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4" style="height: 26px" valign="middle">
                                <radG:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    GridLines="Horizontal" PageSize="20" Skin="Outlook" Width="100%" OnNeedDataSource="RadGrid1_NeedDataSource"
                                    OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand">
                                    <MasterTableView CssClass="grid" DataKeyNames="TranID">
                                        <FilterItemStyle HorizontalAlign="left" />
                                        <HeaderStyle ForeColor="Navy" />
                                        <ItemStyle BackColor="White" Height="20px" />
                                        <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                                        <Columns>
                                            <radG:GridBoundColumn DataField="status" HeaderText="Staus" UniqueName="FileName"
                                                DataType="System.Double" Visible="false">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="TranID" HeaderText="Doc No" UniqueName="TranID">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="FileName" HeaderText="Filename" UniqueName="FileName">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="OriFileName" HeaderText="Original Filename" UniqueName="OriFileName">
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="FileType" HeaderText="FileType" UniqueName="FileType">
                                            </radG:GridBoundColumn>
                                            <radG:GridButtonColumn ButtonType="LinkButton" CommandName="Process" ConfirmText="Process This Doc?"
                                                Text="" UniqueName="Process">
                                                <ItemStyle Width="50px" />
                                            </radG:GridButtonColumn>
                                            <radG:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmText="Delete File Uploaded"
                                                ImageUrl="~/frames/images/toolbar/Delete.gif" Text="Delete" UniqueName="DeleteColumn">
                                                <ItemStyle Width="30px" />
                                            </radG:GridButtonColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings AllowColumnsReorder="True" AllowExpandCollapse="True">
                                    </ClientSettings>
                                </radG:RadGrid>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" valign="middle" colspan="4" style="height: 26px">
                                <tt class="bodytxt">
                                    <asp:Label ID="lblMsg" runat="server" ForeColor="Maroon"></asp:Label></tt>
                            </td>
                        </tr>
                    </table>
                    <asp:ValidationSummary ID="vldSum" runat="server" ShowMessageBox="True" ShowSummary="False" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
