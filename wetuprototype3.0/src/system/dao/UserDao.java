package system.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import system.bean.UserBean;
import system.dbconnection.ConnectionProvider;

public class UserDao {

    private Connection conn;

    public UserDao() {
    	conn = ConnectionProvider.getConnection();
    }

    public void addItin(UserBean userBean) {
        try {
        	String sql = "INSERT INTO itinerary( itinname,branding,itintype,language,itinsessid)" +
            		" VALUES ( ?, ?,?,?,? )";

            PreparedStatement ps = conn.prepareStatement(sql);
            
           // ps.setInt(1, userBean.getId());
            ps.setString(1, userBean.getItinName());
            ps.setString(2, userBean.getBranding());    
            ps.setString(3, userBean.getItinType());
            ps.setString(4, userBean.getLanguage());  
            ps.setString(5, userBean.getItinsessId());
            

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void addItinAccom(UserBean userBean) {
    	
    	
        try {
        	String sql = "INSERT INTO itinaccom(hotelname,location,basis,bev,deslayout,nights,itinsessid)" +
    		" VALUES (?,? ,?,?, ?, ?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            
           // ps.setInt(1, userBean.getId());
            ps.setString(1, userBean.getHotelName());
            ps.setString(2, userBean.getLocation());
            ps.setString(3, userBean.getBasis());
            ps.setString(4, userBean.getBeverage());
            ps.setString(5, userBean.getDesLayout());
            ps.setString(6, userBean.getnIghts());
            ps.setString(7, userBean.getItinsessId());
           
          

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
  public void editAccom(UserBean userBean) {
    	
    	
        try {
        	
        	String sql = "UPDATE itinaccom SET hotelname=?, location=?, basis=? , bev=?, destlayout=?, nights=?, itinsessid=?"+
                    " WHERE itinaccomid=?";
        	

            PreparedStatement ps = conn.prepareStatement(sql);
            
           // ps.setInt(1, userBean.getId());
            ps.setString(1, userBean.getHotelName());
            ps.setString(2, userBean.getLocation());
            ps.setString(3, userBean.getBasis());
            ps.setString(4, userBean.getBeverage());
            ps.setString(5, userBean.getDesLayout());
            ps.setString(6, userBean.getnIghts());
            ps.setString(7, userBean.getItinsessId());
           
          

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
  
  public void removeAccom(int itinaccomid) {
      try {
      	String sql = "DELETE FROM itinaccom WHERE itinaccomid=?";
          PreparedStatement ps = conn
                  .prepareStatement(sql);
          ps.setInt(1, itinaccomid);
          ps.executeUpdate();

      } catch (SQLException e) {
          e.printStackTrace();
      }
    }
  
  
  public UserBean getAccomById(int itinaccomid) {
  	UserBean userBean = new UserBean();
      try {
      	String sql = "SELECT * FROM itinaccom WHERE itinaccomid=?";
          PreparedStatement ps = conn.
                  prepareStatement(sql);
          ps.setInt(1, itinaccomid);
          ResultSet rs = ps.executeQuery();

          if (rs.next()) {
          	userBean.setHotelName(rs.getString("hotelname"));
          	userBean.setLocation(rs.getString("location"));
          	userBean.setBasis(rs.getString("basis"));
          	userBean.setBeverage(rs.getString("bev")); 
          	userBean.setDesLayout(rs.getString("destlayout"));
          	userBean.setnIghts(rs.getString("nights"));
          	userBean.setItinsessId(rs.getString("itinsessid")); 

          }
      } catch (SQLException e) {
          e.printStackTrace();
      }
      return userBean;
  }
  
  
  
 public void addUserPlanner(UserBean userBean) {
    	
    	
        try {
        	String sql = "INSERT INTO itinrouteplanner(plannerstart,plannermode,plannermodetype,plannermodetheme,plannerdate,plannermonth,planneryear,plannerhour,plannerminute,plannerampm,plannerend,itinsessid)" +
    		" VALUES (?,? ,?,?, ?, ?,?,?, ?, ?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            
           // ps.setInt(1, userBean.getId());
            ps.setString(1, userBean.getPlannerStart());
            ps.setString(2, userBean.getPlannerMode()); 
            ps.setString(3, userBean.getPlannerModeType());
            ps.setString(4, userBean.getPlannerModeTheme());
            ps.setString(5,userBean.getPlannerDate());
            ps.setString(6, userBean.getPlannerMonth());
            ps.setString(7, userBean.getPlannerYear());
            ps.setString(8, userBean.getPlannerHour());
            ps.setString(9, userBean.getPlannerMinute());
            ps.setString(10, userBean.getPlannerAmpm());
            ps.setString(11, userBean.getPlannerEnd());
            ps.setString(12, userBean.getItinsessId());  
          

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
 
 public void addUserDayPlanner(UserBean userBean) {
 	
 	
     try {
     	String sql = "INSERT INTO itinactivity(activityaccom,activity,activitydate,activitymonth,activityyear,itinsessid)" +
 		" VALUES (?,?,?,?,?,?)";
         PreparedStatement ps = conn.prepareStatement(sql);
         
        // ps.setInt(1, userBean.getId());
         ps.setString(1, userBean.getActivityAccom());
         ps.setString(2, userBean.getActivity());  
         ps.setString(3, userBean.getActivityDate());
         ps.setString(4, userBean.getActivityMonth()); 
         ps.setString(5, userBean.getActivityYear());
         ps.setString(6, userBean.getItinsessId());  
       

         ps.executeUpdate();

     } catch (SQLException e) {
         e.printStackTrace();
     }
 }

 
 

    public void removeUser(int userId) {
        try {
        	String sql = "DELETE FROM users WHERE userid=?";
            PreparedStatement ps = conn
                    .prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
      }

    public void editUser(UserBean userBean) {    	
    	try {
    		String sql = "UPDATE users SET firstname=?, lastname=?" +
            " WHERE userid=?";
            PreparedStatement ps = conn
                    .prepareStatement(sql);
            ps.setString(1, userBean.getfName());
            ps.setString(2, userBean.getlName());            
            ps.setInt(3, userBean.getId());
            ps.executeUpdate();            

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List getAllUsers() {
        List users = new ArrayList();
        try {
        	String sql = "SELECT * FROM itinaccom";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserBean userBean = new UserBean();
              //  userBean.setId(rs.getInt("userid"));
    
                userBean.setHotelName(rs.getString("hotelname"));
              	userBean.setLocation(rs.getString("location"));
              	userBean.setBasis(rs.getString("basis"));
              	userBean.setBeverage(rs.getString("bev")); 
              	userBean.setDesLayout(rs.getString("destlayout"));
              	userBean.setnIghts(rs.getString("nights"));
              	userBean.setItinsessId(rs.getString("itinsessid")); 
                
                
                users.add(userBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
    

    public UserBean getUserById(int userId) {
    	UserBean userBean = new UserBean();
        try {
        	String sql = "SELECT * FROM users WHERE userid=?";
            PreparedStatement ps = conn.
                    prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	userBean.setId(rs.getInt("userid"));
            	userBean.setfName(rs.getString("firstname"));
            	userBean.setlName(rs.getString("lastname"));                           
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userBean;
    }
    
    
  
    
   
}