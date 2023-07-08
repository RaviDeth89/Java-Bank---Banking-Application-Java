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
public class Admin_005_Filter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
            PrintWriter out=response.getWriter();
            
            String bal=request.getParameter("bal");
        
            try{
           
                Long.parseLong(bal);
              
                
                if (Long.parseLong(bal)<=0){
           
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Rs. !!!');");
                out.println("location='Admin_003.jsp';");
                out.println("</script>");
                RequestDispatcher rd1=request.getRequestDispatcher("/Admin_003.jsp");
                rd1.include(request, response);
                }
                
                else if (Long.parseLong(bal)<1000){
           
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Minimum balance must be 1000 Rs. !!!');");
                out.println("location='Admin_003.jsp';");
                out.println("</script>");
                RequestDispatcher rd1=request.getRequestDispatcher("/Admin_003.jsp");
                rd1.include(request, response);
                }

                else{
                    chain.doFilter(request, response);
                }
            }  
    
        catch(NumberFormatException e){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please enter valid data !!!');");
            out.println("location='Admin_003.jsp';");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("/Admin_003.jsp");  
            rd.include(request, response);
        } 
    }
    @Override
    public void destroy() {        
    }

    @Override
    public void init(FilterConfig filterConfig) {        
        
    }
}
