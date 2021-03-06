<%-- 
    Document   : hoteledit
    Created on : 22-mei-2019, 13:14:58
    Author     : Ruben
--%>

<%@page import="fact.it.www.beans.Regio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fact.it.www.beans.Hotel"%>
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
        <%Hotel hotel = (Hotel) request.getAttribute("hotel");%>
        <%ArrayList<Regio> regios = (ArrayList<Regio>) request.getAttribute("alleRegios");%>
        <%String foutmelding = (String) request.getAttribute("foutmelding");%>

        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">

                <div class="row">   

                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Pas <%=hotel.getNaam()%> aan</h1>

                        <%if (foutmelding != null) {%>
                        <h1>Aanpassen Mislukt!</h1>
                        <%}%>

                        <form action="HotelServlet">

                            <%-- onder elkaar --%>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms ">
                                    <label for="pasAanId">Hotel ID: </label>
                                    <input type="text" class="form-control" id="pasAanId" name="pasAanId" value="<%=hotel.getId()%>" readonly>
                                </div>
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="pasAanNaam">Hotel naam: </label>
                                    <input type="text" class="form-control" id="pasAanNaam" name="pasAanNaam" value="<%=hotel.getNaam()%>">
                                </div>
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6">
                                    <label for="pasAanRegio">Regio: </label>     
                                    <select class="form-control" name="pasAanRegio" id="pasAanRegio">
                                        <%for (Regio regio : regios) {%>
                                        <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>
                                        <%}%>
                                    </select>
                                </div>  
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="pasAanAantalsterren">Aantal sterren: </label>
                                    <input type="number" class="form-control py-0" min="0" max="5" id="pasAanAantalsterren" name="pasAanAantalsterren" value="<%=hotel.getAantalSterren()%>">
                                </div>
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="pasAanLigging">Ligging: </label>
                                    <input type="text" class="form-control" id="pasAanLigging" name="pasAanLigging" value="<%=hotel.getLigging()%>">
                                </div>
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="pasAanMaaltijden">Maaltijden: </label>
                                    <input type="text" class="form-control" id="pasAanMaaltijden" name="pasAanMaaltijden" value="<%=hotel.getMaaltijden()%>">
                                </div>
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="pasAanOntspanning">Ontspanning: </label>
                                    <input type="text" class="form-control" id="pasAanOntspanning" name="pasAanOntspanning" value="<%=hotel.getOntspanning()%>">
                                </div>
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="pasAanFoto">Fotobestand: </label>
                                    <input type="text" class="form-control" id="pasAanFoto" name="pasAanFoto" value="<%=hotel.getFoto()%>">
                                </div>
                            </div>


                            <p class="d-flex justify-content-center">                                
                                <input type="submit" name="pasHotelAan" value="Opslaan" class="btn btn-outline-primary mt-2 mx-2">
                                <a href="starthotels.jsp" class="btn btn-outline-primary mt-2 mx-2">Terug naar de startpagina</a>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="temp/footer.jsp" />             
    </body>
</html>
