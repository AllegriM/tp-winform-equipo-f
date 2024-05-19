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
            <div class="flex-row mb-2">
                <div class="input-group">
                    <span class="input-group-btn">
                        <button type="button" class="quantity-left-minus btn btn-danger btn-number" data-type="minus" data-field="">
                          <span class="glyphicon glyphicon-minus">-</span>
                        </button>
                    </span>
                    <input type="number" id="quantity" name="quantity" class="form-control input-number mx-5" value="1" min="1" max="100" runat="server" />
                    <span class="input-group-btn">
                        <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus" data-field="">
                            <span class="glyphicon glyphicon-plus">+</span>
                        </button>
                    </span>
                </div>
            </div>
            <asp:Button ID="btnAgregarCarrito" runat="server" CssClass="btn btn-primary" Text="Agregar al carrito" OnClick="btnAgregarCarrito_Click" />
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.carousel').carousel();

            var quantityInput = $('#MainContent_quantity');

            $('.quantity-right-plus').on('click', function (e) {
                e.preventDefault();
                var quantity = parseInt(quantityInput.val());
                if (!isNaN(quantity) && quantity < 100) {
                    quantityInput.val(quantity + 1);
                } else {
                    quantityInput.val(100);
                }
            });

            $('.quantity-left-minus').on('click', function (e) {
                e.preventDefault();
                var quantity = parseInt(quantityInput.val());
                if (!isNaN(quantity) && quantity > 1) {
                    quantityInput.val(quantity - 1);
                } else {
                    quantityInput.val(1);
                }
            });
        });
    </script>
</asp:Content>
