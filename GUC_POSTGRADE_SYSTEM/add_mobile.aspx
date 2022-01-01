
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_mobile.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.add_mobile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67" />
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' crossorigin='anonymous' />
    <link href="signin.css" rel="stylesheet" />
    <script src='https://kit.fontawesome.com/cc3cb258ce.js' crossorigin='anonymous'></script>
    <title>PostGrade Office</title>
    <style>
        .invalid-feedback {
            display: initial;
        }

        .valid-feedback {
            display: initial;
        }
    </style>
</head>
<body>
       <main class="form-signin">
             <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Add Mobile</h1> 

            <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff">

    <form id="form1" runat="server">
       <p style="text-align:left">
        Enter Your Mobile Number :</p>
            <p>
            <asp:TextBox class="form-control" ID="mobileNumber" runat="server" placeholder="Enter Your Mobile Number" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="mobileNumber" runat="server" ErrorMessage="Please Enter your Mobile Number" CssClass="invalid-feedback" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" ControlToValidate="mobileNumber" CssClass="invalid-feedback" display="Dynamic" runat="server" ErrorMessage="Mobile Number must be 11 numbers" MinimumValue="10000000000" MaximumValue="19999999999"></asp:RangeValidator>
        </p>   
        <p>
            <asp:Button ID="add" runat="server" OnClick="AddMobileNumber" Text="Add" class="btn btn-outline-primary btn-lg" CausesValidation="true" />
        </p>
        <br />
        <br />
            <asp:Label ID="succ" runat="server" Text="Mobile Number added successfully" CssClass="valid-feedback" Visible="false"></asp:Label>
            <asp:Label ID="failM" runat="server" Text="Mobile Number entered already exist, please enter another mobile number" CssClass="invalid-feedback" Visible="false"></asp:Label>
            <asp:Label ID="failI" runat="server" Text="Please register or log in and then add your mobile number" CssClass="invalid-feedback" Visible="false"></asp:Label>

            <br />
            <br />
        </form>
    </div>
    </main>
</body>
</html>