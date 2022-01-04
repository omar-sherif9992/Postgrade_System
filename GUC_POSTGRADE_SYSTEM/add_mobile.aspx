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
        <style>
          * {
    scrollbar-width: auto;
    scrollbar-color: #8f8f8f #ffffff;
  }

  /* Chrome, Edge, and Safari */
  *::-webkit-scrollbar {
    width: 16px;
  }

  *::-webkit-scrollbar-track {
    background: #ffffff;
  }

  *::-webkit-scrollbar-thumb {
    background-color: #8f8f8f;
    border-radius: 10px;
    border: 3px solid #ffffff;
  }

        li > a{color:white !important;
          text-decoration:underline !important;
        }
        .hide {
            display:hidden;
     }
        td {
        color: grey;
  font-size: 150%;
      border-bottom: 1px solid #ddd;

        }
        table {
            width:50%;
            position:relative;
            left:25%;
        }
    </style>
    </style>
</head>
<body>
    <nav class="navbar fixed-top navbar-expand-lg navbar-light" style="background-color:#808080ff">
  <a class="navbar-brand" href="#" style="color:white !important;font-weight:700;">PostGrade Office <i class="fas fa-graduation-cap"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
    <ul class="navbar-nav me-auto">
      <li class="nav-item active" >
        <a class="nav-link" href="student_profile.aspx">Profile</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="add_publication.aspx">Add & Link Publication <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="add_progress_report.aspx">Add & Fill Progress Report</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="student_thesis.aspx">View Thesis</a>
      </li>
           <li class="nav-item active" >
      </li>
           <li class="nav-item active" >
        <a class="nav-link" href="student_phone.aspx" style="text-decoration:underline">My Phones</a>
      </li>
      
          <li class="nav-item">
             <asp:Label ID="courses" runat="server" Text="" style="display:none">
                         <a class="nav-link" href="student_courses.aspx" style="color:white !important;
          text-decoration:underline !important;">View Courses<a>
             </asp:Label>
      </li>
      
             <li class="nav-item" style="color:greenyellow !important;float:right !important;margin-left:500px">
        <a class="nav-link" href="login_page.aspx" style="color:greenyellow !important;"><i class="fas fa-sign-out-alt"></i> Logout</a>
      </li>
        
           
    </ul>
  </div>
</nav>

    <br />
    <br />
    <br />
       <main class="form-signin">
             <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Add Mobile</h1> 

            <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff">

    <form id="form1" runat="server">
       <p style="text-align:left">
        Enter Your Mobile Number :</p>
            <p>
            <asp:TextBox class="form-control" ID="mobileNumber" runat="server" placeholder="Enter Your Mobile Number" minlength="11" type="number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="mobileNumber" runat="server" ErrorMessage="Please Enter your Mobile Number" CssClass="invalid-feedback" Display="Dynamic"></asp:RequiredFieldValidator>
            
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
