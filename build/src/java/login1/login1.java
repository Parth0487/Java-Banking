
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login1 extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String []r =new String[3];
         
        r[0]=request.getParameter("fname");
        r[1]=request.getParameter("lname");
        try  
        {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/parth","parth","123");
        ResultSet rs;
        Statement st= con.createStatement();
        rs=st.executeQuery("SELECT PASSWORD FROM LOGIN WHERE ID = '"+r[0]+"'");
        String pass1=null;
        
        if(rs.next())
        {
            pass1=rs.getString(1);
                if(r[1].equals(pass1))
                {
                    RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
                    try{
                    String check =  request.getParameter("cb");
                    if(check != null && check.equals("on")){
                        Cookie ck[] = new Cookie[2];
                        ck[0] = new Cookie("Name",r[0]);
                        ck[0].setMaxAge(2000);
                        ck[1] = new Cookie("Pass",r[1]);
                        ck[1].setMaxAge(2000);
                        response.addCookie(ck[0]);
                        response.addCookie(ck[1]);
                        request.setAttribute("Type","Remember Me");
                    }
                    else{
                        request.setAttribute("Type","No Remember Me");
                    }
                    rd.forward(request,response);
                    }catch(Exception e3){
                        out.print("E2 "+e3.getMessage());
                    }
                }
                else
                {
                    RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }
        }else
        {
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }   
        con.close();
        }
         catch(Exception e)
                {
                    out.print("error is" + e.getMessage());
                }
    }
    }
