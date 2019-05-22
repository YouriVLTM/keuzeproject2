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
                       
            <section class="packages pt-5">
                <div class="container py-lg-4 py-sm-3">
                    <div class="row">               		
                    <div class="col-lg-12 contact-left-form">
                    
<h1 class="heading text-center mb-5">Hotel</h1>
        <form action="HotelServlet">
            <div class="row justify-content-md-center">
            <p>
                <label for="hotelNaam"> 
                    Geef de naam van een hotel: </label> 
                <input type="text" name="hotelNaam" id="hotelNaam">
            
            <input class="btn btn-outline-primary"  type="submit" value="zoeken" name="zoekHotel"></p>
            </div>
        </form>
<div class="row justify-content-md-center pt-3">
<div class="btn-group" role="group" aria-label="Basic example">
    <a class="btn btn-outline-primary" href="HotelServlet?toonspecifiek=1">Toon specifiek hotel</a>
        <a class="btn btn-outline-primary" href="HotelServlet?toonhotels=1">Toon alle hotels</a>
        <a class="btn btn-outline-primary" href="HotelServlet?uitgebreid=1">Uitgebreid zoeken</a>        
        <a class="btn btn-outline-primary" href="HotelServlet?maakHotel=1">Hotel aanmaken</a>
        <a class="btn btn-outline-primary" href="HotelServlet?pasAanDelete=1">Hotel aanpassen/verwijderen</a>
</div>
</div>
                     </div>
                    </div>
                </div>
            </section>
        
 <jsp:include page="temp/footer.jsp" />
    </body>
</html>
