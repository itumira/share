package servlets;

import entite.Utilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import metier.Searching;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SearchResult extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String motcles = request.getParameter("q");
        Searching search = new Searching();
        List<Utilisateur> listuser = search.getSearchResult(motcles);

        JSONObject obj = null;
        JSONArray arr = new JSONArray();

        for (Utilisateur u : listuser) {
            try {
                obj = new JSONObject();
                obj.put("iduser", u.getIduser());
                obj.put("nomuser", u.getNomuser());
                obj.put("prenomuser", u.getPrenomuser());
                obj.put("emailuser", u.getEmailuser());
                obj.put("imguser", u.getImguser());
                obj.put("nomprenomuser", u.getPrenomuser() + " " + u.getNomuser());
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
