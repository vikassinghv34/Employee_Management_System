<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="tymsc_exam.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:HyperLink runat="server" ID="btnback" CssClass="nav-link" Text="Go Back"></asp:HyperLink>
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center><h2>Profile</h2></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="img/employeemanagement.png" height="100" width="100"/>
                                </center>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-4">
                                <asp:Label runat="server" ID="profilename" Text="Name"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                <asp:TextBox runat="server" ID="stdname" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-4">
                                <asp:Label runat="server" ID="profilefaculty" Text="Faculty"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                <asp:TextBox runat="server" ID="stdfaculty" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-4">
                                <asp:Label runat="server" ID="profiledepartment" Text="Department"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                <asp:TextBox runat="server" ID="stddepartment" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-4">
                                <asp:Label runat="server" ID="profiledob" Text="Date of Birth"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="stddob" CssClass="form-control" runat="server" TextMode="Date" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-4">
                                <asp:Label runat="server" ID="profileprn" Text="PRN"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="stdprn" runat="server" CssClass="form-control" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-4">
                                <asp:Label runat="server" ID="profileusername" Text="Username"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-4">
                                <asp:Label runat="server" ID="profilepassword" Text="Password"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="password" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <div class="form-group my-1 d-grid">
                                    <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-success" OnClientClick="update_popup();" OnClick="btnupdate_Click"/>
                                    <asp:HiddenField runat="server" ID="hupdate" />
                                </div>
                                
                            </div>
                        </div>
                        <asp:Label ID="message" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
