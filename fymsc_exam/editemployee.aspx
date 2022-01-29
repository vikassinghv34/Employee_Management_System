<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="editemployee.aspx.cs" Inherits="fymsc_exam.editemployee" %>
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
                                    <img src="img/sign-up.png" height="50" width="50" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Employees Details</h3>
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
                                    <asp:DropDownList ID="empdepartment" runat="server" CssClass="form-select" DataSourceID="department" DataTextField="DepartmentName" DataValueField="DepartmentId"></asp:DropDownList>
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
                                    <asp:TextBox ID="password" runat="server" CssClass="form-control" Placeholder="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group mt-4">
                                    <asp:DropDownList ID="role" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Admin" Value="admin"></asp:ListItem>
                                        <asp:ListItem Text="Employee" Value="emp"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group my-1">
                                    <asp:Button ID="btnregister" runat="server" Text="Register" CssClass="btn btn-success" OnClick="btnregister_Click" />
                                    <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-success" OnClientClick="update_popup();" OnClick="btnupdate_Click" />
                                    <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-success" OnClientClick="del_popup();" OnClick="btndelete_Click" />
                                    <asp:HiddenField runat="server" ID="hupdate" />
                                    <asp:HiddenField runat="server" ID="hdel" />
                                    <br />
                                    <br />
                                    <asp:ValidationSummary ID="registerationvalidationsummary" runat="server" ForeColor="Red" />
                                    <asp:Label ID="message" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmpID,UserName" DataSourceID="empDetails" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="EmpID" HeaderText="EmpID" InsertVisible="False" ReadOnly="True" SortExpression="EmpID" />
            <asp:BoundField DataField="EmpName" HeaderText="EmpName" SortExpression="EmpName" />
            <asp:BoundField DataField="EmpDesignation" HeaderText="EmpDesignation" SortExpression="EmpDesignation" />
            <asp:BoundField DataField="EmpDepartment" HeaderText="EmpDepartment" SortExpression="EmpDepartment" />
            <asp:BoundField DataField="EmpDateOfJoin" HeaderText="EmpDateOfJoin" SortExpression="EmpDateOfJoin" />
            <asp:BoundField DataField="EmpSalary" HeaderText="EmpSalary" SortExpression="EmpSalary" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="empDetails" runat="server" ConnectionString="<%$ ConnectionStrings:DBEmployeeConnection %>" SelectCommand="SELECT tblEmp.EmpID, tblEmp.EmpName, tblEmp.EmpDesignation, tblEmp.EmpDepartment, tblEmp.EmpDateOfJoin, tblEmp.EmpSalary, tblLogin.UserName, tblLogin.Password, tblLogin.Role FROM tblEmp INNER JOIN tblLogin ON tblEmp.EmpName = tblLogin.UserName"></asp:SqlDataSource>
    </center>
</asp:Content>
