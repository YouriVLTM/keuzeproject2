<%-- 
    Document   : vergelijkenparken
    Created on : May 22, 2019, 10:06:58 AM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Park"%>
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
                        <h1 class="heading text-center mb-5">Vergelijk 2 parken</h1>

                        <form action="ParkServlet" >



                            <%ArrayList<Park> parken = (ArrayList<Park>) request.getAttribute("parken");%>
                            
                            <%if(parken != null){%>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="naam1">Park 1</label>
                                </div>
                                <div class="form-group col-md-3"> 
                                    <select class="form-control" name="naam1Id" id="naam1">
                                        <%for (Park park : parken) {%>
                                        <option value="<%=park.getId()%>"><%=park.getNaam()%></option>
                                        <%}%>
                                    </select>
                                </div>  
                            </div>
                                    
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="naam2">Park 2</label>
                                </div>
                                <div class="form-group col-md-3"> 
                                    <select class="form-control" name="naam2Id" id="naam2">
                                        <%for (Park park : parken) {%>
                                        <option value="<%=park.getId()%>"><%=park.getNaam()%></option>
                                        <%}%>
                                    </select>
                                </div>  
                            </div>
                            <%}%>
                                    
                                    
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
                                    <input type="submit" class="btn  sent-butnn btn-outline-primary" name="vergelijkpark" value="Vergelijk park" />
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
