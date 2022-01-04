<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="list_thesis.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.Admin.list_thesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Theses List</title>
    <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' crossorigin='anonymous'>
    <script src='https://kit.fontawesome.com/cc3cb258ce.js' crossorigin='anonymous'></script>
    <style>
        h1 {
            text-align: center;
        }

        table {
            width: 100%;
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

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: yellow;
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
    <br />
    <br />
        <br />

    <br />
    <form id="form1" runat="server">
        <h1 style="justify-content: center; font-weight: 800; text-align: center; text-decoration: underline">Theses</h1>
        <div>
            <asp:GridView ID="thesisGrid" runat="server" AutoGenerateColumns="false" Width="90%" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField HeaderText="Serial Number" DataField="serialNumber" />
                    <asp:BoundField HeaderText="Field" DataField="field" />
                    <asp:BoundField HeaderText="Title" DataField="title" />
                    <asp:BoundField HeaderText="Start Date" DataField="startDate" DataFormatString="{0:d}"/>
                    <asp:BoundField HeaderText="End Date" DataField="endDate" DataFormatString="{0:d}"/>
                    <asp:BoundField HeaderText="Defense Date" DataField="defenceDate" DataFormatString="{0:d}"/>
                    <asp:BoundField HeaderText="Years" DataField="years" />
                    <asp:BoundField HeaderText="Grade" DataField="grade" NullDisplayText="-"/>
                    <asp:BoundField HeaderText="Payment ID" DataField="payment_id" />
                    <asp:BoundField HeaderText="Number of Extensions" DataField="noExtension" />
                </Columns>
            </asp:GridView>
            <br />
            <h1 style="justify-content: center; font-weight: 800; text-align: center; text-decoration: underline">
                <asp:Label ID="thesesCount" runat="server"></asp:Label></h1>
        </div>
    </form>
</body>
</html>

