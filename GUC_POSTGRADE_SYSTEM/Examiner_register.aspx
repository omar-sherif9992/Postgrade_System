<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examiner_register.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.Examiner_register" %>

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
        <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Register Examiner</h1> 
        <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff">

            Enter your E-mail:<br />
            <asp:TextBox class="form-control" ID="email" runat="server" placeholder="Enter Your E-mail" type="email"></asp:TextBox>
            <br />
            Enter your Password<br />
            <asp:TextBox class="form-control" ID="pass" runat="server" placeholder="Enter Your Password"></asp:TextBox>
            <br />
            <br />

            Enter your Name:<br />
            <asp:TextBox class="form-control" ID="name" runat="server" placeholder="Enter Your Name"></asp:TextBox>
            <br />
            <br />
            Enter your Field of Work:<br />
            <asp:TextBox class="form-control" ID="fow" runat="server" placeholder="Enter Your Field of Work"></asp:TextBox>
            <br />
            
            <asp:Button ID="Button1" runat="server" Text="Register for National Examiner" class="btn btn-outline-secondary btn-lr" OnClick = "National"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Register for NonNational Examiner" class="btn btn-outline-secondary btn-lr" OnClick="non"/>
            
            <br />
            <asp:label ID ="error" runat="server"></asp:label>
           
            
            

        </div>
    </form>
</body>
</html>
