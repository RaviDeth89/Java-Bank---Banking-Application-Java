import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.*;

/*
 * @author ravid
 */
public class Change_Password_01_Filter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
            PrintWriter out=response.getWriter();
            
            String password=request.getParameter("password");
            String password_repeat=request.getParameter("password_repeat");
       
            if(!password.equals(password_repeat)){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('New password doesnot match !!!');");
                out.println("location='Change_Password.jsp';");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("/Change_Password.jsp");
                rd.include(request, response);           
            }
                
            else if(password.equals(password_repeat)){  
                RequestDispatcher rd=request.getRequestDispatcher("/Change_Password_01.jsp");  
                rd.forward(request, response);          
            }    
                    
            else{
                    chain.doFilter(request, response);
                }
     }  
    
    @Override
    public void destroy() {        
    }

    @Override
    public void init(FilterConfig filterConfig) {        
        
    }
}
