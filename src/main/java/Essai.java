
import java.text.DecimalFormat;

public class Essai {

    public static void main(String[] args) {

        DecimalFormat decimalFormat = (DecimalFormat) DecimalFormat.getInstance();
        decimalFormat.applyPattern("###0.##########");

        // r
        int r = 6366;

        double lat1 = 47.5327777;
        double lon1 = -18.9860195;

        double lat2 = 47.5327607;
        double lon2 = -18.9860271;

        long tempsT1;
        long tempsT2;

        System.out.println(
                "Point A (lat/lon) : " + decimalFormat.format(lat1) + " " + decimalFormat.format(lon1) + "\n"
                + "Point B (lat/lon) : " + decimalFormat.format(lat2) + " " + decimalFormat.format(lon2)
        );

        /**
         * Conversion des entrées en ° vers en radian
         */
        lat1 = Math.toRadians(lat1);
        lon1 = Math.toRadians(lon1);
        lat2 = Math.toRadians(lat2);
        lon2 = Math.toRadians(lon2);

        tempsT1 = System.nanoTime();
        double distance = distanceVolOiseauEntre2PointsAvecPrécision(lat1, lon1, lat2, lon2);
        tempsT2 = System.nanoTime();
        System.out.println("Temps (AvecPrécision) : " + String.format("%10d", (tempsT2 - tempsT1)) + " ns");
        double distanceEnKm = distance * r * 1000;

        tempsT1 = System.nanoTime();
        double distanceEloigné = distanceVolOiseauEntre2PointsSansPrécision(lat1, lon1, lat2, lon2);
        tempsT2 = System.nanoTime();
        System.out.println("Temps (SansPrécision) : " + String.format("%10d", (tempsT2 - tempsT1)) + " ns");
        double distanceEloignéEnKm = distanceEloigné * r;

        System.out.println(
                "Distance      : " + decimalFormat.format(distance) + " (" + distance + ")\n"
                + "Distance (km) calcul précis pour courtes distances         : " + decimalFormat.format(distanceEnKm) + " km (" + distanceEnKm + ")\n"
                + "Distance (km) calcul non précis pour distances non courtes : " + decimalFormat.format(distanceEloignéEnKm) + " km (" + distanceEloignéEnKm + ")\n"
                + ""
        );

//		Point A (lat/lon) : 50,19473 6,83212
//		Point B (lat/lon) : 50,1948 6,83244
//		Temps (AvecPrécision) :      34297 ns
//		Temps (SansPrécision) :      24435 ns
//		Distance      : 0,0000037784 (3.7784109830459747E-6)
//		Distance (km) calcul précis pour courtes distances         : 0,0240533643 km (0.024053364318070675)
//		Distance (km) calcul non précis pour distances non courtes : 0,0240533376 km (0.024053337627628308)
    }

    public static double distanceVolOiseauEntre2PointsSansPrécision(double lat1, double lon1, double lat2, double lon2) {

        // d=acos(sin(lat1)*sin(lat2)+cos(lat1)*cos(lat2)*cos(lon1-lon2))
        return Math.acos(
                Math.sin(lat1) * Math.sin(lat2) + Math.cos(lat1) * Math.cos(lat2) * Math.cos(lon1 - lon2)
        );

    }

    /**
     * Distance entre 2 points GPS
     * http://dotclear.placeoweb.com/post/Formule-de-calcul-entre-2-points-wgs84-pour-calculer-la-distance-qui-separe-ces-deux-points
     *
     * La distance mesurée le long d'un arc de grand cercle entre deux points
     * dont on connaît les coordonnées {lat1,lon1} et {lat2,lon2} est donnée par
     * : La formule, mathématiquement équivalente, mais moins sujette aux
     * erreurs d'arrondis pour les courtes distances est :	*
     * d=2*asin(sqrt((sin((lat1-lat2)/2))^2 + cos(lat1)*cos(lat2)*(sin((lon1-
     * lon2)/2))^2)) Le tout * 6366 pour l'avoir en km
     *
     * @param lat1
     * @param lon1
     * @param lat2
     * @param lon2
     * @return
     */
    public static double distanceVolOiseauEntre2PointsAvecPrécision(double lat1, double lon1, double lat2, double lon2) {
        return 2 * Math.asin(
                Math.sqrt(
                        Math.pow((Math.sin((lat1 - lat2) / 2)), 2)
                        + Math.cos(lat1) * Math.cos(lat2)
                        * (Math.pow(
                                Math.sin(
                                        ((lon1 - lon2) / 2)
                                ), 2))
                )
        );

    }
    
    

}
