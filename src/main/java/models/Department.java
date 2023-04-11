package models;

public class Department {
	private int dept_id;
	private String dept_name;
	private String dept_desc;
	
	public Department() {
		//super();
	}

    public Department(String dept_name, String dept_desc) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getDept_desc() {
		return dept_desc;
	}
	public void setDept_desc(String dept_desc) {
		this.dept_desc = dept_desc;
	}
	public Department(int dept_id, String dept_name, String dept_desc) {
		//super();
		this.dept_id = dept_id;
		this.dept_name = dept_name;
		this.dept_desc = dept_desc;
	}
	@Override
	public String toString() {
		return "Department [dept_id=" + dept_id + ", dept_name=" + dept_name + ", dept_desc=" + dept_desc + "]";
	}
	
	
}
