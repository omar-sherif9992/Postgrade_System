<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="issue_thesis_payment.aspx.cs" Inherits="GUC_POSTGRADE_SYSTEM.Admin.issue_thesis_payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel='icon' type='image/png' sizes='32x32' href="https://camo.githubusercontent.com/195f24feca7dc8575566c0c0d848b8cc5affbaabdbc0cb0a8b776faade01ac86/68747470733a2f2f7777772e6275652e6564752e65672f77702d636f6e74656e742f75706c6f6164732f323031382f30382f67726164756174696f6e2d6361702d333030783330302e706e67" />
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' crossorigin='anonymous' />
    <script src='https://kit.fontawesome.com/cc3cb258ce.js' crossorigin='anonymous'></script>
    <title>Issue Payment</title>
    <style>
        .invalid-feedback {
            display: initial;
        }

        .valid-feedback {
            display: initial;
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
    <main class="form-signin">
        <h1 style="justify-content: center; font-weight: 800; text-align: center; text-decoration: underline">Issue Thesis Payment</h1>
        <div class="container" style="margin: 5rem auto; text-align: center; border: 3px solid black; padding: 2.1rem 10.1rem; border-radius: 15% 5%; box-shadow: 2px 5px #808080ff">
            <form id="form1" runat="server">
                <p style="text-align: left">
                    Enter Serial Number :
                </p>
                <p>
                    <asp:TextBox class="form-control" ID="serialNo" runat="server" placeholder="Enter Serial Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="serialNo" ErrorMessage="Please enter a serial number" CssClass="invalid-feedback" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="serialNo" MinimumValue="1" MaximumValue="2147483647" Type="Integer" ErrorMessage="Serial Number must be a positive integer." CssClass="invalid-feedback" Display="Dynamic"></asp:RangeValidator>
                </p>
                <p style="text-align: left">
                    Enter Amount :
                </p>
                <p>
                    <asp:TextBox class="form-control" ID="amnt" runat="server" placeholder="Enter Amount"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="amnt" ErrorMessage="Please enter an amount" CssClass="invalid-feedback" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="amnt" MinimumValue="0.01" MaximumValue="2147483647" Type="Double" ErrorMessage="Amount must be a positive number." Display="Dynamic" CssClass="invalid-feedback"></asp:RangeValidator>
                </p>
                <p style="text-align: left">
                    Enter Number of Installments : 
                </p>
                <p>
                    <asp:TextBox class="form-control" ID="noInstallments" runat="server" placeholder="Enter Number of Installments"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="noInstallments" ErrorMessage="Please enter the number of installments" CssClass="invalid-feedback" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="noInstallments" MinimumValue="1" MaximumValue="1000" Type="Integer" ErrorMessage="Number of installments must be a positive integer between 1 and 1000." Display="Dynamic" CssClass="invalid-feedback"></asp:RangeValidator>
                </p>
                <p style="text-align: left">
                    Enter Fund Percentage : 
                </p>
                <p>
                    <asp:TextBox class="form-control" ID="fundPerc" runat="server" placeholder="Enter Fund Percentage"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="fundPerc" ErrorMessage="Please enter the fund percentage" CssClass="invalid-feedback" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="fundPerc" MinimumValue="0" MaximumValue="100" Type="Double" ErrorMessage="Fund Percentage must be a number between 0 and 100." Display="Dynamic" CssClass="invalid-feedback"></asp:RangeValidator>
                </p>
                <p>
                    <asp:Button ID="submit" runat="server" OnClick="SubmitButtonClicked" Text="Issue Payment" class="btn btn-outline-primary btn-lg" CausesValidation="true" />
                </p>
                <br />
                <br />
                <asp:Label ID="succ" runat="server" CssClass="valid-feedback" Text="Payment issued successfully" Visible="false"></asp:Label>
                <asp:Label ID="fail" runat="server" CssClass="invalid-feedback" Text="Serial Number entered does not exit, please enter another serial number" Visible="false"></asp:Label>

            </form>

        </div>
    </main>

</body>
</html>
