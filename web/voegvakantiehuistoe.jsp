<%-- 
    Document   : voegvakantiehuistoe
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

        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">

                <div class="row">               

                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Voeg nieuw vakantiehuis toe</h1>

                        <form action="ParkServlet" >

                            <%ArrayList<Park> parken = (ArrayList<Park>) request.getAttribute("parken");%>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="park">In welke regio moet het Park liggen?</label>
                                </div>
                                <div class="form-group col-md-3"> 
                                    <select class="form-control" name="parkIdvakantie" id="park">
                                        <%for (Park park : parken) {%>
                                        <option value="<%=park.getId()%>"><%=park.getNaam()%></option>
                                        <%}%>
                                    </select>
                                </div>  
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="type">Type</label>
                                    <input type="text" class="form-control" id="type" name="type" placeholder="type" >
                                </div>
                            </div>


                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="aantalSlaapKamers">aantal slaapkamers</label>
                                    <input type="text" class="form-control" id="aantalSlaapKamers" name="aantalSlaapkamers" placeholder="aantal slaap kamers" >
                                </div>

                            </div>
                            <div class="form-row">

                                <div class="form-group col-md-6 contact-forms">
                                    <label for="aantalPersonen">aantal personen</label>
                                    <input type="text" class="form-control" id="aantalPersonen" name="aantalPersonen" placeholder="aantal personen" >
                                </div>

                            </div>
                            <div class="form-row">

                                <div class="form-group col-md-6 contact-forms">
                                    <label for="oppervlakte">Oppervlakte</label>
                                    <input type="text" class="form-control" id="oppervlakte" name="oppervlakte" placeholder="oppervlakte" >
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
                                    <input type="submit" class="btn  sent-butnn btn-outline-primary" name="maaknieuwvakantiehuisaan" value="Voeg vakantiehuis toe" />
                                </div>
                            </div>
                    </div>
                    </form>
                </div>

            </div>
        </div>
    </section>
    <!-- tour packages -->



    <jsp:include page="temp/footer.jsp" />
</body>
</html>
