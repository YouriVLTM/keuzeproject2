<%-- 
    Document   : starthotels
    Created on : 20-mei-2019, 10:32:25
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="temp/head.jsp" />
    <body>
        <jsp:include page="temp/nav.jsp" />
        <section class="banner_inner" id="home">
            <div class="banner_inner_overlay">
            </div>
        </section>
        <section class="book py-5">
            <div class="container py-lg-5 py-sm-3">
                <h2 class="heading text-capitalize text-center">Hotel zoeken</h2>            

                <form action="HotelServlet" >                

                    <div class="form-row mt-5 justify-content-center">

                        <div class="col-8 contact-forms mb-3">
                            <label for="naam" class="text-white ml-2">Ga op zoek naar uw hotel</label> 
                            <input type="text" class="form-control" name="hotelNaam" id="hotelNaam" placeholder="Geef de begin letters in">

                        </div>
                        <div class="col-8">
                            <input class="btn btn-outline-light mb-2 btn-lg mr-3"  type="submit" value="Zoeken naar uw specifiek hotel" name="zoekHotel">
                            <a href="HotelServlet?toonspecifiek=1" class="btn btn-outline-light mb-2 btn-lg">Zoek op hotel id 1</a>

                        </div>
                    </div>
                </form>           
        </section>
        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">

                <div class="row">               

                    <div class="col-lg-12 contact-left-form">

                        <div class="row mt-2">
                            <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree text-center mb-5">
                                <div class="ser-fashion-grid">
                                    <div class="about-icon mb-md-4 mb-3">
                                        <span class="far fa-building fa-3x" aria-hidden="true"></span>
                                    </div>
                                    <div class="ser-sevice-grid mb-3">
                                        <h4 class="pb-3">Overzicht Hotels</h4>
                                        <p>Hier kan je alle hotels bekijken die beschikbaar zijn</p>
                                    </div>
                                    <a href="HotelServlet?toonhotels=1" class="btn btn-outline-primary mx-1">Toon alle Hotels</a>

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree text-center mb-5">
                                <div class="ser-fashion-grid">

                                    <div class="about-icon mb-md-4 mb-3">
                                        <span class="fas fa-search fa-3x" aria-hidden="true"></span>
                                    </div>
                                    <div class="ser-sevice-grid mb-3">
                                        <h4 class="pb-3">Uitgebreid zoeken</h4>
                                        <p>Hier kan je uitgebreid op hotels zoeken. Doormiddel van een aantal criteria die je zelf kan invoeren. En zo dan het hotel vinden dat bij jou past.</p>
                                    </div>
                                    <a href="HotelServlet?uitgebreid=1" class="btn btn-outline-primary mx-1">Uitgebreid zoeken</a>      

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree text-center mb-5">
                                <div class="ser-fashion-grid">
                                    <div class="about-icon mb-md-4 mb-3">
                                        <span class="fas fa-user-shield fa-3x" aria-hidden="true"></span>
                                    </div>
                                    <div class="ser-sevice-grid mb-3">
                                        <h4 class="pb-3">Admin Pagina</h4>
                                        <p>Hier kan je doorgaan naar de admin pagina. Zo kan je hotels aanpassen, verwijderen en toevoegen</p>
                                    </div>
                                    <a href="HotelServlet?pasAanDelete=1" class="btn btn-outline-primary mx-1">Admin overzicht</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
