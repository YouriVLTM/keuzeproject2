<%-- 
    Document   : hotelaanpassen
    Created on : 22-mei-2019, 12:54:19
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
        <h1>Overzicht</h1>
        <table>
            <tr>
                <td>Hotelid</td>
                <td>Naam</td>
                <td>Regio</td>
                <td>Aantalsterren</td>
                <td>Ligging</td>
                <td>Maaltijden</td>
                <td>Ontspanning</td>
                <td>Foto</td>
                <td>Aanpassen</td>
            </tr>
            <%for (Hotel hotel : hotels) {%>
            <tr>
                <td>
                    <%=hotel.getId()%>
                </td>
                   <td>
                    <%=hotel.getNaam()%>
                </td>
                   <td>
                    <%=hotel.getRegioid()%>
                </td>
                   <td>
                    <%=hotel.getAantalSterren()%>
                </td>
                   <td>
                    <%=hotel.getLigging()%>
                </td>
                   <td>
                    <%=hotel.getMaaltijden()%>
                </td>
                   <td>
                    <%=hotel.getOntspanning()%>
                </td>
                   <td>
                    <%=hotel.getFoto()%>
                </td>
                <td>
                    <a href="HotelServlet?Verwijderen=1&hotelid=<%=hotel.getId()%>">verwijderen</a>
                    <a href="HotelServlet?Aanpassen=1&hotelid=<%=hotel.getId()%>">aanpassen</a>                    
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
