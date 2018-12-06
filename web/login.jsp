<!DOCTYPE html>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css1.css">
        <!-- Font Awesome -->
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.8/js/mdb.min.js"></script></head>
    <body>
        <%
//            Cookie ck[] = request.getCookies();
//            if(ck.length>2){
//                String Name = ck[1].getValue();
//                String Pass = ck[2].getValue();
//                RequestDispatcher rd=request.getRequestDispatcher("login1.java");
//                
//            }
        %>    
         <form method="get" action ="login1">
 	<center>
 	<table cellspacing="10" cellpadding="3">
         
 	<tr>
 			<td>ID :</td>
            <td><input type="text" name="fname" placeholder="ID" required></td>
 		</tr>
 		<tr>
 			<td>Password :</td>
 			<td><input type="Password" name="lname" placeholder="Password" required></td>
 		</tr>
                <tr>
                    <td></td>
                    <td><input type="checkbox" name="cb">Remember Me</td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><button name="btn2" >LOGIN</button></td>
 		</tr>
 	</table></center>
 </form>
    </body>
</html>
