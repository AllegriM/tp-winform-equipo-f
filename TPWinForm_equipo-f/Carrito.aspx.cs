using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPWinForm_equipo_f
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected List<Articulo> listaArticulosEnCarrito = new List<Articulo>();
        protected float totalCarrito = 0; 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listaArticulosEnCarrito = (List<Articulo>)Session["Carrito"];
                if (listaArticulosEnCarrito == null)
                {
                    listaArticulosEnCarrito = new List<Articulo>();
                }
                ActualizarCarrito();
            }
        }

        protected void btnSumar_Click(object sender, EventArgs e)
        {
            // El objeto "sender" es un boton, se lo asigno al objeto boton local.
            Button btnIncrementar = (Button)sender;

            // El argumento del boton del dgv es el ID del articulo, utilizo eso para saber que articulo modificar.
            int articuloID = int.Parse((btnIncrementar.CommandArgument));

            listaArticulosEnCarrito = (List<Articulo>)Session["Carrito"];

            Articulo articuloEnCarrito = listaArticulosEnCarrito.FirstOrDefault(a => a.ID == articuloID);

            if (articuloEnCarrito != null)
            {
                articuloEnCarrito.Cantidad++;
            }

            ActualizarCarrito();
        }

        protected void btnRestar_Click(object sender, EventArgs e)
        {
             // El objeto "sender" es un boton, se lo asigno al objeto boton local.
             Button btnIncrementar = (Button)sender;

             // El argumento del boton del dgv es el ID del articulo, utilizo eso para saber que articulo modificar.
             int articuloID = Convert.ToInt32(btnIncrementar.CommandArgument);

             listaArticulosEnCarrito = (List<Articulo>)Session["Carrito"];

             Articulo articuloEnCarrito = listaArticulosEnCarrito.FirstOrDefault(a => a.ID == articuloID);

             if (articuloEnCarrito != null && articuloEnCarrito.Cantidad > 0)
             {
                 articuloEnCarrito.Cantidad--;
                if(articuloEnCarrito.Cantidad==0)
                {
                    listaArticulosEnCarrito.Remove(articuloEnCarrito);
                }
             }

             ActualizarCarrito();
        }

        private void ActualizarCarrito()
        {
            foreach (Articulo articulo in listaArticulosEnCarrito)
            {
                totalCarrito += (float)(articulo.Cantidad * articulo.PRECIO);
            }
            dgvCarrito.DataSource = listaArticulosEnCarrito;
            dgvCarrito.DataBind();
            Session["Carrito"] = listaArticulosEnCarrito;
        }

        protected void btnVaciarCarrito_Click(object sender, EventArgs e)
        {
            listaArticulosEnCarrito = (List<Articulo>)Session["Carrito"];

            if(listaArticulosEnCarrito!=null)
            {
                listaArticulosEnCarrito.Clear();
            }

            ActualizarCarrito();
        }

        protected void btnEliminarArticulo_Click(object sender, EventArgs e)
        {
            // El objeto "sender" es un boton, se lo asigno al objeto boton local.
            Button btnIncrementar = (Button)sender;

            // El argumento del boton del dgv es el ID del articulo, utilizo eso para saber que articulo modificar.
            int articuloID = Convert.ToInt32(btnIncrementar.CommandArgument);

            listaArticulosEnCarrito = (List<Articulo>)Session["Carrito"];

            Articulo articuloEnCarrito = listaArticulosEnCarrito.FirstOrDefault(a => a.ID == articuloID);

            listaArticulosEnCarrito.Remove(articuloEnCarrito);
             
            ActualizarCarrito();
        }
    }
}