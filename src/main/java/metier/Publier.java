package metier;

import entite.Publication;
import entite.Tag;
import entite.TagByPublication;
import java.sql.Connection;
import java.util.List;

public class Publier {

    /**
     * Alaina ny idconfidentialité raha publique na privé. Alaina ny iduser.
     * Alaina daholo ny tag rehetra ao amin'ilay publication : vérifier un par
     * un raha efa ao anaty table tag : si oui, ajouter dans tagbypublication
     * l'id du tag et de la publication; sinon, mamorona tag vaovao ary
     * ajouter-na ao amin'ny tagbypublication avy eo.
     */
    public Publier() {

    }

    public void insertPublier(Connection c, Publication p) {
        int idpublication = p.insertPublication();
        List<String> listetag = p.listeTagDansCettePublication();

        for (String tag : listetag) {
            Tag t = new Tag();
            t.setThetag(tag);
            if (!t.tagexist(c)) {
                int idtag = t.insertTag();
                TagByPublication tbp = new TagByPublication();
                tbp.setIdpublication(idpublication);
                tbp.setIdtag(idtag);
                tbp.insertTbP();
            } else {
                t.getTag(c);
                TagByPublication tbp = new TagByPublication();
                tbp.setIdpublication(idpublication);
                tbp.setIdtag(t.getIdtag());
                tbp.insertTbP();
            }
        }
    }

}
