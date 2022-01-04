<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examiner_search.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.Examiner_search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
    <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>
    <link href="signin.css" rel="stylesheet">
    <script src='https://kit.fontawesome.com/cc3cb258ce.js' crossorigin='anonymous'></script>
        <style>
       
        table {
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
        <li class="nav-item">
        <a class="nav-link" href="Examiner_Add_grades.aspx">Add grade</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="Examiner_Add_comments.aspx">Add comments</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="Examiner_List.aspx">List Thesis Title,Supervisors and Student Names </a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="Examiner_page.aspx">Edit Examiner</a>
      </li>

    </ul>
  </div>
</nav>
    <form id="form1" runat="server">
        <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff">
            <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Search For Thesis Title</h1> 

            
          <asp:TextBox class="form-control" ID="searchT" runat="server"  placeholder="Enter the thesis title"></asp:TextBox>
            <asp:Button ID="Search" runat="server" OnClick="search" Text="Search" class="btn btn-outline-primary btn-lg" />
        </div>
        <div>
             
            <asp:GridView ID="SearchTable" runat="server" AutoGenerateColumns ="false">
               <columns>    
                   <asp:BoundField HeaderText="Serial Number" DataField="serialNumber"/> 
                   <asp:BoundField HeaderText="Field" DataField="field"/> 
                   <asp:BoundField HeaderText="Type" DataField="type"/> 
                   <asp:BoundField HeaderText="Title" DataField="title"/> 
                   <asp:BoundField HeaderText="Start Date" DataField="startDate"/> 
                   <asp:BoundField HeaderText="End Date" DataField="endDate"/> 
                   <asp:BoundField HeaderText="Defence Date" DataField="defenceDate"/> 
                   <asp:BoundField HeaderText="Years" DataField="years"/> 
                   <asp:BoundField HeaderText="Grade" DataField="grade"/> 
                   <asp:BoundField HeaderText="Payment ID" DataField="payment_id"/>
                   <asp:BoundField HeaderText="Extention Number" DataField="noExtension"/>
                   

               </columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
