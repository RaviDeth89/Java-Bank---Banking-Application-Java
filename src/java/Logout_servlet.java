import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * @author ravid
 */
@WebServlet(urlPatterns = {"/Logout_servlet"})
public class Logout_servlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
            PrintWriter out=response.getWriter();
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.removeAttribute("ac_number");
                session.removeAttribute("atm_number");
                session.invalidate();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('You have successfully logged out...');");
                out.println("location='index.html';");
                out.println("</script>");
            }
                out.println("<script type=\"text/javascript\">");
                out.println("alert('You have successfully logged out...');");
                out.println("location='index.html';");
                out.println("</script>");  
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
