<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>username</td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" Width="98px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:LinkButton ID="lnkbtnCheck" runat="server" CausesValidation="False" OnClick="lnkbtnCheck_Click">check username exist or not</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>password</td>
                <td>
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="98px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>comfirm password</td>
                <td>
                    <asp:TextBox ID="txtRepwd" runat="server" TextMode="Password" Width="98px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRepwd" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPwd" ControlToValidate="txtRepwd" ErrorMessage="comfirm password not as same as password!"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>email</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="98px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email format not correct!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnOk" runat="server" OnClick="btnOk_Click" Text="register" />
                    <asp:Button ID="btnBack" runat="server" CausesValidation="False" OnClick="btnBack_Click" Text="back" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
