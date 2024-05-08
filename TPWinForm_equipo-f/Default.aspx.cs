using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace TPWinForm_equipo_f
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloService negocio = new ArticuloService();
            dgvArticulos.DataSource = negocio.ListarArticulos();
            dgvArticulos.DataBind();
        }
    }
}