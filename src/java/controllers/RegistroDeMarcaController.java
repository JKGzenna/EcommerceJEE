package controllers;

import JavaBeans.Marca;
import dao.MarcaDao;
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
public class RegistroDeMarcaController extends HttpServlet {

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
            out.println("<title>Servlet RegistroDeMarcaController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroDeMarcaController at " + request.getContextPath() + "</h1>");
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
        
        Marca m = new Marca();
            m.setNombre(nombre);
            m.setVisible(visible);

        if (request.getParameter("Registrar")!= null){
            if(MarcaDao.registrarMarca(m)){
                request.setAttribute("mensajemar","<p style='color:green'>La Marca se ha registrado correctamente</p>");
            }else{
                request.setAttribute("mensajemar","<p style='color:red'>No se ha podido registrar la Marca</p>");
            }
        }else if (request.getParameter("Eliminar")!= null){
            if (MarcaDao.eliminarMarca(m)){
                request.setAttribute("mensajemar", "<p style='color:green'>Se ha eliminado la Marca</p>");
            }else{
                request.setAttribute("mensajemar", "<p style='color:red'>No se ha podido eliminar la Marca</p>");
            }
        }else{
            request.setAttribute("mensajemar", "Acción desconocida");
        }
        request.getRequestDispatcher("RegistroDeMarca").forward(request, response);
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
