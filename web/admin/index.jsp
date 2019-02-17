

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="connectDB.connectDB"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>XYZ HOTEL ADMIN</title>
  
  
     
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
<%
    // Database Connectivity
    System.out.println("Connecting to DB ....Admin Page.....");
    connectDB DBconnection = new connectDB();
    if(DBconnection.connect() == 0)
        DBconnection.connect();
%>
    <div id="clouds">
	<div class="cloud x1"></div>
	<!-- Time for multiple clouds to dance around -->
	<div class="cloud x2"></div>
	<div class="cloud x3"></div>
	<div class="cloud x4"></div>
	<div class="cloud x5"></div>
</div>

 <div class="container">


      <div id="login">

        <form method="post">

          <fieldset class="clearfix">

            <p><span class="fontawesome-user"></span><input type="text"  name="user" value="Username" onBlur="if(this.value == '') this.value = 'Username'" onFocus="if(this.value == 'Username') this.value = ''" required></p> <!-- JS because of IE support; better: placeholder="Username" -->
            <p><span class="fontawesome-lock"></span><input type="password" name="pass"  value="Password" onBlur="if(this.value == '') this.value = 'Password'" onFocus="if(this.value == 'Password') this.value = ''" required></p> <!-- JS because of IE support; better: placeholder="Password" -->
            <p><input type="submit" name="sub"  value="Login"></p>

          </fieldset>

        </form>
        <%!
            String Username;
            String Password;
            String ID =null;

            
        %>
        <%
          Username = request.getParameter("user");
          Password = request.getParameter("pass");
          if(Username!=null && Password!=null)
          { 
            DBconnection.checkLogin = DBconnection.stmt.executeQuery
                ("SELECT * FROM login WHERE usname='"+Username+"' AND pass='"+Password+"'");
            if(DBconnection.checkLogin.next()){
                response.sendRedirect("home.jsp");
                
            }
            else{
                response.sendRedirect("index.jsp");
            }
          }
        %>

      </div> <!-- end login -->

    </div>
    <div class="bottom">  <h3><a href="../index.jsp">XYZ HOTEL HOMEPAGE</a></h3></div>
  
  
</body>
</html>
