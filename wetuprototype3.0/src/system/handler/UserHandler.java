package system.handler;

import java.io.IOException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
//import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import system.dao.UserDao;
import system.bean.UserBean;




public class UserHandler extends HttpServlet {    
    /**
	 * 
	 */
	private static final long serialVersionUID = 4409768105034319350L;
	private static String INSERT = "/clientdetail.jsp";
    private static String EditAccom = "/editaccomodation.jsp";
    private static String UserRecord = "//basic5.jsp";
    private static String Usersess = "/basic5.jsp";
    private static String Accom = "/basic5.jsp";
    private static String End = "/end.jsp";


    private UserDao dao;

    public UserHandler() {
        super();
        dao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String redirect="";
       // String uId = request.getParameter("userid");  
        String Fn = request.getParameter("itinname");
        String action = request.getParameter("action");
        
        
       if(!((Fn)== null) && action.equalsIgnoreCase("insert"))
          

        {
        	//int id = Integer.parseInt(uId);
        	UserBean user = new UserBean();
        	//user.setId(id);
        	user.setItinName(request.getParameter("itinname"));
            user.setBranding(request.getParameter("branding"));
            user.setItinType(request.getParameter("itintype"));
            user.setLanguage(request.getParameter("language"));
            user.setItinsessId(request.getParameter("itinsessid"));

        	
        	
        	dao.addItin(user);
        	redirect = Accom;
            request.setAttribute("users", dao.getAllUsers()); 
            request.setAttribute("itinname", Fn);
        
           	System.out.println("Record Added Successfully");
        	
          
        }
        
   	
        
    else if (action.equalsIgnoreCase("insertaccom")){
    	DateFormat formatter ;
    	formatter = new SimpleDateFormat("dd-MM-yyyy");
    	//int id = Integer.parseInt(uId);
		UserBean itinaccom = new UserBean();

	//	useraccom.setId(id);
		itinaccom .setHotelName(request.getParameter("hotelName"));
		itinaccom .setLocation(request.getParameter("location"));
		itinaccom .setBasis(request.getParameter("basis"));
		itinaccom .setBeverage(request.getParameter("beverage"));
		itinaccom .setDesLayout(request.getParameter("deslayout"));
		itinaccom .setnIghts(request.getParameter("nights"));
		itinaccom .setItinsessId(request.getParameter("itinsessid"));
		
		dao.addItinAccom(itinaccom );
		redirect = Usersess;
		System.out.println("Record Added Successfully");
           	
    }
        
        
    else if (action.equalsIgnoreCase("insertplanner")){
    	DateFormat formatter ;
    	formatter = new SimpleDateFormat("dd-MM-yyyy");
    //	int id = Integer.parseInt(uId);
		UserBean userplanner = new UserBean();

	//	userplanner.setId(id);
		userplanner.setPlannerStart(request.getParameter("plannerstart"));
		userplanner.setPlannerMode(request.getParameter("plannermode"));
		userplanner.setPlannerModeType(request.getParameter("plannermodetype"));
		userplanner.setPlannerModeTheme(request.getParameter("plannermodetheme"));
		userplanner.setPlannerDate(request.getParameter("plannerdate"));
		userplanner.setPlannerMonth(request.getParameter("plannermonth"));
		userplanner.setPlannerYear(request.getParameter("planneryear"));
		userplanner.setPlannerHour(request.getParameter("plannerhour"));
		userplanner.setPlannerMinute(request.getParameter("plannerminute"));
		userplanner.setPlannerAmpm(request.getParameter("plannerampm"));
		userplanner.setPlannerEnd(request.getParameter("plannerend"));
		userplanner.setItinsessId(request.getParameter("itinsessid"));

		
		dao.addUserPlanner(userplanner);
		redirect = Usersess;
		request.setAttribute("users", dao.getAllUsers());    
		System.out.println("Record Added Successfully");
           	
    }
        
        
    else if (action.equalsIgnoreCase("insertdayplanner")){
    	
    	//int id = Integer.parseInt(uId);
		UserBean userdayplanner = new UserBean();

	//	userdayplanner.setId(id);
		userdayplanner.setActivityAccom(request.getParameter("activityaccom"));
		userdayplanner.setActivity(request.getParameter("activity"));
		userdayplanner.setActivityDate(request.getParameter("activitydate"));
		userdayplanner.setActivityMonth(request.getParameter("activitymonth"));
		userdayplanner.setActivityYear(request.getParameter("activityyear"));
		userdayplanner.setItinsessId(request.getParameter("itinsessid"));

		
		dao.addUserDayPlanner(userdayplanner);
		redirect = Usersess;
		request.setAttribute("users", dao.getAllUsers());    
		System.out.println("Record Added Successfully");
           	
    }
        
            
      
        else if (action.equalsIgnoreCase("delete")){
            String userId = request.getParameter("itinaccomid");
            int uid = Integer.parseInt(userId);
            dao.removeAccom(uid);
            redirect = UserRecord;
          //  request.setAttribute("users", dao.getAllUsers());
            System.out.println("Record Deleted Successfully");
            
            
        }else if (action.equalsIgnoreCase("editaccom")){        	
        	redirect = EditAccom;            
        } else if (action.equalsIgnoreCase("edit")){
        	String userId = request.getParameter("itinaccomid");
            int uid = Integer.parseInt(userId);            
            UserBean user = new UserBean();
        //	user.setId(uid);
        	user .setHotelName(request.getParameter("hotelName"));
        	user.setLocation(request.getParameter("location"));
        	user .setBasis(request.getParameter("basis"));
        	user .setBeverage(request.getParameter("beverage"));
        	user .setDesLayout(request.getParameter("deslayout"));
        	user .setnIghts(request.getParameter("nights"));
        	user .setItinsessId(request.getParameter("itinsessid"));
            dao.editAccom(user);
            request.setAttribute("user", user);
            redirect = UserRecord;
            System.out.println("Record updated Successfully");
            
            
         } else if (action.equalsIgnoreCase("listUser")){
            redirect = UserRecord;
            request.setAttribute("users", dao.getAllUsers());
         } else {
            redirect = INSERT;
        }

        RequestDispatcher rd = request.getRequestDispatcher(redirect);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}