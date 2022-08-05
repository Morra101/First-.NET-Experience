<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Workshop.aspx.cs" Inherits="Assesment2.Workshop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #6F0579">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 269px;
            height: 192px;
        }
        .auto-style2 {
            width: 120px;
            height: 192px;
        }
        .auto-style3 {
            height: 192px;
        }
        .auto-style4 {
            width: 269px;
            height: 42px;
        }
        .auto-style5 {
            width: 120px;
            height: 42px;
        }
        .auto-style6 {
            height: 42px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblHeadingMessage" runat="server" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnLogOut" runat="server" BackColor="Red" BorderStyle="None" Font-Bold="True" Height="36px" OnClick="btnLogOut_Click" Text="Log Out" Width="88px" />
            <br />
            <br />
        </div>
        <asp:Label ID="lblIndicate" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Please indicate your preffered date for a programming workshop below."></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblGridHeading" runat="server" Text="Here is your current date and selected programming language (if any):"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" Width="361px" AutoGenerateColumns="False" BackColor="White">
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Name" />
                <asp:BoundField DataField="WorkshopDate" DataFormatString="{0:dd MMMM yyyy}" HeaderText="Date" />
                <asp:BoundField DataField="Java" HeaderText="Java" />
                <asp:BoundField DataField="CSharp" HeaderText="C#" />
                <asp:BoundField DataField="CPP" HeaderText="C++" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="lblLastHead" runat="server" Text="To indicate a new preferred date, choose one on the calendar below:"></asp:Label>
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" ForeColor="Black"></asp:Calendar>
                </td>
                <td class="auto-style2">
                    <asp:RadioButtonList ID="RadList1" runat="server" Height="121px">
                        <asp:ListItem>Java</asp:ListItem>
                        <asp:ListItem>C#</asp:ListItem>
                        <asp:ListItem>C++</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style3">
                    <asp:Image ID="Image1" runat="server" Height="135px" ImageUrl="~/index.png" Width="148px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Confirm date" />
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style6">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
