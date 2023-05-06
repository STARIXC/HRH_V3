package org.usaidtujengejamii.hrh.controller;

import utils.IdGen;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import utils.FyDAO;

/**
 *
 * @author CBwahyi
 */
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final DatabaseConnection conn;
    private PrintWriter out;
    private HttpSession session;
    private final JSONObject obj;
    private String financialYear;
    private String username;
    private String password;
    private String fname;
    private String mname;
    private String lname;
    private String userId;
    private String pno;
    private String pass;
    private String facility;
    private int supervisor;
    private int to_;
    private String fullname;
    private String position;
    private String status;
    private int level;
    private int empType;

    private final FyDAO fyear;

    public LoginController() {
        super();
        conn = new DatabaseConnection();
        obj = new JSONObject();
//        idGen = new IdGen();
        fyear = new FyDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            processRequest(request, response);
        } catch (ServletException | IOException | NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            sendErrorResponse("Something went wrong while processing your request.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            processRequest(request, response);
        } catch (ServletException | IOException | NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            sendErrorResponse("Something went wrong while processing your request.");
        }
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
        response.setContentType("application/json;charset=UTF-8");
        out = response.getWriter();
        session = request.getSession();
        String action = request.getParameter("action");
        if (action == null || !action.equalsIgnoreCase("login")) {
            sendErrorResponse("Invalid action.");
            return;
        }

        username = request.getParameter("username");
        pass = request.getParameter("password");
        if (username == null || username.isEmpty() || pass == null || pass.isEmpty()) {
            sendErrorResponse("Please provide both username and password.");
            return;
        }

        password = hashPassword(pass);
        if (isValidUser(username, password)) {
            // Create a new session for the user
            String output = getSessions(username, password);
            out.println(output);
        } else {
            sendErrorResponse("Either username or password is wrong.");
        }
    }

    private boolean isValidUser(String username, String password) throws SQLException {
        boolean result = false;
        try {
            String sql = "select * from  hrh.tbl_user where username=? and password=? and status =1";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, username.toUpperCase());
            conn.pst.setString(2, password);
            conn.rs = conn.pst.executeQuery();
            result = conn.rs.next();

        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;

    }

    private String getSessions(String username, String password) throws SQLException {
        try {
            String sql = "select * from  hrh.tbl_user where username=? and password=? and status =1";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, username.toUpperCase());
            conn.pst.setString(2, password);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next()) {
                System.out.println("User Exist");
                userId = conn.rs.getString("userid");
                level = conn.rs.getInt("level_");
                switch (level) {
                    case 2:
                        try {
                        userId = conn.rs.getString("userid");

//                        userid, fname, mname, lname, username, email, phone, password, level_, facility, scounty, status, created_at, updated_at
                        String query = "SELECT \n"
                                + "  u.userid AS emp_no,\n"
                                + "  u.level_ AS level,\n"
                                + "  u.fname AS firstname,\n"
                                + "  IFNULL(u.lname, '') AS surname,\n"
                                + "  IFNULL(u.mname, '') AS middlename,\n"
                                + "  u.username,\n"
                                + "  p.position_title AS position,\n"
                                + "  ct.id AS emp_type,\n"
                                + "  f.facility_id AS mfl,\n"
                                + "  fs.supervisor_id AS supervisor_id,\n"
                                + "  t.technical_monitor_id AS technical_monitor_id,\n"
                                + "  u.status AS status\n"
                                + "FROM hrh.tbl_user u\n"
                                + "JOIN hrh.tbl_employee_position_relations e ON u.userid = e.emp_no\n"
                                + "JOIN hrh.tbl_user_facility f ON f.user_id = u.userid\n"
                                + "JOIN hrh.tbl_facility_supervisor fs ON fs.mflc = f.facility_id\n"
                                + "JOIN hrh.subpartnera fac ON fac.CentreSanteId = f.facility_id\n"
                                + "JOIN district s ON fac.DistrictID = s.districtID\n"
                                + "JOIN mdtregion r ON s.regionID = r.id\n"
                                + "JOIN technical_monitors t ON t.mdtregion = r.id\n"
                                + "JOIN hrh.cadre_positions p ON p.id = e.position_id\n"
                                + "JOIN hrh.standardized_cadre sc ON sc.id = p.standardized_cadre_id\n"
                                + "JOIN hrh.cadre_type ct ON ct.id = sc.carder_type_id\n"
                                + "WHERE u.userid = ?";
                        conn.pst = conn.conn.prepareStatement(query);
                        conn.pst.setString(1, userId);
                        conn.rs = conn.pst.executeQuery();
                        if (conn.rs.next()) {
                            financialYear = getFinancialYear();
                            fname = conn.rs.getString("firstname");
                            pno = conn.rs.getString("emp_no");
                            mname = conn.rs.getString("middlename");
                            lname = conn.rs.getString("surname");
                            empType = conn.rs.getInt("emp_type");
                            to_ = conn.rs.getInt("technical_monitor_id");
                            supervisor = conn.rs.getInt("supervisor_id");
                            status = conn.rs.getString("status");
                            position = conn.rs.getString("position");
                            facility = conn.rs.getString("mfl");
                            fullname = fname + " " + mname + " " + lname;
                            session.setAttribute("username", username.toUpperCase());
                            session.setAttribute("emp_no", pno);
                            session.setAttribute("user_id", pno);
                            session.setAttribute("user_login", fullname);
                            session.setAttribute("level_", level);
                            session.setAttribute("empType", empType);
                            session.setAttribute("position", position);
                            session.setAttribute("status", status);
                            session.setAttribute("fy", financialYear);
                            session.setAttribute("supervisor_id", supervisor);
                            session.setAttribute("technical_monitor_id", to_);
                            session.setAttribute("facility", facility);
                            session.setAttribute("message", "Welcome " + fullname + "!");
                            obj.put("success", true);
//                            obj.put("message", "Welcome " + fullname + "!");
                            obj.put("nextPage", "/index.jsp");

                        }

                    } catch (SQLException ex) {
                        Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                    case 1:
                        //                    userid, fname, mname, lname, username, email, phone, password, level_, facility, scounty, status, created_at, updated_at

                        userId = conn.rs.getString("userid");
                        fname = conn.rs.getString("fname");
                        mname = conn.rs.getString("mname");
                        lname = conn.rs.getString("lname");
                        financialYear = getFinancialYear();
                        //                    empType = conn.rs.getInt("emp_type");
                        status = conn.rs.getString("status");
                        //                    position = conn.rs.getString("position");
                        fullname = fname + " " + mname + " " + lname;
                        session.setAttribute("username", username.toUpperCase());
                        session.setAttribute("userid", userId);
                        session.setAttribute("admin_login", fullname);
                        session.setAttribute("level_", level);
                        session.setAttribute("message", "Welcome " + fullname + "!");
                        //                    session.setAttribute("empType", empType);
//                    session.setAttribute("position", position);
                        session.setAttribute("status", status);
                        session.setAttribute("fy", financialYear);
                        obj.put("success", true);
                        obj.put("message", "Welcome " + fullname + "!");
                        obj.put("nextPage", "/admin/index.jsp");
                        break;
                    case 3:
                        //                    userid, fname, mname, lname, username, email, phone, password, level_, facility, scounty, status, created_at, updated_at

                        userId = conn.rs.getString("userid");
                        fname = conn.rs.getString("fname");
                        mname = conn.rs.getString("mname");
                        lname = conn.rs.getString("lname");
                        financialYear = getFinancialYear();
                        //                    empType = conn.rs.getInt("emp_type");
                        status = conn.rs.getString("status");
                        //                    position = conn.rs.getString("position");
                        fullname = fname + " " + mname + " " + lname;
                        session.setAttribute("username", username.toUpperCase());
                        session.setAttribute("userid", userId);
                        session.setAttribute("admin_login", fullname);
                        session.setAttribute("level_", level);
                        session.setAttribute("message", "Welcome " + fullname + "!");
                        //                    session.setAttribute("empType", empType);
//                    session.setAttribute("position", position);
                        session.setAttribute("status", status);
                        session.setAttribute("fy", financialYear);
                        obj.put("success", true);
                        obj.put("message", "Welcome " + fullname + "!");
                        obj.put("nextPage", "/supervisors/index.jsp");
                        break;
                    case 4:
                        //                    userid, fname, mname, lname, username, email, phone, password, level_, facility, scounty, status, created_at, updated_at

                        userId = conn.rs.getString("userid");
                        fname = conn.rs.getString("fname");
                        mname = conn.rs.getString("mname");
                        lname = conn.rs.getString("lname");
                        financialYear = getFinancialYear();
                        //                    empType = conn.rs.getInt("emp_type");
                        status = conn.rs.getString("status");
                        //                    position = conn.rs.getString("position");
                        fullname = fname + " " + mname + " " + lname;
                        session.setAttribute("username", username.toUpperCase());
                        session.setAttribute("userid", userId);
                        session.setAttribute("admin_login", fullname);
                        session.setAttribute("level_", level);
                        session.setAttribute("message", "Welcome " + fullname + "!");
                        //                    session.setAttribute("empType", empType);
//                    session.setAttribute("position", position);
                        session.setAttribute("status", status);
                        session.setAttribute("fy", financialYear);
                        obj.put("success", true);
                        obj.put("message", "Welcome " + fullname + "!");
                        obj.put("nextPage", "/payroll/index.jsp");
                        break;
                    case 5:
                        //                    userid, fname, mname, lname, username, email, phone, password, level_, facility, scounty, status, created_at, updated_at

                        userId = conn.rs.getString("userid");
                        fname = conn.rs.getString("fname");
                        mname = conn.rs.getString("mname");
                        lname = conn.rs.getString("lname");
                        financialYear = getFinancialYear();
                        //                    empType = conn.rs.getInt("emp_type");
                        status = conn.rs.getString("status");
                        //                    position = conn.rs.getString("position");
                        fullname = fname + " " + mname + " " + lname;
                        session.setAttribute("username", username.toUpperCase());
                        session.setAttribute("userid", userId);
                        session.setAttribute("sup_login", fullname);
                        session.setAttribute("level_", level);
                        session.setAttribute("message", "Welcome " + fullname + "!");
                        //                    session.setAttribute("empType", empType);
//                    session.setAttribute("position", position);
                        session.setAttribute("status", status);
                        session.setAttribute("fy", financialYear);
                        obj.put("success", true);
                        obj.put("message", "Welcome " + fullname + "!");
                        obj.put("nextPage", "/supervisors/index.jsp");
                        break;
                    default:
                        //                    userid, fname, mname, lname, username, email, phone, password, level_, facility, scounty, status, created_at, updated_at

                        userId = conn.rs.getString("userid");
                        fname = conn.rs.getString("fname");
                        mname = conn.rs.getString("mname");
                        lname = conn.rs.getString("lname");
                        financialYear = getFinancialYear();
                        //                    empType = conn.rs.getInt("emp_type");
                        status = conn.rs.getString("status");
                        //                    position = conn.rs.getString("position");
                        fullname = fname + " " + mname + " " + lname;
                        session.setAttribute("username", username.toUpperCase());
                        session.setAttribute("userid", userId);
                        session.setAttribute("admin_login", fullname);
                        session.setAttribute("level_", level);
                        session.setAttribute("message", "Welcome " + fullname + "!");
                        //                    session.setAttribute("empType", empType);
                        session.setAttribute("fy", financialYear);
                        session.setAttribute("status", status);
                        obj.put("success", true);
                        obj.put("message", "Welcome " + fullname + "!");
                        obj.put("nextPage", "/hr/index.jsp");

                        break;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj.toString();
    }

    private void sendErrorResponse(String message) {
        obj.put("success", false);
        obj.put("message", message);
        out.println(obj);
    }

    private String hashPassword(String pass) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(pass.getBytes());
        byte[] bytes = md.digest();
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    private String getFinancialYear() {
        String fY;
        fY = fyear.getCurrentFy();
        return fY;

    }
}
