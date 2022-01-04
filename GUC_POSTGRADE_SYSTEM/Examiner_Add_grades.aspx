<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examiner_Add_grades.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.Examiner_Add_grades" %>

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

    <nav class="navbar fixed-top navbar-expand-lg navbar-light" style="background-color:#808080ff">
  <a class="navbar-brand" href="#" style="color:white !important;font-weight:700;">PostGrade Office <i class="fas fa-graduation-cap"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      
    <ul class="navbar-nav me-auto">
        <li class="nav-item">
        <a class="nav-link" href="Examiner_page.aspx">Edit Examiner</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="Examiner_Add_comments.aspx">Add comments</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="Examiner_List.aspx">List Thesis Title,Supervisors and Student Names </a>
      </li>
         <li class="nav-item">
        <a class="nav-link" href="Examiner_search.aspx">Search for Thesis Title</a>
      </li>
    </ul>
  </div>
</nav>

    
    <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff">
    <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Add Grade</h1>
        <form id="form1" runat="server">
        <p style="text-align:left">
           Enter the Grade <p>
        <asp:TextBox class="form-control" ID="newGrade" runat="server"  placeholder="Enter the grade"></asp:TextBox>
               <p>
                   
        <p style="text-align:left">
            Enter Date :</p>
     
        <asp:Calendar ID="date" runat="server"></asp:Calendar>

                   <p style="text-align:left">
           Enter the thesis serial number <p>
        <asp:TextBox class="form-control" ID="serialnumber" runat="server"  placeholder="Enter the thesis serial number"></asp:TextBox>


               <asp:Label ID="Label1" runat="server" Text="the grade is added" Visible="false"></asp:Label>
               <asp:Label ID="Label2" runat="server" Text="the date chosen or the serial number is incorrect" Visible="false"></asp:Label>
               

            <asp:Button ID="addgrade" runat="server" OnClick="AddGrade" Text="Add Grade" Width="172px" class="btn btn-outline-primary btn-lg" />
        </p>
    </form>
        </div>
</body>
</html>
