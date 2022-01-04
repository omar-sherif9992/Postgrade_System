<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_register.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.StudentRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>
    <link href="signin.css" rel="stylesheet">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Student's Register page</h1>
        <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff">
        <div >

            First Name<br />
            <asp:TextBox ID="FirstName" class="form-control" runat="server"></asp:TextBox>
            <br />
            <br />
            Last Name<br />
            <asp:TextBox ID="SecondName" class="form-control" runat="server"></asp:TextBox>
            <br />
            <br />
            E-Mail<br />
            <asp:TextBox ID="EMAIL" class="form-control" runat="server" type="email"></asp:TextBox>
            <br />
            <br />
            Password<br />
            <asp:TextBox ID="Password" class="form-control" runat="server"></asp:TextBox>
            <br />
            <br />
            Faculty<br />
            <asp:TextBox ID="Faculty" class="form-control" runat="server"></asp:TextBox>
            <br />
            <br />
            Address<br />
            <asp:TextBox ID="Address" class="form-control" runat="server"></asp:TextBox>
            <br />
            <br />
                        <asp:label ID ="error" runat="server"></asp:label>
            <br />

            <asp:Button ID="Guc" runat="server" Text="Gucian" OnClick="GucIan" class="btn btn-outline-primary btn-lr" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="NonGuc" runat="server" Text="Non Gucian" OnClick="NonGUC" class="btn btn-outline-primary btn-lr" />

            <br />

        </div>
            </div>
    </form>
</body>
</html>