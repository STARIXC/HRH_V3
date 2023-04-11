package models;

public class county {
 int CountyID;
 String County;
public int getCountyID() {
	return CountyID;
}
public void setCountyID(int countyID) {
	CountyID = countyID;
}
public String getCounty() {
	return County;
}
public void setCounty(String county) {
	County = county;
}
public county(int countyID, String county) {
	super();
	CountyID = countyID;
	County = county;
}
@Override
public String toString() {
	return "county [CountyID=" + CountyID + ", County=" + County + "]";
}
 
 
 
}
