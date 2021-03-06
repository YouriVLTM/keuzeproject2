<%-- 
    Document   : zoekhotel
    Created on : 20-mei-2019, 23:47:45
    Author     : Ruben
--%>

<%@page import="fact.it.www.beans.Periode"%>
<%@page import="fact.it.www.beans.Regio"%>
<%@page import="java.util.ArrayList"%>
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

        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">

                <div class="row">   

                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Zoek je hotel</h1></h1>

                        <%ArrayList<Regio> regios = (ArrayList<Regio>) request.getAttribute("alleRegios");%>
                        <%ArrayList<Periode> periodes = (ArrayList<Periode>) request.getAttribute("allePeriodes");%>
                        <%ArrayList<String> maaltijden = (ArrayList<String>) session.getAttribute("maaltijden");%>

                        <form action="ZoekHotelServlet">

                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <p>
                                        <label for="select">Hoeveel sterren moet het hotel hebben? <i class="fas fa-star"></i></label>
                                </div>
                                <div class="form-group col-md-3">
                                    <select class="form-control" name="select" id="select">
                                        <option value="1">1 ster</option>
                                        <option value="2">2 sterren</option>
                                        <option value="3">3 sterren</option>
                                        <option value="4">4 sterren</option>
                                        <option value="5">5 sterren</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <input type="submit" name="zoekHotelAantalSterren" value="zoeken op aantal sterren" class="btn btn-outline-primary">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <p>
                                        <label for="regio">In welke regio moet het hotel liggen?</label>
                                </div>
                                <div class="form-group col-md-3"> 
                                    <select class="form-control" name="regio" id="regio">
                                        <%for (Regio regio : regios) {%>
                                        <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <br>
                                <div class="form-group col-md-4">
                                    <input type="submit" name="zoekHotelRegio" value="zoeken op regio" class="btn btn-outline-primary">
                                </div>
                                </p>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <p>
                                        <label for="periode">In welke periode wilt u op vakantie gaan?</label>
                                </div>
                                <div class="form-group col-md-3"> 
                                    <select class="form-control" name="periode" id="periode">
                                        <%for (Periode periode : periodes) {%>
                                        <option value="<%=periode.getId()%>"><%=periode.getNaam()%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <br>
                                <div class="form-group col-md-4">
                                    <input type="submit" name="zoekHotelPeriode" value="zoeken op periode" class="btn btn-outline-primary">
                                </div>
                                </p>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <p>
                                        <label for="maaltijd">Welke maaltijd wilt u?</label>
                                </div>
                                <div class="form-group col-md-3"> 
                                    <select class="form-control" name="maaltijd" id="maaltijd">
                                        <%for (int i = 0; i < maaltijden.size(); i++) {%>
                                        <option value="<%=i%>"><%=maaltijden.get(i)%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <br>
                                <div class="form-group col-md-4">
                                    <input type="submit" name="zoekHotelMaaltijd" value="zoeken op maaltijd" class="btn btn-outline-primary">
                                </div>
                                </p>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <p><label for="hotelNaam">Naam van het hotel?<sup>(optioneel)</sup></label></p>
                                </div>
                                <div class="form-group col-md-3">    
                                    <input class="form-control" type="text" name="hotelNaam" id="hotelNaam">
                                </div>

                                <div class="form-group col-md-4">
                                    <input type="submit" name="zoekHotelNaam" value="zoeken op naam" class="btn btn-outline-primary">
                                </div>
                                </p>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <p><label for="ontspanning">Welke ontspanning wilt u?<sup>(optioneel)</sup></label></p>
                                </div>
                                <div class="form-group col-md-3">    
                                    <input class="form-control" type="text" name="ontspanning" id="ontspanning">
                                </div>
                                <br>
                                <div class="form-group col-md-4">
                                    <input type="submit" name="zoekHotelOntspanning" value="zoeken op ontspanning" class="btn btn-outline-primary">
                                </div>
                                </p>
                            </div>
                            <input type="submit" name="hotelZoeken"id="hotelZoeken" value="Zoeken" class="btn btn-outline-primary">                       
                        </form>
                        <a href="starthotels.jsp" class="btn btn-outline-primary mt-2">Terug naar de startpagina</a>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="temp/footer.jsp" />             
    </body>
</html>
