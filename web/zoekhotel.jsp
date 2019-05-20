<%-- 
    Document   : zoekhotel
    Created on : 20-mei-2019, 23:47:45
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel zoeken</title>
    </head>
    <body>
        <h1>Zoek je hotel</h1>
        <form action="ZoekHotelServlet">
            <p>                
            <label for="select">Hoeveel sterren moet het hotel hebben?</label>
            <select name="select" id="select">
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            </p>
            <p><input type="submit" name="zoekHotel" value="zoeken"></p>
        </form>
        <a href="starthotels.jsp">Terug naar de startpagina</a>
    </body>
</html>
