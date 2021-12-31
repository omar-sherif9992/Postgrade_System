<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_publication.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="GUC_POSTGRADE_SYSTEM.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>
    <script src='https://kit.fontawesome.com/cc3cb258ce.js' crossorigin='anonymous'></script>
    <title>PostGrade Office</title>
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




      
       Label > Table > th {
  background-color: #04AA6D;
  color: white;
}
        Label > Table >   th, td {
  padding: 15px;
  text-align: left;
    border-bottom: 1px solid #ddd;

}

         label > table >  tr:nth-child(even) {background-color: #f2f2f2;}
          label > table > tr:hover {background-color: yellow;}

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
        <a class="nav-link" href="student_phone.aspx">My Phones</a>
      </li>
          <li class="nav-item">
             <asp:Label ID="courses" runat="server" Text="" style="display:none">
                         <a class="nav-link" href="student_courses.aspx" style="color:white !important;
          text-decoration:underline !important;">View Courses<a>
             </asp:Label>
      </li>

           <li class="nav-item" style="color:greenyellow !important;float:right !important;margin-left:480px">
        <a class="nav-link" href="login_page.aspx" style="color:greenyellow !important;"><i class="fas fa-sign-out-alt"></i> Logout</a>
      </li>
    </ul>
  </div>
</nav>

 <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Add & Link Publication</h1> 
             <h2 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Add Publication</h2> 


    <form id="form1" runat="server">
                    <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff">
        <p style="text-align:left">
        Enter Publication Title :</p>
         <p>
            <asp:TextBox class="form-control" ID="addTitle" runat="server" onkeypress="return /[a-z]/i.test(event.key)" placeholder="Enter  Publication Title" ></asp:TextBox>
        </p>
                <br />

        <p style="text-align:left">
            Enter Date :</p>
     
        <asp:Calendar ID="addDate" runat="server"></asp:Calendar>

                          <p style="text-align:left">
        Enter Host :</p>
         <p>
            <asp:TextBox class="form-control" onkeypress="return /[a-z]/i.test(event.key)" ID="addHost" runat="server" placeholder="Enter Publication Host" ></asp:TextBox>
        </p>
                          <p style="text-align:left">
        Enter Place:</p>
         <p>
            <asp:TextBox class="form-control" ID="addPlace" runat="server" placeholder="Enter Publication Place" ></asp:TextBox>
        </p>
        <p>
    <asp:Label ID="addMessage" runat="server" Text=""></asp:Label></p>

               <p style=" display: inline-flex;flex-wrap: wrap; gap: 12px;justify-content:center;align-items:center">
                <asp:Button  ID="addaccept"  runat="server" OnClick="addAccepted" Text="Acceepted" class="btn btn-outline-primary btn-lg"  />

                 <asp:Button  ID="addnotaccept"  runat="server" OnClick="addNotAccepted" Text="Not Accepted" class="btn btn-outline-secondary btn-lg"  />

        </p>
                                                                </div>
                     <h2 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Link Publication</h2> 
                     <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff">

        <p style="text-align:left">
            Enter Thesis Serial Number :</p>
     
           <p>
            <asp:TextBox class="form-control" ID="linkThesis" runat="server"    placeholder="Enter Your Thesis Serial Number" type="number"  ></asp:TextBox>
        </p>
                  <div>    
         <p style="text-align:left;display:inline-block;float:left">
            Enter Publication ID :</p>
     <asp:Button  runat="server" type="button" style="display:inline-block;float:right" Class="btn btn-outline-primary btn-sm"  OnClick="showPublications" Text="show available publications" />

                  </div>   
     
           <p>
             
                                <asp:Label  runat="server"  ID="viewPublications1" Text="" style="display:none;margin-top:10%" >

                 <asp:Button  runat="server" type="button"  style="float:right;" Class="btn btn-secondary btn-sm" OnClick="closePublications" Text="X"  />
                                  </asp:Label>
                                               <asp:Label  runat="server"  ID="viewPublications2" Text="" style="display:none;margin-top:10%" >

                                    <asp:Table ID="mainTable" runat="server" style="margin:auto;width:50%;display:none"></asp:Table>

                
                                              </asp:Label>

            <asp:TextBox class="form-control" ID="linkPub" runat="server" type="number"    placeholder="Enter Publication ID" ></asp:TextBox>
        </p>
     <p>
    <asp:Label ID="linkMessage" runat="server" Text="" style="display:none;"></asp:Label>

                             </p>
           <p>
                <asp:Button  ID="link"  runat="server" OnClick="linkPublication" Text="Link" class="btn btn-outline-primary btn-lg" />
        </p>
                                                                                                </div>

    </form>
        </main>
</body>
</html>
