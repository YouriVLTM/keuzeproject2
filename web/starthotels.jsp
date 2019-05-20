<%-- 
    Document   : starthotels
    Created on : 20-mei-2019, 10:32:25
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Hello World!</h1>
        <form action="HotelServlet">
            <p>
                <label for="hotelNaam"> 
                Geef de naam van een hotel: </label> 
                <input type="text" name="hotelNaam" id="hotelNaam">
               
            </p>
            <p> <input type="submit" value="zoeken" name="zoekHotel"></p>
        </form>
        <p><a href="HotelServlet">Toon specifiek hotel</a></p>
        <p><a href="HotelServlet?toonhotels=1">Toon alle hotels</a></p>
        <p><a href="HotelServlet?uitgebreid=1">Uitgebreid zoeken</a></p>
    </body>
</html>
