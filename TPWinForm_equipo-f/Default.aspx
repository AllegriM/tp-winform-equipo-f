<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWinForm_equipo_f._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h1>PRODUCTOS</h1>
        <div class="input-group">
            <asp:Label ID="Label1" runat="server" CssClass="input-group-text">Buscador: </asp:Label>
            <asp:TextBox ID="txtBuscador" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtBuscador_TextChanged" type="text"></asp:TextBox>
            <asp:DropDownList ID="categoria" runat="server" CssClass="ms-auto border ps-2" AutoPostBack="true" OnSelectedIndexChanged="SelectCategoria">
            </asp:DropDownList>
        </div>
        <hr />
        <div class="row row-cols-1 row-cols-md-2 gap-4">
            <asp:Repeater ID="rptArticulos" runat="server">
                <ItemTemplate>
                    <a href="Detalle.aspx?id=<%# Eval("ID") %>" class="card" style="width: 18rem;">
                        <img class="card-img-top img-fluid" src='<%# Eval("IMAGEN[0].Url") %>' alt='<%# Eval("NOMBRE") %>' style="min-height: 265px;" onerror="this.src='https://images-ext-1.discordapp.net/external/aJ-cg0DJZH6L3siM3fYasS5RjwV7L9keSrrxF2nQgiA/https/img.freepik.com/vector-premium/vector-icono-imagen-predeterminado-pagina-imagen-faltante-diseno-sitio-web-o-aplicacion-movil-no-hay-foto-disponible_87543-11093.jpg?format=webp&width=782&height=587';">
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("NOMBRE") %></h5>
                            <h5 class="card-text">$<%# Eval("PRECIO") %></h5>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </main>
</asp:Content>
