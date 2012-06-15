<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiDeductionMap_edit.ascx.cs" Inherits="SMEPayroll.Management.MultiDeductionMap_edit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<center>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
           <tr>
               <td  style="height: 32px; text-align: center">
                <asp:DropDownList ID="drpVariable"  class="textfields" runat="server" 
                DataSourceid="SqlDataSource_AddType"                 
                DataTextField="desc" 
                DataValueField="id">
                  </asp:DropDownList>
                &nbsp;<asp:Button ID="btnUpdate" CommandName="Update"
                    Text="Update"
                    runat="server" Width="85px" />
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" Width="64px" /></td>
           
                 <asp:SqlDataSource ID="SqlDataSource_AddType" runat="server" 
                 SelectCommand="select ''as [id] ,'Select'as [desc] Union all  SELECT  [id],Replace ([desc],'''' ,'') [desc] FROM [deductions_types] where company_id=@Compid  Order by [Desc]">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="Compid" Name="Compid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
             
        </tr>
    </table>
</center>