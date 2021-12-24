<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_thesis.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.all_thesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>
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
    <form id="form1" runat="server">
       <div class="container">             <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">
               <asp:Label ID="pageTitle" runat="server"></asp:Label>

                                           </h1> 
        <asp:Table ID="mainTable" runat="server">


        </asp:Table>
                          
           </div>


    </form>
</body>
</html>
