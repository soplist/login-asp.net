<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" BackColor="#E0E0E0" BorderColor="Gray" Text="click me" OnClick="Button1_Click"/>
        <table>
            <tr>
                <td>username</td>
                <td><asp:TextBox ID="txtUserName" runat="server" Width="98px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>password</td>
                <td><asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="98px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>verification code</td>
                <td style="width: 97px"><asp:TextBox ID="txtValidateNum" runat="server" Width="98px"></asp:TextBox></td>
                <td><asp:Image ID="Image1" runat="server" Height="22px" Width="58px" ImageUrl="~/ValidateNum.aspx" />input verification code in image</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="login" OnClick="btnLogin_Click" ForeColor="DodgerBlue" />
                    <asp:Button ID="btnRegister" runat="server" Text="register" OnClick="btnRegister_Click" ForeColor="DodgerBlue" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
