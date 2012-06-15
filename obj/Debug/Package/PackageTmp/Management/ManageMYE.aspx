<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ManageMYE.aspx.cs" Inherits="SMEPayroll.Management.ManageMYE" %>

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
        <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage MYE</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right" style="height: 25px">
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
        <radG:RadCodeBlock ID="RadCodeBlock3" runat="server">

            <script type="text/javascript" language="javascript">
        function isNumericKeyStrokeDecimal(evt)
        {
             var charCode = (evt.which) ? evt.which : event.keyCode
             if ((charCode > 31 && (charCode < 48 || charCode > 57)) && (charCode !=46))
                return false;

             return true;
        }
            </script>

        </radG:RadCodeBlock>
        <div>
            <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

                <script type="text/javascript">
                        function RowDblClick(sender, eventArgs)
                        {
                            sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                        }
                        
                        function myOnClientCleared(radUpload,eventargs)
                        {
                            var image = document.getElementById("Image1");
                            image.src = null;
                        }
                </script>

            </radG:RadCodeBlock>
            <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                    <td>
                        <radG:RadGrid ID="RadGrid1" runat="server" OnDeleteCommand="RadGrid1_DeleteCommand"  
                            AllowFilteringByColumn="true" AllowSorting="true" OnItemDataBound="RadGrid1_ItemDataBound"
                            DataSourceID="SqlDataSource1" GridLines="None" Skin="Outlook" Width="96%" OnUpdateCommand="RadGrid1_ItemUpdated"
                            OnInsertCommand="RadGrid1_InsertCommand">
                            <MasterTableView CommandItemDisplay="Bottom" AllowAutomaticUpdates="True" DataSourceID="SqlDataSource1"
                                AllowAutomaticDeletes="True" AutoGenerateColumns="False" AllowAutomaticInserts="false"
                                DataKeyNames="id, FileName">
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
                                    <radG:GridTemplateColumn EditFormColumnIndex="0" HeaderStyle-Width="10%" HeaderStyle-Font-Bold="true"
                                        HeaderText="Certificate No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCertificateNo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CertificateNo")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCertificateNo" MaxLength="50" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CertificateNo")%>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvCERT" runat="server" ControlToValidate="txtCertificateNo"
                                                Display="None" ErrorMessage="Please Enter Certificate Number." SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridTemplateColumn EditFormColumnIndex="1" HeaderStyle-Width="10%" HeaderStyle-Font-Bold="true"
                                        HeaderText="Prior App Ref No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPriorAppRefNo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PriorAppRefNo")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtPriorAppRefNo" MaxLength="50" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PriorAppRefNo")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridTemplateColumn EditFormColumnIndex="2" HeaderStyle-Width="10%" HeaderStyle-Font-Bold="true"
                                        HeaderText="Prior App Granted">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPriorAppGranted" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PriorAppGranted")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtPriorAppGranted" onkeypress="return isNumericKeyStrokeDecimal(event)"
                                                MaxLength="50" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PriorAppGranted")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridTemplateColumn EditFormColumnIndex="0" HeaderStyle-Width="10%" HeaderStyle-Font-Bold="true"
                                        HeaderText="Approval Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPriorType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PriorType")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtPriorType1" Width="40px" MaxLength="50" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PriorType1")%>'></asp:TextBox>
                                            <asp:TextBox ID="txtPriorType2" Width="100px" MaxLength="50" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PriorType2")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridTemplateColumn EditFormColumnIndex="1" HeaderStyle-Width="10%" HeaderStyle-Font-Bold="true"
                                        HeaderText="Issue Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIssueDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "IssueDate")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <radG:RadDatePicker Calendar-ShowRowHeaders="false" MinDate="01-01-1900" ID="rdIssueDate"
                                                DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "IssueDateCopy")%>' runat="server">
                                                <DateInput ID="DIIssueDate" runat="server" Skin="" DateFormat="dd/MM/yyyy">
                                                </DateInput>
                                            </radG:RadDatePicker>
                                        </EditItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridTemplateColumn EditFormColumnIndex="2" HeaderStyle-Width="10%" HeaderStyle-Font-Bold="true"
                                        HeaderText="Val Start Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblValidityDateStart" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ValidityDateStart")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <radG:RadDatePicker Calendar-ShowRowHeaders="false" MinDate="01-01-1900" ID="rdValidityDateStart"
                                                DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "ValidityDateStartCopy")%>'
                                                runat="server">
                                                <DateInput ID="DIValidityDateStart" runat="server" Skin="" DateFormat="dd/MM/yyyy">
                                                </DateInput>
                                            </radG:RadDatePicker>
                                        </EditItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridTemplateColumn EditFormColumnIndex="0" HeaderStyle-Width="10%" HeaderStyle-Font-Bold="true"
                                        HeaderText="Val End Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblValidityDateEnd" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ValidityDateEnd")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <radG:RadDatePicker Calendar-ShowRowHeaders="false" MinDate="01-01-1900" ID="rdValidityDateEnd"
                                                DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "ValidityDateEndCopy")%>'
                                                runat="server">
                                                <DateInput ID="DIValidityDateEnd" runat="server" Skin="" DateFormat="dd/MM/yyyy">
                                                </DateInput>
                                            </radG:RadDatePicker>
                                        </EditItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </radG:GridTemplateColumn>
                                    <radG:GridTemplateColumn EditFormColumnIndex="1" UniqueName="lnk" HeaderText="File Name">
                                        <ItemTemplate>
                                            <asp:HyperLink runat="server" ID="hlnFile" Text='<%# Bind("FileName") %>'>      
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <radG:RadUpload ID="rdUpload" OnClientClearing="myOnClientCleared" InitialFileInputsCount="1"
                                                runat="server" Skin="" EnableFileInputSkinning="false" EnableEmbeddedSkins="false"
                                                Localization-Select="" ControlObjectsVisibility="None" MaxFileInputsCount="1"
                                                OverwriteExistingFiles="True" />
                                        </EditItemTemplate>
                                    </radG:GridTemplateColumn>
                                    <radG:GridTemplateColumn EditFormColumnIndex="2" Display="false" AllowFiltering="False"
                                        UniqueName="TC">
                                        <ItemTemplate>
                                            &nbsp;
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="lblSt" runat="server" Text="&nbsp;">&nbsp;</asp:Label></EditItemTemplate>
                                    </radG:GridTemplateColumn>
                                    <radG:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditColumn">
                                        <ItemStyle Width="50px" />
                                    </radG:GridEditCommandColumn>
                                    <radG:GridButtonColumn ConfirmText="Delete this record?" ConfirmDialogType="RadWindow"
                                        ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton" />
                                    </radG:GridButtonColumn>
                                    <radG:GridTemplateColumn Display="false" HeaderStyle-Width="0px" HeaderText="">
                                        <ItemTemplate>
                                            <asp:Label Width="0px" Visible="false" ID="lblID2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label Width="0px" Visible="false" ID="lblID1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID")%>'></asp:Label></EditItemTemplate>
                                    </radG:GridTemplateColumn>
                                </Columns>
                                <EditFormSettings ColumnNumber="3">
                                    <FormTableItemStyle HorizontalAlign="left"></FormTableItemStyle>
                                    <FormTableAlternatingItemStyle HorizontalAlign="left"></FormTableAlternatingItemStyle>
                                    <FormCaptionStyle HorizontalAlign="left" CssClass="EditFormHeader"></FormCaptionStyle>
                                    <FormMainTableStyle HorizontalAlign="left" BorderColor="black" BorderWidth="0" CellSpacing="0"
                                        CellPadding="2" BackColor="White" Width="100%" />
                                    <FormTableStyle HorizontalAlign="left" BorderColor="black" BorderWidth="0" CellSpacing="0"
                                        CellPadding="2" BackColor="White" />
                                    <EditColumn ButtonType="ImageButton" InsertText="Add New MYE Certificate" UpdateText="Update"
                                        UniqueName="EditCommandColumn1" CancelText="Cancel Edit">
                                    </EditColumn>
                                    <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
                                </EditFormSettings>
                                <ExpandCollapseColumn Visible="False">
                                    <HeaderStyle Width="19px"></HeaderStyle>
                                </ExpandCollapseColumn>
                                <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </RowIndicatorColumn>
                                <CommandItemSettings AddNewRecordText="Add New MYE Certificate" />
                            </MasterTableView>
                            <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                                    AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                                <ClientEvents OnRowDblClick="RowDblClick" />
                            </ClientSettings>
                        </radG:RadGrid>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT ID, CertificateNo, Convert(varchar,IssueDate,103) IssueDate, IssueDate IssueDateCopy, PriorAppRefNo, PriorAppGranted, PriorType1, PriorType2, Convert(varchar,ValidityDateStart,103) ValidityDateStart, ValidityDateStart ValidityDateStartCopy, Convert(varchar,ValidityDateEnd,103) ValidityDateEnd, ValidityDateEnd ValidityDateEndCopy, FileName, (PriorType1+'-'+PriorType2) PriorType FROM [MYECertificate] WHERE [company_id] = @company_id">
                <SelectParameters>
                    <asp:SessionParameter Name="company_id" SessionField="Compid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;</center>
            <center>
                &nbsp;</center>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                ShowMessageBox="true" ShowSummary="False" />
        </div>
    </form>
</body>
</html>
