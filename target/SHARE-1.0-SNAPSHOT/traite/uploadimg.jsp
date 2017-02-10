<%@ page import="org.apache.commons.fileupload.*, java.util.List, java.io.File, java.util.Iterator" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DBConnect"%>
<%
    boolean isMultipart = FileUpload.isMultipartContent(request);

    if (isMultipart) {

        DiskFileUpload upload = new DiskFileUpload();
        List items = upload.parseRequest(request);
        Iterator itr = items.iterator();

        String image = null;
        while (itr.hasNext()) {
            FileItem item = (FileItem) itr.next();
            if (!item.isFormField()) {
                File fullFile = new File(item.getName());
                image = fullFile.getName();
                File savedFile = new File(getServletContext().getRealPath("/") + "/img/", fullFile.getName());
                System.out.println(getServletContext().getRealPath("/"));
                try {
                    item.write(savedFile);
                } catch (Exception e) {
                }
            }
        }
    }

    String site = "";
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
%>