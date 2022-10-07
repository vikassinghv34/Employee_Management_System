<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="tymsc_exam.adminhome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <asp:Label ID="sessionusername" runat="server"></asp:Label>
        <div class="row">
            <div class="col-md-11 mx-auto">
                

                <br />
                <center><h3>Stdloyee Details</h3>
                    <p>Search Employee details with Employee Department
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                            <asp:ListItem Text="BCA" Value="BCA"></asp:ListItem>
                            <asp:ListItem Text="BSc" Value="BSc"></asp:ListItem>
                            <asp:ListItem Text="MSc" Value="MSc"></asp:ListItem>
                        </asp:DropDownList>
                    </p>
          
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="StdID,UserName" DataSourceID="emdetails" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="StdID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="StdID" />
            <asp:BoundField DataField="StdName" HeaderText="Name" SortExpression="StdName" />
            <asp:BoundField DataField="StdFaculty" HeaderText="Faculty" SortExpression="StdFaculty" />
            <asp:BoundField DataField="StdDepartment" HeaderText="Department" SortExpression="StdDepartment" />
            <asp:BoundField DataField="StdDateOfBirth" HeaderText="Date Of Birth" SortExpression="StdDateOfBirth" />
            <asp:BoundField DataField="StdPRN" HeaderText="PRN" SortExpression="StdPRN" />
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
                    
   <asp:SqlDataSource ID="emdetails" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBEmployeeConnection %>" DeleteCommand="DELETE FROM [tblEmp] WHERE [StdID] = @original_StdID AND [StdName] = @original_StdName AND [StdFaculty] = @original_StdFaculty AND [StdDepartment] = @original_StdDepartment AND [StdDateOfBirth] = @original_StdDateOfBirth AND [StdPRN] = @original_StdPRN" InsertCommand="INSERT INTO [tblEmp] ([StdName], [StdFaculty], [StdDepartment], [StdDateOfBirth], [StdPRN]) VALUES (@StdName, @StdFaculty, @StdDepartment, @StdDateOfBirth, @StdPRN)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT tblEmp.StdID, tblEmp.StdName, tblEmp.StdFaculty, tblEmp.StdDepartment, tblEmp.StdDateOfBirth, tblEmp.StdPRN, tblLogin.* FROM tblEmp INNER JOIN tblLogin ON tblEmp.StdName = tblLogin.UserName" UpdateCommand="UPDATE [tblEmp] SET [StdName] = @StdName, [StdFaculty] = @StdFaculty, [StdDepartment] = @StdDepartment, [StdDateOfBirth] = @StdDateOfBirth, [StdPRN] = @StdPRN WHERE [StdID] = @original_StdID AND [StdName] = @original_StdName AND [StdFaculty] = @original_StdFaculty AND [StdDepartment] = @original_StdDepartment AND [StdDateOfBirth] = @original_StdDateOfBirth AND [StdPRN] = @original_StdPRN">
        <DeleteParameters>
            <asp:Parameter Name="original_StdID" Type="Int32" />
            <asp:Parameter Name="original_StdName" Type="String" />
            <asp:Parameter Name="original_StdFaculty" Type="String" />
            <asp:Parameter Name="original_StdDepartment" Type="String" />
            <asp:Parameter Name="original_StdDateOfBirth" Type="String" />
            <asp:Parameter Name="original_StdPRN" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="StdName" Type="String" />
            <asp:Parameter Name="StdFaculty" Type="String" />
            <asp:Parameter Name="StdDepartment" Type="String" />
            <asp:Parameter Name="StdDateOfBirth" Type="String" />
            <asp:Parameter Name="StdPRN" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="StdName" Type="String" />
            <asp:Parameter Name="StdFaculty" Type="String" />
            <asp:Parameter Name="StdDepartment" Type="String" />
            <asp:Parameter Name="StdDateOfBirth" Type="String" />
            <asp:Parameter Name="StdPRN" Type="String" />
            <asp:Parameter Name="original_StdID" Type="Int32" />
            <asp:Parameter Name="original_StdName" Type="String" />
            <asp:Parameter Name="original_StdFaculty" Type="String" />
            <asp:Parameter Name="original_StdDepartment" Type="String" />
            <asp:Parameter Name="original_StdDateOfBirth" Type="String" />
            <asp:Parameter Name="original_StdPRN" Type="String" />
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
