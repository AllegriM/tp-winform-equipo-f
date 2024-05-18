using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

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
                Response.Write("ID de artículo no válido.");
            };
        }

        protected void btnAgregarCarrito_Click(object sender, EventArgs e)
        {
            try
            {
                // Creo una lista de articulos que estarán en el carrito, en sesión:
                List<Articulo> carrito = (List<Articulo>)Session["Carrito"];

                if(carrito == null)
                {
                    carrito = new List<Articulo>();
                }

                // Creo el objeto articulo que estará en el carrito.
                // Y ,si está en la lista segun su ID, le asigno los valores correspondientes.
                Articulo articuloEnCarrito = new Articulo();

                articuloEnCarrito = carrito.FirstOrDefault(a => a.ID == detalleArticulo.ID);

                if (articuloEnCarrito == null)
                {
                    articuloEnCarrito = new Articulo
                    {
                        ID = detalleArticulo.ID,
                        IMAGEN = detalleArticulo.IMAGEN,
                        NOMBRE = detalleArticulo.NOMBRE,
                        PRECIO = detalleArticulo.PRECIO,
                        Cantidad = 1
                    };

                    carrito.Add(articuloEnCarrito);
                }
                else 
                {
                    articuloEnCarrito.Cantidad++;
                }

                Session["Carrito"] = carrito;

                Response.Redirect("Carrito.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}