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
    <jsp:include page="temp/head.jsp" />

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
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <p>
                                        <label for="select">Hoeveel sterren moet het hotel hebben? <i class="fas fa-star"></i></label>
                                </div>
                                <div class="form-group col-md-3">
                                    <select class="form-control" name="aantalSterren" id="select">
                                        <option value="2">2 sterren</option>
                                        <option value="3">3 sterren</option>
                                        <option value="4">4 sterren</option>
                                        <option value="5">5 sterren</option>
                                    </select>
                                </div>
                                <br>
                                <div class="form-group col-md-4">
                                    <input type="submit" name="zoekParkAantalSterren" value="zoeken op aantal sterren" class="btn btn-outline-primary">
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
                                        <%for (Regio regio : regios) {%>
                                        <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <br>
                                <div class="form-group col-md-4">
                                    <input type="submit" name="zoekParkRegio" value="zoeken op regio" class="btn btn-outline-primary">
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
                                <br>
                                <div class="form-group col-md-4">
                                    <input type="submit" name="zoekParkNaam" value="zoeken op naam" class="btn btn-outline-primary">
                                </div>
                                </p>
                            </div>
                            <p>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="aantalSlaapkamers">Aantal slaapkamers</label>
                                </div>
                                <div class="form-group col-md-3">
                                    <input class="form-control" type="text" name="aantalSlaapkamers" id="aantalSlaapkamers" value="2">
                                </div>
                                <br>
                                <div class="form-group col-md-4">
                                    <input type="submit" name="zoekAantalslaapkamers" value="zoeken op aantal slaapkamers" class="btn btn-outline-primary">
                                </div>
                                </p>
                            </div>
                            <p>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="aantalPersonen">Aantal Personen</label>
                                </div>
                                <div class="form-group col-md-3">
                                    <input class="form-control" type="text" name="aantalPersonen" id="aantalPersonen" value="4">
                                </div>
                                <br>
                                <div class="form-group col-md-4">
                                    <input type="submit" name="zoekAantalPersonen" value="zoeken op aantal Personen" class="btn btn-outline-primary">
                                </div>
                                <br>
                                </p>
                            </div>
                        </form>
                        <a href="startparken.jsp">Terug naar de startpagina</a>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="temp/footer.jsp" />             
    </body>
</html>
