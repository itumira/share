package entite;

public class DetPublication extends Publication {

    private String nomuser;
    private String prenomuser;
    private String imguser;
    private String confidentialite;
    private int nbrpa;

    public String getConfidentialite() {
        return confidentialite;
    }

    public String getImguser() {
        return imguser;
    }

    public void setImguser(String imguser) {
        this.imguser = imguser;
    }

    public void setConfidentialite(String confidentialite) {
        if (confidentialite.equals("private")) {
            this.confidentialite = "depuis le web / mode restreint";
        } else {
            this.confidentialite = "depuis l'application ShareIT";
        }
    }

    public int getNbrpa() {
        return nbrpa;
    }

    public void setNbrpa(int nbrpa) {
        this.nbrpa = nbrpa;
    }

    public String getNomuser() {
        return nomuser;
    }

    public void setNomuser(String nomuser) {
        this.nomuser = nomuser;
    }

    public String getPrenomuser() {
        return prenomuser;
    }

    public void setPrenomuser(String prenomuser) {
        this.prenomuser = prenomuser;
    }

    public String getNomPrenom() {
        return prenomuser + " " + nomuser;
    }
}
