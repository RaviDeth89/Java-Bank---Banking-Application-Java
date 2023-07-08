import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * @author ravid
 */
public class Client_Message_Filter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
            PrintWriter out=response.getWriter();
            
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String number=request.getParameter("number");
            String message=request.getParameter("message");
       
            
            try{
                Long.parseLong(number);
                
                if(name.equals("") || email.equals("") || number.equals("") || message.equals("")){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please enter the details !!!');");
                    out.println("location='index.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("index.html");  
                    rd.include(request, response);
                }
                else if(Long.parseLong(number)<=1000000000){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please,Enter 10 digit mobile umber !!!');");
                    out.println("location='index.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/index.html");
                    rd.include(request, response);
                }
                else{
                    chain.doFilter(request, response);
                }
            }  
    
        catch(NumberFormatException e){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please enter valid data !!!');");
            out.println("location='index.html';");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("/index.html");  
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
