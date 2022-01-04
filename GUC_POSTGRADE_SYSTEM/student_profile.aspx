<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_profile.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.student_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>
    <script src='https://kit.fontawesome.com/cc3cb258ce.js' crossorigin='anonymous'></script>

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
    <div class="container">
    <form id="profileForm" runat="server">
   
         
   
     <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff;align-content:center">

                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeu3D3jKzVj7aLLCP5jUDIzuQb6EzfC4wQL7NmtCTQF4gR4qXHC-h2M-Kr07EHOIGtufI&usqp=CAU"
                    style="border-radius:100%; width:150px; height:150px;position:relative;top:-10%;margin-top:-10%"  /><br />
            <div style="margin:auto">
            <asp:Table ID="Table1" runat="server" style="border-spacing:200px;">

         
                    <asp:TableRow>
                    <asp:TableCell>
                      ID :
                    </asp:TableCell>
                    <asp:TableCell ID="idk"  >
                        49-3324
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                       First Name :
                    </asp:TableCell>
                    <asp:TableCell id="fname">
                        omar
                    </asp:TableCell>
                </asp:TableRow>

                    <asp:TableRow>
                    <asp:TableCell>
                       Last Name :
                    </asp:TableCell>
                    <asp:TableCell id="lname">
                        sherif
                    </asp:TableCell >


                </asp:TableRow>
                   <asp:TableRow>
                    <asp:TableCell >
Faculty :                   </asp:TableCell>
                      <asp:TableCell id="faculty">
                          Computer Science


                    </asp:TableCell>
                </asp:TableRow>

                   <asp:TableRow>
                    <asp:TableCell >
                        Address :
                    </asp:TableCell>
                      <asp:TableCell id="address">
                          shar3


                    </asp:TableCell>
                </asp:TableRow>


                   <asp:TableRow>
                    <asp:TableCell >
                        GPA :
                    </asp:TableCell>
                      <asp:TableCell id="gpa">
                        Not Specified
                    </asp:TableCell>
                </asp:TableRow>
                   <asp:TableRow id="underGradeIDRow" style="display:none;">
                    <asp:TableCell >
UnderGrade ID     :               </asp:TableCell>
                      <asp:TableCell id="underGradeID">
Not Specified
                    </asp:TableCell>
                </asp:TableRow>


                 <asp:TableRow id="typeRow">
                    <asp:TableCell>
                        Type :
                    </asp:TableCell>
                      <asp:TableCell id="typeCell">
                          Not Specified


                    </asp:TableCell>
                </asp:TableRow>

                   <asp:TableRow id="add_mobile">
              
                      <asp:TableCell ColumnSpan="2">
    <asp:Button ID="Button1" runat="server" Text="Add Mobile" Class="btn btn-outline-primary btn-lg" OnClick="addMobile" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>    
                </div>
                    </div>

    
    </form>

       



            <br />
        </div>
</body>
   
</html>
