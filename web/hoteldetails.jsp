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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoteldetails</title>
    </head>
    
        <%Hotel hotel = (Hotel)request.getAttribute("hotelIdZoek");%>
        <%Regio regio = (Regio)request.getAttribute("regioIdZoek");%>
        <h1>Details van het hotel</h1>

        <p>Naam: <a href="HotelServlet?zoekPrijs=<%=hotel.getId()%>&zoekPrijsHotelNaam=<%=hotel.getNaam()%>"><%=hotel.getNaam()%></a></p>
            <p>Aantal Sterren: <%=hotel.getAantalSterren()%></p>
            <p>Ligging: <%=hotel.getLigging()%></p>
            <p>Ontspanningsmogelijkheden: <%=hotel.getOntspanning()%></p>              
            <p>Naam van de streek: <%=regio.getNaam()%></p>
            <img src="images/<%=hotel.getFoto()%>">
 
            <a href="starthotels.jsp.">Klik hier om terug te gaan naar de startpagina van hotels.</a>
    
</html>