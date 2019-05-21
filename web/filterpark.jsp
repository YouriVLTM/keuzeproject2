<%-- 
    Document   : filterpark
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
                        <h1 class="heading text-center mb-5">Filter je Park</h1></h1>

        <form action="ZoekParkServlet">  
            <div class="form-row">
            <div class="form-group col-md-5">
            <p>
            <label for="select">Hoeveel sterren moet het hotel hebben? <i class="fas fa-star"></i></label>
            </div>
            <div class="form-group col-md-3">
            <select class="form-control" name="aantalSterren" id="select">
                <option value="null">geen</option>
                <option value="2">2 sterren</option>
                <option value="3">3 sterren</option>
                <option value="4">4 sterren</option>
                <option value="5">5 sterren</option>
            </select>
            </div>
            </p>
            </div>
            
            
            <%ArrayList<Regio> regios = (ArrayList<Regio>) request.getAttribute("alleRegios");%>
            <div class="form-row">
            <div class="form-group col-md-5">
            <p>
                <label for="regio">In welke regio moet het hotel liggen?</label>
            </div>
            <div class="form-group col-md-3"> 
                <select class="form-control" name="regio" id="regio">
                    <option value="null">geen</option>

                    <%for (Regio regio : regios) {%>
                    <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>
                    <%}%>
                </select>
            </div>
            </p>
                </div>
             <p>
            <div class="form-row">
            <div class="form-group col-md-5">
                <label for="parkNaam">Naam van het Park</label>
            </div>
            <div class="form-group col-md-3">    
                <input class="form-control" type="text" name="parkNaam" id="parkNaam">
            </div>
            </p>
            </div>
            
             <p>
            <div class="form-row">
                <div class="form-group col-md-5">
                <label for="aantalSlaapkamers">Aantal slaapkamers</label>
                </div>
                <div class="form-group col-md-3">
                <input class="form-control" type="text" name="aantalSlaapkamers" id="aantalSlaapkamers" value="">
                </div>
            </p>
            </div>
            
            <p>
            <div class="form-row">
                <div class="form-group col-md-5">
                <label for="aantalPersonen">Aantal Personen</label>
                </div>
                <div class="form-group col-md-3">
                <input class="form-control" type="text" name="aantalPersonen" id="aantalPersonen" value="">
                </div>
            </p>
            </div>
            <input type="submit" name="zoekFilter" value="Zoek de resultaten" class="btn btn-outline-primary">
        </form>
        <a href="startparken.jsp">Terug naar de startpagina</a>
        </div>
        		</div>
	</div>
</section>
                    
       <jsp:include page="temp/footer.jsp" />             
    </body>
</html>
