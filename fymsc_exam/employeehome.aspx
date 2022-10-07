<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="employeehome.aspx.cs" Inherits="tymsc_exam.employeehome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                        <asp:Label ID="username" runat="server"></asp:Label>
                <img src="img/manage.png" height="426" width="450" />
            </div>
            <div class="col-md-5 welcometext">
                <h1>Welcome to Employee Management System</h1>
            </div>
        </div>
    </div>
</asp:Content>
