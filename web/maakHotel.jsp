<%-- 
    Document   : maakHotel.jsp
    Created on : 21-mei-2019, 14:58:52
    Author     : Ruben
--%>

<%@page import="fact.it.www.beans.Regio"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%ArrayList<Regio> regios = (ArrayList<Regio>) request.getAttribute("alleRegios");%>
        <%String foutmelding = (String) request.getAttribute("foutmelding");%>

        <%if (foutmelding != null) {%>
        <h1><%=foutmelding%></h1>
        <%}%>
        <form>
            <p>
                <label for="maakHotelNaam">Geef de naam van het hotel</label>
                <input type="text" name="maakHotelNaam" id="maakHotelNaam" required>
            </p>
            <p>
                <label for="maakHotelRegio">Geef de regio</label>
                <select name="maakHotelRegio" id="maakHotelRegio" required>
                    <%for (Regio regio : regios) {%>
                    <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>
                    <%}%>
                </select>
            </p>
            <p>
                <label for="maakHotelAantalSterren">Geef het aantal sterren van het hotel</label>
                <input type="text" name="maakHotelAantalSterren" id="maakHotelAantalSterren" required>
            </p>
            <p>
                <label for="maakHotelLigging">Geef de ligging van het hotel</label>
                <input type="text" name="maakHotelLigging" id="maakHotelLigging" required>
            </p>
            <p>
                <label for="maakHotelMaaltijden">Geef de maaltijden van het hotel</label>
                <input type="text" name="maakHotelMaaltijden" id="maakHotelMaaltijden" required>
            </p>
            <p>
                <label for="maakHotelOntspanning">Geef de ontspanningsmogelijkheden van het hotel</label>
                <input type="text" name="maakHotelOntspanning" id="maakHotelOntspanning" required>
            </p>
            <p>
                <label for="maakHotelFoto">Geef de naam van het fotobestand van het hotel</label>
                <input type="text" name="maakHotelFoto" id="maakHotelFoto" required>
            </p>
            <p>
                <input type="submit" name="voegHotelToe" id="maakHotel" value="Maak Hotel" required>
            </p>

        </form>
    </body>
</html>
