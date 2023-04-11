package models;

public class Activity {
	private int activity_id;
	private String activity_description;
	private int activity_cadre_type;
	
	public Activity(int activity_id, String activity_description, int activity_cadre_type) {

		this.activity_id = activity_id;
		this.activity_description = activity_description;
		this.activity_cadre_type = activity_cadre_type;
	}
	
	@Override
	public String toString() {
		return "Activity [activity_id=" + activity_id + ", activity_description=" + activity_description
				+ ", activity_cadre_type=" + activity_cadre_type + "]";
	}

	public Activity() {
		super();
	}

	public int getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
	}
	public String getActivity_description() {
		return activity_description;
	}
	public void setActivity_description(String activity_description) {
		this.activity_description = activity_description;
	}
	public int getActivity_cadre_type() {
		return activity_cadre_type;
	}
	public void setActivity_cadre_type(int activity_cadre_type) {
		this.activity_cadre_type = activity_cadre_type;
	}
 
 
}
