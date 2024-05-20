<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPWinForm_equipo_f.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Carrito</h1>
    <hr />
    <asp:Label ID="lblMensajeError" runat="server" CssClass="alert alert-danger" Visible="false"></asp:Label>
    <asp:GridView ID="dgvCarrito" runat="server" CssClass="table table-hover" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate>
                    <asp:Image ID="imgArticulo" runat="server" ImageUrl='<%# Eval("IMAGEN[0].Url") %>' Width="100px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Nombre" DataField="NOMBRE" />
            <asp:BoundField HeaderText="Precio" DataField="PRECIO" />
            <asp:BoundField HeaderText="Cantidad" DataField="CANTIDAD" />
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:Button ID="btnSumar" runat="server" CssClass="btn btn-primary" CommandArgument='<%# Eval("ID") %>' Text="+" OnClick="btnSumar_Click" />
                    <asp:Button ID="btnRestar" runat="server" CssClass="btn btn-primary" CommandArgument='<%# Eval("ID") %>' Text="-" OnClick="btnRestar_Click"/>
                    <asp:Button ID="btnEliminarArticulo" runat="server" CssClass="btn-close" CommandArgument='<%# Eval("ID") %>' OnClick="btnEliminarArticulo_Click"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <p class="text-end">TOTAL: $<%: totalCarrito %> </p>
    <asp:Button ID="btnVaciarCarrito" runat="server" CssClass="btn btn-outline-primary" Text="Vaciar carrito" OnClick="btnVaciarCarrito_Click"/>
</asp:Content>
