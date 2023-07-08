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
public class Money_Transfer_01_Filter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
            PrintWriter out=response.getWriter();
            
           
            String ts_account_no=request.getParameter("ts_account_no");
            String ts_amount=request.getParameter("ts_amount");
       
            try{
               
                Long.parseLong(ts_account_no);
                Long.parseLong(ts_amount);
                
                if(Long.parseLong(ts_amount)<=0 || Long.parseLong(ts_account_no)<=0){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid details !!!');");
                    out.println("location='Money_Transfer.jsp';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/Money_Transfer.jsp");
                    rd.include(request, response);
                }
                
                else if (Long.parseLong(ts_account_no)<1000000000){
           
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Account number must be 10 digit !!!');");
                    out.println("location='Money_Transfer.jsp';");
                    out.println("</script>");
                    RequestDispatcher rd1=request.getRequestDispatcher("/Money_Transfer.jsp");
                    rd1.include(request, response);
                }
                  
                else if(Long.parseLong(ts_account_no)>=1000000000){
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_bank","root","");
                        String sr="select * from account_details where account_no='" +Long.parseLong(ts_account_no)+"'";
                        Statement sp=con.createStatement();
                        ResultSet rs=sp.executeQuery(sr);

                        if(rs.next()){  
                            RequestDispatcher rd=request.getRequestDispatcher("/Money_Transfer_01.jsp");  
                            rd.forward(request, response);
                            
                        }
                        else{
                           out.println("<script type=\"text/javascript\">");
                            out.println("alert('Account number is not exist !!!');");
                            out.println("location='Money_Transfer.jsp';");
                            out.println("</script>");
                            RequestDispatcher rd=request.getRequestDispatcher("/Money_Transfer.jsp");
                            rd.include(request, response); 
                        }
                    
                    } catch (ClassNotFoundException | SQLException ex) {
                        Logger.getLogger(New_Account_Filter.class.getName()).log(Level.SEVERE, null, ex);
                    }      
                }    

                else{
                    chain.doFilter(request, response);
                }
            }  
    
        catch(NumberFormatException e){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please enter valid data !!!');");
            out.println("location='Money_Transfer.jsp';");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("/Money_Transfer.jsp");  
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
