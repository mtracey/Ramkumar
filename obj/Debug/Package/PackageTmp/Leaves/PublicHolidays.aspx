<%@ Page Language="C#" AutoEventWireup="true" Codebehind="PublicHolidays.aspx.cs"
    Inherits="SMEPayroll.Leaves.PublicHolidays" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG1" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
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
    <script language="javascript"  type="text/javascript"  src="../Frames/Script/collapseableDIV.js">           
    </script>
</head>

<body style="margin-left: auto">
    <form id="form1" runat="server">
        <radG1:RadScriptManager ID="ScriptManager" runat="server">
        </radG1:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />              
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>VIEW PUBLIC HOLIDAYS LIST</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="#E5E5E5">
                            <td valign="middle" align="right">
                                <tt class="bodytxt">Year:</tt>
                            <td align="left" width="10%" style="font-size: 9pt; color: #000000; font-family: verdana;">
                                &nbsp;
                              <%--  <asp:DropDownList ID="cmbYear" runat="server" Style="width: 65px" CssClass="textfields">                                
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
                                
                                <asp:DropDownList ID="cmbYear"  CssClass="textfields" DataTextField="text" DataValueField="id" DataSourceID="xmldtYear" 
                                       runat="server">
                               </asp:DropDownList>
                               <asp:XmlDataSource ID="xmldtYear" runat="server" DataFile="~/XML/xmldata.xml" XPath="SMEPayroll/Calendar/Years/Year" ></asp:XmlDataSource>
                                
                                
                            </td>
                            <td align="left" width="20%" style="font-size: 9pt; color: #000000; font-family: verdana;">
                                <asp:ImageButton ID="imgbtnfetch" OnClick="bindgrid" runat="server" ImageUrl="~/frames/images/toolbar/go.ico" /></td>
                            <td align="right" style="height: 25px">
                                <input id="Button1" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div>
        
                <radG:RadGrid  OnUpdateCommand="RadGrid1_UpdateCommand" OnItemDataBound="RadGrid1_ItemDataBound"
                    OnInsertCommand="RadGrid1_InsertCommand" OnDeleteCommand="RadGrid1_DeleteCommand"
                    ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" GridLines="None" Skin="Outlook"
                    Width="99%">
                    <MasterTableView DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="ID"
                        CommandItemDisplay="Bottom">
                        <Columns>
                            <radG:GridBoundColumn ReadOnly="True"  DataField="holiday_date" DataType="System.string"
                                UniqueName="holiday_date" SortExpression="holiday_date" HeaderText="Date">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn ReadOnly="True" Visible="False" DataField="ID" DataType="System.Int32"
                                UniqueName="ID" SortExpression="ID" HeaderText="ID">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn DataField="holiday_name" UniqueName="holiday_name" SortExpression="holiday_name"
                                HeaderText="Name">
                            </radG:GridBoundColumn>
                            <radG:GridBoundColumn Display="False" DataField="companyid" UniqueName="companyid"
                                SortExpression="companyid" HeaderText="company">
                            </radG:GridBoundColumn>
                            <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="Editcolumn">
                            </radG:GridEditCommandColumn>
                            <radG:GridButtonColumn ButtonType="ImageButton" ConfirmText="Are you sure you want to cancel this holiday?"
                                CommandName="Delete" Text="Delete" UniqueName="Deletecolumn">
                                <ItemStyle Width="1%" />
                            </radG:GridButtonColumn>
                        </Columns>
                        <EditFormSettings UserControlName="publicholidays.ascx" EditFormType="WebUserControl">
                            <EditColumn UniqueName="Editcolumn">
                            </EditColumn>
                        </EditFormSettings>
                        <ExpandCollapseColumn Visible="False">
                            <HeaderStyle Width="19px"></HeaderStyle>
                        </ExpandCollapseColumn>
                        <RowIndicatorColumn Visible="False">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </RowIndicatorColumn>
                        <CommandItemSettings AddNewRecordText="Add New Holiday" />
                    </MasterTableView>
                </radG:RadGrid>
                <%--SelectCommand="SELECT [holiday_date] holiday1,convert(varchar(15),[holiday_date],103)'holiday_date', [holiday_name], [ID],companyid FROM [public_holidays] where datepart(yyyy,holiday_date)=datepart(yyyy,getdate()) order by 1"--%>
            <div  id="divMessage" class="bodytxt" style="visibility:visible" runat="server">
                <asp:Label ID="lblMsg" runat="server" ForeColor="Maroon"></asp:Label>  
            </div>            
            <div id="divHeader" style="cursor: pointer;visibility:visible"  onclick="toggleDiv('divContent', 'img1')" runat="server" >
	            <img id="img1" alt="Import Holiday List" src="../Frames/Images/Other/expand.gif"/>
            </div> 
            <div class="bodytxt" id="divimpHl" runat="server">
                Import Holiday List
            </div>  
            <div id="divContent" style="overflow:hidden; display:none;" runat="server" >
                <table  width="100%">                                                                        
                                   <tr>
                                        <td width="10%">
                                            <tt class="bodytxt">Select File :</tt>
                                        </td>
                                        <td width="60%" class="textfields" >
                                           <input id="FileUpload" runat="server" name="FileUpload" type="file" class="textfields" size="58" />
                                           <%--<asp:RequiredFieldValidator
                                           ID="rfvFileUpload" runat="server" ControlToValidate="FileUpload" Display="Static"
                                           ErrorMessage="Please Select File">*</asp:RequiredFieldValidator>--%>
                                           <asp:RegularExpressionValidator
                                            ID="revFileUpload" runat="Server" ControlToValidate="FileUpload" 
                                            ErrorMessage="Please Select CSV Files"
                                            ValidationExpression=".+\.(([cC][sS][vV]))">Please Select CSV Files</asp:RegularExpressionValidator>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                  </tr>
                                   <tr>
                                        <td>
                                        </td>
                                        <td align="center" >
                                           <asp:Button ID="CmdUpload" Height="22px" Width="80px" runat="server" Text="Upload" CssClass="textfields" OnClick="CmdUpload_Click" />
                                        </td>                
                                        <td>
                                        </td>
                                        <td></td>
                                  </tr>
                                   <tr>
                                        <td>
                                        </td>                
                                        <td  align="center">
                                            
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                   </tr>
                                   <tr>
                                        <td class="bodytxt" colspan="3">
                                           <label id="lblHlist" runat="server"></label>                     
                                           <asp:HyperLink ID="FileDownload" runat="server"  Text="Download Holiday File"  NavigateUrl="http://www.smepayroll.com/download.htm" Target="_search" >
                                           </asp:HyperLink><td>
                                          
                                        </td>                                               
                                        <td>
                                        </td>
                                   </tr>
                    </table>
            </div>            
        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" DeleteCommand="DELETE FROM [public_holidays] WHERE [ID] = @ID"
                InsertCommand="INSERT INTO [public_holidays] ([holiday_date], [holiday_name]) VALUES (@holiday_date, @holiday_name)"
                SelectCommand="SELECT [holiday_date] holiday1,convert(varchar(15),[holiday_date],103)'holiday_date', [holiday_name], [ID],companyid FROM [public_holidays] where year(holiday_date)=@year And (CompanyID=@company_id Or CompanyID=-1) order by 1"
                UpdateCommand="UPDATE [public_holidays] SET [holiday_date] = @holiday_date, [holiday_name] = @holiday_name WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="holiday_date" Type="DateTime" />
                    <asp:Parameter Name="holiday_name" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="holiday_date" Type="DateTime" />
                    <asp:Parameter Name="holiday_name" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="cmbYear" Name="year" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
