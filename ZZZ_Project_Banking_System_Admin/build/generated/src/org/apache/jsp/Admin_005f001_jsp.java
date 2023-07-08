package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Admin_005f001_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"icon\" href=\"Laughing-Person.svg\">\n");
      out.write("        <title>Admin Login</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link href=\"index-styles.css\" rel=\"stylesheet\" />\n");
      out.write("        <style>\n");
      out.write("            \n");
      out.write("            body{\n");
      out.write("                font-family: Arial, Helvetica, sans-serif;\n");
      out.write("                background: url('other-bck.jpg');\n");
      out.write("                background-size: cover;\n");
      out.write("                background-attachment: fixed;\n");
      out.write("                font-size: 1.20em;\n");
      out.write("            }\n");
      out.write("            * {box-sizing: border-box}\n");
      out.write("            .container-h1{\n");
      out.write("                width: 40%;\n");
      out.write("                margin: 0 auto;\n");
      out.write("                margin-top: 8%;\n");
      out.write("            }\n");
      out.write("            .h10{\n");
      out.write("                background-color: rgba(26, 188, 156, 0.5);\n");
      out.write("                color: #003366;\n");
      out.write("                font-family:inherit;\n");
      out.write("                font-weight: bolder;\n");
      out.write("            }\n");
      out.write("            .container-atm {\n");
      out.write("                width: 75%;\n");
      out.write("                margin: 0 auto;\n");
      out.write("                margin-top: 4%;\n");
      out.write("                margin-left: 27.5%;\n");
      out.write("                margin-right: 50%;\n");
      out.write("            }\n");
      out.write("            .right {\n");
      out.write("                position: absolute;\n");
      out.write("                right: 10px;\n");
      out.write("                top: 125px;\n");
      out.write("                display: inline-block;\n");
      out.write("            }\n");
      out.write("            .left {\n");
      out.write("                position: absolute;\n");
      out.write("                left: 10px;\n");
      out.write("                top: 125px;\n");
      out.write("                display: inline-block;\n");
      out.write("            }\n");
      out.write("            img{\n");
      out.write("                height: 560px;\n");
      out.write("                width: 475px;\n");
      out.write("            }\n");
      out.write("            table {\n");
      out.write("                  border: 2px solid gray;\n");
      out.write("                  border-collapse: collapse;\n");
      out.write("                  margin: 0;\n");
      out.write("                  padding: 0;\n");
      out.write("                  width: 60%;\n");
      out.write("                  table-layout: fixed;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                table caption {\n");
      out.write("                  font-size: 1.5em;\n");
      out.write("                  margin: .5em 0 .75em;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                table tr {\n");
      out.write("                  background-color: rgba(255, 255, 255, 0.5);\n");
      out.write("                  font-weight: bold;\n");
      out.write("                  border: 1px solid #ddd;\n");
      out.write("                  padding: .35em;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                table th,\n");
      out.write("                table td {\n");
      out.write("                  padding: .625em;\n");
      out.write("                  text-align: center;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                table th {\n");
      out.write("                  font-size: .85em;\n");
      out.write("                  letter-spacing: .1em;\n");
      out.write("                  text-transform: uppercase;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                @media screen and (max-width: 600px) {\n");
      out.write("                  table {\n");
      out.write("                    border: 0;\n");
      out.write("                  }\n");
      out.write("\n");
      out.write("                  table caption {\n");
      out.write("                    font-size: 1.3em;\n");
      out.write("                  }\n");
      out.write("\n");
      out.write("                  table thead {\n");
      out.write("                    border: none;\n");
      out.write("                    height: 1px;\n");
      out.write("                    margin: -1px;\n");
      out.write("                    overflow: hidden;\n");
      out.write("                    padding: 0;\n");
      out.write("                    position: absolute;\n");
      out.write("                    width: 1px;\n");
      out.write("                  }\n");
      out.write("\n");
      out.write("                  table tr {\n");
      out.write("                    border-bottom: 3px solid #ddd;\n");
      out.write("                    display: block;\n");
      out.write("                    margin-bottom: .625em;\n");
      out.write("                  }\n");
      out.write("\n");
      out.write("                  table td {\n");
      out.write("                    border-bottom: 1px solid #ddd;\n");
      out.write("                    display: block;\n");
      out.write("                    font-size: .8em;\n");
      out.write("                    text-align: right;\n");
      out.write("                  }\n");
      out.write("\n");
      out.write("                  table td::before {\n");
      out.write("                    content: attr(data-label);\n");
      out.write("                    float: left;\n");
      out.write("                    font-weight: bold;\n");
      out.write("                    text-transform: uppercase;\n");
      out.write("                  }\n");
      out.write("                  \n");
      out.write("                  table td:last-child {\n");
      out.write("                    border-bottom: 0;\n");
      out.write("                  }\n");
      out.write("                }\n");
      out.write("                .btn{  \n");
      out.write("                    background-color: lightgoldenrodyellow;\n");
      out.write("                    font-weight: bold;\n");
      out.write("                    border-color: darkslategray;\n");
      out.write("                }\n");
      out.write("                .btn:hover{\n");
      out.write("                    background-color: cadetblue;\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        <nav\n");
      out.write("\t\tclass=\"navbar navbar-expand-lg bg-secondary text-uppercase fixed-top\"\n");
      out.write("\t\tid=\"mainNav\">\n");
      out.write("\t\t<div class=\"container\">\n");
      out.write("\t\t\t<a class=\"navbar-brand\" href=\"Admin_001.jsp\">JAVA BANK</a>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<div class=\"collapse navbar-collapse\" id=\"navbarResponsive\">\n");
      out.write("\t\t\t\t<ul class=\"navbar-nav ms-auto\">\n");
      out.write("\t\t\t\t\t<li class=\"nav-item mx-0 mx-lg-1\"><a\n");
      out.write("\t\t\t\t\t\tclass=\"nav-link py-3 px-0 px-lg-3 rounded\" href=\"Admin_001.jsp\">Home</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</nav>\n");
      out.write("    \n");
      out.write("        <br>\n");
      out.write("        <form action=\"Admin_002.jsp\" method=\"post\">\n");
      out.write("            <div class=\"container-h1\"><h1 align=\"center\" class=\"h10\">Admin Login &#128176;</h1></div>\n");
      out.write("            <div class=\"container-atm\">\n");
      out.write("                <table>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>\n");
      out.write("                            ID Number :\n");
      out.write("                        </td>\n");
      out.write("                        <td>\n");
      out.write("                            <input type=\"text\" name=\"id\" placeholder=\"ID number\"/>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>\n");
      out.write("                            Administrator Name :\n");
      out.write("                        </td>\n");
      out.write("                        <td>\n");
      out.write("                            <input type=\"text\" name=\"name\" placeholder=\"Administrator Name\"/>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>\n");
      out.write("                            Password : \n");
      out.write("                        </td>\n");
      out.write("                        <td>\n");
      out.write("                            <input type=\"password\" name=\"password\" placeholder=\"Password\"/>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>\n");
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                        <td>\n");
      out.write("                            <button type=\"submit\" name=\"Enter\" class=\"btn\"> Login </button>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>  \n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("    </body>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
