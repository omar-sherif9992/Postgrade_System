<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_progress_report.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>
    <script src='https://kit.fontawesome.com/cc3cb258ce.js' crossorigin='anonymous'></script>
    <title>PostGrade Office</title>
</head>
<body>
     <main class="form-signin">
             <h1 style="justify-content:center;font-weight:800;text-align:center;text-decoration:underline">Add and Fill Progress Report</h1> 

            <div class="container"style="margin:5rem auto;text-align:center; border:3px solid black;padding:2.1rem 10.1rem;border-radius:15% 5%;box-shadow:2px 5px #808080ff">

    <form id="form1" runat="server">
        <div>
        </div><p style="text-align:left">
        Enter Thesis Serial number :</p><p>
            <asp:TextBox class="form-control" ID="ssn" runat="server" placeholder="Enter Your Thesis serial number" ></asp:TextBox>
        </p>
                <br />

        <p style="text-align:left">
            Enter Date :</p>
     
        <asp:Calendar ID="date" runat="server"></asp:Calendar>
                 <br />

          <p style="text-align:left">
            Enter State :</p>
     
           <p>
            <asp:TextBox class="form-control" ID="state" runat="server"    placeholder="Enter State" ></asp:TextBox>
        </p>
        <br />
        <p style="text-align:left">
            Enter Description :</p>
     
           <p>
            <asp:TextBox class="form-control" ID="TextBox1" runat="server"    placeholder="Enter State" ></asp:TextBox>
        </p>


           <p>
                <asp:Button  ID="add"  runat="server" OnClick="AddFillProgressReport" Text="Add" class="btn btn-outline-primary btn-lg" />
        </p>

    </form>
                </div>
        </main>
</body>
</html>
