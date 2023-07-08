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
public class New_Account_Filter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
            PrintWriter out=response.getWriter();       
                            
            String account_no=request.getParameter("account_no");
            String pincode=request.getParameter("pincode");
            String aadhar_no=request.getParameter("aadhar_no");
            String age=request.getParameter("age");
            String mob_no=request.getParameter("mob_no");       
 
            String password=request.getParameter("password");
            String password_repeat=request.getParameter("password_repeat");
           
            try{
                Long.parseLong(account_no);
                Long.parseLong(pincode);
                Long.parseLong(aadhar_no);
                Long.parseLong(age);
                Long.parseLong(mob_no);
                
                if(Long.parseLong(account_no)<=0 || Long.parseLong(pincode)<=0 || Long.parseLong(aadhar_no)<=0||Long.parseLong(age)<=10 || Long.parseLong(mob_no)<=0){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please,Enter valid details !!!');");
                    out.println("location='NewAccount.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/NewAccount.html");
                    rd.include(request, response);
                }
                else if(Long.parseLong(account_no)<1000000000){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please,Enter minimum 10 digit Account no. !!!');");
                    out.println("location='NewAccount.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/NewAccount.html");
                    rd.include(request, response);
                }
                else if(Long.parseLong(mob_no)<1000000000){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please, Enter 10 digit Mobile number !!!');");
                    out.println("location='NewAccount.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/NewAccount.html");
                    rd.include(request, response);
                }
                
                else if(Integer.parseInt(pincode)<100000){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please, Enter minimum 6 digit Pincode !!!');");
                    out.println("location='NewAccount.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/NewAccount.html");
                    rd.include(request, response);
                }

                else if (Long.parseLong(aadhar_no)<1000000000 ){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please, Enter minimum 10 digit Aadhar card no. !!!');");
                    out.println("location='NewAccount.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/NewAccount.html");  
                    rd.include(request, response);
                }
                else if(Long.parseLong(age)>150){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please, Enter valid Age !!!');");
                    out.println("location='NewAccount.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/NewAccount.html");  
                    rd.include(request, response);
                }
                
                else if(! password.equals(password_repeat)){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please, match the password !!!');");
                    out.println("location='NewAccount.html';");
                    out.println("</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/NewAccount.html");  
                    rd.include(request, response);
                }
                
                else if(Long.parseLong(account_no)>=1000000000){
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_bank","root","");
                        String sr="select * from account_details where account_no='" +Long.parseLong(account_no)+"'";
                        Statement sp=con.createStatement();
                        ResultSet rs=sp.executeQuery(sr);

                        if(rs.next()){   
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Account No. is already exist !!!');");
                            out.println("location='NewAccount.html';");
                            out.println("</script>");
                            RequestDispatcher rd=request.getRequestDispatcher("/NewAccount.html");
                            rd.include(request, response);
                        }
                        else{
                            RequestDispatcher rd=request.getRequestDispatcher("/NewAccount.jsp");  
                            rd.forward(request, response);
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
            out.println("location='NewAccount.html';");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("/NewAccount.html");  
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
