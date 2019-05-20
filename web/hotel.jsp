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
    </head>
    <body>
         <%Hotel hotel = (Hotel) request.getAttribute("hotel");%>
         <%if (hotel == null){%>
         <h1>Helaas, er is geen hotel gevonden!</h1>
       
         <%} else{%>
        <h1>Toon het hotel</h1>
        <p>De naam: <%=hotel.getNaam()%></p>
        <p>Het aantal sterren: <%=hotel.getAantalSterren()%></p>
        <p><a href="HotelServlet?hotelId=<%=hotel.getId()%>">Klik hier voor meer details</a></p>       
        <%}%>
        <p><a href="starthotels.jsp">Klik hier om terug te gaan naar de startpagina van hotels</a></p>
    </body>
</html>
