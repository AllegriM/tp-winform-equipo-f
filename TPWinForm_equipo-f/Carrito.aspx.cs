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
        List<Articulo> listaArticulosEnCarrito = new List<Articulo>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listaArticulosEnCarrito = (List<Articulo>)Session["Carrito"];
                if (listaArticulosEnCarrito == null)
                {
                    listaArticulosEnCarrito = new List<Articulo>();
                }
                dgvCarrito.DataSource = listaArticulosEnCarrito;
                dgvCarrito.DataBind();
            }
        }
    }
}