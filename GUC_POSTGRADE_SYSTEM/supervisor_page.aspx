<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supervisor_page.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.supervisor_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' 		     crossorigin='anonymous'>
    <link href="signin.css" rel="stylesheet">
    <title>PostGrade Office</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Supervisor Name:<br />
            Supervisor Email:<br />
            <br />
            <asp:Button ID="ListStdID" runat="server" Text="List My Students in their Thesis" OnClick="ListThesis" />


            <br />
            <br />


        </div>
        <asp:Button ID="ViewPubID" runat="server" Text="View a Student Publication" OnClick="ViewPub"/>

        <br />
        <br />
        <asp:Button ID="AddDefID" runat="server" Text="Add a Defense for a Thesis" OnClick="AddDefense"/>


        <br />
        <br />
        <asp:Button ID="AddExmID" runat="server" Text="Add an Examiner to a Defense" OnClick="AddExaminer"/>


        <br />
        <br />
        <asp:Button ID="EvalID" runat="server" Text="Evaluate Progress Report" OnClick="EvaluateReport"/>




        <br />
        <br />
        <asp:Button ID="cancelID" runat="server" Text="Cancel Thesis" OnClick="CancelThesis"/>



    </form>
</body>
</html>
