<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="TPWinForm_equipo_f.Detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>DETALLE</h1>
    <div class="card" style="width: 18rem;">
      <img class="card-img-top" src="<%:detalleArticulo.IMAGEN.Url%>" alt="<%:detalleArticulo.NOMBRE%>">
      <div class="card-body">
        <h5 class="card-title"><%:detalleArticulo.NOMBRE%></h5>
        <p class="card-text"><%:detalleArticulo.DESCRIPCION%></p>
        <a href="#" class="btn btn-primary">Go somewhere</a>
      </div>
    </div>
</asp:Content>
