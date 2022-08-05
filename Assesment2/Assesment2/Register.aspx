<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assesment2.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #6F0579">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            height: 47px;
            width: 84px;
        }
        .auto-style4 {
            height: 9px;
            width: 84px;
        }
        .auto-style5 {
            height: 57px;
            width: 84px;
        }
        .auto-style7 {
            height: 47px;
            width: 167px;
        }
        .auto-style8 {
            height: 9px;
            width: 167px;
        }
        .auto-style9 {
            height: 57px;
            width: 167px;
        }
        .auto-style10 {
            height: 47px;
            width: 180px;
        }
        .auto-style11 {
            height: 9px;
            width: 180px;
        }
        .auto-style12 {
            height: 57px;
            width: 180px;
        }
        .auto-style13 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblHeadRegister" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Registration page"></asp:Label>
            <asp:Panel ID="Panel1" runat="server">
            </asp:Panel>
        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="lblUsername" runat="server" Font-Size="Large" Text="Username:" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please enter username!" Font-Bold="True" ForeColor="Black" BackColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td rowspan="3" class="auto-style13">
                    <asp:Image ID="Image1" runat="server" Height="99px" ImageUrl="~/index.png" Width="120px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblPassword" runat="server" Font-Size="Large" Text="Password:" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter password!" Font-Bold="True" ForeColor="Black" BackColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
                </td>
                <td class="auto-style9">
                    <asp:Label ID="lblUsernameUse" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
                <td class="auto-style12">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
