<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Beans.Hechizo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Daos.HechizoDao" %>

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
  </head>
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
                  <h4><b style="color:#144C47">CREAR HECHIZO:</b></h4>
                </center>
              </div>
              <div class="col-md-6">
                <td>
                  <br><br><br>
                  <img src="https://cdnb.artstation.com/p/assets/images/images/025/147/925/large/seo-eaglesage-11012020-ext-temple-3-1.jpg?1584801782" class="rounded mx-auto d-block " alt="userphoto" height="450rem" width="400rem">
                </td>
              </div>
              <div class="col-md-6">
                <form  method="post" action="<%=request.getContextPath()%>/MenuServlet?accion=guardarHechizo" class="row g-3">
                  <td style="padding-left: 2rem;">


                    <ul class="list-group list-group-flush">


                      <label for="idHechizo" class="form-label" >Hechizo ID</label>
                      <input required maxlength="10" type="text" class="form-control" id="idHechizo" placeholder="idHechizo"
                             name="idHechizo" >

                    </ul>

                    <ul class="list-group list-group-flush">

                      <label for="nombreHechizo" class="form-label">Nombre:</label>
                      <input required type="text" class="form-control" id="nombreHechizo" placeholder="nombreHechizo"
                             name="nombreHechizo" >
                    </ul>
                    <ul class="list-group list-group-flush">

                      <label for="genero" class="form-label">ELEMENTO:</label>
                      <select required class="form-select" id="genero" placeholder="genero" name="genero">
                        <option value="">Seleccione una opción</option>
                        <option value="Hombre">1-Fuego</option>
                        <option value="Mujer">2-Tierra</option>
                        <option value="Otro">3-Agua</option>
                        <option value="Mujer">4-Viento</option>
                        <option value="Otro">5-Aire</option>
                      </select>

                    </ul>
                    <ul class="list-group list-group-flush">

                      <label for="potenciaDeHechizo" class="form-label">Potencia:</label>
                      <input required type="number" min="8" max="999" class="form-control" id="potenciaDeHechizo" placeholder="potenciaDeHechizo"
                             name="potenciaDeHechizo" >
                    </ul>
                    <ul class="list-group list-group-flush">

                      <label for="precisionDeHechizo" class="form-label">Precisión</label>
                      <input required type="number" min="1" max="100" class="form-control" id="precisionDeHechizo" placeholder="precisionDeHechizo"
                             name="precisionDeHechizo" >

                    </ul>
                    <ul class="list-group list-group-flush">

                      <label for="hechizoBase" class="form-label">Hechizo base:</label>
                      <input required type="number" min="1" class="form-control" id="hechizoBase" placeholder="hechizoBase"
                             name="hechizoBase" >

                    </ul>
                    <ul class="list-group list-group-flush">

                      <label for="nivelAprendizaje" class="form-label">Nivel de aprendizaje:</label>
                      <input required type="number" min="1" class="form-control" id="nivelAprendizaje" placeholder="nivelAprendizaje"
                             name="nivelAprendizaje" >
                    </ul>
                    <ul class="list-group list-group-flush">
                      <div class="d-grid gap-2 col-6 col-lg-4 col-xl-3 mx-auto">
                        <button class="btn btn-danger" type="submit">Crear Hechizo</button>
                      </div>
                      <div class="d-grid gap-2 col-3 col-lg-4 col-xl-3 mx-auto">
                        <a class="btn btn-secondary" href="<%=request.getContextPath()%>/MenuServlet?accion=MenuDeHechizos">Regresar</a>
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
</html>