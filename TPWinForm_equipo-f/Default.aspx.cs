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
            if (!IsPostBack)
            {
                ArticuloService negocio = new ArticuloService();
                listaArticulos = negocio.ListarArticulos();
                Session["Articulos"] = listaArticulos;
                MostrarArticulos(listaArticulos);
            }
        }

        protected void txtBuscador_TextChanged(object sender, EventArgs e)
        {
            listaArticulos = (List<Articulo>)Session["Articulos"];
            
            // Se lleva a minusculas para evitar cualquier tipo de diferencias, lo mismo con en el "where()".
            string filtro = txtBuscador.Text.ToLower();

            var listaArticulosFiltrados = listaArticulos.Where(a => a.NOMBRE.ToLower().Contains(filtro)).ToList();

            MostrarArticulos(listaArticulosFiltrados);
            
        }

        private void MostrarArticulos(List<Articulo> listaArticulos)
        {
            rptArticulos.DataSource = listaArticulos;
            rptArticulos.DataBind();
        }
    }
}