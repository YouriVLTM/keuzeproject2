<%-- 
    Document   : starthotels
    Created on : 20-mei-2019, 10:32:25
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="temp/head.jsp" />
    <body>
        <jsp:include page="temp/nav.jsp" />
        <section class="banner_inner" id="home">
            <div class="banner_inner_overlay">
            </div>
        </section>

        <h1>Hotel</h1>
        <form action="HotelServlet">
            <p>
                <label for="hotelNaam"> 
                    Geef de naam van een hotel: </label> 
                <input type="text" name="hotelNaam" id="hotelNaam">

            </p>
            <p> <input type="submit" value="zoeken" name="zoekHotel"></p>
        </form>
        <p><a href="HotelServlet?toonspecifiek=1">Toon specifiek hotel</a></p>
        <p><a href="HotelServlet?toonhotels=1">Toon alle hotels</a></p>
        <p><a href="HotelServlet?uitgebreid=1">Uitgebreid zoeken</a></p>        
        <p><a href="HotelServlet?maakHotel=1">Hotel aanmaken</a></p>
        <p><a href="HotelServlet?pasAanDelete=1">Hotel aanpassen/verwijderen</a></p>
    </body>
</html>
