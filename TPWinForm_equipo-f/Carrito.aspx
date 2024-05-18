<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPWinForm_equipo_f.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Carrito</h1>
    <hr />
    <asp:GridView ID="dgvCarrito" runat="server" CssClass="table" AutoGenerateColumns="false">
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
                    <asp:Button ID="btnIncrementar" runat="server" CssClass="btn btn-primary" CommandName="Incrementar" CommandArgument='<%# Eval("ID") %>' Text="+" />
                    <asp:Button ID="btnDecrementar" runat="server" CssClass="btn btn-primary" CommandName="Decrementar" CommandArgument='<%# Eval("ID") %>' Text="-" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
