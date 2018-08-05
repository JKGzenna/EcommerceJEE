package controllers;

import JavaBeans.SubCategoria;
import dao.CategoriaDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jlGoldaracena
 */
public class RegistroDeSubCategoriaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistroDeSubCategoriaController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroDeSubCategoriaController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        String nombre = request.getParameter("nombre");
        
        boolean visible;
        try{
        visible = request.getParameter("visible").equalsIgnoreCase("on");
        }catch(Exception e){
            visible=false;
        }

        int categoriasuperior;
        categoriasuperior=Integer.parseInt(request.getParameter("categoriasuperior"));
        
        SubCategoria sc = new SubCategoria();
            sc.setNombre(nombre);
            sc.setVisible(visible);
            sc.setCategoria_superior(categoriasuperior);

            
        if (request.getParameter("Registrar")!= null){
            if(CategoriaDao.registrarSubCategoria(sc)){
                request.setAttribute("mensajesubcat","<p style='color:green'>La Subcategoría se ha registrado correctamente</p>");
            }else{
                request.setAttribute("mensajesubcat","<p style='color:red'>No se ha podido registrar la Subcategoría</p>");
            }
        }else if (request.getParameter("Eliminar")!= null){
            if (CategoriaDao.eliminarSubCategoria(sc)){
                request.setAttribute("mensajesubcat", "<p style='color:green'>Se ha eliminado la Subcategoría</p>");
            }else{
                request.setAttribute("mensajesubcat", "<p style='color:red'>No se ha podido eliminar la Subcategoría</p>");
            }
        }else{
            request.setAttribute("mensajesubcat", "Acción desconocida");
        }
        request.getRequestDispatcher("RegistroDeSubCategoria").forward(request, response);
    
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
