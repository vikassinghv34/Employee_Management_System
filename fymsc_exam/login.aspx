<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="tymsc_exam.login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body" style="background-color: aliceblue;">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="img/generaluser.png" height="50" width="50" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Login Page</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <%--<asp:Label ID="lblusername" runat="server" Text="Username"></asp:Label>--%>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="Requireusername" runat="server" ControlToValidate="username" ErrorMessage="Please enter Username" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:TextBox ID="username" runat="server" placeholder="Username" CssClass="form-control"></asp:TextBox>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <%--<asp:Label ID="lblpassword" runat="server" Text="Password"></asp:Label>--%>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequirePassword" runat="server" ControlToValidate="password" ErrorMessage="Please Enter Password" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:TextBox ID="password" runat="server" placeholder="Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group my-1 d-grid">
                                    <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn btn-success" OnClick="btnlogin_Click"/>
                                    <br />
                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                    <asp:ValidationSummary ID="loginSummary" runat="server" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
