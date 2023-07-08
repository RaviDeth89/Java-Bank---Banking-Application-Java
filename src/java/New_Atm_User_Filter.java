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
public class New_Atm_User_Filter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
            PrintWriter out=response.getWriter();       
                            
            String account_no=request.getParameter("account_no");
            String card_no=request.getParameter("card_no");
            String mob_no=request.getParameter("mob_no");       
 
            String pin=request.getParameter("pin");
            String pin_repeat=request.getParameter("pin_repeat");
           
            try{
                Long.parseLong(account_no);
                Long.parseLong(card_no);
                Long.parseLong(mob_no);
                Long.parseLong(pin);
                Long.parseLong(pin_repeat);
                
                if(Long.parseLong(account_no)<=0 || Long.parseLong(card_no)<=0 || Long.parseLong(mob_no)<=0||Long.parseLong(pin)<=0){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please,Enter valid details !!!');");
                    out.println("location='New_Atm_User.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/New_Atm_User.html");
                    rd.include(request, response);
                }
                
                else if(Long.parseLong(account_no)<1000000000){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please,Enter minimum 10 digit Account no. !!!');");
                    out.println("location='New_Atm_User.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/New_Atm_User.html");
                    rd.include(request, response);
                }
                else if(Long.parseLong(card_no)<100000){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please,Enter minimum 6 digit Card no. !!!');");
                    out.println("location='New_Atm_User.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/New_Atm_User.html");
                    rd.include(request, response);
                }
                
                else if(Long.parseLong(mob_no)<1000000000){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please, Enter 10 digit Mobile number !!!');");
                    out.println("location='New_Atm_User.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/New_Atm_User.html");
                    rd.include(request, response);
                }
                
                else if(Integer.parseInt(pin)<1000){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please, Enter minimum 4 digit PIN !!!');");
                    out.println("location='New_Atm_User.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/New_Atm_User.html");
                    rd.include(request, response);
                }

                else if(! pin.equals(pin_repeat)){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please, match the PIN !!!');");
                    out.println("location='New_Atm_User.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/New_Atm_User.html");  
                    rd.include(request, response);
                }
                
                else if(Long.parseLong(card_no)>=100000){
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_bank","root","");
                        String sr="select * from account_details where account_no='" +Long.parseLong(account_no)+"'";
                        String sr1="select * from atm where card_no='" +Long.parseLong(card_no)+"'";
                        String sr2="select * from atm where account_no='" +Long.parseLong(account_no)+"'";
                        Statement sp=con.createStatement();
                        Statement sp1=con.createStatement();
                        ResultSet rs=sp.executeQuery(sr);
                        ResultSet rs1=sp1.executeQuery(sr1);
                        Statement sp2=con.createStatement();
                        ResultSet rs2=sp2.executeQuery(sr2);

                        if(rs1.next()){   
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Card No. is already exist !!!');");
                            out.println("location='New_Atm_User.html';");
                            out.println("</script>");
                            RequestDispatcher rd=request.getRequestDispatcher("/New_Atm_User.html");
                            rd.include(request, response);
                        }
                        if(rs2.next()){   
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('You can register only one ATM card on this account number !!!');");
                            out.println("location='New_Atm_User.html';");
                            out.println("</script>");
                            RequestDispatcher rd=request.getRequestDispatcher("/New_Atm_User.html");
                            rd.include(request, response);
                        }
                        else if(rs.next()){   
                            RequestDispatcher rd=request.getRequestDispatcher("/New_Atm_User.jsp");  
                            rd.forward(request, response);
                        }
                        else{
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Account No. is not exist !!!');");
                            out.println("location='New_Atm_User.html';");
                            out.println("</script>");
                            RequestDispatcher rd=request.getRequestDispatcher("/New_Atm_User.html");
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
            out.println("location='New_Atm_User.html';");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("/New_Atm_User.html");  
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
