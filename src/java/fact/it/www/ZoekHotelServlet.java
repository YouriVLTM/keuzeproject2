/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fact.it.www;

import fact.it.www.beans.Hotel;
import fact.it.www.beans.Park;
import fact.it.www.dataaccess.DAHotel;
import fact.it.www.dataaccess.DAHotelaanbod;
import fact.it.www.dataaccess.DAPeriode;
import fact.it.www.dataaccess.DARegio;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ZoekHotelServlet", urlPatterns = {"/ZoekHotelServlet"}, initParams = {
    @WebInitParam(name = "url", value = "jdbc:oracle:thin:@itf-oracledb01.thomasmore.be:1521:XE")
    ,
    @WebInitParam(name = "login", value = "r0662682")
    ,
    @WebInitParam(name = "password", value = "1234")
    ,
    @WebInitParam(name = "driver", value = "oracle.jdbc.driver.OracleDriver")})

public class ZoekHotelServlet extends HttpServlet {

    private DAHotel dahotel = null;
    private DARegio daregio = null;
    private DAHotelaanbod daHotelaanbod = null;
    private DAPeriode daperiode = null;

    public void init() throws ServletException {
        try {
            String url = getInitParameter("url");
            String login = getInitParameter("login");
            String password = getInitParameter("password");
            String driver = getInitParameter("driver");
            if (dahotel == null) {
                dahotel = new DAHotel(url, login, password, driver);
            }
            if (daregio == null) {
                daregio = new DARegio(url, login, password, driver);
            }
            if (daHotelaanbod == null) {
                daHotelaanbod = new DAHotelaanbod(url, login, password, driver);
            }
            if (daperiode == null) {
                daperiode = new DAPeriode(url, login, password, driver);
            }

        } catch (ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = null;

        if (request.getParameter("zoekHotelAantalSterren") != null) {
            
            int aantalSterren = Integer.parseInt(request.getParameter("select"));
            ArrayList<Hotel> hotels = dahotel.getHotelsByAantalSterren(aantalSterren);
            request.setAttribute("hotels", hotels);

        }else if (request.getParameter("zoekHotelRegio") != null) {
            
            int regioId = Integer.parseInt(request.getParameter("regio"));
            ArrayList<Hotel> hotels = dahotel.getHotelsByRegio(regioId);
            request.setAttribute("hotels", hotels);           
            
        }else if (request.getParameter("zoekHotelNaam") != null) {
            
            String hotelNaam = request.getParameter("hotelNaam").toLowerCase();
            ArrayList<Hotel> hotels = dahotel.getHotelsByNaam(hotelNaam);
            request.setAttribute("hotels", hotels);           
            
            
        }
        rd = request.getRequestDispatcher("overzichtHotels.jsp");
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
