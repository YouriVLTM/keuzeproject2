<%-- 
    Document   : huisprijs
    Created on : May 21, 2019, 9:28:56 AM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Periode"%>
<%@page import="fact.it.www.beans.Huisaanbod"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fact.it.www.beans.Vakantiehuis"%>
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
        <%ArrayList<Huisaanbod> huisaanboden = (ArrayList<Huisaanbod>) request.getAttribute("huisaanboden");%>
        <%ArrayList<Periode> periodes = (ArrayList<Periode>) request.getAttribute("periodes");%>

        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">

                <div class="row">               

                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">        
                            <% if (vakantiehuis != null) {%>
                            <%=vakantiehuis.getType()%> - <strong>Prijzen</strong></h1> 


                        <div class="row"> 
                            <%for (Huisaanbod huisaanbod : huisaanboden) {%>
                            <div class="col-lg-6 col-sm-6 mb-5">
                                <div class="package-info">
                                    <p><%=huisaanbod.getPrijsperweek()%> euro -
                                        <%for (Periode periode : periodes) {%>
                                        <% if (periode.getId() == huisaanbod.getPeriodeid()) {%>
                                        <%=periode.getNaam()%> </p>

                                </div>
                            </div>

                            <%}%>
                            <%}%>

                            <%}%>
                        </div>
                        <% } else { %>
                        <p>Er is geen vakantiehuis gevonden</p>        
                        <% }%>
                        <p>  
                        <div class="mx-auto" style="width: 200px;">
                            <a href="index.jsp"><strong>Terug naar beginpagina</strong></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
