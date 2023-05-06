package models;

/**
 *
 * @author CBwahyi
 */
public class TechnicalMonitor {
    private int technicalMonitorId;
    private String name;
    private String email;
    private String phone;
    private int mdtRegion;
    private int active;

    public TechnicalMonitor() {
    }

    public TechnicalMonitor(int technicalMonitorId, String name, String email, String phone, int mdtRegion, int active) {
        this.technicalMonitorId = technicalMonitorId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.mdtRegion = mdtRegion;
        this.active = active;
    }

    public int getTechnicalMonitorId() {
        return technicalMonitorId;
    }

    public void setTechnicalMonitorId(int technicalMonitorId) {
        this.technicalMonitorId = technicalMonitorId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getMdtRegion() {
        return mdtRegion;
    }

    public void setMdtRegion(int mdtRegion) {
        this.mdtRegion = mdtRegion;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

  
}
