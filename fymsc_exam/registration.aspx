<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="fymsc_exam.registration1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
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
                                    <asp:RequiredFieldValidator ID="Requireempname" runat="server" ControlToValidate="empname" ErrorMessage="Please Enter Employee Name" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:TextBox ID="empname" CssClass="form-control" Placeholder="Employee Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group mt-4">
                                    <asp:DropDownList ID="empdesignation" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Developer" Value="Developer"></asp:ListItem>
                                        <asp:ListItem Text="Sr.Developer" Value="Sr.Developer"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group mt-4">
                                    <asp:DropDownList ID="empdepartment" runat="server" CssClass="form-select" DataSourceID="department" DataTextField="DepartmentName" DataValueField="DepartmentName"></asp:DropDownList>
                                    <asp:SqlDataSource ID="department" runat="server" ConnectionString="<%$ ConnectionStrings:DBEmployeeConnection %>" SelectCommand="SELECT * FROM [tblDepartment]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="Requiredoj" runat="server" ControlToValidate="empdoj" ErrorMessage="Please Enter Date of Join" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="Rangedoj" runat="server" ControlToValidate="empdoj" ErrorMessage="Please enter date after 01-01-2021" ForeColor="Red" MaximumValue="01-01-2023" MinimumValue="01-01-2021" Type="Date">*</asp:RangeValidator>
                                    <asp:TextBox ID="empdoj" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="Requiresalary" runat="server" ControlToValidate="empsalary" ErrorMessage="Please enter Salary" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="Rangesalary" runat="server" ControlToValidate="empsalary" ErrorMessage="Please enter salary between 10000 and 10000." ForeColor="Red" MaximumValue="100000" MinimumValue="10000" Type="Integer">*</asp:RangeValidator>
                                    <asp:TextBox ID="empsalary" runat="server" CssClass="form-control" Placeholder="Salary" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="Requireusername" runat="server" ControlToValidate="username" ErrorMessage="Please Enter Username." ForeColor="Red">*</asp:RequiredFieldValidator>
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
