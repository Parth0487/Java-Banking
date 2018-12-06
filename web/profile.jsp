<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        
        <!-- Font Awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.3/css/mdb.min.css" rel="stylesheet">
    </head>
    <body>
       
        <%
            String name=request.getParameter("fname");
            try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            }catch(Exception e)
            {
                out.print(e.getMessage());
            }
        %>
        
        <table align="centr" cellpadding="5" cellspacing="3" border="2">
            <tr></tr>
            <tr>
                <td><b>First Name</b></td>
                <td><b>Last Name</b></td>
                <td><b>Address</b></td>
                <td><b>Postcode</b></td>
                <td><b>Contact_No</b></td>
                <td><b>Email</b></td>
                <td><b>Id</b></td>
                <td><b>Amount</b></td>
            </tr>
            <%
                try{
                 Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/parth","parth","123");
                ResultSet rs;
                Statement st= con.createStatement();
                rs=st.executeQuery("select * from register where id='"+name+"'");
                while(rs.next())
                    
                {
            %>
            
            <tr>

                <td><%=rs.getString("FIRST_NAME") %></td>
                <td><%=rs.getString("LAST_NAME") %></td>
                <td><%=rs.getString("ADDRESS") %></td>
                <td><%=rs.getDouble("POSTCODE") %></td>
                <td><%=rs.getString("CONTACT_NO") %></td>
                <td><%=rs.getString("EMAIL") %></td>
                <td><%=rs.getString("ID") %></td>
                <td><%=rs.getString("AMOUNT") %></td>
            </tr>
            <% 
}

}catch (Exception e) {
e.printStackTrace();
}
%>

        </table>
        
<!--           
           try{
           String cbval=request.getParameter("cb");
           String idval=request.getParameter("fname");
           String passval=request.getParameter("lname");
           
           if(cbval.equals("on"))
           {
            Cookie c1=new Cookie("id", idval);
            response.addCookie(c1);
            Cookie c2=new Cookie("password",passval);
            response.addCookie(c2);
            out.println(c1.getName());
            out.println(c1.getValue());
           out.print("<h1>Hello Mr."+ c1.getValue());
           }
           }catch(Exception e){out.print(e.getMessage());}-->
   
    </body>
</html>
