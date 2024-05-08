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
            int id = int.Parse(Request.QueryString["ID"]);
            ArticuloService negocio = new ArticuloService();
            detalleArticulo = negocio.listarArticuloXID(id);
        }
    }
}