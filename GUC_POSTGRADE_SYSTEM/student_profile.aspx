<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_profile.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.student_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>
    <script src='https://kit.fontawesome.com/cc3cb258ce.js' crossorigin='anonymous'></script>

    <style>
        .hide {
            display:hidden;
     }
        td {
        color: grey;
  font-size: 150%;
        }
    </style>
    <title>PostGrade Office</title>
</head>
<body>
    <div class="container">
    <form id="profileForm" runat="server">
   
                <div id="navBar" style=" display: inline-flex;flex-wrap: wrap; gap: 12px;justify-content:center;align-items:center">


                <asp:Button ID="thesis" runat="server" class="btn btn-outline-primary btn-lg" Text="View Thesis" OnClick="viewThesis" />
                 <asp:Button ID="progress" runat="server" class="btn btn-outline-primary btn-lg" Text="Add & Fill Progress Report" OnClick="addProgress" />
                 <asp:Button ID="publication" runat="server" class="btn btn-outline-primary btn-lg" Text="Add Publication" OnClick="addPublication" />
               <asp:Button ID="course" runat="server" class="btn btn-outline-primary btn-lg" Text="View Courses" OnClick="viewCourses" style="display:hidden" />
  
                </div>
   
     <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff;align-content:center">

                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeu3D3jKzVj7aLLCP5jUDIzuQb6EzfC4wQL7NmtCTQF4gR4qXHC-h2M-Kr07EHOIGtufI&usqp=CAU"
                    style="border-radius:100%; width:150px; height:150px;position:relative;top:-10%;margin-top:-10%"  /><br />
            <div style="margin:auto">
            <asp:Table ID="Table1" runat="server" style="border-spacing:200px;">

         
                    <asp:TableRow>
                    <asp:TableCell>
                      ID :
                    </asp:TableCell>
                    <asp:TableCell ID="id"  >
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
                          4.0
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
            </asp:Table>    
                </div>
                    </div>

    
    </form>

       



            <br />
        </div>
</body>
   
</html>
