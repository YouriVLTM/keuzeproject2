<%-- 
    Document   : wijzighuisaanbod
    Created on : May 22, 2019, 10:06:58 AM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Huisaanbod"%>
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

        <%Huisaanbod huisaanbod = (Huisaanbod) request.getAttribute("huisaanbod");%>


        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">

                <div class="row">               

                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Wijzig prijs</h1>

                        <form action="ParkServlet" >
                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="huisaanbodId">Huis aanbod Id</label>
                                    <input type="text" class="form-control" id="huisaanbodId" name="huisaanbodId" value="<%=huisaanbod.getId()%>" readonly>
                                </div> 
                            </div>


                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="aantalSterren">periode id</label>
                                    <input type="text" class="form-control" id="aantalSterren" name="aantalSterren" placeholder="aantal sterren"  value="<%=huisaanbod.getPeriodeid()%>" readonly>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="prijsperweek">prijsperweek</label>
                                    <input type="text" class="form-control" id="prijsperweek" name="prijsperweek" placeholder="prijsperweek" value="<%=huisaanbod.getPrijsperweek()%>">
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
                                    <input type="submit" class="btn  sent-butnn btn-outline-primary" name="wijzighuisaanbod" value="Wijzeging opslaan" />
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
