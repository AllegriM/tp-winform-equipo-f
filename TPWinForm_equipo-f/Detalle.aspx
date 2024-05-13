<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="TPWinForm_equipo_f.Detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card" style="width: 18rem;">
        <h1 class="card-header">DETALLE</h1>
        <% if (detalleArticulo.IMAGEN != null && detalleArticulo.IMAGEN.Count > 0) { %>
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <% bool isFirst = true; %>
                    <% foreach (var imagen in detalleArticulo.IMAGEN) { %>
                        <div class="carousel-item<%= isFirst ? " active" : "" %>">
                            <img class="d-block w-100" style="max-height: 300px; object-fit: contain;" src="<%: imagen.Url %>" alt="imagen">
                        </div>
                        <% isFirst = false; %>
                    <% } %>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        <% } else { %>
            <p>No se encontraron imágenes para mostrar.</p>
        <% } %>
        <div class="card-body">
            <h5 class="card-title"><%:detalleArticulo.NOMBRE %></h5>
            <p>Cantidad de imágenes: <%: detalleArticulo.CantidadImagenes %></p>
            <p class="card-text"><%:detalleArticulo.DESCRIPCION %></p>
            <a href="#" class="btn btn-primary">Agregar al carrito</a>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.carousel').carousel();
        });
    </script>
</asp:Content>
