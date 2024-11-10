/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import bean.TicketBean;
import dao.TicketDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class TicketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String name = request.getParameter("name");
           String email = request.getParameter("email");
           String ic = request.getParameter("ic");
           String date = request.getParameter("date");
           int adult = Integer.parseInt(request.getParameter("total_adults"));
           int children = Integer.parseInt(request.getParameter("total_children"));
           int totalprice = Integer.parseInt(request.getParameter("totalprice"));

        try {                
        TicketBean ticketBean = new TicketBean();
        
        ticketBean.setName(name);
        ticketBean.setEmail(email);
        ticketBean.setIc(ic);
        ticketBean.setDate(date);
        ticketBean.setTotal_adults(adult);
        ticketBean.setTotal_children(children);
        ticketBean.setTotalprice(totalprice);
        
        TicketDao ticketDao = new TicketDao();
        
        String purchase = ticketDao.ticket(ticketBean);
        
        if(purchase.equals("SUCCESS"))   
         {
             request.setAttribute("errMessage", purchase);
            request.getRequestDispatcher("/bookingDetails.jsp").forward(request, response);
         }
         else   
         {
            request.setAttribute("errMessage", purchase);
            request.getRequestDispatcher("/ticket.jsp").forward(request, response);
         }
    }catch (NumberFormatException nfe) {
      nfe.printStackTrace();
    }
    }
}