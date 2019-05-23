<%-- 
    Document   : adminoverzichtvakantiehuizen
    Created on : May 22, 2019, 10:06:58 AM
    Author     : yourivanlaer
--%>

<%@page import="java.util.Hashtable"%>
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
        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">

                <div class="row">               

                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Lijst van Vakantiehuizen</h1>

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
                        <a href="ParkServlet?adminoverzichtpagina=1" class="btn btn-outline-primary">Terug naar admin dashboard</a>
                        <a href="ParkServlet?voegvakantiehuistoepagina=1" class="btn btn-outline-primary">Voeg nieuw vakantiehuis toe</a>
                        <br>
                        <br>

                        <%ArrayList<Vakantiehuis> vakantiehuizen = (ArrayList<Vakantiehuis>) request.getAttribute("vakantiehuizen");%>
                        <%Hashtable<Integer, Park> parken = (Hashtable<Integer, Park>) request.getAttribute("parken");%>
                        <% if (!parken.isEmpty()) { %>
                        <% if (!vakantiehuizen.isEmpty()) { %>

                        <table id="dtBasicParken" class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">id</th>
                                    <th scope="col">ParkID</th>
                                    <th scope="col">Type</th>
                                    <th scope="col">aantal slaapkamers</th>
                                    <th scope="col">aantal personen</th>
                                    <th scope="col">oppervlakte</th>
                                    <th scope="col">Edit</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Vakantiehuis vakantiehuis : vakantiehuizen) {%>
                                <tr>
                                    <th scope="row"><%=vakantiehuis.getId()%></th>
                                    <td><%=parken.get(vakantiehuis.getParkid()).getNaam()%></td>
                                    <td><%=vakantiehuis.getType()%></td>
                                    <td><%=vakantiehuis.getAantalSlaapkamers()%></td>
                                    <td><%=vakantiehuis.getAantalPersonen()%></td>
                                    <td><%=vakantiehuis.getOppervlakte()%></td>
                                    <td><a href="ParkServlet?wijzigvakantiehuispagina=<%=vakantiehuis.getId()%>" <i class="far fa-edit"></i></a> </td>
                                    <td><a href="ParkServlet?adminoverzichtvakantiehuisdelete=<%=vakantiehuis.getId()%>" <i class="fas fa-trash"></i></a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <%} else {%>
                        <p>Er is geen vakantiehuizen gevonden</p>        
                        <%}%>
                        <%} else {%>
                        <p>Er is geen parken gevonden</p>        
                        <%}%>
                    </div>
                </div>
        </section>
        <!-- tour packages -->
        <jsp:include page="temp/footer.jsp" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf8" src="temp/table.js"></script>

    </body>
</html>
