<%-- 
    Document   : overzichtHotels
    Created on : 20-mei-2019, 14:03:26
    Author     : Ruben
--%>

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
        <!-- tour packages -->
        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">
                <h2 class="heading text-capitalize text-center mb-5">Overzicht Hotels</h2>

                <%ArrayList<Hotel> hotels = (ArrayList<Hotel>) request.getAttribute("hotels");%>

                <% if (hotels != null) { %>
                <div class="row">
                    <% for (Hotel hotel : hotels) {%>
                    <div class="col-lg-6 col-md-6 mb-5">
                        <div class="package-info h-100">
                            <div class="row">
                                <div class="col-12 text-center">
                                    <h3 class="my-2"><span><%=hotel.getNaam()%></span></h3> 
                                    <br>
                                </div>
                                <div class="col-6">
                                    <img src="images/<%=hotel.getFoto()%>" class="rounded img-fluid" style="width: 250px" onerror="this.src='images/noPic.png'"/>
                                </div>
                                <div class="col-6">
                                    <p>Aantal sterren: <%=hotel.getAantalSterren()%> </p> 
                                    <a href="HotelServlet?hotelId=<%=hotel.getId()%>">meer info</a>
                                    <%if (hotel.getAantalSterren() == 5) { %>
                                    <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
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
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
                <%} else {%>
                <p>Er is geen park gevonden</p>        
                <%}%>
                <a href="HotelServlet?uitgebreid=1" class="btn btn-outline-primary">Terug naar zoekfunctie</a>
                <%--<a href="zoekhotel.jsp" class="btn btn-outline-primary">Terug naar zoekfunctie</a>--%>
                <a href="index.jsp" class="btn btn-outline-primary">Terug naar beginpagina</a>
            </div>
        </section>
        <!-- tour packages -->
        <jsp:include page="temp/footer.jsp" />
    </body>
</html>