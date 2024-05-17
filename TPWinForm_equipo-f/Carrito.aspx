<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPWinForm_equipo_f.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Carrito</h1>
    <hr />
    <asp:GridView ID="dgvCarrito" runat="server" CssClass="table" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="" DataField="IMAGEN" />
            <asp:BoundField HeaderText="Nombre" DataField="NOMBRE" />
            <asp:BoundField HeaderText="Precio" DataField="PRECIO" />
            <asp:BoundField HeaderText="Cantidad" DataField="CANTIDAD" />

        </Columns>
    </asp:GridView>
</asp:Content>
