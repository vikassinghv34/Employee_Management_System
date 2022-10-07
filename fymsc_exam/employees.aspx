<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="employees.aspx.cs" Inherits="tymsc_exam.employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:HyperLink runat="server" ID="btnback" CssClass="nav-link" NavigateUrl="~/adminhome.aspx" Text="Go Back"></asp:HyperLink>
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
                                    <asp:RequiredFieldValidator ID="Requirestdname" runat="server" ControlToValidate="stdname" ErrorMessage="Please Enter Student Name" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                    <asp:RequiredFieldValidator ID="Requiredob" runat="server" ControlToValidate="stddob" ErrorMessage="Please Enter Date of Birth" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="Rangedob" runat="server" ControlToValidate="stddob" ErrorMessage="Birth year must be between 1995 to 2005" ForeColor="Red" MaximumValue="01-01-2005" MinimumValue="01-01-1995" Type="Date">*</asp:RangeValidator>
                                    <asp:TextBox ID="stddob" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="Requireprn" runat="server" ControlToValidate="stdprn" ErrorMessage="Please enter PRN" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="Reprn" runat="server" ControlToValidate="stdprn" ErrorMessage="PRN must be between 10 to 16 charcter" ValidationExpression = "^[\d\D]{8,14}$" ForeColor="Red">*</asp:RegularExpressionValidator>
                                    <asp:TextBox ID="stdprn" runat="server" CssClass="form-control" Placeholder="PRN" TextMode="Number"></asp:TextBox>
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="StdID,UserName" DataSourceID="empDetails" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="StdID" HeaderText="Student ID" InsertVisible="False" ReadOnly="True" SortExpression="StdID" />
            <asp:BoundField DataField="StdName" HeaderText="Name" SortExpression="StdName" />
            <asp:BoundField DataField="StdFaculty" HeaderText="Faculty" SortExpression="StdFaculty" />
            <asp:BoundField DataField="StdDepartment" HeaderText="Department" SortExpression="StdDepartment" />
            <asp:BoundField DataField="StdDateOfBirth" HeaderText="Date Of Birth" SortExpression="StdDateOfBirth" />
            <asp:BoundField DataField="StdPRN" HeaderText="PRN" SortExpression="StdPRN" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Select" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:SqlDataSource ID="empDetails" runat="server" ConnectionString="<%$ ConnectionStrings:DBEmployeeConnection %>" SelectCommand="SELECT tblEmp.StdID, tblEmp.StdName, tblEmp.StdFaculty, tblEmp.StdDepartment, tblEmp.StdDateOfBirth, tblEmp.StdPRN, tblLogin.UserName, tblLogin.Password, tblLogin.Role FROM tblEmp INNER JOIN tblLogin ON tblEmp.StdName = tblLogin.UserName WHERE Role!='Admin'"></asp:SqlDataSource>
    </center>

</asp:Content>
