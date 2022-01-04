<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sup_link_exam.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.sup_link_exam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PostGrad System</title>
    <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>
    <link href="signin.css" rel="stylesheet">
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
    </style>
</head>
<body>
    <main class="form-signin">
         <nav class="navbar fixed-top navbar-expand-lg navbar-light" style="background-color:#808080ff">
  <a class="navbar-brand" href="#" style="color:white !important;font-weight:700;">PostGrade Office <i class="fas fa-graduation-cap"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
    <ul class="navbar-nav me-auto">
      <li class="nav-item active" >
        <a class="nav-link" href="supervisor_page.aspx">Profile</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="supervisor_list_students.aspx">List Students in Thesis <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="sup_view_pub.aspx">View A Student's Publications</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="sup_add_defense.aspx">Add A defense for a Thesis</a>
      </li>
         <li class="nav-item">
        <a class="nav-link" href="sup_link_exam.aspx">Linnk Examiner to a Defense</a>
      </li>
         <li class="nav-item">
        <a class="nav-link" href="sup_eval_report.aspx">Evaluate a Student's Progress Report</a>
      </li>
         <li class="nav-item">
        <a class="nav-link" href="sup_cancel.aspx">Cancel Thesis</a>
      </li>
        <li class="nav-item" style="color:greenyellow !important;float:right !important;margin-left:80px">
        <a class="nav-link" href="login_page.aspx" style="color:greenyellow !important;"><i class="fas fa-sign-out-alt"></i> Logout</a>
      </li>
    </ul>
  </div>
</nav>
                <br />
        <br />
        <br />
    <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Add Examiner to a Defense</h1> 
    <form id="form1" runat="server">
        <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff">
            Enter Examiner ID<br />
            <asp:TextBox ID="ExxaminerID" class="form-control" runat="server" placeholder ="Examiner ID" type="number"></asp:TextBox>

            <br />
            Enter Thesis Serial Number<br />
            <asp:TextBox ID="serrialNumber" class="form-control" runat="server" placeholder="Serial Number" type ="number"></asp:TextBox>
            <br />
            Choose Defense Date<br />
            <div class="container" style="position:center;margin:auto">
            <asp:Calendar ID="Calendar" runat="server"></asp:Calendar>
            </div>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Link Examiner with The Defense" class="btn btn-outline-primary btn-md" OnClick="submit"  />

            <br />

            <br />
            <asp:Label ID="lb" runat="server"></asp:Label>

            <br />
            <br />
            <asp:Button ID="Home" class="btn btn-outline-secondary btn-md" runat="server" Text="Home Page" OnClick="Home_Click" />

        </div>
    </form>
</body>
</html>
