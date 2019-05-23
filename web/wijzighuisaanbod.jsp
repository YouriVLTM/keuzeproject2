<%-- 
    Document   : wijzighuisaanbod
    Created on : May 22, 2019, 10:06:58 AM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Park"%>
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

        <%Park park = (Park) request.getAttribute("park");%>


        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">

                <div class="row">               

                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Wijzig park</h1>

                        <form action="ParkServlet" >
                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="parkId">Park id</label>
                                    <input type="text" class="form-control" id="parkId" name="parkIdla" value="<%=park.getId()%>" readonly>
                                </div> 
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="naam">Naam</label>
                                    <input type="text" class="form-control" id="naam" name="naam" placeholder="naam" value="<%=park.getNaam()%>">
                                </div>
                            </div>

                            <%ArrayList<Regio> regios = (ArrayList<Regio>) request.getAttribute("alleRegios");%>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="regio">In welke regio moet het Park liggen?</label>
                                </div>
                                <div class="form-group col-md-3"> 
                                    <select class="form-control" name="regioId" id="regio">
                                        <option value="0">geen</option>

                                        <%for (Regio regio : regios) {%>
                                        <%if (regio.getId() == park.getRegioid()) {%>
                                        <option value="<%=regio.getId()%>" selected><%=regio.getNaam()%></option>
                                        <%} else {%>
                                        <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>
                                        <%}%>
                                        <%}%>
                                        
                                    </select>
                                </div>  
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="aantalSterren">Aantal sterren</label>
                                    <input type="text" class="form-control" id="aantalSterren" name="aantalSterren" placeholder="aantal sterren"  value="<%=park.getAantalSterren()%>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="Voorzieningen">Voorzieningen</label>
                                    <input type="text" class="form-control" id="Voorzieningen" name="Voorzieningen" placeholder="Voorzieningen" value="<%=park.getVoorzieningen()%>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="fotonaam">Foto naam</label>
                                    <input type="text" class="form-control" id="fotonaam" name="fotonaam" placeholder="Geef de foto naam in" value="<%=park.getFoto()%>">
                                </div>
                            </div>
                                
                            <%String foutmelding = (String) request.getAttribute("foutmelding");%>
                            <%if (foutmelding != null) {%>
                            <div class="alert alert-danger">
                                <strong>Alert!</strong> 
                                <ul>
                                    <%=foutmelding%>
                                </ul>
                            </div>
                            <%}%>

                            <div class="form-row">
                                <div class="col-6">
                                    <input type="submit" class="btn  sent-butnn btn-outline-primary" name="wijzigpark" value="Wijzeging opslaan" />
                                </div>
                            </div>
                    </div>
                    </form>
                </div>
                <a href="startparken.jsp" class="btn btn-outline-primary">Terug naar parken</a>
            </div>
        </div>
    </section>
    <!-- tour packages -->



    <jsp:include page="temp/footer.jsp" />
</body>
</html>
