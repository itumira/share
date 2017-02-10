package entite;

public class DetUtilisateur extends Utilisateur {

    private int nbrepublication;
    private int nbreabonnes;
    private int nbreabonnement;

    public void setNbrepublication(int nbrepublication) {
        this.nbrepublication = nbrepublication;
    }

    public void setNbreabonnes(int nbreabonnes) {
        this.nbreabonnes = nbreabonnes;
    }

    public void setNbreabonnement(int nbreabonnement) {
        this.nbreabonnement = nbreabonnement;
    }

    public int getNbrepublication() {
        return nbrepublication;
    }

    public int getNbreabonnes() {
        return nbreabonnes;
    }

    public int getNbreabonnement() {
        return nbreabonnement;
    }
}
