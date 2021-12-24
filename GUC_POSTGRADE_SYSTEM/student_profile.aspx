<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_profile.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.student_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>

    <title>PostGrade Office</title>
</head>
<body>
    <div class="container">
    <form id="profileForm" runat="server">
        <div>
        </div>


                <asp:Button ID="thesis" runat="server" class="btn btn-outline-primary btn-lg" Text="View Thesis" OnClick="viewThesis" />
                 <asp:Button ID="progress" runat="server" class="btn btn-outline-primary btn-lg" Text="Add & Fill Progress Report" OnClick="addProgress" />
                 <asp:Button ID="publication" runat="server" class="btn btn-outline-primary btn-lg" Text="Add Publication" OnClick="addPublication" />

    </form>

        
        </div>
</body>
   
</html>
