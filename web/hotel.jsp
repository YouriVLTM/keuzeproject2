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
         <%Hotel hotelnaam = (Hotel) request.getAttribute("hotelnaam");%>
         <%if (hotelnaam == null ){%>
         <h1>Helaas, er is geen hotel gevonden!</h1>
         <%} else {%>
        <h1>Toon het hotel</h1>
        <p>De naam: <%=hotelnaam.getNaam()%></p>
        <p>Het aantal sterren: <%=hotelnaam.getAantalSterren()%></p>
        <a href="starthotels.jsp">Klik hier om terug te gaan naar de startpagina van hotels</a>
        <%}%>
    </body>
</html>
