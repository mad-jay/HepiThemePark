

import bean.RegisterBean;
import dao.RegisterDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String nophone = request.getParameter("nophone");
        String conpsw = request.getParameter("conpsw");
        
        if(!password.equals(conpsw)){
            request.setAttribute("errMessage", "please reconfirm password correctly");
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
        }else{
        RegisterBean rb = new RegisterBean();
        
        rb.setUsername(username);
        rb.setEmail(email);
        rb.setPassword(password);
        rb.setNophone(nophone);
        
        RegisterDao rd = new RegisterDao();
        
        String userRegistered = rd.registerUser(rb);
        
        if(userRegistered.equals("SUCCESS"))   
         {
             request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("/index.html").forward(request, response);
         }
         else   
         {
            request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
         }
        }        
    }
}
