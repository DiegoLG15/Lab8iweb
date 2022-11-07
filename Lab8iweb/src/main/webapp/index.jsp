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
            bgcolor: "#800000";
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
            </ul>
        </div>
    </div>
</header>
<p></p>
<p></p>
<div class="d-flex justify-content-center">
    <center>
        <br>
        <div class="card" style="width: 45rem; background-color:#00000090">
            <br>
            <h1 style="font-family: monospace; font-weight: bold; color: white" class="card-title"><b>ÚLTIMA FANTASIA</b></h1>
            <br>
            <h5 style="font-family: 'KrinkesDecorPERSONAL'; color:#FFFFFF" class="card-text"><b> SELECCIONE UNA OPCIÓN </b></h5>
            <br>
            <br>
            <div class="row row-cols-1 row-cols-md-2 g-4">
                <div class="col">
                    <div class="card h-100">
                        <img class="card-img-top" height="300" src="https://cdnb.artstation.com/p/assets/images/images/028/820/243/20200724110900/smaller_square/seo-eaglesage-290520-cha-protectivepriestesssmall.jpg?1595606941" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">HEROES</h5>
                            <p class="card-text">Los héroes están dispuestos a arriesgar su vida por mantener la armonía del mundo. </p>
                            <a href="<%=request.getContextPath()%>/MenuServlet?accion=MenuDeHeroes" class="btn btn-dark">Conoce mas</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img class="card-img-top" height="300" src="https://cdnb.artstation.com/p/assets/images/images/031/132/051/20201014114802/smaller_square/seo-eaglesage-040320-cha-owlpriest-300dpi.jpg?1602694082" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">ENEMIGOS</h5>
                            <p class="card-text">Los enemigos son seres malignos dispuestos a destruir a los héroes. </p>
                            <a href="<%=request.getContextPath()%>/MenuServlet?accion=MenuDeEnemigos" class="btn btn-dark">Conoce mas</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img class="card-img-top" height="300" src="https://mir-s3-cdn-cf.behance.net/project_modules/disp/9e5ed6147205377.62bddfd0b0679.png" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">HECHIZOS</h5>
                            <p class="card-text"> Los hechizos son poderosas armas elementales que se usan
                                para la guerra. </p>
                            <a href="<%=request.getContextPath()%>/MenuServlet?accion=MenuDeHechizos" class="btn btn-dark">Conoce mas</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img class="card-img-top" height="300" src="https://cdna.artstation.com/p/assets/images/images/026/276/972/large/seo-eaglesage-090420-prp-candleholder.jpg?1588347521" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">OBJETOS</h5>
                            <p class="card-text">Lista de objetos que utilizan los heroes y los enemigos en la guerra.</p>
                            <a href="lab8_heroes.html " class="btn btn-dark">Conoce mas</a>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
        </div>
    </center>
</div>
</body>

</html>