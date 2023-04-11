package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.util.logging.Level;
import java.util.logging.Logger;

import models.Department;

public class DepartmentDAO {

    private final DatabaseConnection conn;

    public DepartmentDAO() {
        // super();
        conn = new DatabaseConnection();
    }


    @SuppressWarnings("static-access")
    public boolean addDepartment(Department dept) throws SQLException {

        String sql = "REPLACE INTO departments (dept_name,dept_desc) VALUES (?, ?)";
        conn.pst = conn.conn.prepareStatement(sql);
        conn.pst.setString(1, dept.getDept_name());
        conn.pst.setString(2, dept.getDept_desc());
        boolean rowInserted = conn.pst.executeUpdate() > 0;
        conn.pst.close();
        return rowInserted;
    }

    @SuppressWarnings("static-access")
    public boolean deleteDepartment(int dept_id) throws SQLException {
        String sql = "DELETE from departments where dept_id=?";

        conn.pst = conn.conn.prepareStatement(sql);
        conn.pst.setInt(1, dept_id);
        boolean rowDeleted = conn.pst.executeUpdate() > 0;
        conn.pst.close();
        return rowDeleted;

    }

    @SuppressWarnings("static-access")
    public boolean updateDepartment(Department dept) throws SQLException {

        String sql = "update departments set dept_name=?,dept_desc=? where dept_id=?";
        conn.pst = conn.conn.prepareStatement(sql);
        conn.pst.setString(1, dept.getDept_name());
        conn.pst.setString(2, dept.getDept_desc());
        conn.pst.setInt(3, dept.getDept_id());
        boolean rowUpdated = conn.pst.executeUpdate() > 0;
        conn.pst.close();
        return rowUpdated;

    }

    @SuppressWarnings("static-access")
    public List<Department> getAllDepartment() {
        List<Department> departments = new ArrayList<>();
        try {
            String sql = "SELECT * FROM departments";
            conn.rs = conn.st.executeQuery(sql);

            while (conn.rs.next()) {

                int _id = conn.rs.getInt("dept_id");
                String _name = conn.rs.getString("dept_name");
                String _desc = conn.rs.getString("dept_desc");
                Department dept = new Department(_id, _name, _desc);
                departments.add(dept);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(DepartmentDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return departments;
    }

    @SuppressWarnings("static-access")
    public Department getDepartmentByID(int dept_id) throws SQLException {
        Department dept = null;
        String sql = "SELECT * FROM departments where dept_id=?";
        conn.pst = conn.conn.prepareStatement(sql);
        conn.pst.setInt(1, dept_id);
        conn.rs = conn.pst.executeQuery();
        if (conn.rs.next()) {

            String dept_name = conn.rs.getString("dept_name");
            String dept_desc = conn.rs.getString("dept_desc");
            dept = new Department(dept_id, dept_name, dept_desc);
        }
        conn.rs.close();
        conn.pst.close();
        return dept;

    }
}
