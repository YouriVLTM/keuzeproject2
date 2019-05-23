
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Startpagina admin</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <jsp:include page="temp/head.jsp" />
    </head>  
    <body>
        <jsp:include page="temp/nav.jsp" />

        <!-- banner -->
        <section class="banner_inner" id="home">
            <div class="banner_inner_overlay">
            </div>
        </section>

        <div class="row justify-content-md-center">                 
            <section class="packages pt-5">
                <div class="container py-lg-4 py-sm-3">

                    <div class="row justify-content-md-center">                 
                        <h1 class="heading text-center mb-2">Meer <strong>informatie</strong> kennen ?</h1>
                    </div>
                    <form action="ManageServlet" >
                        <div class="row justify-content-md-center"> 
                            <p>Wil je de details van een regio bekijken?</p>
                        </div>
                        <div class="row justify-content-md-center"> 
                            <p><input class="btn btn-outline-primary" type="submit" value="Regio bekijken" /></p>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
