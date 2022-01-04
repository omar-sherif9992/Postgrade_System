<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supervisor_register.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.supervisor_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>
    <link href="signin.css" rel="stylesheet">
    <title>PostGrade Office</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Supervisor's Register page</h1>
        <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff">
        <div>
            First Name<br />
            <asp:TextBox ID="FirstName" class="form-control" runat="server" style="border-radius:7px"></asp:TextBox>
            <br />
            <br />
            Last Name<br />
            <asp:TextBox ID="SecondName" class="form-control" runat="server" style="border-radius:7px"></asp:TextBox>
            <br />
            <br />
            E-Mail<br />
            <asp:TextBox ID="EMAIL" runat="server" class="form-control" style="border-radius:7px" type="email"></asp:TextBox>
            <br />
            <br />
            Password<br />
            <asp:TextBox ID="Password" runat="server" class="form-control" style="border-radius:7px"></asp:TextBox>
            <br />
            <br />
            Faculty<br />
            <asp:TextBox ID="Faculty" runat="server" class="form-control" style="border-radius:7px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="registers" runat="server" Text="Register" OnClick="registerSup" style="border-radius:15px" class="btn btn-outline-primary btn-lr"/>
            </br>
            <asp:label ID ="error" runat="server"></asp:label>
            </div>
        </div>
        
    </form>
</body>
</html>
