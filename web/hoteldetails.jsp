<%-- 
    Document   : hoteldetails
    Created on : 20-mei-2019, 14:10:01
    Author     : Ruben
--%>

<%--@page import="java.lang.Integer.parseInt(String)"--%>
<%@page import="fact.it.www.beans.Hotel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <%Hotel hotel = (Hotel)request.getAttribute("hotelIdZoek");%>
        <h1>Details van het hotel</h1>

            <p><%=hotel.getNaam()%></p>
            <p><%=hotel.getAantalSterren()%></p>
            <p><%=hotel.getLigging()%></p>
            <p><%=hotel.getOntspanning()%></p>
            <p><%=hotel.getRegioid()%></p> 
            <p><%=hotel.getFoto()%></p> 
 
            <a href="starthotels.jsp.">Klik hier om terug te gaan naar de startpagina van hotels.</a>
    
</html>
