<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Inicio Última Fantasía</title>
    <style>
        body {
            background: url(https://img.freepik.com/premium-photo/unicorn-background-with-rainbow-sky-fantasy-colorful-space-galaxy-illustration_71374-1570.jpg?w=2000);
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            height: 100vh;
            bgcolor = "#800000";
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<header class="d-flex p-2" style="background-color: rgba(255,255,255,0.6)">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="40" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <h4><li><a href="#" class="nav-link px-2"><b style="color:#144C47">WIKI FANTASIA</b></a></li></h4>
                <!--
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                        <img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" alt="mdo" width="32" height="32" class="rounded-circle">
                    </a>
                </div>
                -->
            </ul>
        </div>
    </div>
</header>
<p></p>
<p></p>
<div class="d-flex justify-content-center">
    <center>
        <p></p>
        <p></p>
        <div class="card" style="width: 50rem; background-color:#00000090">
            <p></p>
            <p></p>
            <h1 style="font-family: monospace; font-weight: bold; color: white" class="card-title"><b>ÚLTIMA FANTASIA</b></h1>
            <p></p>
            <p></p>
            <p></p>
            <h4 style="font-family: 'KrinkesDecorPERSONAL'; color:#FFFFFF" class="card-text"><b> SELECCIONE UNA OPCIÓN </b></h4>
            <p></p>
            <div class="d-grid gap-2 col-8 mx-auto">
                <a href="<%=request.getContextPath()%>/MenuServlet?accion=MenuDeHeroes" style="color: rgb(141, 15, 15);"><button class="btn btn-light" type="button" class="btn btn-secondary" style="color:#404546 ; width: 15rem; font-size: 15px"><b>Heroes</b></button></a>
                <a href="<%=request.getContextPath()%>/MenuServlet?accion=MenuDeEnemigos" style="color: rgb(141, 15, 15);"><button class="btn btn-light" type="button" style="color:#404546; width: 15rem; font-size: 15px;"><b>Enemigos</b></button></a>
                <a href="<%=request.getContextPath()%>/MenuServlet?accion=MenuDeHechizos" style="color: rgb(141, 15, 15);"><button class="btn btn-light" type="button" class="btn btn-secondary" style="color:#404546 ; width: 15rem; font-size: 15px"><b>Hechizos</b></button></a>
                <a href="crear_cuenta_nueva.html" style="color: rgb(141, 15, 15);"><button class="btn btn-light" type="button" style="color:#404546; width: 15rem; font-size: 15px;"><b>Objetos</b></button></a>
                <p></p>
                <p></p>
            </div>
        </div>
        <center>
</div>
</body>

</html>