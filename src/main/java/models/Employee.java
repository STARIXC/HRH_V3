package models;

/**
 *
 * @author UTJ
 */
public class Employee {

    private String id;
    private String emp_no;
    private String full_name;
    private String first_name;
    private String surname;
    private String other_name;
    private String national_id;
    private String current_position;
    private String current_facility;
    private String gender;
    private String phone;
    private String email;
    private String alt_phone;
    private String alt_email;
    private String dob;
    private String home_address;
    private String present_address;
    private String postal_code;
    private String marital_status;
    private String nationality;
    private String disability;
    private String disability_explain;
    private String kra_pin;
    private String nssf_no;
    private String nhif_no;
    private String cert_good_conduct_no;
    private String helb_clearance_no;
    private int helb_benefitiary;
    private String bank_name, branch, account_name, acount_number;
    private String date_started;
    private String date_ended;
    private String isActive;
    private int status;
    private String positionTitle;
    private String positionId;
    private String standardId;
    private String cadreTypeName;
    private String typeId;
    private String supervisor;
//    private List<EmploymentHistory> employmentHistoryList;

    public Employee() {
    }

    // Getters and setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getOther_name() {
        return other_name;
    }

    public void setOther_name(String other_name) {
        this.other_name = other_name;
    }

    public String getNational_id() {
        return national_id;
    }

    public void setNational_id(String national_id) {
        this.national_id = national_id;
    }

    public String getCurrent_position() {
        return current_position;
    }

    public void setCurrent_position(String current_position) {
        this.current_position = current_position;
    }

    public String getCurrent_facility() {
        return current_facility;
    }

    public void setCurrent_facility(String current_facility) {
        this.current_facility = current_facility;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAlt_phone() {
        return alt_phone;
    }

    public void setAlt_phone(String alt_phone) {
        this.alt_phone = alt_phone;
    }

    public String getAlt_email() {
        return alt_email;
    }

    public void setAlt_email(String alt_email) {
        this.alt_email = alt_email;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getHome_address() {
        return home_address;
    }

    public void setHome_address(String home_address) {
        this.home_address = home_address;
    }

    public String getPresent_address() {
        return present_address;
    }

    public void setPresent_address(String present_address) {
        this.present_address = present_address;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getMarital_status() {
        return marital_status;
    }

    public void setMarital_status(String marital_status) {
        this.marital_status = marital_status;
    }

    public String getDisability() {
        return disability;
    }

    public void setDisability(String disability) {
        this.disability = disability;
    }

    public String getDisability_explain() {
        return disability_explain;
    }

    public void setDisability_explain(String disability_explain) {
        this.disability_explain = disability_explain;
    }

    public String getKra_pin() {
        return kra_pin;
    }

    public void setKra_pin(String kra_pin) {
        this.kra_pin = kra_pin;
    }

    public String getNssf_no() {
        return nssf_no;
    }

    public void setNssf_no(String nssf_no) {
        this.nssf_no = nssf_no;
    }

    public String getNhif_no() {
        return nhif_no;
    }

    public void setNhif_no(String nhif_no) {
        this.nhif_no = nhif_no;
    }

    public String getCert_good_conduct_no() {
        return cert_good_conduct_no;
    }

    public void setCert_good_conduct_no(String cert_good_conduct_no) {
        this.cert_good_conduct_no = cert_good_conduct_no;
    }

    public String getHelb_clearance_no() {
        return helb_clearance_no;
    }

    public void setHelb_clearance_no(String helb_clearance_no) {
        this.helb_clearance_no = helb_clearance_no;
    }

    public int getHelb_benefitiary() {
        return helb_benefitiary;
    }

    public void setHelb_benefitiary(int helb_benefitiary) {
        this.helb_benefitiary = helb_benefitiary;
    }

    public String getBank_name() {
        return bank_name;
    }

    public void setBank_name(String bank_name) {
        this.bank_name = bank_name;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getAccount_name() {
        return account_name;
    }

    public void setAccount_name(String account_name) {
        this.account_name = account_name;
    }

    public String getAcount_number() {
        return acount_number;
    }

    public void setAcount_number(String acount_number) {
        this.acount_number = acount_number;
    }

    public String getDate_started() {
        return date_started;
    }

    public void setDate_started(String date_started) {
        this.date_started = date_started;
    }

    public String getDate_ended() {
        return date_ended;
    }

    public void setDate_ended(String date_ended) {
        this.date_ended = date_ended;
    }

    public String getIsActive() {
        return isActive;
    }

    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPositionTitle() {
        return positionTitle;
    }

    public void setPositionTitle(String positionTitle) {
        this.positionTitle = positionTitle;
    }

    public String getPositionId() {
        return positionId;
    }

    public void setPositionId(String positionId) {
        this.positionId = positionId;
    }

    public String getStandardId() {
        return standardId;
    }

    public void setStandardId(String standardId) {
        this.standardId = standardId;
    }

    public String getCadreTypeName() {
        return cadreTypeName;
    }

    public void setCadreTypeName(String cadreTypeName) {
        this.cadreTypeName = cadreTypeName;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(String supervisor) {
        this.supervisor = supervisor;
    }

}
