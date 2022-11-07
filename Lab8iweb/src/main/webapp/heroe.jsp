<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Beans.Heroe" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    ArrayList<Heroe> listaHeroes = (ArrayList<Heroe>) request.getAttribute("listaHeroes");
%>
<!DOCTYPE html>
<html lang="en">
    <head>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <script src="https://kit.fontawesome.com/600382161a.js" crossorigin="anonymous"></script>
        <title>Heroes</title>
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
        <br><br><br>
        <div class="d-flex justify-content-center">
            <div class="card"  style="background-color: rgba(240,240,240,0.6)">
                <div class="card-body">
                    <div>
                        <h4 style="text-align: center; color: black"><b>LISTA DE HEROES</b></h4>
                    </div>
                    <div>
                        <form method="post" class="d-flex input-group w-auto" role="search" id="floatingInput" aria-describedby="search-addon" action="<%=request.getContextPath()%>/MenuServlet?accion=buscarHeroe">
                            <input name="searchText" class="form-control me-2" type="text" placeholder="Buscar por nombre de héroe" aria-label="Search"  >
                            <button class="btn btn-outline-light" type="submit" style="color: darkslategray; border:1px solid white">Buscar</button>
                        </form>
                        <br>
                    </div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <a class="btn btn-danger" href="<%=request.getContextPath()%>/MenuServlet?accion=crearHeroe"
                           role="button">CREAR HÉROE</a>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr style="align-content: center">
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>ID</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>NOMBRE</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>EDAD</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>GENERO</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>CLASE</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>NIVEL</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>ATAQUE</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>PAREJA</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col" ><b>PUNTOS DE EXPERIENCIA</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>OPCIONES</b></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                for (Heroe heroe : listaHeroes) {
                            %>
                            <tr style="align-content: center">
                                <td style="padding-left: 2rem; text-align: center">
                                    <%=heroe.getIdHeroe()%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center">
                                    <%=heroe.getNombre()%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center">
                                    <%=heroe.getEdad()%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center">
                                    <% if (heroe.getGenero()==1){%>
                                    Hombre <%} else if (heroe.getGenero()==2) {%>
                                    Mujer <%} else if (heroe.getGenero()==3) {%>
                                    Otro

                                <%}%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center">
                                    <% if (heroe.getClase()==1){%>
                                    Normal <%} else if (heroe.getClase()==2) {%>
                                    Sayayin <%} else if (heroe.getClase()==3) {%>
                                    Hechicero <%} else if (heroe.getClase()==4) {%>
                                    Androide <%} else if (heroe.getClase()==5) {%>
                                    Namekusein <%} else if (heroe.getClase()==6) {%>
                                    Guerrero <%} else if (heroe.getClase()==7) {%>
                                    Zombie <%} else if (heroe.getClase()==8) {%>
                                    Ninja <%} else if (heroe.getClase()==9) {%>
                                    Fantasma <%} else if (heroe.getClase()==10) {%>
                                    Robot
                                    <%}%>
                                </td >
                                <td style="padding-left: 2rem; text-align: center">
                                    <%=heroe.getNivel()%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center">
                                    <%=heroe.getAtaque()%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center">
                                    <%=heroe.getPareja()%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center"><%
                                    int nivel= heroe.getNivel();
                                    DecimalFormat numeroFormateado = new DecimalFormat("#.00");
                                    if(nivel>0 && nivel<=15){
                                    double puntos=Math.pow(nivel,3) *  (24+(nivel+1.0)/3.0)/50.0;
                                    double valorfinal = Math.round(puntos*100d)/100d;%>
                                    <%=valorfinal%><%}else if (nivel>=16 && nivel<=35){
                                    double puntos=Math.pow(nivel,3) *  (14+nivel)/50.0;
                                    double valorfinal = Math.round(puntos*100d)/100d; %>
                                    <%=valorfinal%><%}else if (nivel>=36 && nivel<=100){
                                    double puntos=Math.pow(nivel,3) *  (32+nivel/2)/50.0;
                                    double valorfinal = Math.round(puntos*100d)/100d;%>
                                    <%=valorfinal%><%}%>

                                </td>

                                <td >

                                    <a type="button" class="btn btn-primary"
                                       href="<%=request.getContextPath()%>/MenuServlet?accion=editarHeroe&id=<%=heroe.getIdHeroe()%>">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor"
                                             class="bi bi-pencil" viewBox="0 0 16 16">
                                            <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"></path>
                                        </svg>
                                    </a>
                                    <a type="button" class="btn btn-danger"
                                       onclick="return confirm('¿Estas seguro(a) que deseas borrar?')"
                                       href="<%=request.getContextPath()%>/MenuServlet?accion=borrarHeroe&id=<%=heroe.getIdHeroe()%>">
                                        <i class="bi bi-trash"></i></a>
                                </td>



                            </tr>
                            <%

                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <br>
        <a class="btn btn-primary" href="<%=request.getContextPath()%>/MenuServlet?accion=MenuPrincipal" role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
        <br><br>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>

<!--
<table class="table table-striped">
<thead>
<tr>
<th style="color:#053934; padding-left: 2rem; text-align: center"><b>NOMBRE</b></th>
<th style="color:#053934; padding-left: 2rem; text-align: center"><b>EDAD</b></th>
<th style="color:#053934; padding-left: 2rem; text-align: center"><b>GENERO</b></th>
<th style="color:#053934; padding-left: 2rem; text-align: center"><b>CLASE</b></th>
<th style="color:#053934; padding-left: 2rem; text-align: center"><b>NIVEL</b></th>
<th style="color:#053934; padding-left: 2rem; text-align: center"><b>ATAQUE</b></th>
<th style="color:#053934; padding-left: 2rem; text-align: center"><b>PAREJA</b></th>
<th style="color:#053934; padding-left: 2rem; text-align: center"><b>OPCIONES</b></th>
</tr>
</thead>
<tbody>
<tr>
<for (Heroe heroe : listaHeroes) { %>
<td style="color:black; padding-left: 2rem; text-align: center"><b><=heroe.getNombre()%></b></td>
<td style="color:black; padding-left: 2rem; text-align: center"><b><=heroe.getEdad()%></b></td>
<td style="color:black; padding-left: 2rem; text-align: center"><b><=heroe.getGenero()%></b></td>
<td style="color:black;; padding-left: 2rem; text-align: center"><b><=heroe.getClase()%></b></td>
<td style="color:black; padding-left: 2rem; text-align: center"><b><=heroe.getNivel()%></b></td>
<td style="color:black; padding-left: 2rem; text-align: center"><b><=heroe.getAtaque()%></b></td>
<td style="color:black; padding-left: 2rem; text-align: center"><b><=heroe.getPareja()%></b></td>
< } %>
<td>
<div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
<a href="<=request.getContextPath()%>/MenuServlet?accion=index" type="button" class="btn btn-outline-secondary">Editar</a>
<a href="" type="button" class="btn btn-outline-secondary">Inventario</a>
<a type="button" class="btn btn-danger"
onclick="return confirm('¿Estas seguro(a) que deseas eliminar al heroe?')"
href="<=request.getContextPath()%>">Eliminar
</a>
</div>
</td>
</tr>
</tbody>
</table>
-->