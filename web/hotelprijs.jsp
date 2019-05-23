<%-- 
    Document   : hotelprijs
    Created on : 20-mei-2019, 19:25:15
    Author     : Ruben
--%>

<%@page import="fact.it.www.beans.Hotelaanbod"%>
<%@page import="fact.it.www.beans.Periode"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="temp/head.jsp" />

    <body>
        <jsp:include page="temp/nav.jsp" />

        <%ArrayList<Periode> periodes = (ArrayList<Periode>) request.getAttribute("periode");%>
        <%ArrayList<Hotelaanbod> hotelaanbiedingen = (ArrayList<Hotelaanbod>) request.getAttribute("hotelaanbod");%>
        <%String zoekPrijsHotelNaam = (String) request.getAttribute("zoekPrijsHotelNaam");%>

        <!-- banner -->
        <section class="banner_inner" id="home">
            <div class="banner_inner_overlay"></div>
        </section>

        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">
                <div class="row ">   
                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Prijzen voor <%=zoekPrijsHotelNaam%></h1>
                        <table id="dtBasicParken" class="table table-hover">
                            <tr>
                                <th>Periode</th>
                                <th>Prijs per dag</th>
                            </tr>
                            <%for (int i = 0; i < periodes.size(); i++) {%>
                            <tr>
                                <td><%=periodes.get(i).getNaam()%></td>
                                <td>€<%=hotelaanbiedingen.get(i).getPrijsperdag()%></td>
                                <%}%>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>