<%-- 
    Document   : overzichtparken
    Created on : May 20, 2019, 3:00:37 PM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Regio"%>
<%@page import="fact.it.www.beans.Park"%>
<%@page import="java.util.ArrayList"%>
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

        <!-- tour packages -->
        <section class="packages pt-5">
            <div class="container-fluid py-lg-4 py-sm-3">
                <h2 class="heading text-capitalize text-center">Overzicht VakantiePark</h2>
                <br>
                <div class="row">

                    <div class="col-sm-12 col-md-3 p-5">

                        <h2 class="pb-3">Filter</h2>

                        <form action="ZoekParkServlet">  
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <p>
                                        <label for="select">Hoeveel sterren moet het hotel hebben?</label>

                                        <select class="form-control" name="aantalSterren" id="select">
                                            <option value="0">Geen voorkeur</option>
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
                                <div class="form-group col-md-12">
                                    <p>
                                        <label for="regio">In welke regio moet het hotel liggen?</label>

                                        <select class="form-control" name="regio" id="regio">
                                            <option value="0">Geen voorkeur</option>

                                            <%for (Regio regio : regios) {%>
                                            <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>
                                            <%}%>
                                        </select>
                                </div>
                                </p>
                            </div>
                            <p>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="parkNaam">Naam van het Park</label>

                                    <input class="form-control" type="text" name="parkNaam" id="parkNaam" value="">
                                </div>
                                </p>
                            </div>

                            <p>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="aantalSlaapkamers">Aantal slaapkamers</label>

                                    <input class="form-control" type="text" name="aantalSlaapkamers" id="aantalSlaapkamers" value="0">
                                </div>
                                </p>
                            </div>

                            <p>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="aantalPersonen">Aantal Personen</label>

                                    <input class="form-control" type="text" name="aantalPersonen" id="aantalPersonen" value="0">
                                </div>
                                </p>
                            </div>

                            <input type="submit" name="zoekFilter" value="Filter" class="btn btn-outline-primary mt-3">
                        </form>

                    </div>
                    <div class="col-sm-12 col-md-9 p-5">
                        <%ArrayList<Park> parken = (ArrayList<Park>) request.getAttribute("parken");%>

                        <% if (parken != null) { %>

                        <div class="row">

                            <% for (Park park : parken) {%>

                            <div class="col-lg-6 col-sm-6 mb-5">
                                <div class="package-info">
                                    <div class="row">
                                        <div class="col-12 text-center">
                                            <h2 class="my-2"><span><%=park.getNaam()%></span></h2> 
                                            <br>
                                        </div>
                                        <div class="col-6">
                                            <img src="images/<%=park.getFoto()%>" onerror="this.src='images/noPic.png'" class="rounded img-fluid" style="width: 250px"/>
                                        </div>
                                        <div class="col-6">
                                            <p>AantalSterren: <%=park.getAantalSterren()%> </p> 
                                            <a href="ParkServlet?parkId=<%=park.getId()%>">meer info</a>
                                            <%if (park.getAantalSterren() == 5) { %>
                                            <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
                                                    <% }%>
                                                    <%if (park.getAantalSterren() == 4) { %>
                                            <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i></p>
                                                    <% }%>
                                                    <%if (park.getAantalSterren() == 3) { %>
                                            <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></p>
                                                    <% }%>
                                                    <%if (park.getAantalSterren() == 2) { %>
                                            <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></p>
                                                    <% }%>    
                                                    <%if (park.getAantalSterren() == 1) { %>
                                            <p><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></p>
                                                    <% }%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <% } %>
                        </div>

                        <% } else { %>
                        <p>Er is geen park gevonden</p>        
                        <% }%>

                    </div>
                </div>
                <br>
                <a href="ZoekParkServlet?uitgebreid=1" class="btn btn-outline-primary">Terug naar zoekfunctie</a>
                <a href="index.jsp" class="btn btn-outline-primary">Terug naar beginpagina</a>
            </div>
        </section>
        <!-- tour packages -->     
        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
