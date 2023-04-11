package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.util.logging.Level;
import java.util.logging.Logger;

import models.Activity;


public class ActivityDAO {
	private final DatabaseConnection conn;

	public ActivityDAO() {
		conn= new DatabaseConnection();
	}
//	add activities
	@SuppressWarnings("static-access")
	public void addActivity(Activity activity) {

		try {
			String sql = "INSERT INTO activities (activity_description,activity_cadre_type) VALUES (?, ?)";
			conn.pst = conn.conn.prepareStatement(sql);
			// Declare parameters starting with 1
			conn.pst.setString(1, activity.getActivity_description());
			conn.pst.setInt(2, activity.getActivity_cadre_type());
		
			conn.pst.executeUpdate();
		} catch (SQLException e) {
			 Logger.getLogger(ActivityDAO.class.getName()).log(Level.SEVERE, null, e);
		}
	}
	@SuppressWarnings("static-access")
	public void deleteActivity(int activity_id) {
		try {
			String sql = "DELETE from activities where activity_id=?";
			conn.pst = conn.conn.prepareStatement(sql);
			conn.pst.setInt(1, activity_id);
			conn.pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			 Logger.getLogger(ActivityDAO.class.getName()).log(Level.SEVERE, null, e);
		}
	}
	@SuppressWarnings("static-access")
	public void updateActivity(Activity activity) {
	
		try {
			String sql = "update activities set activity_description=?,activity_cadre_type=? where activity_id=?";
			conn.pst = conn.conn.prepareStatement(sql);
			conn.pst.setString(1,activity.getActivity_description());
			conn.pst.setInt(2, activity.getActivity_cadre_type());
			conn.pst.setInt(3,activity.getActivity_id());
		
			conn.pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			 Logger.getLogger(ActivityDAO.class.getName()).log(Level.SEVERE, null, e);
		}
	}
	@SuppressWarnings("static-access")
	public List<Activity> getAllActivities(){
		List<Activity> activities = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM activities";
			conn.rs = conn.st.executeQuery(sql);
			
			while (conn.rs.next()) {
		
				Activity activity = new Activity();
				activity.setActivity_id(conn.rs.getInt("activity_id"));
				activity.setActivity_description(conn.rs.getString("activity_description"));
				activity.setActivity_cadre_type(conn.rs.getInt("activity_cadre_type"));
				

				activities.add(activity);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			 Logger.getLogger(ActivityDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return activities;
	}
	@SuppressWarnings("static-access")
	public Activity getActivityById(int activity_id) {
		Activity activity = new Activity();
		
		try {
			String sql = "SELECT * FROM activities where activity_id=?";
			conn.pst = conn.conn.prepareStatement(sql);
			conn.pst.setInt(1, activity_id);
			conn.rs = conn.pst.executeQuery();
			if (conn.rs.next()) {

				activity.setActivity_id(conn.rs.getInt("activity_id"));
				activity.setActivity_description(conn.rs.getString("activity_description"));
				activity.setActivity_cadre_type(conn.rs.getInt("activity_cadre_type"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			 Logger.getLogger(ActivityDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return activity;

	}
}
