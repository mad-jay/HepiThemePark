/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import bean.paymentBean;
import dao.paymentDao;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author arish
 */
public class paymentServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet paymentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet paymentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        //processRequest(request, response);
        
             List errorMsgs = new LinkedList();
        
        try{
        //copying all the input parameters in to local variables
        String CARDNO = request.getParameter("CARDNO");
        String CARDNAME= request.getParameter("CARDNAME");
        String CVV = request.getParameter("CVV");
        String EXPMONTH = request.getParameter("EXPMONTH");
        String EXPYEAR = request.getParameter("EXPYEAR");
        String IC = request.getParameter("IC");
        
        paymentBean paymentBean = new paymentBean();
        
        paymentBean.setCARDNO(CARDNO);
        paymentBean.setCARDNAME(CARDNAME);
        paymentBean.setCVV(CVV);
        paymentBean.setEXPMONTH(EXPMONTH);
        paymentBean.setEXPYEAR(EXPYEAR);
        paymentBean.setIC(IC);
        
        //check if the field is empty
        if((CARDNO == null)|| CARDNO.length()==0){
                errorMsgs.add("Please enter card number");
            }
        
        if((CARDNAME== null)|| CARDNAME.length()==0){
                errorMsgs.add("Please enter card name");
            }
        
        if((CVV == null)||CVV.length()==0){
                errorMsgs.add("Please enter cvv number");
            }
        
        if((EXPMONTH == null)||EXPMONTH.length()==0){
                errorMsgs.add("Please enter month");
            }
        
        if((EXPYEAR == null)||EXPYEAR.length()==0){
                errorMsgs.add("Please enter year");
            }
        
        if((IC == null)||IC.length()==0){
                errorMsgs.add("Please enter email");
            }
        
        
        if(! errorMsgs.isEmpty()){
               request.setAttribute("errorMsgs", errorMsgs);
               RequestDispatcher view = request.getRequestDispatcher("/error.jsp");
               view.forward(request,response);
               return;
            }
           
            paymentDao paymentDao = new paymentDao();
            String userPayment = paymentDao.paymentUser(paymentBean);
            if (userPayment.equalsIgnoreCase("SUCCESS"));
            request.setAttribute("CARDNO",CARDNO);

            //Dispatch to Success View
            RequestDispatcher view = request.getRequestDispatcher("/successPayment.jsp");
            view.forward(request,response);
       
        }catch (Exception ex) {
             errorMsgs.add("Error: " + ex.getMessage());
             request.setAttribute("errorMsgs", errorMsgs);
             RequestDispatcher view = request.getRequestDispatcher("/error.jsp");
             view.include(request, response);
        }finally{
             out.close();
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
