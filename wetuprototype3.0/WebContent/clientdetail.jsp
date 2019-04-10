<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <title></title>
  <meta name="author" content="Robbert Matasa">

  <link rel="stylesheet" type="text/css" media="all" href="css/styles.css">
  <link rel="stylesheet" type="text/css" media="all" href="c/switchery.min.css">
    <script type="text/javascript" src="js/switchery.min.js"></script>
  
  <script type="text/javascript" src=""></script>
</head>

<body>
  <div id="wrapper">

 <h1>Itinerary Details</h1>



  <%
    if (session != null) {
      if (session.getAttribute("user") != null) {
        String name = (String) session.getAttribute("user");
        out.print("Hello, " + name + "  Profile");
      } else {
        response.sendRedirect("login.html");
      }
    }
  %>


  
<form method="POST" action='UserHandler' name="frmAddUser">

<input type="hidden" name="action" value="insert"  />
 

	<div class="col-2">
        <label>
      Itinerary Name
      <input type="text" placeholder="Name of the itinerary?"  name="itinname" tabindex="1">
    </label>
  </div>
  <div class="col-2">
     <label>
      Branding
<select tabindex="1" name="branding">
        <option>Select Branding</option>
        <option value="Afrolink Adventures">Afrolink Adventures</option>
        <option value="Other">Other</option>
        
      </select>    </label>
  </div>
  <div class="col-2">
     <label>
      Itinerary Type
<select tabindex="1" name="itintype">
        <option>Select Itinerary type</option>
        <option value="Not Specified">Not Specified</option>
        <option value="Self drive">Self drive</option>
        <option value="Overland">Overland</option>
        <option value="Fully Guided">Fully Guided</option>        
         <option value="Scheduled Tour">Scheduled Tour</option>
         <option value="Partially Guided">Partially Guided</option>        
         <option value="Tailor Made Tour">Tailor Made Tour</option>        
         <option value="Customized Tour">Customized Tour</option>       
         <option value="Other">Other</option>
        
        
      </select>    </label>
  </div>
  
   <div class="col-2">
     <label>
      Language
<select tabindex="1" name="language">
        <option>Select Language</option>
        <option value="English">English</option>
        <option value="French">French</option>
        <option value="German">German</option>
        <option value="Other">Other</option>
        
      </select>    </label>
  </div>
   
      <input type="hidden" name="itinsessid" tabindex="6" value="${testInq}"> 
  
  <div class="col-submit">
    <button type="submit" class="submitbtn">Next</button>
  </div>
  
  </form>
  </div>
<script type="text/javascript">
var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));

elems.forEach(function(html) {
  var switchery = new Switchery(html);
});
</script>


</body>
</html>