/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package upc.edu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import upc.edu.entitys.Usuario;

/**
 *
 * @author Alex
 */
@WebServlet(name = "ServletUsuario", urlPatterns = {"/ServletUsuario"})
public class ServletUsuario extends HttpServlet {

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
            out.println("<title>Piero de Mela</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Piero de Mela " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
               
        String accion=(String)request.getParameter("accion");
        if(accion!=null)
        {
            String res="";
            
            if(accion.equals("salir"))
            {
                HttpSession sesion=request.getSession();
                sesion.invalidate();
                response.sendRedirect("index.jsp");
                return;
            }
            
            request.setAttribute("accion", accion);
            
            if(accion.equals("principal"))
                request.getRequestDispatcher("main.jsp").forward(request, response);
            else if(accion.equals("estado"))
                request.getRequestDispatcher("estadoCuenta.jsp").forward(request, response);
            else if(accion.equals("ingresar"))
                request.getRequestDispatcher("ingresarMonto.jsp").forward(request, response);
            else if(accion.equals("retirar"))
                request.getRequestDispatcher("retirarMonto.jsp").forward(request, response);
            else if(accion.equals("adminu"))
            {
                   try{
                            EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                            EntityManager em=emf.createEntityManager();

                            Query query=em.createQuery("SELECT u FROM Usuario u", Usuario.class);
                            List<Usuario> lista=query.getResultList();   
                            
                            request.setAttribute("listaUsuarios",lista);
        
                    }catch(Exception ex)
                    {
                        System.out.println("Error de conexión en el Admin Usu GET");
                    }      
                request.getRequestDispatcher("adminUsuarios.jsp").forward(request, response);
            }
            else if(accion.equals("adminc"))
                request.getRequestDispatcher("adminCuentas.jsp").forward(request, response);
             else if(accion.equals("nosotros"))
                request.getRequestDispatcher("acercaNosotros.jsp").forward(request, response);
                     
        }
              
        System.out.println("AQUI LLEGÓ BIEN :D");
        //request.getRequestDispatcher("main.jsp").forward(request, response);
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String user="";
        String clave="";
        user=request.getParameter("txtUsuario").toString();
        clave=request.getParameter("txtClave").toString();
        
        
         try{
        EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
        EntityManager em=emf.createEntityManager();
        
        Query query=em.createQuery("SELECT u FROM Usuario u where u.codigo=:user and u.clave=:clave", Usuario.class);
        query.setParameter("clave", clave);
         query.setParameter("user",user);    
        
        List<Usuario> lista=query.getResultList();
        
        if(lista.size()>0)
        {
            //SI AUTENTICA AL USUARIO
            HttpSession sesion=request.getSession(true);
            sesion.setAttribute("usuario", user);
            sesion.setAttribute("nombre", lista.get(0).getNombre()+" "+lista.get(0).getApellido());
            sesion.setAttribute("rol", lista.get(0).getRol());
                        
            request.getRequestDispatcher("main.jsp").forward(request, response);
        
        }
        else
        {
            request.setAttribute("mensaje", "LOGIN ERROR");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        
        }catch(Exception ex)
        {
            System.out.println("Error de conexión en el doPost");
           
        }      
        
        
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
