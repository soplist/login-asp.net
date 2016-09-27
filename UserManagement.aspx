<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManagement.aspx.cs" Inherits="UserManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td><asp:LinkButton ID="lnkbtnExit" runat="server" OnClick="lnkbtnExit_Click" ForeColor="White">exist</asp:LinkButton></td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" OnEditCommand="DataList1_EditCommand" OnCancelCommand="DataList1_CancelCommand" OnUpdateCommand="DataList1_UpdateCommand" OnDeleteCommand="DataList1_DeleteCommand" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound" Font-Size="9pt">
                       <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                       <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                       <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lnkbtnUserName" runat="server" CommandName="select" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'></asp:LinkButton></td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Email")%>'></asp:Label></td>
                                    <td>
                                        <asp:CheckBox ID="chkRole" Checked ='<%#DataBinder.Eval(Container.DataItem,"Role")%>' runat="server" Enabled="False" /></td>
                                    <td>
                                        <asp:Button ID="btnEdit" runat="server" CommandName="edit" Text="edit" />
                                        <asp:Button ID="btnDelete" runat="server" CommandName="delete" Text="delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"UserID") %>' OnLoad="btnDelete_Load" /></td>
                                    <td>
                                        <asp:Button ID="btnSetRole" runat="server" CommandName="setRole" Text='<%# (bool) DataBinder.Eval(Container.DataItem,"Role")==true?"cancel administrative rights":"set administrative rights" %>' CommandArgument = '<%# DataBinder.Eval(Container.DataItem,"UserID") %>'/>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table>
                                <tr>
                                    <td>username:</td>
                                    <td>
                                        <asp:Label ID="lblUserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'></asp:Label></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>old password:</td>
                                    <td>
                                        <asp:TextBox ID="txtOldpwd" runat="server" TextMode="Password" Width="98px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldpwd" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>new password:</td>
                                    <td>
                                        <asp:TextBox ID="txtNewpwd" runat="server" TextMode="Password" Width="98px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewpwd" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>confirm password:</td>
                                    <td>
                                        <asp:TextBox ID="txtRepwd" runat="server" TextMode="Password" Width="98px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRepwd" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewpwd" ControlToValidate="txtRepwd" ErrorMessage="confirm password not same" Width="73px"></asp:CompareValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnUpdate" runat="server" CommandName="update" CommandArgument = '<%#DataBinder.Eval(Container.DataItem,"PassWord")%>' Text="change password" />
                                        <asp:Button ID="btnCancel" runat="server" CommandName="cancel" Text="cancel" CausesValidation="False" /></td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <ItemStyle BackColor="#EBF6FD" ForeColor="#333333" />
                        <HeaderTemplate>
                            <table>
                                <tr>
                                    <td>username</td>
                                    <td>email</td>
                                    <td>administrative rights</td>
                                    <td>operation</td>
                                    <td>administrative rights setting</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <HeaderStyle BackColor="#0973DC" Font-Bold="True" ForeColor="White" />
                        <SelectedItemTemplate>
                            <table>
                                <tr>
                                    <td>username:</td>
                                    <td>
                                        <asp:TextBox ID="txtUserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' Width="98px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUserName" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td>email:</td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Email") %>' Width="98px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnUpdateName" runat="server" CommandName="updateName" CommandArgument = '<%# DataBinder.Eval(Container.DataItem,"UserID") %>' Text="change user message" Width="84px" />
                                        <asp:Button ID="btnCancel" runat="server" CommandName="cancel" Text="cancel" CausesValidation="False" />
                                    </td>
                                </tr>
                            </table>
                        </SelectedItemTemplate>
                    </asp:DataList>                    
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
