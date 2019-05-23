<%-- 
    Document   : hoteldetails
    Created on : 20-mei-2019, 14:10:01
    Author     : Ruben
--%>

<%@page import="fact.it.www.beans.Regio"%>
<%--@page import="java.lang.Integer.parseInt(String)"--%>
<%@page import="fact.it.www.beans.Hotel"%>
<%@page import="java.util.ArrayList"%>
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
        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">

                <div class="row">               

                    <div class="col-lg-12 contact-left-form">

                        <%Hotel hotel = (Hotel) request.getAttribute("hotelIdZoek");%>
                        <%Regio regio = (Regio) request.getAttribute("regioIdZoek");%>

                        <h1 class="heading text-center mb-5">Details van het hotel</h1>

                        <div class="row mb-5">
                            <div class="col-6">
                                <% if (hotel.getFoto() != "") {%>
                                <img src="images/<%=hotel.getFoto()%>" onerror="this.src='images/noPic.png'" class="img-fluid w-100"/>
                                <%}%>
                            </div>
                            <div class="col-6">

                                <% if (hotel.getNaam() != "") {%>
                                <p>Naam: <a href="HotelServlet?zoekPrijs=1&zoekPrijsHotelNaam=<%=hotel.getNaam()%>"><%=hotel.getNaam()%></a> </p>  
                                <%} else { %>
                                <p>Er is geen naam gegeven</p>
                                <%}%>
                                <% if (hotel.getAantalSterren() != 0) {%>
                                <p>Aantal sterren: <%=hotel.getAantalSterren()%> </p>
                                <%if (hotel.getAantalSterren() == 5) { %>
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
                                    <% }%>
                                    <%if (hotel.getAantalSterren() == 4) { %>
                                <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i></p>
                                        <% }%>
                                        <%if (hotel.getAantalSterren() == 3) { %>
                                <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></p>
                                        <% }%>
                                        <%if (hotel.getAantalSterren() == 2) { %>
                                <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></p>
                                        <% }%>
                                        <%if (hotel.getAantalSterren() == 1) { %>
                                <p><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></p>
                                        <% }%>
                                        <%} else { %>
                                <p>Aantal sterren niet gevonden</p>
                                <%}%>
                                <% if (hotel.getOntspanning() != "") {%>
                                <p>ontspanningsmogelijkheden</p> 
                               
                                <ul>
                                    <%-- De string van ontspaningen scheiden adhv een komma --> anders lijst te lang --%>
                                    <% String[] separated = hotel.getOntspanning().split("\\, |\\. ");
                                        for (int i = 0; i < separated.length; i++) {%>
                                        <li><p>- <%= separated[i].substring(0, 1).toUpperCase() + separated[i].substring(1).toLowerCase()%></p></li>
                                        <%}%>
                                </ul>
                                <%} else { %>
                                <p>Geen ontspanningsmogelijkheden gevonden</p>
                                <%}%>
                                <% if (regio != null) {%>
                                <p> Regio : <%=regio.getNaam()%></p>
                                <%} else { %>
                                <p>Er is geen regio gegeven</p>
                                <%}%>
                                <% if (hotel.getLigging() != "") {%>
                                <p>Ligging: <%=hotel.getLigging()%> </p> 
                                <%} else { %>
                                <p>Geen ligging gevonden</p>
                                <%}%>
                            </div>
                        </div>                           
                        <a class="btn btn-outline-primary" href="starthotels.jsp">Terug naar startpagina hotels</a>
                    </div>          

                </div>
            </div>
        </section>
        <jsp:include page="temp/footer.jsp" />
    </body>
</html>