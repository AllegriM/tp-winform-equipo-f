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
    }
}