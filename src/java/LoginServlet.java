/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import bean.LoginBean;
import dao.LoginDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author frsha
 */
public class LoginServlet extends HttpServlet {

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
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            LoginBean loginBean = new LoginBean(username, password);
            LoginDao loginDao = new LoginDao();

            String userValidate = loginDao.authenticateUser(loginBean);

            if (userValidate.equals("SUCCESS")) {
                String usernameDB = loginDao.getUsername();
                HttpSession session = request.getSession();
                session.setAttribute("username", usernameDB);

                request.setAttribute("successMesage", "WELCOME TO HEPILAND");
                RequestDispatcher view = request.getRequestDispatcher("/dashboard.html");
                view.forward(request, response);
            }
            request.setAttribute("errorMesage", userValidate);
            RequestDispatcher view = request.getRequestDispatcher("/index.html");
            view.forward(request, response);
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
        processRequest(request, response);

//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        LoginBean loginBean = new LoginBean();
//
//        loginBean.setUsername(username);
//        loginBean.setPassword(password);
//
//        LoginDao loginDao = new LoginDao();
//        String userValidate = loginDao.authenticateUser(loginBean);
//
//        if (userValidate.equals("SUCCESS")) {
//            request.setAttribute("username", username);
//            request.getRequestDispatcher("/dashboard.html").forward(request, response);
//        } else {
//            request.setAttribute("errMessage", userValidate);
//            request.getRequestDispatcher("/login.jsp").forward(request, response);
//        }
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
