<%-- 
    Document   : startparken
    Created on : 20-mei-2019, 10:35:31
    Author     : lukak
--%>

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
                       


                        <%String foutmelding = (String) request.getAttribute("foutmelding");%>
                        <%if (foutmelding != null) {%>
                        <div class="alert alert-danger">
                            <strong>Alert!</strong> 
                            <ul>
                                <%=foutmelding%>
                            </ul>
                        </div>
                        <%}%>
                        <%String melding = (String) request.getAttribute("melding");%>
                        <%if (melding != null) {%>
                        <div class="alert alert-success">
                            <strong>Alert!</strong> 
                            <ul>
                                <%=melding%>
                            </ul>
                        </div>
                        <%}%>

                        <div class="row">
                            <div class="col">
                                 <h1 class="heading text-center mb-5">VakantiePark</h1>
                            <form action="ParkServlet" >                

                                <div class="form-row">
                                    <div class="col-12">
                                        <label for="naam">Ga op zoek naar u park</label>         
                                    </div>
                                    <div class="col-5 contact-forms">
                                        <label for="attractieNaam" class="sr-only">attractie Naam</label>
                                        <input type="text" class="form-control" id="naam" name="naam" placeholder="Geef de begin letters in">

                                    </div>
                                    <input type="submit" class="btn btn-outline-primary"  value="Zoek naar u specifiek park" name="vakantiePark" />
                                    <a href="ParkServlet?vakantiePark1=1" class="btn btn-outline-primary mx-1">Zoek op park id 1</a>

                                </div>
                            </form>
                                </div>
                            </div>
                           

                        <div class="row mt-5">
                            <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree text-center mb-5">
                                <div class="ser-fashion-grid">
                                    <div class="about-icon mb-md-4 mb-3">
                                        <span class="fas fa-user-plus fa-3x" aria-hidden="true"></span>
                                    </div>
                                    <div class="ser-sevice-grid mb-3">
                                        <h4 class="pb-3">Nieuw bezoeker</h4>
                                        <p>Hier kan je een nieuw bezoeker aanmaken.</p>
                                    </div>
                                    <a href="ParkServlet?alleVakantiePark=1" class="btn btn-outline-primary mx-1">Toon alle Parken</a>

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree text-center mb-5">
                                <div class="ser-fashion-grid">
                                    <div class="about-icon mb-md-4 mb-3">
                                        <span class="far fa-building fa-3x" aria-hidden="true"></span>
                                    </div>
                                    <div class="ser-sevice-grid mb-3">
                                        <h4 class="pb-3">Nieuw pretpark</h4>
                                        <p>Hier kan je een nieuw pretpark aanmaken.</p>
                                    </div>
                                    <a href="ZoekParkServlet?uitgebreid=1" class="btn btn-outline-primary mx-1">uitgebreid zoeken</a>      

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree text-center mb-5">
                                <div class="ser-fashion-grid">
                                    <div class="about-icon mb-md-4 mb-3">
                                        <span class="fas fa-user-tie fa-3x" aria-hidden="true"></span>
                                    </div>
                                    <div class="ser-sevice-grid mb-3">
                                        <h4 class="pb-3">Nieuw persooneelslid</h4>
                                        <p>Hier kan je een nieuw persooneelslid aanmaken.</p>
                                    </div>
                                    <a href="ParkServlet?adminoverzichtparken=1" class="btn btn-outline-primary mx-1">admin overzicht park</a>

                                </div>
                            </div>

                        </div>





                    </div>



                </div>
            </div>
        </section>
        <!-- tour packages -->




        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
