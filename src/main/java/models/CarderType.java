package models;

/**
 *
 * @author STARIXC
 */
public class CarderType {
    int id;
    String cadre_type_name,hrs_per_week;       

    public CarderType() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCadre_type_name() {
        return cadre_type_name;
    }

    public void setCadre_type_name(String cadre_type_name) {
        this.cadre_type_name = cadre_type_name;
    }

    public String getHrs_per_week() {
        return hrs_per_week;
    }

    public void setHrs_per_week(String hrs_per_week) {
        this.hrs_per_week = hrs_per_week;
    }
    
}
