package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.util.logging.Level;
import java.util.logging.Logger;

import models.EmployeeType;

public class EmployeeTypeDAO {
	public List <EmployeeType> list() throws SQLException{
		
		List<EmployeeType> listEmpType = new ArrayList<>();
		 try {
			DatabaseConnection conn = new DatabaseConnection();
			String sql ="SELECT * FROM hrh.cadre_type";
			conn.rs=conn.st.executeQuery(sql);
			while(conn.rs.next()) {
				int id = conn.rs.getInt("id");
				String cadre_type_name=conn.rs.getString("cadre_type_name");
				String hrs_per_week=conn.rs.getString("cadre_type_name");
				
				EmployeeType employeeType= new EmployeeType(id, cadre_type_name, hrs_per_week);
				listEmpType.add(employeeType);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			Logger.getLogger(EmployeeTypeDAO.class.getName()).log(Level.SEVERE, null, e);
			throw e;
		}
		return listEmpType;
		
	}

}
