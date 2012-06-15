<%@ Control Language="C#" AutoEventWireup="true" Codebehind="GroupRights.ascx.cs"
    Inherits="SMEPayroll.Management.GroupRights" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr align="center">
    </tr>
    <tr>
        <td valign="middle" style="width:100%" class="bodytxt" align="left" >
           <font face="verdana" size="2">
           <div style="height:22px;text-align:left;vertical-align:middle;font-weight:bold" class="bodytxt"  id="rightsHeader" runat="server"></div>
            </font>
            <radG:RadGrid ID="RadGrid1" runat="server" AllowMultiRowSelection="True" AllowMultiRowEdit="True"
                GridLines="None" 
                AutoGenerateColumns="False" Skin="Outlook" Width="100%">
                <MasterTableView DataKeyNames="RightID,ActualRightName,RightSubCategory,Description">
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
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# GenerateBindString(Container.DataItem)%>' />
                            </ItemTemplate>
                        </radG:GridTemplateColumn>
                        <radG:GridBoundColumn UniqueName="RightID" Visible="False" HeaderText="RightID" DataField="RightID">
                        </radG:GridBoundColumn>
                        <radG:GridBoundColumn UniqueName="ActualRightName" HeaderText="Rights" DataField="ActualRightName">
                        </radG:GridBoundColumn>
                        <radG:GridBoundColumn UniqueName="RightSubCategory" HeaderText="RightSubCategory" DataField="RightSubCategory">
                        </radG:GridBoundColumn>
                        <radG:GridBoundColumn UniqueName="Description" HeaderText="Description" DataField="Description">
                        </radG:GridBoundColumn>
                    </Columns>
                    <EditFormSettings UserControlName="Grouptemplate.ascx" EditFormType="WebUserControl">
                        <EditColumn UniqueName="EditCommandColumn1">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Resizing AllowRowResize="False" EnableRealTimeResize="True" ResizeGridOnColumnResize="True"
                        AllowColumnResize="True" ClipCellContentOnResize="False"></Resizing>
                </ClientSettings>
            </radG:RadGrid>
        </td>
    </tr>
</table>
