<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="temp/head.jsp" />

    <body>
        <jsp:include page="temp/nav.jsp" />

        <!-- banner -->
        <section class="banner_inner" id="home">
            <div class="banner_inner_overlay">
            </div>
        </section>

        <!-- tour packages -->
        <div class="row justify-content-md-center">                 
            <section class="packages pt-5">
                <div class="container py-lg-4 py-sm-3">

                    <div class="row justify-content-md-center">               

                        <div class="col-lg-12 contact-left-form">
                            <h1 class="heading text-center mb-5">Lekker genieten op <strong>vakantie</strong></h1>
                            <div class="row">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <p>
                                        <a href="startparken.jsp" class="btn btn-outline-primary">Startpagina vakantieparken</a>
                                        <a href="starthotels.jsp" class="btn btn-outline-primary">Startpagina hotels</a>
                                        <a href="admin.jsp" class="btn btn-outline-primary">Informatie over regio's</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- tour packages -->
        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
