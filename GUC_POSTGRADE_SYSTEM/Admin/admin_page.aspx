<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_page.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.Admin.admin_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67" />
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous' />
    <script src='https://kit.fontawesome.com/cc3cb258ce.js' crossorigin='anonymous'></script>
    <title>Admin Page</title>
    <style>
/*        .hide {
            display:hidden;
     }*/
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
</head>
<body>
              <nav class="navbar fixed-top navbar-expand-lg navbar-light" style="background-color:#808080ff">
  <a class="navbar-brand" href="#" style="color:white !important;font-weight:700;margin:5px">  PostGrade Office <i class="fas fa-graduation-cap"></i></a>
  <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
    <ul class="navbar-nav me-auto">
      <li class="nav-item active" >
        <a class="nav-link" href="/Admin/admin_page.aspx" style="color:white !important;margin:5px">My Profile</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/Admin/list_supervisors.aspx" style="color:white !important;margin:5px">View Supervisors <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/Admin/list_thesis.aspx" style="color:white !important;margin:5px">View Theses</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/Admin/issue_thesis_payment.aspx" style="color:white !important;margin:5px">Issue Thesis Payment</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="/Admin/issue_installment.aspx" style="color:white !important;margin:5px">Issue Installments</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="/Admin/update_number_of_extensions.aspx" style="color:white !important;margin:5px">Update Number of Thesis Extensions</a>
      </li>
        <li class="nav-item" style="color:greenyellow !important;float:right !important;margin-left:450px">
        <a class="nav-link" href="../login_page.aspx" style="color:greenyellow !important;"><i class="fas fa-sign-out-alt"></i> Logout</a>
      </li>
    </ul>
  </div>
</nav>
    <br />    <br />

    <br />
    <br />
    <div class="container">
    <form id="profileForm" runat="server">
     <div class="container" style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff;align-content:center">

                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeu3D3jKzVj7aLLCP5jUDIzuQb6EzfC4wQL7NmtCTQF4gR4qXHC-h2M-Kr07EHOIGtufI&usqp=CAU"
                    style="border-radius:100%; width:150px; height:150px;position:relative;top:-10%;margin-top:-10%"  /><br />
            <div style="margin:auto">
            <asp:Table ID="Table1" runat="server" style="border-spacing:200px;">
            <asp:TableRow runat="server">
            <asp:TableCell>
                E-mail :
            </asp:TableCell>
            <asp:TableCell ID="email" runat="server"></asp:TableCell>
            </asp:TableRow>      
        </asp:Table>    
            </div>
                </div>

    
    </form>

       



            <br />
        </div>
</body>
</html>
