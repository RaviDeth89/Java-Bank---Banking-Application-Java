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
public class Fixed_deposit_request_01_Filter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
            PrintWriter out=response.getWriter();
           
            String amount=request.getParameter("amount");
       
            try{
              
                Long.parseLong(amount);
                
                if(Long.parseLong(amount)<=0){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid details !!!');");
                    out.println("location='Fixed_deposit_request.jsp';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/Fixed_deposit_request.jsp");
                    rd.include(request, response);
                }
                    
                else if (Long.parseLong(amount)<30000){
           
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Fixed deposit amount must be minimmum 30,000 Rs. !!!');");
                out.println("location='Fixed_deposit_request.jsp';");
                out.println("</script>");
                RequestDispatcher rd1=request.getRequestDispatcher("/Fixed_deposit_request.jsp");
                rd1.include(request, response);
                }
                  
                else{
                    chain.doFilter(request, response);
                }
            }  
    
        catch(NumberFormatException e){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please enter valid data !!!');");
            out.println("location='Fixed_deposit_request.jsp';");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("/Fixed_deposit_request.jsp");  
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
