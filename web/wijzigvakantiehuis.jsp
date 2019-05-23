<%-- 
    Document   : wijzigvakantiehuis
    Created on : May 22, 2019, 10:06:58 AM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Vakantiehuis"%>
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

        <%Vakantiehuis vakantiehuis = (Vakantiehuis) request.getAttribute("vakantiehuis");%>


        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">

                <div class="row">               

                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Wijzig vakantiehuis</h1>

                        <form action="ParkServlet" >
                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="parkId">Park id</label>
                                    <input type="text" class="form-control" id="parkId" name="parkIdla" value="<%=vakantiehuis.getId()%>">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="naam">Naam</label>
                                    <input type="text" class="form-control" id="naam" name="naam" placeholder="naam" value="<%=vakantiehuis.getType()%>" >
                                </div>
                            </div>

                          
                               
                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="aantalSterren">Aantal sterren</label>
                                    <input type="text" class="form-control" id="aantalSterren" name="aantalSterren" placeholder="aantal sterren"  value="<%=vakantiehuis.getAantalSlaapkamers()%>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="Voorzieningen">Voorzieningen</label>
                                    <input type="text" class="form-control" id="Voorzieningen" name="Voorzieningen" placeholder="Voorzieningen" value="<%=vakantiehuis.getAantalPersonen()%>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="fotonaam">Foto naam</label>
                                    <input type="text" class="form-control" id="fotonaam" name="fotonaam" placeholder="Geef de foto naam in" value="<%=vakantiehuis.getOppervlakte()%>">
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
