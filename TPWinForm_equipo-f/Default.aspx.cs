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
    public partial class _Default : Page
    {
        public List<Articulo> listaArticulos = new List<Articulo>();
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloService negocio = new ArticuloService();
            listaArticulos = negocio.ListarArticulos();
            
        }
    }
}