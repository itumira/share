package servlets;

import entite.DetPublication;
import entite.Utilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class PublicationUtilisateur extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Utilisateur u = new Utilisateur();
        int iduser = Integer.parseInt(request.getParameter("iduser"));
        u.setIduser(iduser);
        List<DetPublication> listdetpub = u.getAllPublications();

        JSONObject obj = null;
        JSONArray arr = new JSONArray();

        for (DetPublication ldp : listdetpub) {
            try {
                obj = new JSONObject();
                obj.put("confidentialite", ldp.getConfidentialite());
                obj.put("contenupublication", ldp.getContenupublication());
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                obj.put("datepublication", sdf.format(ldp.getDatepublication()));
                obj.put("heurepublication", ldp.getHeurepublication());
                obj.put("idconfidentialite", ldp.getIdconfidentialite());
                obj.put("idpublication", ldp.getIdpublication());
                obj.put("iduser", ldp.getIduser());
                obj.put("latitude", ldp.getLatitude());
                obj.put("longitude", ldp.getLongitude());
                obj.put("nbrpa", ldp.getNbrpa());
                obj.put("nomprenom", ldp.getNomPrenom());
                arr.put(obj);
            } catch (JSONException ex) {
            }
        }
        try (PrintWriter out = response.getWriter()) {
            out.println(arr);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
