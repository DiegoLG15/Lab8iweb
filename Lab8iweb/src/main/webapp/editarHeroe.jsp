<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Beans.Heroe" %>
<%@ page import="java.util.ArrayList" %>
<%
Heroe heroe = (Heroe) request.getAttribute("hereoeEditar");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Editar Heroes</title>
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
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <h4><li><a href="#" class="nav-link px-2"><b style="color:#144C47">WIKI FANTASIA</b></a></li></h4>
            </ul>
        </div>
    </div>
</header>
<br><br><br>
<div class="d-flex justify-content-center">
    <div class="card">
        <div class="card-body">
            <div >
                <center>
                    <h4><b style="color:#144C47">EDITAR HEROE</b></h4>
                </center>
            </div>
            <table>
                <tr>
                    <td><img src="https://cdnb.artstation.com/p/assets/images/images/031/262/015/large/seo-eaglesage-firemagecasuallsmall.jpg?1603114058" class="rounded mx-auto d-block " alt="userphoto" height="400rem" width="200rem">
                    </td>
                    <td style="padding-left: 2rem;">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color: black"><b>Nombre:</b></li>
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color: black"><b>Edad:</b></li>
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color:black"><b>Genero:</b></li>
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color:black"><b>Clase:</b></li>
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color:black"><b>Nivel:</b></li>
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color:black"><b>Ataque:</b></li>
                        </ul>
                        <br>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="border-radius: 10%;color:black"><b>Pareja:</b></li>
                        </ul>
                        <br>
                    </td>
                    <form method="post" action="<%=request.getContextPath()%>/MenuServlet?accion=actualizarHeroe">
                        <td style="padding-left: 2rem;">
                            <ul class="list-group list-group-flush">
                                <input type="hidden" id="ID Heroe" name = "ID Heroe"  value="<%=heroe.getIdHeroe()%>">
                            </ul>
                            <ul class="list-group list-group-flush">
                                <input type="text" class="form-control"   id="nombre" name="nombre"  value="<%=heroe.getNombre()%>">
                            </ul>
                            <br>
                            <ul class="list-group list-group-flush">
                                <input type="text" class="form-control"   id="edad" name="edad"  value="<%=heroe.getEdad()%>">
                            </ul>
                            <br>
                            <ul class="list-group list-group-flush">
                                <input type="text" class="form-control"  id="genero" name="genero"  value="<%=heroe.getGenero()%>">
                            </ul>
                            <br>
                            <ul class="list-group list-group-flush">
                                <input type="text" class="form-control"  id="clase" name="clase"  value="<%=heroe.getClase()%>">
                            </ul>
                            <br>
                            <ul class="list-group list-group-flush">
                                <input type="text" class="form-control"  id="nivel" name="nivel"  value="<%=heroe.getNivel()%>">
                            </ul>
                            <br>
                            <ul class="list-group list-group-flush">
                                <input type="text" class="form-control"  id="ataque" name="ataque"  value="<%=heroe.getAtaque()%>">
                            </ul>
                            <br>
                            <ul class="list-group list-group-flush">
                                <input type="text" class="form-control"   id="pareja" name="pareja"  value="<%=heroe.getPareja()%>">
                            </ul>
                            <br>
                        </td>
                    </form>
                </tr>
            </table>
        </div>
    </div>
</div>
<br>
<form>
    <div class="d-flex justify-content-center">
        <button type="submit" class="btn btn-danger">Actualizar</button>
    </div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<br></br>
<a class="btn btn-primary" href="<%=request.getContextPath()%>/MenuServlet" role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
<br><br>
</body>
</html>