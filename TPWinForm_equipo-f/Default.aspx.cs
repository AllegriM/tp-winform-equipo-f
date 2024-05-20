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
        public List<Categoria> listaCategorias = new List<Categoria>();
        public List<Marca> listaMarcas = new List<Marca>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CategoriaService categoriaService = new CategoriaService();
                ArticuloService negocio = new ArticuloService();
                MarcaService marcaService = new MarcaService();
                listaArticulos = negocio.ListarArticulos();
                listaCategorias = categoriaService.listar();
                listaMarcas = marcaService.listar();
                Session["Articulos"] = listaArticulos;
                Session["Categorias"] = listaCategorias;  // Save categories to session for later use
                Session["Marcas"] = listaMarcas; 
                categoria.DataSource = listaCategorias;
                categoria.DataTextField = "Descripcion";
                categoria.DataValueField = "Id";
                categoria.DataBind();
                categoria.Items.Insert(0, new ListItem("Todos", "todos")); // Add "Todos" option
                marca.DataSource = listaMarcas;
                marca.DataTextField = "Descripcion";
                marca.DataValueField = "Id";
                marca.DataBind();
                marca.Items.Insert(0, new ListItem("Todas las marcas", "todas"));

                MostrarArticulos(listaArticulos);
            }
        }


        protected void SelectCategoria(object sender, EventArgs e)
        {
            listaArticulos = (List<Articulo>)Session["Articulos"];
            string selectedCategory = categoria.SelectedValue;

            List<Articulo> listaArticulosFiltrados;
            if (selectedCategory == "todos")
            {
                listaArticulosFiltrados = listaArticulos;
            }
            else
            {
                listaArticulosFiltrados = listaArticulos.Where(a => a.CATEGORIA.Id.ToString() == selectedCategory).ToList();
            }

            MostrarArticulos(listaArticulosFiltrados);
        }

        protected void SelectMarca(object sender, EventArgs e)
        {
            listaArticulos = (List<Articulo>)Session["Articulos"];
            string selectedMarca = marca.SelectedValue;

            List<Articulo> listaArticulosFiltrados;
            if (selectedMarca == "") // Si se selecciona "Todas las marcas"
            {
                listaArticulosFiltrados = listaArticulos;
            }
            else
            {
                listaArticulosFiltrados = listaArticulos.Where(a => a.MARCA.Id.ToString() == selectedMarca).ToList();
            }

            MostrarArticulos(listaArticulosFiltrados);
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
