package system.bean;

import java.sql.Time;
import java.util.Date;

public class UserBean {

    private int id;
    private String fName;
    private String lName;
    private String hName;
    private String vCountry;
    private String pNumber;
    private String eMail;
    private String aDults;
    private String cHildren;
    private String sessId;
    
    
    
    
    //accomo
    
   // private int id;
    private String hotelName;
    private String basis;
    private String desLayout;
    private String nIghts;
    private String cHeckin;
    
    
    //planner
    private String plannerStart;
    private String plannerMode;
    private String plannerEnd;
    private String plannerDate;
    private String plannerHour;
    private String plannerMinute;
    private String plannerAmpm;

    
    
    
    //day planner
    
    private String ActivityAccom;
    private String Activity;
    private String ActivityDate;
    private String ActivityMonth;
    private String ActivityYear;
    private String ActivityName;
    
    
    
    //itinerary
    private int itinId;
    private String itinName;
    private String Branding;
    private String itinType;
    private String itinsessId;
    private String language;
    
    private String location;

    private String beverage;
    
    
    private String plannermodetype;
    private String plannermodetheme;
    private String plannermonth;
    private String planneryear;



    
    
    
    
    
    
    

    
    
    
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getSessId() {
		return sessId;
	}
	public void setSessId(String sessId) {
		this.sessId = sessId;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public String getvCountry() {
		return vCountry;
	}
	public void setvCountry(String vCountry) {
		this.vCountry = vCountry;
	}
	public String getpNumber() {
		return pNumber;
	}
	public void setpNumber(String pNumber) {
		this.pNumber = pNumber;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getaDults() {
		return aDults;
	}
	public void setaDults(String aDults) {
		this.aDults = aDults;
	}
	public String getcHildren() {
		return cHildren;
	}
	public void setcHildren(String cHildren) {
		this.cHildren = cHildren;
	}
	
	
	
	
	
	
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getBasis() {
		return basis;
	}
	public void setBasis(String basis) {
		this.basis = basis;
	}
	public String getDesLayout() {
		return desLayout;
	}
	public void setDesLayout(String desLayout) {
		this.desLayout = desLayout;
	}
	public String getnIghts() {
		return nIghts;
	}
	public void setnIghts(String nIghts) {
		this.nIghts = nIghts;
	}
	public String getcHeckin() {
		return cHeckin;
	}
	public void setcHeckin(String checkin) {
		this.cHeckin = checkin;
	}
	
	
	
	
	
	
	
	public String getPlannerStart() {
		return plannerStart;
	}
	public void setPlannerStart(String plannerStart) {
		this.plannerStart = plannerStart;
	}
	public String getPlannerMode() {
		return plannerMode;
	}
	public void setPlannerMode(String plannerMode) {
		this.plannerMode = plannerMode;
	}
	public String getPlannerEnd() {
		return plannerEnd;
	}
	public void setPlannerEnd(String plannerEnd) {
		this.plannerEnd = plannerEnd;
	}
	public String getPlannerDate() {
		return plannerDate;
	}
	public void setPlannerDate(String plannerDate) {
		this.plannerDate = plannerDate;
	}

	
	
	public String getActivityName() {
		return ActivityName;
	}
	public void setActivityName(String activityName) {
		ActivityName = activityName;
	}
	public String getActivityDate() {
		return ActivityDate;
	}
	public void setActivityDate(String activitydate) {
		ActivityDate = activitydate;
	}
	public String getPlannerHour() {
		return plannerHour;
	}
	public void setPlannerHour(String plannerHour) {
		this.plannerHour = plannerHour;
	}
	public String getPlannerMinute() {
		return plannerMinute;
	}
	public void setPlannerMinute(String plannerMinute) {
		this.plannerMinute = plannerMinute;
	}
	public String getPlannerAmpm() {
		return plannerAmpm;
	}
	public void setPlannerAmpm(String plannerAmpm) {
		this.plannerAmpm = plannerAmpm;
	}
	
	
	
	
	public int getItinId() {
		return itinId;
	}
	public void setItinId(int itinId) {
		this.itinId = itinId;
	}
	public String getItinName() {
		return itinName;
	}
	public void setItinName(String itinName) {
		this.itinName = itinName;
	}
	public String getBranding() {
		return Branding;
	}
	public void setBranding(String branding) {
		Branding = branding;
	}
	public String getItinsessId() {
		return itinsessId;
	}
	public void setItinsessId(String itinsessId) {
		this.itinsessId = itinsessId;
	}
	public String getItinType() {
		return itinType;
	}
	public void setItinType(String itinType) {
		this.itinType = itinType;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}

	public String getBeverage() {
		return beverage;
	}
	public void setBeverage(String beverage) {
		this.beverage = beverage;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPlannerModeType() {
		return plannermodetype;
	}
	public void setPlannerModeType(String plannermodetype) {
		this.plannermodetype = plannermodetype;
	}
	public String getPlannerModeTheme() {
		return plannermodetheme;
	}
	public void setPlannerModeTheme(String plannermodetheme) {
		this.plannermodetheme = plannermodetheme;
	}
	public String getPlannerMonth() {
		return plannermonth;
	}
	public void setPlannerMonth(String plannermonth) {
		this.plannermonth = plannermonth;
	}
	public String getPlannerYear() {
		return planneryear;
	}
	public void setPlannerYear(String planneryear) {
		this.planneryear = planneryear;
	}
	public String getActivityAccom() {
		return ActivityAccom;
	}
	public void setActivityAccom(String activityaccom) {
		ActivityAccom = activityaccom;
	}
	public String getActivity() {
		return Activity;
	}
	public void setActivity(String activity) {
		Activity = activity;
	}
	public String getActivityMonth() {
		return ActivityMonth;
	}
	public void setActivityMonth(String activitymonth) {
		ActivityMonth = activitymonth;
	}
	public String getActivityYear() {
		return ActivityYear;
	}
	public void setActivityYear(String activityyear) {
		ActivityYear = activityyear;
	}
	
	
	
	
}