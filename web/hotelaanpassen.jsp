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

                        <table id="dtBasicParken" class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Naam</th>
                                    <th scope="col" class="w-auto">Regio</th>
                                    <th scope="col">Aantalsterren</th>
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
                                    <td class="w-auto"><%=hotel.getRegioid()%></td>
                                    <td><%= hotel.getAantalSterren()%></td>
                                    <td><%= hotel.getLigging()%></td>
                                    <td><%= hotel.getMaaltijden()%></td>
                                    <td><%= hotel.getOntspanning()%></td>
                                    <td><img src ="images/<%=hotel.getFoto()%>" alt="<%=hotel.getFoto()%>" class="img-fluid" onerror="this.src='images/noPic.png'"></td>
                                    <td><a href="HotelServlet?Aanpassen=1&hotelid=<%=hotel.getId()%>"> <i class="far fa-edit"></i></a></td>
                                    <td><a href="HotelServlet?Verwijderen=1&hotelid=<%=hotel.getId()%>"><i class="fas fa-trash"></i></a></td>
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

