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
    <jsp:include page="temp/head.jsp" />
    <body>
        <jsp:include page="temp/nav.jsp" />
        <!-- banner -->
        <section class="banner_inner" id="home">
            <div class="banner_inner_overlay">
            </div>
        </section>

        <%ArrayList<Regio> regios = (ArrayList<Regio>) request.getAttribute("alleRegios");%>
        <%String foutmelding = (String) request.getAttribute("foutmelding");%>
        
        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">
                <div class="row">               
                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Voeg nieuw hotel toe</h1>
                        
                        <%if (foutmelding != null) {%>
                        <h1><%=foutmelding%></h1>
                        <%}%>
                        
                        <form>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="maakHotelNaam">Naam: </label>
                                    <input type="text" class="form-control" id="maakHotelNaam" name="maakHotelNaam" placeholder="naam" class="form-control" >
                                </div>
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6">
                                    <label for="maakHotelRegio">Geef de regio: </label>     
                                    <select class="form-control" name="maakHotelRegio" id="maakHotelRegio">
                                        <%for (Regio regio : regios) {%>
                                        <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>
                                        <%}%>
                                    </select>
                                </div>  
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="maakHotelAantalSterren">Aantal sterren: </label>
                                    <input type="text" class="form-control" id="maakHotelAantalSterren" name="maakHotelAantalSterren" placeholder="aantal sterren" >
                                </div>
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="maakHotelLigging">Ligging: </label>
                                    <input type="text" class="form-control" id="maakHotelLigging" name="maakHotelLigging" placeholder="ligging" >
                                </div>
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="maakHotelMaaltijden">Maaltijden: </label>
                                    <input type="text" class="form-control" id="maakHotelMaaltijden" name="maakHotelMaaltijden" placeholder="maaltijden" >
                                </div>
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="maakHotelOntspanning">Ontspanning: </label>
                                    <input type="text" class="form-control" id="maakHotelOntspanning" name="maakHotelOntspanning" placeholder="ontspanning" >
                                </div>
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="maakHotelFoto">Naam van de foto: </label>
                                    <input type="text" class="form-control" id="maakHotelFoto" name="maakHotelFoto" placeholder="naam van de foto" >
                                </div>
                            </div>
                            <p class="d-flex justify-content-center">
                                <input type="submit" name="voegHotelToe" id="maakHotel" value="Maak Hotel" required class="btn btn-outline-primary mt-2">
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
