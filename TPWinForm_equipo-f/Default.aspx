<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWinForm_equipo_f._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
         <h1>CARRITO DE COMPRAS</h1>
        <asp:GridView ID="dgvArticulos" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID"/>
                <asp:BoundField HeaderText="CODIGO" DataField="CODIGO" />
                <asp:BoundField HeaderText="NOMBRE" DataField="NOMBRE" />
                <asp:BoundField HeaderText="DESCRIPCION" DataField="DESCRIPCION" />
                <asp:BoundField HeaderText="IMAGENES" DataField="IMAGEN.url" />
                <asp:BoundField HeaderText="CATEGORIA" DataField="CATEGORIA.descripcion" />
                <asp:BoundField HeaderText="MARCA" DataField="MARCA.Descripcion" />
                <asp:BoundField HeaderText="PRECIO" DataField="PRECIO" />
            </Columns>
        </asp:GridView>
    </main>

</asp:Content>
