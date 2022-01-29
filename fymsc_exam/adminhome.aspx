<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="fymsc_exam.adminhome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:Label ID="sessionusername" runat="server"></asp:Label>
        <div class="row">
            <div class="col-md-11 mx-auto">
                

                <br />
                <center><h3>Employee Details</h3>
                    <p>Search Employee details with Employee Department
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="empdepartment" DataTextField="DepartmentName" DataValueField="DepartmentName" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="empdepartment" runat="server" ConnectionString="<%$ ConnectionStrings:DBEmployeeConnection %>" SelectCommand="SELECT * FROM [tblDepartment]"></asp:SqlDataSource>
                    </p>
          
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmpID,UserName" DataSourceID="emdetails" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="emdetails" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBEmployeeConnection %>" DeleteCommand="DELETE FROM [tblEmp] WHERE [EmpID] = @original_EmpID AND [EmpName] = @original_EmpName AND [EmpDesignation] = @original_EmpDesignation AND [EmpDepartment] = @original_EmpDepartment AND [EmpDateOfJoin] = @original_EmpDateOfJoin AND [EmpSalary] = @original_EmpSalary" InsertCommand="INSERT INTO [tblEmp] ([EmpName], [EmpDesignation], [EmpDepartment], [EmpDateOfJoin], [EmpSalary]) VALUES (@EmpName, @EmpDesignation, @EmpDepartment, @EmpDateOfJoin, @EmpSalary)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT tblEmp.EmpID, tblEmp.EmpName, tblEmp.EmpDesignation, tblEmp.EmpDepartment, tblEmp.EmpDateOfJoin, tblEmp.EmpSalary, tblLogin.* FROM tblEmp INNER JOIN tblLogin ON tblEmp.EmpName = tblLogin.UserName" UpdateCommand="UPDATE [tblEmp] SET [EmpName] = @EmpName, [EmpDesignation] = @EmpDesignation, [EmpDepartment] = @EmpDepartment, [EmpDateOfJoin] = @EmpDateOfJoin, [EmpSalary] = @EmpSalary WHERE [EmpID] = @original_EmpID AND [EmpName] = @original_EmpName AND [EmpDesignation] = @original_EmpDesignation AND [EmpDepartment] = @original_EmpDepartment AND [EmpDateOfJoin] = @original_EmpDateOfJoin AND [EmpSalary] = @original_EmpSalary">
        <DeleteParameters>
            <asp:Parameter Name="original_EmpID" Type="Int32" />
            <asp:Parameter Name="original_EmpName" Type="String" />
            <asp:Parameter Name="original_EmpDesignation" Type="String" />
            <asp:Parameter Name="original_EmpDepartment" Type="String" />
            <asp:Parameter Name="original_EmpDateOfJoin" Type="String" />
            <asp:Parameter Name="original_EmpSalary" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmpName" Type="String" />
            <asp:Parameter Name="EmpDesignation" Type="String" />
            <asp:Parameter Name="EmpDepartment" Type="String" />
            <asp:Parameter Name="EmpDateOfJoin" Type="String" />
            <asp:Parameter Name="EmpSalary" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmpName" Type="String" />
            <asp:Parameter Name="EmpDesignation" Type="String" />
            <asp:Parameter Name="EmpDepartment" Type="String" />
            <asp:Parameter Name="EmpDateOfJoin" Type="String" />
            <asp:Parameter Name="EmpSalary" Type="String" />
            <asp:Parameter Name="original_EmpID" Type="Int32" />
            <asp:Parameter Name="original_EmpName" Type="String" />
            <asp:Parameter Name="original_EmpDesignation" Type="String" />
            <asp:Parameter Name="original_EmpDepartment" Type="String" />
            <asp:Parameter Name="original_EmpDateOfJoin" Type="String" />
            <asp:Parameter Name="original_EmpSalary" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

                    <br />
                    <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>

                </center>
            </div>
        </div>
    </div>
</asp:Content>
