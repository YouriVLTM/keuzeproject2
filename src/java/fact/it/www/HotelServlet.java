/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fact.it.www;

import fact.it.www.beans.Hotel;
import fact.it.www.beans.Hotelaanbod;
import fact.it.www.beans.Periode;
import fact.it.www.beans.Regio;
import fact.it.www.dataaccess.DAHotel;
import fact.it.www.dataaccess.DAHotelaanbod;
import fact.it.www.dataaccess.DAPeriode;
import fact.it.www.dataaccess.DARegio;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "HotelServlet", urlPatterns = {"/HotelServlet"}, initParams = {
    @WebInitParam(name = "url", value = "jdbc:oracle:thin:@itf-oracledb01.thomasmore.be:1521:XE")
    ,
    @WebInitParam(name = "login", value = "r0662682")
    ,
    @WebInitParam(name = "password", value = "1234")
    ,
    @WebInitParam(name = "driver", value = "oracle.jdbc.driver.OracleDriver")})

public class HotelServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (request.getParameter("toonspecifiek") != null) {

            Hotel hotel = dahotel.getHotel();
            rd = request.getRequestDispatcher("hotel.jsp");
            request.setAttribute("hotel", hotel);
        }
        if (request.getParameter("zoekHotel") != null) {

            Hotel hotel = dahotel.getHotel(request.getParameter("hotelNaam").toLowerCase());
            request.setAttribute("hotel", hotel);
            rd = request.getRequestDispatcher("hotel.jsp");

        } else if (request.getParameter("toonhotels") != null) {

            ArrayList<Hotel> hotels = dahotel.getAlleHotels();
            request.setAttribute("hotels", hotels);
            rd = request.getRequestDispatcher("overzichtHotels.jsp");

        }
        if (request.getParameter("pasAanDelete") != null) {

            ArrayList<Hotel> hotels = dahotel.getAlleHotels();
            rd = request.getRequestDispatcher("hotelaanpassen.jsp");
            request.setAttribute("hotels", hotels);

        } else if (request.getParameter("hotelId") != null) {

            int hotelid = Integer.parseInt(request.getParameter("hotelId"));
            Hotel hotelIdZoek = dahotel.getHotelById(hotelid);
            Regio regioIdZoek = daregio.getRegionaamByHotelId(hotelid);
            request.setAttribute("regioIdZoek", regioIdZoek);
            request.setAttribute("hotelIdZoek", hotelIdZoek);
            rd = request.getRequestDispatcher("hoteldetails.jsp");

        } else if (request.getParameter("zoekPrijs") != null) {

            int hotelid = Integer.parseInt(request.getParameter("zoekPrijs"));
            String zoekPrijsHotelNaam = request.getParameter("zoekPrijsHotelNaam");
            ArrayList<Periode> periode = daperiode.getHotelPrijs(hotelid);
            ArrayList<Hotelaanbod> hotelaanbod = daHotelaanbod.getHotelPrijs(hotelid);
            request.setAttribute("hotelaanbod", hotelaanbod);
            request.setAttribute("periode", periode);
            request.setAttribute("zoekPrijsHotelNaam", zoekPrijsHotelNaam);
            rd = request.getRequestDispatcher("hotelprijs.jsp");
        } else if (request.getParameter("uitgebreid") != null) {

            ArrayList<Regio> alleRegios = daregio.getAlleRegios();
            ArrayList<Periode> allePeriodes = daperiode.getAllePeriodes();
            ArrayList<String> maaltijden = dahotel.getMaaltijden();
            request.setAttribute("alleRegios", alleRegios);
            request.setAttribute("allePeriodes", allePeriodes);
            session.setAttribute("maaltijden", maaltijden);
            rd = request.getRequestDispatcher("zoekhotel.jsp");
        } else if (request.getParameter("maakHotel") != null) {

            ArrayList<Regio> alleRegios = daregio.getAlleRegios();
            Boolean hotelAanmaken = true;
            request.setAttribute("hotelAanmaken", hotelAanmaken);
            request.setAttribute("alleRegios", alleRegios);
            rd = request.getRequestDispatcher("maakHotel.jsp");

        } else if (request.getParameter("voegHotelToe") != null) {
            Boolean hotelAanmaken = true;
            ArrayList<Hotel> hotels = dahotel.getAlleHotels();
            int hotelId = hotels.size() + 1;
            String hotelNaam = request.getParameter("maakHotelNaam");
            int regioId = Integer.parseInt(request.getParameter("maakHotelRegio"));
            int aantalSterren = Integer.parseInt(request.getParameter("maakHotelAantalSterren"));
            String hotelLigging = request.getParameter("maakHotelLigging");
            String maaltijden = request.getParameter("maakHotelMaaltijden");
            String ontspanning = request.getParameter("maakHotelOntspanning");
            String foto = request.getParameter("maakHotelFoto");

            if (!dahotel.zoekHotelNaam(hotelNaam.toLowerCase())) {
                hotelAanmaken = false;
                rd = request.getRequestDispatcher("maakHotel.jsp");

                if (dahotel.insertHotel(hotelId, hotelNaam, regioId, aantalSterren, hotelLigging, maaltijden, ontspanning, foto)) {

                    hotels = dahotel.getAlleHotels();
                    request.setAttribute("hotels", hotels);
                    rd = request.getRequestDispatcher("overzichtHotels.jsp");

                } else {
                    rd = request.getRequestDispatcher("maakHotel.jsp");
                    ArrayList<Regio> alleRegios = daregio.getAlleRegios();

                    request.setAttribute("hotelAanmaken", hotelAanmaken);
                    request.setAttribute("alleRegios", alleRegios);
                    request.setAttribute("foutmelding", "Kan hotel niet aanmaken.");
                }

            } else {
                ArrayList<Regio> alleRegios = daregio.getAlleRegios();
                request.setAttribute("hotelAanmaken", hotelAanmaken);
                request.setAttribute("alleRegios", alleRegios);
                rd = request.getRequestDispatcher("maakHotel.jsp");
                request.setAttribute("foutmelding", "Er bestaat al een hotel met deze naam.");
            }

        } else if (request.getParameter("Verwijderen") != null) {

            int hotelId = Integer.parseInt(request.getParameter("hotelid"));
            dahotel.deleteHotel(hotelId);
            ArrayList<Hotel> hotels = dahotel.getAlleHotels();
            request.setAttribute("hotels", hotels);
            rd = request.getRequestDispatcher("hotelaanpassen.jsp");
        } else if (request.getParameter("Aanpassen") != null) {

            ArrayList<Regio> alleRegios = daregio.getAlleRegios();
            int hotelId = Integer.parseInt(request.getParameter("hotelid"));
            Hotel hotel = dahotel.getHotelById(hotelId);
            request.setAttribute("hotel", hotel);
            request.setAttribute("alleRegios", alleRegios);
            rd = request.getRequestDispatcher("hoteledit.jsp");
        } else if (request.getParameter("pasHotelAan") != null) {

            String hotelNaam = request.getParameter("pasAanNaam");
            int id = Integer.parseInt(request.getParameter("pasAanId"));
            int regioId = Integer.parseInt(request.getParameter("pasAanRegio"));
            int aantalSterren = Integer.parseInt(request.getParameter("pasAanAantalsterren"));
            String hotelLigging = request.getParameter("pasAanLigging");
            String maaltijden = request.getParameter("pasAanMaaltijden");
            String ontspanning = request.getParameter("pasAanOntspanning");
            String foto = request.getParameter("pasAanFoto");

            if (dahotel.editHotel(hotelNaam, regioId, aantalSterren, hotelLigging, maaltijden, ontspanning, foto, id)) {

                ArrayList<Hotel> hotels = dahotel.getAlleHotels();
                request.setAttribute("hotels", hotels);
                rd = request.getRequestDispatcher("hotelaanpassen.jsp");

            } else {
                rd = request.getRequestDispatcher("hoteledit.jsp");
                ArrayList<Regio> alleRegios = daregio.getAlleRegios();
                Hotel hotel = dahotel.getHotelById(id);
                request.setAttribute("hotel", hotel);
                request.setAttribute("alleRegios", alleRegios);
                request.setAttribute("foutmelding", "Kan hotel niet aanmaken.");
            }
          
        }

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
