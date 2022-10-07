<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="tymsc_exam.registration1" %>
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
                                    <img src="img/sign-up.png" height="50" width="50"/>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Registration Form</h3>
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
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="Requireempname" runat="server" ControlToValidate="stdname" ErrorMessage="Please Enter Employee Name" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:TextBox ID="stdname" CssClass="form-control" Placeholder="Student Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group mt-4">
                                    <asp:DropDownList ID="stdfaculty" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Faculty of Science" Value="Science"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group mt-4">
                                    <asp:DropDownList ID="stddepartment" runat="server" CssClass="form-select" DataSourceID="department" DataTextField="DepartmentName" DataValueField="DepartmentName"></asp:DropDownList>
                                    <asp:SqlDataSource ID="department" runat="server" ConnectionString="<%$ ConnectionStrings:DBEmployeeConnection %>" SelectCommand="SELECT * FROM [tblDepartment]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="Requiredob" runat="server" ControlToValidate="stddob" ErrorMessage="Please Enter Date of Join" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="Rangedob" runat="server" ControlToValidate="stddob" ErrorMessage="Birth year must be between 1995 to 2005" ForeColor="Red" MaximumValue="01-01-2005" MinimumValue="01-01-1998" Type="Date">*</asp:RangeValidator>
                                    <asp:TextBox ID="stddob" CssClass="form-control" runat="server" Placeholder="Enter date of Birth" OnFocus="this.type='date'" OnBlur="this.value!=''?null:this.type='text'"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="Requireprn" runat="server" ControlToValidate="stdprn" ErrorMessage="Please enter Salary" ForeColor="Red">*</asp:RequiredFieldValidator>
                                   
                                    <asp:RegularExpressionValidator ID="Reprn" runat="server" ControlToValidate="stdprn" ErrorMessage="PRN must be between 10 to 16 charcter" ValidationExpression = "^[\d\D]{8,14}$" ForeColor="Red">*</asp:RegularExpressionValidator>
                                    <asp:TextBox ID="stdprn" runat="server" CssClass="form-control" Placeholder="PRN" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="Requireusername" runat="server" ControlToValidate="username" ErrorMessage="Please Enter Username." ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareName" runat="server" ControlToCompare="stdname" ControlToValidate="username" ErrorMessage="Name and Username must be same" ForeColor="Red">*</asp:CompareValidator>
                                    <asp:TextBox ID="username" runat="server" Placeholder="Username" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="Requirepassword" runat="server" ControlToValidate="password" ErrorMessage="Please Enter Password." ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:TextBox ID="password" runat="server" CssClass="form-control" Placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequireRepassword" runat="server" ControlToValidate="repassword" ErrorMessage="Please Re-Type Password." ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="Comparepassword" runat="server" ControlToCompare="password" ControlToValidate="repassword" ErrorMessage="Password &amp; RePassword Must be same." ForeColor="Red">*</asp:CompareValidator>
                                    <asp:TextBox ID="repassword" runat="server" CssClass="form-control" Placeholder="Re-type Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group my-1 d-grid">
                                    <asp:Button ID="btnregister" runat="server" Text="Register" CssClass="btn btn-success" OnClick="btnregister_Click" />
                                    <br />
                                    <asp:ValidationSummary ID="registerationvalidationsummary" runat="server" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
