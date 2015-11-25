
package upc.edu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import upc.edu.entitys.Cuenta;
import upc.edu.entitys.Usuario;


@WebServlet(name = "ServletCuenta", urlPatterns = {"/ServletCuenta"})
public class ServletCuenta extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //DO GET (URL)
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //DO POST (FORM)
         String accion=(String)request.getParameter("accion");
         // <editor-fold defaultstate="collapsed" desc="Administracion de Cuentas">
         if(accion!=null) //ha entrado por post significa que ha entrado por formulario por lo tanto o es un insert o es un update :D
        {
            //OJO ACA ... 192-12345678-0-30
            String ncuenta=(String)request.getParameter("ncuenta");
            
            String ofi=ncuenta.substring(0,3);
            String num=ncuenta.substring(4,12);
            String ulti=ncuenta.substring(15,17);
            ncuenta=ofi+""+num+"0"+ulti;
            
            
             BigDecimal monto=new BigDecimal((String)request.getParameter("monto"));
             int usuarioid=Integer.parseInt((String)request.getParameter("selectUsuario"));           
           
            
            //habiendo obtenido todos los datos pregunto n.n
           try{
                   EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                   EntityManager em=emf.createEntityManager();   
   
                   Cuenta cuenta=null;
                     
                    switch(accion)
                    {
                        case "insert": 
                            
                            cuenta=new Cuenta();
                            cuenta.setEstado("ACT");
                            cuenta.setMontoNeto(monto);
                            //encuentro el usuario con el id
                            Usuario wat=em.find(Usuario.class, usuarioid);
                            cuenta.setUsuarioId(wat);
                            cuenta.setNroCuenta(ncuenta);
                            
                                em.getTransaction().begin();
                                em.persist(cuenta);
                                em.getTransaction().commit();                                    
                                
                                
                                  request.setAttribute("mensajeConfirmacion", "Cuenta registrada correctamente");
                         break;
                        
                    }           
                            Query query=em.createQuery("SELECT c FROM Cuenta c where c.estado= :estado ", Cuenta.class);
                            query.setParameter("estado", "ACT");
                            List<Cuenta> lista=query.getResultList();   
                            em.close();
                            
                            request.setAttribute("listaCuentas",lista);
                             request.setAttribute("accion", "adminc");
                            
           }catch(Exception ex)
           {
               System.out.println("Error de conexión en el doPost INSERT CUENTA");
           }
                     request.getRequestDispatcher("adminCuentas.jsp").forward(request, response);
                     return;
        }
         //</editor-fold>
        
         String operacionCuenta=(String)request.getParameter("operacionCuenta");
         if(operacionCuenta!=null)
         {
             //O BIEN ES INGRESAR O BIEN ES RETIRAR
             
             
         }
        
    }    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
