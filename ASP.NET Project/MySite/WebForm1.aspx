<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="DoctorId" HeaderText="DoctorId" SortExpression="DoctorId" />
                <asp:BoundField DataField="LastNmae" HeaderText="LastNmae" SortExpression="LastNmae" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="FatherName" HeaderText="FatherName" SortExpression="FatherName" />
                <asp:BoundField DataField="Specialty" HeaderText="Specialty" SortExpression="Specialty" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region" />
                <asp:BoundField DataField="ZIP" HeaderText="ZIP" SortExpression="ZIP" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ErgasiaConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ErgasiaConnectionString1.ProviderName %>" SelectCommand="SELECT [DoctorId], [LastNmae], [FirstName], [FatherName], [Specialty], [Address], [Region], [ZIP], [Phone] FROM [iatroi]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
