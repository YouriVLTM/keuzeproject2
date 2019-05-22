<%-- 
    Document   : hoteledit
    Created on : 22-mei-2019, 13:14:58
    Author     : Ruben
--%>

<%@page import="fact.it.www.beans.Regio"%>
<%@page import="java.util.ArrayList"%>
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
        <%ArrayList<Regio> regios = (ArrayList<Regio>) request.getAttribute("alleRegios");%>
        <%String foutmelding = (String) request.getAttribute("foutmelding");%>
        <%if (foutmelding != null){%>
        <h1>Aanpassen Mislukt!</h1>
        <%}%>
        <h1>Pas <%=hotel.getNaam()%> aan</h1>
        <form action="HotelServlet">
            <p>
                <label for="pasAanId">De id</label>
                <input type="text" name="pasAanId" id="pasAanId" value="<%=hotel.getId()%>" readonly>
            </p>
            <p>
                <label for="pasAanNaam">Pas de naam aan</label>
                <input type="text" name="pasAanNaam" id="pasAanNaam" value="<%=hotel.getNaam()%>">
            </p>
            <p>
                <label for="pasAanRegio">Pas de regio aan</label>
                <select name="pasAanRegio">
                    <%for (Regio regio : regios){%>
                    <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>     
                    <%}%>
                </select>
            </p>
            <p>
                <label for="pasAanAantalsterren">Pas het aantal sterren aan</label>
                <input type="text" name="pasAanAantalsterren" id="pasAanAantalsterren" value="<%=hotel.getAantalSterren()%>">
            </p>
            <p>
                <label for="pasAanLigging">Pas de ligging aan</label>
                <input type="text" name="pasAanLigging" id="pasAanLigging" value="<%=hotel.getLigging()%>">
            </p>
            <p>
                <label for="pasAanMaaltijden">Pas de maaltijden aan</label>
                <input type="text" name="pasAanMaaltijden" id="pasAanMaaltijden" value="<%=hotel.getMaaltijden()%>">
            </p>
            <p>
                <label for="pasAanOntspanning">Pas de ontspanning aan</label>
                <input type="text" name="pasAanOntspanning" id="pasAanOntspanning" value="<%=hotel.getOntspanning()%>">
            </p>
            <p>
                <label for="pasAanFoto">Pas de foto aan</label>
                <input type="text" name="pasAanFoto" id="pasAanFoto" value="<%=hotel.getFoto()%>">
            </p>
            <input type="submit" name="pasHotelAan" value="Opslaan">


        </form>
    </body>
</html>
