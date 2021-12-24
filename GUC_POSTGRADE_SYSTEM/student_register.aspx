<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_register.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.StudentRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div >

            First Name<br />
            <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
            <br />
            <br />
            Last Name<br />
            <asp:TextBox ID="SecondName" runat="server"></asp:TextBox>
            <br />
            <br />
            E-Mail<br />
            <asp:TextBox ID="EMAIL" runat="server"></asp:TextBox>
            <br />
            <br />
            Password<br />
            <asp:TextBox ID="Password" runat="server"></asp:TextBox>
            <br />
            <br />
            Faculty<br />
            <asp:TextBox ID="Faculty" runat="server"></asp:TextBox>
            <br />
            <br />
            Address<br />
            <asp:TextBox ID="Address" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Guc" runat="server" Text="Gucian" OnClick="GucIan" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="NonGuc" runat="server" Text="Non Gucian" OnClick="NonGUC" />

            <br />

        </div>
    </form>
</body>
</html>