<%-- 
    Document   : hotel
    Created on : 20-mei-2019, 10:39:06
    Author     : Ruben
--%>

<%@page import="fact.it.www.beans.Hotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="temp/head.jsp" />
    </head>
    <body>
        <jsp:include page="temp/nav.jsp" />

        <section class="banner_inner" id="home">
            <div class="banner_inner_overlay">
            </div>
        </section>

        <%Hotel hotel = (Hotel) request.getAttribute("hotel");%>

        <div class="row justify-content-md-center">

            <div class="col-lg-6 col-sm-12 mb-5" style="margin-top: 25px;">
                <div class="package-info">
                    <div class="row justify-content-md-center">

                        <%if (hotel == null) {%>
                        <h1>Helaas, er is geen hotel gevonden!</h1>

                        <%} else {%>
                        <div class="col-12 text-center">
                            <h2 class="my-2"><span><%=hotel.getNaam()%></span></h2>
                        </div>
                        <div class="col-6">
                            <img src="images/<%=hotel.getFoto()%>" class="rounded img-fluid" style="width: 250px"/>
                        </div>
                        <div class="col-6">
                            <p>Het aantal sterren: <%=hotel.getAantalSterren()%></p>
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
                            <p><a href="HotelServlet?hotelId=<%=hotel.getId()%>">Meer details</a></p>       
                            <%}%>
                            
                        </div>

                    </div>

                            <p class="mt-3"><a href="starthotels.jsp" class="btn btn-outline-primary">Terug naar startpagina hotels</a></p>
                </div>
                            
            </div> 
        </div>

        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
