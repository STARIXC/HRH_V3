package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.LeaveApplication;
import models.Leave;
import models.LeaveBalance;

public class LeaveDAO {

    private final DatabaseConnection conn;

    public LeaveDAO() {

        conn = new DatabaseConnection();
    }

 

}
