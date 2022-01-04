<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supervisor_list_students.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.supervisor_list_students" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>
    <link href="signin.css" rel="stylesheet">
    <script src='https://kit.fontawesome.com/cc3cb258ce.js' crossorigin='anonymous'></script>
    <title>PostGrade Office</title>
    <style>
        /*#Table1 {
            width: 700px;
            border-collapse : collapse; 
            position:center;
            margin:auto;
        }
        #Table1, .td {
            border: 2px solid black;
           
        }
        .td {
            padding: 10px; 
            text-align: left;
            background-color: #04AA6D;
            color: white;
            font-size: 150%;
            position:center;
            margin:auto;
        }
        TableCell*/
        t table {
        width:100%;
        }
        th {
  background-color: #04AA6D;
  color: white;
}
        th, td {
  padding: 15px;
  text-align: left;
    border-bottom: 1px solid #ddd;

}

        tr:nth-child(even) {background-color: #f2f2f2;}
        tr:hover {background-color: yellow;}
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
    <form id="form1" runat="server">
        
            <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Student/Thesis</h1> 
            <div class="container" >
                
            <asp:Table ID="Table1" runat="server" style="border-spacing:200px;justify-content:center">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell CssClass="td" Text="Student Name">

                    </asp:TableHeaderCell>
                    <asp:TableHeaderCell CssClass="td" Text="Years Spent in Thesis">

                    </asp:TableHeaderCell>
                </asp:TableHeaderRow>
                    
            </asp:Table>
            </div>
    </form>
</body>
</html>
