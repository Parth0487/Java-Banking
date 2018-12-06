import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.rmi.server.Dispatcher;

public class login extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String []r=new String[10];
        
        r[0] = request.getParameter("fname");
        r[1] = request.getParameter("lname");
        r[2] = request.getParameter("add");
        r[3] = request.getParameter("postcode");
        r[4] = request.getParameter("num");
        r[5] = request.getParameter("email");
        r[6] = request.getParameter("id");
        r[7] = request.getParameter("password");
        r[8] = request.getParameter("amount"); 
        try
        {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/parth","parth","123");
        Statement st= con.createStatement();
        
        int rst1 = st.executeUpdate("insert into register(FIRST_NAME,LAST_NAME,ADDRESS,POSTCODE,CONTACT_NO,EMAIL,ID,AMOUNT) values('"+r[0]+"','"+r[1]+"','"+r[2]+"',"+r[3]+","+r[4]+",'"+r[5]+"','"+r[6]+"',"+r[8]+")");
        int rst2 = st.executeUpdate("insert into login(ID,PASSWORD) values('"+r[6]+"','"+r[7]+"')");
        
        RequestDispatcher rd=request.getRequestDispatcher("register.html");
            rd.forward(request, response);
        
        con.close();
        }
         catch(Exception e)
                {
                    out.print("error is" + e.getMessage());
                }
    }
    }


