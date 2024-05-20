using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;
using System.Web.UI.HtmlControls;

namespace TPWinForm_equipo_f
{
    public partial class Detalle : System.Web.UI.Page
    {
        public Articulo detalleArticulo = new Articulo();

        protected void Page_Load(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse(Request.QueryString["ID"], out id))
            {
                ArticuloService negocio = new ArticuloService();
                detalleArticulo = negocio.listarArticuloXID(id);
                if (detalleArticulo != null)
                {
                    detalleArticulo.CantidadImagenes = detalleArticulo.IMAGEN.Count;
                }
                if (detalleArticulo == null)
                {
                    Response.Redirect("~/Error.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Error.aspx");
            };
        }

        protected void btnAgregarCarrito_Click(object sender, EventArgs e)
        {
            try
            {
                ContentPlaceHolder contentPlaceHolder = (ContentPlaceHolder)this.Master.FindControl("MainContent");
                if (contentPlaceHolder != null)
                {
                    HtmlInputControl quantityInput = (HtmlInputControl)contentPlaceHolder.FindControl("quantity");
                    if (quantityInput != null)
                    {
                        int cantidadArticulos = int.Parse(quantityInput.Value);

                        // Verificar si la cantidad de artículos a agregar es menor que la cantidad de imágenes disponibles
                        if (cantidadArticulos <= detalleArticulo.CantidadImagenes)
                        {
                            List<Articulo> carrito = (List<Articulo>)Session["Carrito"];

                            if (carrito == null)
                            {
                                carrito = new List<Articulo>();
                            }

                            Articulo articuloEnCarrito = carrito.FirstOrDefault(a => a.ID == detalleArticulo.ID);

                            if (articuloEnCarrito == null)
                            {
                                articuloEnCarrito = new Articulo
                                {
                                    ID = detalleArticulo.ID,
                                    IMAGEN = detalleArticulo.IMAGEN,
                                    NOMBRE = detalleArticulo.NOMBRE,
                                    PRECIO = detalleArticulo.PRECIO,
                                    Cantidad = cantidadArticulos
                                };

                                carrito.Add(articuloEnCarrito);
                            }
                            else
                            {
                                articuloEnCarrito.Cantidad += cantidadArticulos;
                            }

                            Session["Carrito"] = carrito;

                            Response.Redirect("Carrito.aspx");
                        }
                        else
                        {
                            // Mostrar mensaje de error si la cantidad de artículos a agregar es mayor que la cantidad de imágenes disponibles
                            Response.Write("La cantidad de artículos a agregar excede la cantidad disponible.");
                        }
                    }
                    else
                    {
                        Response.Write("No se pudo encontrar el campo de cantidad.");
                    }
                }
                else
                {
                    Response.Write("No se pudo encontrar el contenedor de contenido principal.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}