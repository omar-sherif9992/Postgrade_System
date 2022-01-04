<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_page.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.all_login_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>
    <link href="signin.css" rel="stylesheet">
    <script src='https://kit.fontawesome.com/cc3cb258ce.js' crossorigin='anonymous'></script>
   
    <title>PostGrade Office</title>
</head>
    
<body>
    <main class="form-signin">
             <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline;color:black">Login page</h1> 

            <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff">

    <form id="form1" runat="server">
       <p style="text-align:left">
        Enter your Email :</p><p>
            <asp:TextBox class="form-control" ID="email" runat="server" placeholder="Enter Your Email" ></asp:TextBox>
        </p>
        <p style="text-align:left">
            Enter your Password :</p>
        <p>
           <div> <asp:TextBox class="form-control" ID="password" runat="server"  type="password"  placeholder="Enter Your Password"></asp:TextBox>
      <i class="far fa-eye" id="togglePassword" style="margin-left:-35px;margin-top:-25px;float:right;position:relative;z-index:2;cursor:pointer;"></i>
               </div></p>
            <p>
                <asp:Button  ID="signin"  runat="server" OnClick="login" Text="log in" class="btn btn-outline-primary btn-lg" />
        </p>          
        <br />
        <br />
            <asp:Label ID="userDoesnotExist" runat="server" Text="Incorrect Username/Password" style="display:none;color:red"></asp:Label>

            <br />
            <br />

        <div class="container" style="display: inline-flex;flex-wrap: wrap; gap: 12px;">
            <br />
          Don't Have an Account?
        <br/>
        Register Now:
        <br />
        <br />
        <asp:Button ID="StdReg" runat="server" OnClick="StudentRegister" Text="Student" class="btn btn-outline-secondary btn-sm" />
        <asp:Button ID="SupReg" runat="server" OnClick="SupervisorRegister" Text="Supervisor" class="btn btn-outline-secondary btn-sm" />
        <asp:Button ID="ExamReg" runat="server" OnClick="ExaminerRegister" Text="Examiner" class="btn btn-outline-secondary btn-sm" />
            </div>

    </form>
                </div>
        </main>
    <script>
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password');

        togglePassword.addEventListener('click', function (e) {
            // toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            // toggle the eye slash icon
            this.classList.toggle('fa-eye-slash');
        })    </script>
</body>
</html>