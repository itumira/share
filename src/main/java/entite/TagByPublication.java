package entite;

import database.BasicsFunctions;

public class TagByPublication {

    int idtag;
    int idpublication;

    @Override
    public String toString() {
        return idtag + "," + idpublication;
    }

    public void insertTbP() {
        BasicsFunctions bf = new BasicsFunctions();
        bf.insertionObj("tagbypublication", this);
    }

    public int getIdtag() {
        return idtag;
    }

    public void setIdtag(int idtag) {
        this.idtag = idtag;
    }

    public int getIdpublication() {
        return idpublication;
    }

    public void setIdpublication(int idpublication) {
        this.idpublication = idpublication;
    }

}
