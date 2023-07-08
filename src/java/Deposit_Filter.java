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
public class Deposit_Filter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
            PrintWriter out=response.getWriter();
            
            String bal=request.getParameter("bal");
            String pin=request.getParameter("pin");
       
            try{
                Long.parseLong(bal);
                Integer.parseInt(pin);
                
                if(Integer.parseInt(pin)<1000){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid details !!!');");
                    out.println("location='Deposit.html';");
                    out.println("</script>");
                    RequestDispatcher rd2=request.getRequestDispatcher("/Deposit.html");
                    rd2.include(request, response);
                }
                
                else if (Long.parseLong(bal)<=0){
           
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Rs. !!!');");
                out.println("location='Deposit.html';");
                out.println("</script>");
                RequestDispatcher rd1=request.getRequestDispatcher("/Deposit.html");
                rd1.include(request, response);
                }

                else{
                    chain.doFilter(request, response);
                }
            }  
    
        catch(NumberFormatException e){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please enter valid data !!!');");
            out.println("location='Deposit.html';");
            out.println("</script>");
            RequestDispatcher rd3=request.getRequestDispatcher("/Deposit.html");  
            rd3.include(request, response);
        } 
    }
    @Override
    public void destroy() {        
    }

    @Override
    public void init(FilterConfig filterConfig) {        
        
    }
}
