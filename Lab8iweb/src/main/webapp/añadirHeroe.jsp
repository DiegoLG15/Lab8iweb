<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Beans.Heroe" %>
<%@ page import="java.util.ArrayList" %>

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
                bgcolor : "#800000";
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <head/>
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
        <br><br><br><br>
        <main id="main">
            <section class="section profile">
                <div class="container">
                    <div class="container-fluid " style="background-color: rgba(255,255,255,0.6);width: 65%">

                        <div class="row">
                            <div >
                                <center>
                                    <h4><b style="color:#144C47">CREAR HEROE:</b></h4>
                                </center>
                            </div>
                            <div class="col-md-6">
                                <td>
                                    <img src="https://img.freepik.com/vector-premium/mago-o-hechicero-baston-magico-o-varita-ilustracion-vectorial-plana-aislada_181313-2815.jpg?w=740" class="rounded mx-auto d-block " alt="userphoto" height="400rem" width="200rem">
                                </td>
                            </div>
                            <div class="col-md-6">
                                <form method="post" action="<%=request.getContextPath()%>/MenuServlet?accion=guardarHeroe" class="row g-3">
                                    <td style="padding-left: 2rem;">


                                        <ul class="list-group list-group-flush">


                                            <label for="nombre" class="form-label" >NOMBRE</label>
                                            <input maxlength="10" type="text" class="form-control" id="nombre" placeholder="nombre"
                                                   name="nombre" >

                                        </ul>

                                        <ul class="list-group list-group-flush">

                                            <label for="edad" class="form-label">EDAD:</label>
                                            <input type="number" min="8" max="999" class="form-control" id="edad" placeholder="edad"
                                                   name="edad" >
                                        </ul>
                                        <ul class="list-group list-group-flush">

                                            <label for="genero" class="form-label">GÉNERO:</label>
                                            <select class="form-select" id="genero" placeholder="genero" name="genero">
                                                <option selected>Seleccione una opción</option>
                                                <option value="Hombre">Hombre</option>
                                                <option value="Mujer">Mujer</option>
                                                <option value="Otro">Otro</option>
                                            </select>

                                        </ul>
                                        <ul class="list-group list-group-flush">

                                            <label for="clase" class="form-label">CLASE:</label>
                                            <select class="form-select" id="clase" placeholder="clase" name="clase">
                                                <option selected>Seleccione una opción</option>
                                                <option value="Normal">Normal</option>
                                                <option value="Sayayin">Sayayin</option>
                                                <option value="Hechicero">Hechicero</option>
                                                <option value="Androide">Androide</option>
                                                <option value="Namekusein">Namekusein</option>
                                                <option value="Guerrero">Guerrero</option>
                                                <option value="Zombie">Zombie</option>
                                                <option value="Ninja">Ninja</option>
                                                <option value="Fantasma">Fantasma</option>
                                                <option value="Robot">Robot</option>
                                            </select>

                                        </ul>
                                        <ul class="list-group list-group-flush">

                                            <label for="nivel" class="form-label">NIVEL:</label>
                                            <input type="number" min="1" max="100" class="form-control" id="nivel" placeholder="nivel"
                                                   name="nivel" >

                                        </ul>
                                        <ul class="list-group list-group-flush">

                                            <label for="ataque" class="form-label">ATAQUE:</label>
                                            <input type="number" min="1" class="form-control" id="ataque" placeholder="ataque"
                                                   name="ataque" >

                                        </ul>
                                        <ul class="list-group list-group-flush">

                                            <label for="pareja" class="form-label">PAREJA:</label>
                                            <input type="text" class="form-control" id="pareja" placeholder="pareja"
                                                   name="pareja" >

                                        </ul>
                                        <ul class="list-group list-group-flush">
                                            <div class="d-grid gap-2 col-6 col-lg-4 col-xl-3 mx-auto">
                                                <button class="btn btn-danger" type="submit">Crear</button>
                                            </div>
                                            <div class="d-grid gap-2 col-3 col-lg-4 col-xl-3 mx-auto">
                                                <a class="btn btn-secondary" href="<%=request.getContextPath()%>/MenuServlet?accion=MenuDeHeroes">Regresar</a>
                                            </div>
                                        </ul>
                                    </td>


                                </form>
                            </div>
                        </div>

                    </div>

                </div>
            </section>
        </main>
</html>






<!--
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
                        <h4><b style="color:#144C47">CREAR HÉROE</b></h4>
                    </center>
                </div>
                <table>
                    <div>
                        <td>
                            <img src="https://cdnb.artstation.com/p/assets/images/images/031/262/015/large/seo-eaglesage-firemagecasuallsmall.jpg?1603114058" class="rounded mx-auto d-block " alt="userphoto" height="400rem" width="200rem">
                        </td>
                        <form method="post" action="=request.getContextPath()%>/MenuServlet?accion=guardarHeroe">

                            <div class="list-group list-group-flush">
                                <label for="ID Heroe" class="form-label">ID:</label>
                                <input type="text" placeholder="ID Heroe" id="ID Heroe" name = "ID Heroe" >
                            </div>
                            <div class="list-group list-group-flush">
                                <label for="nombre" class="form-label">NOMBRE:</label>
                                <input type="text" class="form-control" placeholder="nombre"  id="nombre" name="nombre">
                            </div>
                            <br>
                            <div class="list-group list-group-flush">
                                <label for="edad" class="form-label">EDAD:</label>
                                <input type="text" class="form-control"  placeholder="edad" id="edad" name="edad" >
                            </div>
                            <br>
                            <div class="list-group list-group-flush">
                                <label for="genero" class="form-label">GÉNERO:</label>
                                <input type="text" class="form-control" placeholder="genero" id="genero" name="genero" >
                            </div>
                            <br>
                            <div class="list-group list-group-flush">
                                <label for="clase" class="form-label">CLASE:</label>
                                <input type="text" class="form-control" placeholder="clase" id="clase" name="clase" >
                            </div>
                            <br>
                            <div class="list-group list-group-flush">
                                <label for="nivel" class="form-label">NIVEL:</label>
                                <input type="text" class="form-control" placeholder="nivel" id="nivel" name="nivel" >
                            </div>
                            <br>
                            <div class="list-group list-group-flush">
                                <label for="ataque" class="form-label">ATAQUE:</label>
                                <input type="text" class="form-control" placeholder="ataque" id="ataque" name="ataque" >
                            </div>
                            <br>
                            <div class="list-group list-group-flush">
                                <label for="pareja" class="form-label">PAREJA:</label>
                                <input type="text" class="form-control"  placeholder="pareja" id="pareja" name="pareja" >
                            </div>
                            <br>

                        </form>
                    </div>
                </table>
            </div>
        </div>
    </div>
    <br>
    <form>
        <div class="d-flex justify-content-center">
            <button type="submit" class="btn btn-danger">Crear</button>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <br>
    <a class="btn btn-primary" href="%=request.getContextPath()%>/MenuServlet" role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
    <br><br>
</body>
-->