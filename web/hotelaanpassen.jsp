<%-- 
    Document   : hotelaanpassen
    Created on : 22-mei-2019, 12:54:19
    Author     : Ruben
--%>

<%@page import="fact.it.www.beans.Hotel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="temp/head.jsp" />
    <body>
        <jsp:include page="temp/nav.jsp" />
        <section class="banner_inner" id="home">
            <div class="banner_inner_overlay">
            </div>
        </section>
        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">

                <div class="row">               

                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Lijst van Hotels</h1>

                        <%ArrayList<Hotel> hotels = (ArrayList<Hotel>) request.getAttribute("hotels");%>
                        <div class="mb-3">
                            <a href="starthotels.jsp" class="btn btn-outline-primary">Terug naar hotels</a>
                            <a href="HotelServlet?maakHotel=1" class="btn btn-outline-primary">Voeg nieuw hotel toe</a>
                        </div>
                        <table id="dtBasicParken" class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Naam</th>
                                    <th scope="col">Sterren</th>
                                    <th scope="col">Ligging</th>
                                    <th scope="col">Maaltijden</th>
                                    <th scope="col">Ontspanning</th>
                                    <th scope="col">Foto</th>
                                    <th scope="col">Edit</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <%for (Hotel hotel : hotels) {%>
                                    <td scope="row"><%=hotel.getNaam()%></td>                                    
                                    <td><%= hotel.getAantalSterren()%></td>
                                    <%if (hotel.getLigging() == null) {%>
                                    <td></td>
                                    <%} else {%>
                                    <td><%= hotel.getLigging()%></td>
                                    <%}%>
                                    <%if (hotel.getMaaltijden() == null) {%>
                                    <td></td>
                                    <%} else {%>
                                    <td><%= hotel.getMaaltijden()%></td>
                                    <%}%>
                                    <%if (hotel.getOntspanning() == null) {%>
                                    <td></td>
                                    <%} else {%>
                                    <td><%= hotel.getOntspanning()%></td>
                                    <%}%>
                                    <td><img src ="images/<%=hotel.getFoto()%>" alt="<%=hotel.getFoto()%>" class="img-fluid" onerror="this.src='images/noPic.png'"></td>
                                    <td class="text-center"><a href="HotelServlet?Aanpassen=1&hotelid=<%=hotel.getId()%>"> <i class="far fa-edit"></i></a></td>
                                    <td class="text-center"><a href="HotelServlet?Verwijderen=1&hotelid=<%=hotel.getId()%>"><i class="fas fa-trash"></i></a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
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

