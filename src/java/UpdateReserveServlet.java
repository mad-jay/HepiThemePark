/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import bean.ReserveBean;
import dao.ReserveDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mad
 */
public class UpdateReserveServlet extends HttpServlet {

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
            throws ServletException, IOException, ParseException {

        String IC = request.getParameter("IC");
        String EMAIL = request.getParameter("EMAIL");
        int ADULT_TICKET = Integer.parseInt(request.getParameter("ADULT_TICKET"));
        int CHILDREN_TICKET = Integer.parseInt(request.getParameter("CHILDREN_TICKET"));
        java.util.Date DATE = new java.util.Date();
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            DATE = format.parse(request.getParameter("hari"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int TOTALPRICE = ((CHILDREN_TICKET * 120) + (ADULT_TICKET * 150));

        ReserveBean updateBean = new ReserveBean();

        updateBean.setIC(IC);
        updateBean.setEMAIL(EMAIL);
        updateBean.setADULT_TICKET(ADULT_TICKET);
        updateBean.setCHILDREN_TICKET(CHILDREN_TICKET);
        updateBean.setDATE(DATE);
        updateBean.setTOTALPRICE(TOTALPRICE);

        ReserveDao updateDao = new ReserveDao();

        String update = updateDao.update_booking(updateBean);

        HttpSession session = request.getSession();
        session.setAttribute("status", update);
        request.getRequestDispatcher("/dashboard.html").forward(request, response);
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

        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateReserveServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

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

        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateReserveServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

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
