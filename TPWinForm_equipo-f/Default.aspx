<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWinForm_equipo_f._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
         <h1>PRODUCTOS</h1>
        <div class="row row-cols-1 row-cols-md-2 gap-4">
            <%
                foreach (dominio.Articulo articulo in listaArticulos)
                {
                    if (articulo.IMAGEN.Count > 0) //validacion en caso de que no haya una img asociada
                    {
                        %>
                        <a href="Detalle.aspx?id=<%: articulo.ID%>" class="card" style="width: 18rem;">
                          <img class="card-img-top img-fluid" src="<%:articulo.IMAGEN[0].Url %>" alt="<%: articulo.NOMBRE %>" style="min-height: 265px;" onerror="this.src='https://images-ext-1.discordapp.net/external/aJ-cg0DJZH6L3siM3fYasS5RjwV7L9keSrrxF2nQgiA/https/img.freepik.com/vector-premium/vector-icono-imagen-predeterminado-pagina-imagen-faltante-diseno-sitio-web-o-aplicacion-movil-no-hay-foto-disponible_87543-11093.jpg?format=webp&width=782&height=587';"> 
                          <div class="card-body">
                            <h5 class="card-title"><%:articulo.NOMBRE%></h5>
                          </div>
                        </a>
                        <%
                    }
                }

            %> 
        </div>
        
        
    </main>

</asp:Content>
