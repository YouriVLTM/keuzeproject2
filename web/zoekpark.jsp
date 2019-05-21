<%-- 
    Document   : zoekpark
    Created on : May 21, 2019, 10:26:44 AM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Periode"%>
<%@page import="fact.it.www.beans.Regio"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <title>JSP Page</title>
        <jsp:include page="temp/head.jsp" />
        </head>
    <body>
        <jsp:include page="temp/nav.jsp" />
        
                        <!-- banner -->
        <section class="banner_inner" id="home">
	<div class="banner_inner_overlay">
	</div>
        </section>
                        
        <section class="packages pt-5">
	<div class="container py-lg-4 py-sm-3">
		
        <div class="row">   
            
        <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Zoek je Park</h1></h1>

        <form action="ZoekParkServlet">  
            <p>
            <label for="select">Hoeveel sterren moet het hotel hebben? <i class="fas fa-star"></i></label>
            <select name="aantalSterren" id="select">
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            <input type="submit" name="zoekParkAantalSterren" value="zoeken op aantal sterren" class="btn btn-outline-primary">
            </p>
            
            
            <%ArrayList<Regio> regios = (ArrayList<Regio>) request.getAttribute("alleRegios");%>
            <p>
                <label for="regio">In welke regio moet het hotel liggen?</label>
                <select name="regio" id="regio">
                    <%for (Regio regio : regios) {%>
                    <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>
                    <%}%>
                </select>
                <input type="submit" name="zoekParkRegio" value="zoeken op regio" class="btn btn-outline-primary">
            </p>
             <p>
                <label for="parkNaam">Naam van het Park</label>
                <input type="text" name="parkNaam" id="parkNaam">
                <input type="submit" name="zoekParkNaam" value="zoeken op naam" class="btn btn-outline-primary">
            </p>
            
             <p>
                <label for="aantalSlaapkamers">Aantal slaapkamers</label>
                <input type="text" name="aantalSlaapkamers" id="aantalSlaapkamers" value="2">
                <input type="submit" name="zoekAantalslaapkamers" value="zoeken op aantal slaapkamers" class="btn btn-outline-primary">
            </p>
            
            <p>
                <label for="aantalPersonen">Aantal Personen</label>
                <input type="text" name="aantalPersonen" id="aantalPersonen" value="4">
                <input type="submit" name="zoekAantalPersonen" value="zoeken op aantal Personen" class="bbtn btn-outline-primary">
            </p>
            
        </form>
        <a href="startparken.jsp">Terug naar de startpaginas</a>
        </div>
        		</div>
	</div>
</section>
                    
       <jsp:include page="temp/footer.jsp" />             
    </body>
</html>
