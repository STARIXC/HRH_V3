package models;

public class Facility {
	int SubPartnerID;
	String SubPartnerNom;
	int DistrictID;
	int CentreSanteId;

    public Facility() {
        super();
    }
        
        
	public Facility(int subPartnerID, String subPartnerNom, int districtID, int centreSanteId) {
		super();
		SubPartnerID = subPartnerID;
		SubPartnerNom = subPartnerNom;
		DistrictID = districtID;
		CentreSanteId = centreSanteId;
	}
	public Facility(String subPartnerNom, int districtID, int centreSanteId) {
		super();
		SubPartnerNom = subPartnerNom;
		DistrictID = districtID;
		CentreSanteId = centreSanteId;
	}
	@Override
	public String toString() {
		return "facility [SubPartnerID=" + SubPartnerID + ", SubPartnerNom=" + SubPartnerNom + ", DistrictID="
				+ DistrictID + ", CentreSanteId=" + CentreSanteId + "]";
	}
	public int getSubPartnerID() {
		return SubPartnerID;
	}
	public void setSubPartnerID(int subPartnerID) {
		SubPartnerID = subPartnerID;
	}
	public String getSubPartnerNom() {
		return SubPartnerNom;
	}
	public void setSubPartnerNom(String subPartnerNom) {
		SubPartnerNom = subPartnerNom;
	}
	public int getDistrictID() {
		return DistrictID;
	}
	public void setDistrictID(int districtID) {
		DistrictID = districtID;
	}
	public int getCentreSanteId() {
		return CentreSanteId;
	}
	public void setCentreSanteId(int centreSanteId) {
		CentreSanteId = centreSanteId;
	}
	
	
	

}
