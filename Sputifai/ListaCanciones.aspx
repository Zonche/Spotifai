<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaCanciones.aspx.cs" Inherits="Sputifai.ListaCanciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="ddl_Genero" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE_GENERO" DataValueField="ID_CATALOGO" AutoPostBack="True"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MUSICAConnectionString %>" SelectCommand="SELECT [ID_CATALOGO], [NOMBRE_GENERO] FROM [t_GENEROS]"></asp:SqlDataSource>
        <asp:DropDownList ID="ddl_artista" runat="server" DataSourceID="SqlDataSource2" DataTextField="NOMBRE" DataValueField="ID_ARTISTA" AutoPostBack="true"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MUSICAConnectionString %>" SelectCommand="SELECT [ID_ARTISTA], [NOMBRE] FROM [t_ARTISTA]"></asp:SqlDataSource>
    </div>
        <div>
            <asp:GridView ID="gv_canciones" runat="server" AutoGenerateColumns="False" DataSourceID="dc_canciones">
                <Columns>
                    <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                    <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                    <asp:BoundField DataField="NOMBRE_GENERO" HeaderText="NOMBRE_GENERO" SortExpression="NOMBRE_GENERO" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dc_canciones" runat="server" ConnectionString="<%$ ConnectionStrings:MUSICAConnectionString %>" SelectCommand="SELECT [NOMBRE], [Expr1], [NOMBRE_GENERO] FROM [vw_canciones] WHERE (([ID_ARTISTA] = @ID_ARTISTA) AND ([ID_CATALOGO] = @ID_CATALOGO))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_artista" Name="ID_ARTISTA" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="ddl_Genero" Name="ID_CATALOGO" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
