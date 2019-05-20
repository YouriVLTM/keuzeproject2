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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%ArrayList<Hotel> hotels = (ArrayList<Hotel>) request.getAttribute("hotels");%>

        <h1>Overzicht hotels</h1>
        <%if(hotels.size() == 0){%>
        <p>Helaas, geen hotels gevonden!</p>
        <%} else {%>
        <ul>
            <%for (Hotel hotel : hotels) {%>
            <li>
                <a href="HotelServlet?hotelId=<%=hotel.getId()%>"><%=hotel.getNaam() + " heeft " + hotel.getAantalSterren() + " sterren"%></a>
            </li>
            <%}%>
        </ul>
        <%}%>
        <a href="zoekhotel.jsp">Opnieuw zoeken</a>
        
        
    </body>
</html>
