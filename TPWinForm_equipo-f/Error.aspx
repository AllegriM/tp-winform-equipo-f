<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPWinForm_equipo_f.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Error</title>
    <style>
        .error-container {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            min-height: 100vh;
            text-align: center;
        }
        .error-image {
            max-width: 300px;
        }
        .error-message {
            font-size: 1.5em;
            color: #333;
        }
        .btn-volver{
            background-color: dodgerblue;
            padding: 10px 5px;
            border-radius: 10px;
            color: white;
            text-decoration: none;
        }   
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container error-container">
            <img class="img-thumbnail error-image" src='<%= ResolveUrl("~/Images/sadface.png") %>' alt="Cara triste" />
            <p class="error-message mt-4">La página que estás buscando no se encuentra disponible.</p>
            <a href="/Default.aspx" class="btn-volver mt-3">Volver a la página principal</a>
        </div>
    </form>
</body>
</html>
