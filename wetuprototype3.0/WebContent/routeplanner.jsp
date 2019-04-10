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
  <link rel="stylesheet" type="text/css" media="all" href="css/switchery.min.css">
  <script type="text/javascript" src="js/switchery.min.js"></script>
   <script type="text/javascript">

	var categories = [];   // Option Text|Option Value; 
	categories['LandCruiser'] = ['4x4 LandCruiser|4x4 LandCruise'];

	categories['SelfDrive'] = ['Birthday|Birthday','Christmas|Christmas','Corporate|Corporate'];

	categories['Transfer'] = ['Safari mini van|Safari mini van','Private Transfer|Private Transfer','Shared group Transfer|Shared group Transfer'];

	categories['Flight'] = ['Regional|Regional','Local|Local','International|International'];


 // the "names" of the dynamic lists, as they occur in the form;

	categories['Birthday'] = ['Disney|DisneyValue','Pirates|PriatesValue','Princess|PrinessValue','Ballet|BalletValue','Magic|MagicValue','Surfer|SurferValue','Hawaiian|HawaiianValue','50\'s 60\'s 70\'s|50\'sValue','Rock & Roll|RRValue','Horses|HorsesValue','Zoo|ZooValue'];

	categories['Christmas'] = ['Magic|MagicValue','Hawaiian|HawaiianValue','50\'s 60\'s 70\s|50\'sValue'];

	categories['Corporate'] = ['Magic|MagicValue','Hawaiian|HawaiianValue','50\'s 60\'s 70\s|50\'sValue','Rock & Roll|RRValue'];

 // take note of landcruiser below and the option value above
    categories['4x4 LandCruiser'] = ['Disney|DisneyValue','Pirates|PriatesValue','Princess|PrinessValue','Ballet|BalletValue','Magic|MagicValue'];

	categories['Safari mini van'] = ['Magic|MagicValue','Hawaiian|HawaiianValue','50\'s 60\'s 70\s|50\'sValue'];

	categories['Private Transfer'] = ['Magic|MagicValue','Hawaiian|HawaiianValue','50\'s 60\'s 70\s|50\'sValue','Rock & Roll|RRValue'];

	categories['Shared group Transfer'] = ['Magic|MagicValue','Hawaiian|HawaiianValue','50\'s 60\'s 70\s|50\'sValue','Rock & Roll|RRValue'];


	categories['Regional'] = ['Kenya Airways','AirKenya','Mombasa Air','Safarilink','Precision Air'];

	categories['Local'] = ['Kenya Airways','Precision Air','Coastal Aviation','Air Excel'];

	categories['International'] = ['Kenya Airways|kq'];





	var dynList = ['plannermodetype','plannermodetheme'];  // the "names" of the dynamic lists, as they occur in the form;

	function fillSelect(currCat,currList,step){

		for (i=step; i<dynList.length; i++)
			{
			 document.forms[0][dynList[i]].length = 1;
			 document.forms[0][dynList[i]].selectedIndex = 0;
			}
		var nCategory = categories[currCat];
		for (each in nCategory)
			{
			 var nOption = document.createElement('option'); 
			 var nInfo = nCategory[each].split("|");
			 nOption.setAttribute('value',nInfo[1]); 
			 nOption.appendChild(document.createTextNode(nInfo[0])); 
			 currList.appendChild(nOption); 
			} 
	}
	
</script>
  
</head>

<body>



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



  
  <div id="wrapper">
  
  <h1>Route Planner</h1>
  
 <form method="POST" action='UserHandler' name="frmAddUser">
 <input type="hidden" name="action" value="insertplanner"  />
	
	
  <div class="col-2">
     <label>
      Start
      <select name="plannerstart" tabindex="1">
      <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/wetuprototype?user=root&password=theblackpearl");

       Statement statement = connection.createStatement() ;
       
       String inq = (String) session.getAttribute("testInq");


       resultset =statement.executeQuery("select hotelname from itinaccom where itinsessid = '"+inq+"' ") ;
%>
					<option value="">- Select start point -</option>
					<option value="Airport">- Airport -</option>
					

	        <%  while(resultset.next()){ %>
            <option value="<%= resultset.getString(1)%>"><%= resultset.getString(1)%></option>
              <% } %>  
        </select>
    </label>
  </div>
  <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
  
  
 

<div class="col-2">
     <fieldset>
			<legend>route mode</legend>
				<select name="plannermode" onchange="fillSelect(this.value,this.form['plannermodetype'],0)">
					<option value="">- Mode -</option>
					<option value="LandCruiser">4x4 Land cruiser</option>
					<option value="Selfdrive">Self Drive</option>
					<option value="Transfer">Transfer</option>
					<option value="Flight">Flight</option>

				</select>
			
				<select name="plannermodetype" size="1" onchange="fillSelect(this.value,this.form['plannermodetheme'],1)">
					<option value="">-Type -</option>
				</select>

				<select name="plannermodetheme">
					<option value="">- Theme -</option>
				</select>
		   </fieldset>
  </div>  
  
  




<div class="col-2">   
    <label>
   Date
<select name='plannerdate' id='Date' >
<option value=''>select Date</option>
<option value='01'>1</option>
<option value='02'>2</option>
<option value='03'>3</option>
<option value='04'>4</option>
<option value='05'>5</option>
<option value='06'>6</option>
<option value='07'>7</option>
<option value='08'>8</option>
<option value='09'>9</option>
<option value='10'>10</option>
<option value='11'>11</option>
<option value='12'>12</option>
<option value='13'>13</option>
<option value='14'>14</option>
<option value='15'>15</option>
<option value='16'>16</option>
<option value='17'>17</option>
<option value='18'>18</option>
<option value='19'>19</option>
<option value='20'>20</option>
<option value='21'>21</option>
<option value='22'>22</option>
<option value='23'>23</option>
<option value='24'>24</option>
<option value='25'>25</option>
<option value='26'>26</option>
<option value='27'>27</option>
<option value='28'>28</option>
<option value='29'>29</option>
<option value='30'>30</option>
<option value='31'>31</option>

</select>

<select name='plannermonth' id='Month'>
<option value=''>select Month</option>
<option value='January'>January</option>
<option value='February'>February</option>
<option value='March'>March</option>
<option value='April'>April</option>
<option value='May'>May</option>
<option value='June'>June</option>
<option value='July'>July</option>
<option value='August'>August</option>
<option value='September'>September</option>
<option value='October'>October</option>
<option value='November'>November</option>
<option value='December'>December</option>


</select>

<select name='planneryear' id='Year' >
<option value=''>Select Year</option>
<option value='2018'>2018</option>
<option value='2019'>2019</option>
<option value='2020'>2020</option>




</select>
</label>
  </div>

 
 
 <div class="col-2" >
    <label>

TIME
<select name='plannerhour' id='hour' >
<option value=''>Hour</option>
<option value='1'>1</option>
<option value='2'>2</option>
<option value='3'>3</option>
<option value='4'>4</option>
<option value='5'>5</option>
<option value='6'>6</option>
<option value='7'>7</option>
<option value='8'>8</option>
<option value='9'>9</option>
<option value='10'>10</option>
<option value='11'>11</option>
<option value='12'>12</option>

</select>

<select name='plannerminute' id='minute'>
<option value=''>Minute</option>
<option value='00'>00</option>
<option value='10'>10</option>
<option value='20'>20</option>
<option value='30'>30</option>
<option value='40'>40</option>
<option value='50'>50</option>


</select>

<select name='plannerampm' id='ampm' >

<option value=''>AM/PM</option>
<option value='am'>AM</option>

<option value='pm'>PM</option>
</select>
</label>
  </div>
 
 
  
  
  
  <div class="col-2">
     <label>
      End
      <select name="plannerend" tabindex="1">
      <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/wetuprototype?user=root&password=theblackpearl");

       Statement statement = connection.createStatement() ;
       
       String inq = (String) session.getAttribute("testInq");


       resultset =statement.executeQuery("select hotelname from itinaccom where itinsessid = '"+inq+"' ") ;
%>

<option value="">- Select end point -</option>
					<option value="Airport">- Airport -</option>
					
	        <%  while(resultset.next()){ %>
            <option value="<%= resultset.getString(1)%>"><%= resultset.getString(1)%></option>
              <% } %>  
        </select>
    </label>
  </div>
  <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
  
  
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