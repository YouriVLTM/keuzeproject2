<%-- 
    Document   : adminoverzicht
    Created on : May 23, 2019, 9:41:13 AM
    Author     : yourivanlaer
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

        <section class="services pt-5">
            <div class="container py-lg-5 py-sm-3">
                <h2 class="heading text-capitalize text-center mb-lg-5 mb-4">Admin dashboard park</h2> 
                <hr>
            </div>
        </section>

        <section class="services">
            <div class="container py-lg-5 py-sm-3">      

                <div class="row">
                    
                    <%int aantalparken = (Integer) request.getAttribute("aantalparken");%>                    
                    <% if(aantalparken != 0 ){%>
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Aantal Parken</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=aantalparken%></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="far fa-building fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                    
                     <%int aantalvakantiehuizen = (Integer) request.getAttribute("aantalvakantiehuizen");%>                    
                    <% if(aantalvakantiehuizen != 0 ){%>
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Aantal Vakantiehuizen</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=aantalvakantiehuizen%></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-home fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                    
                    
 <%int grootsteprijshuisaanbod = (Integer) request.getAttribute("grootsteprijshuisaanbod");%>                    
                    <% if(grootsteprijshuisaanbod != 0 ){%>
                    <!-- Pending Requests Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Grootste prijs aanbod</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=grootsteprijshuisaanbod%> €</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<%}%>
 <%int laagsteprijshuisaanbod = (Integer) request.getAttribute("laagsteprijshuisaanbod");%>                    
                    <% if(laagsteprijshuisaanbod != 0 ){%>
                    <!-- Pending Requests Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Laagste prijs aanbod</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=laagsteprijshuisaanbod%> €</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<%}%>

                </div>

            </div>
        </section>

        <section class="services">
            <div class="container py-lg-5 py-sm-3">
                <h2 class="heading text-capitalize text-center mb-lg-5 mb-4">Wijzigen</h2>      

                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 service-grid-wthree text-center mb-5">
                        <div class="ser-fashion-grid">
                            <div class="about-icon mb-md-4 mb-3">
                                <span class="far fa-building fa-3x" aria-hidden="true"></span>
                            </div>
                            <div class="ser-sevice-grid mb-3">
                                <h4 class="pb-3">Parken</h4>
                                <p>Hier krijg je een totaal overzicht van alle parken. Hier kan je ook je parken aanpassen verwijderen en ook nieuwe parken toevoegen.</p>
                            </div>
                            <a class="btn btn-outline-primary btn-block" href="ParkServlet?adminoverzichtparken=1">Overzicht Parken</a>

                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 service-grid-wthree text-center mb-5">
                        <div class="ser-fashion-grid">
                            <div class="about-icon mb-md-4 mb-3">
                                <span class="fas fa-home fa-3x" aria-hidden="true"></span>
                            </div>
                            <div class="ser-sevice-grid mb-3">
                                <h4 class="pb-3">Vakantiehuizen</h4>
                                <p>Hier krijg je een totaal overzicht van alle vakantiehuizen. Hier kan je ook je vakantiehuizen toevoegen aan het correcte park, ook vakantiehuizen wijzigen en verwijderen.</p>
                            </div>
                            <a class="btn btn-outline-primary btn-block" href="ParkServlet?adminoverzichtvakantiehuizen=1">Overzicht Vakantiehuizen</a>

                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree text-center mb-5">
                        <div class="ser-fashion-grid">

                        </div>
                    </div>

                </div>

            </div>
        </section>
        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
