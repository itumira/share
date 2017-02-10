package entite;

import java.sql.Date;
import java.sql.Time;

public class DetPartage extends DetPublication {

    int idpartage;
    Date datepartage;
    Time heurepartage;
    long longpartage;
    long latpartage;
    int idpartageur;
    String nompartageur;
    String prenompartageur;
    String emailpartageur;
    String imgpartageur;

    public int getIdpartage() {
        return idpartage;
    }

    public Date getDatepartage() {
        return datepartage;
    }

    public Time getHeurepartage() {
        return heurepartage;
    }

    public long getLongpartage() {
        return longpartage;
    }

    public long getLatpartage() {
        return latpartage;
    }

    public int getIdpartageur() {
        return idpartageur;
    }

    public String getNompartageur() {
        return nompartageur;
    }

    public String getPrenompartageur() {
        return prenompartageur;
    }

    public String getEmailpartageur() {
        return emailpartageur;
    }

    public String getImgpartageur() {
        return imgpartageur;
    }

    public void setIdpartage(int idpartage) {
        this.idpartage = idpartage;
    }

    public void setDatepartage(Date datepartage) {
        this.datepartage = datepartage;
    }

    public void setHeurepartage(Time heurepartage) {
        this.heurepartage = heurepartage;
    }

    public void setLongpartage(long longpartage) {
        this.longpartage = longpartage;
    }

    public void setLatpartage(long latpartage) {
        this.latpartage = latpartage;
    }

    public void setIdpartageur(int idpartageur) {
        this.idpartageur = idpartageur;
    }

    public void setNompartageur(String nompartageur) {
        this.nompartageur = nompartageur;
    }

    public void setPrenompartageur(String prenompartageur) {
        this.prenompartageur = prenompartageur;
    }

    public void setEmailpartageur(String emailpartageur) {
        this.emailpartageur = emailpartageur;
    }

    public void setImgpartageur(String imgpartageur) {
        this.imgpartageur = imgpartageur;
    }

}
