
package upc.edu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import upc.edu.entitys.Transaccion;
import upc.edu.entitys.Usuario;
import org.joda.time.DateTime;
import org.joda.time.Days;


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
                                /*
                                //_______________AQUI CAMBIE
                                Transaccion interesGanado=new Transaccion();
                                   interesGanado.setMonto(monto);
                                   interesGanado.setCuentaId(cuenta);
                                   interesGanado.setFechaTransaccion(new Date());
                                    interesGanado.setMotivo("Apertura");
                                    interesGanado.setSaldoRestante(monto.doubleValue());
                                    interesGanado.setCostoBanco(BigDecimal.ZERO);
                                     interesGanado.setActualizado(0);
                                
                                     em.getTransaction().begin();
                                     em.persist(interesGanado);
                                     em.getTransaction().commit(); */
                                
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
        
         // <editor-fold defaultstate="collapsed" desc="Operacion de Cuentas">
         String operacionCuenta=(String)request.getParameter("operacionCuenta");
         if(operacionCuenta!=null)
         {
             //O BIEN ES INGRESAR O BIEN ES RETIRAR
             int cuentaid=Integer.parseInt((String)request.getParameter("cuentaid"));
              BigDecimal monto=new BigDecimal((String)request.getParameter("monto"));
              String motivo=(String)request.getParameter("motivo");
              
              //HACER CALCULOS O QUIZAS TRAER DEL PASADO AL FUTURO ETC ETC _ TRAER TASA
              double tasa=Double.parseDouble(request.getSession().getAttribute("tdcto").toString());
              
              //OPERAR
              //ACTUALIZAR CCUENTA E INSERTAR TRANSACCION
              try{
                         EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                       EntityManager em=emf.createEntityManager();
                       
                       //ENCUENTRO MI CUENTA Y BLA BLA
                       Cuenta objCuenta=em.find(Cuenta.class,cuentaid);
                       
                       //ANTES DE ESO TENGO QUE VERIFICAR QUE MI ULTIMA TRANSACCION HAYA SIDO EL DIA DE HOY, SINO ACTUALIZO TODO
                        Query queryX=em.createQuery("SELECT t FROM Transaccion t where t.cuentaId = :cuenta", Transaccion.class);
                          queryX.setParameter("cuenta", objCuenta);
                       
                       List<Transaccion> listaTran=queryX.getResultList();
                       if(listaTran.size()>0)
                       {
                           //ultima fecha
                           Date fechaUltimaTran=listaTran.get(listaTran.size()-1).getFechaTransaccion();
                          //fecha actual
                           Date hoy=new Date();
                           
                           int days = Days.daysBetween(new DateTime(fechaUltimaTran), new DateTime(hoy)).getDays();
                           if(days>0) //si es que son más dias aplico la actualización pe
                           {
                               //HACEMOS AL UPDATE DE INTERESES GANADOS
                               em.getTransaction().begin();
                               double actualizado=objCuenta.getMontoNeto().doubleValue()*Math.pow((1+tasa),days);
                               objCuenta.setMontoNeto(new BigDecimal(actualizado));
                                em.getTransaction().commit();
                                
                                Transaccion interesGanado=new Transaccion();
                                   interesGanado.setMonto(new BigDecimal(objCuenta.getMontoNeto().doubleValue()-listaTran.get(listaTran.size()-1).getSaldoRestante()));
                                   interesGanado.setCuentaId(objCuenta);
                                   interesGanado.setFechaTransaccion(new Date());
                                    interesGanado.setMotivo("Interes Ganado");
                                    interesGanado.setSaldoRestante(objCuenta.getMontoNeto().doubleValue());
                                    interesGanado.setCostoBanco(BigDecimal.ZERO);
                                     interesGanado.setActualizado(0);
                                     
                                     em.getTransaction().begin();
                                     em.persist(interesGanado);
                                     em.getTransaction().commit();
                                
                           }       
                          
                           
                       }
                       
                        em.getTransaction().begin();
                        double nuevo=0;

                        double costoDiario=Double.parseDouble(request.getSession().getAttribute("costo").toString());
                        
                        switch(operacionCuenta)
                        {
                            case "ingresar" :      nuevo=objCuenta.getMontoNeto().doubleValue()+monto.doubleValue();      break;
                            case "retirar" :     
                                nuevo=objCuenta.getMontoNeto().doubleValue()-monto.doubleValue()-costoDiario;    
                                
                                if(nuevo<0)
                                {
                                     
                                     int id=Integer.parseInt(request.getSession().getAttribute("id").toString());
                                 Usuario user=em.find(Usuario.class,id);
                                 
                                 //NOTAR QUE PARA ASOCIACIONES Y RELACIONES POR ID SE MANDA EL OBJETO e_e
                                 Query query=em.createQuery("SELECT c FROM Cuenta c where c.usuarioId = :user", Cuenta.class);
                                 query.setParameter("user", user);
                                                              
                                 List<Cuenta> lista=query.getResultList();   
                                 em.close();

                                 request.setAttribute("listaCuentas",lista);
                                     request.setAttribute("mensajeConfirmacionPeligro", "Monto solicitado excede sus fondos");    request.getRequestDispatcher("retirarMonto.jsp").forward(request, response); 
                                     return;
                                }
                                
                                break;
                        }
                        //SI ES INGRESO SUMO
                        
                        BigDecimal nuevito=new BigDecimal(nuevo);
                        nuevito=nuevito.setScale(2,RoundingMode.CEILING);
                        objCuenta.setMontoNeto(nuevito);
                        em.getTransaction().commit();
                        //ACTUALICE CUENTA, AHORA INSERTARE LA TRANSACCION

                         Transaccion nuevaTran=new Transaccion();
                         //SI ES RETIRO (-) + COSTO, SI ES INGRESO (+)+0
                          switch(operacionCuenta)
                        {
                            case "ingresar" :       nuevaTran.setMonto(monto); nuevaTran.setCostoBanco(new BigDecimal(0));      break;
                            case "retirar" :      nuevaTran.setMonto(new BigDecimal(-monto.doubleValue())); nuevaTran.setCostoBanco(new BigDecimal(costoDiario));  break;
                        }
                                                 
                         nuevaTran.setCuentaId(objCuenta);
                         nuevaTran.setFechaTransaccion(new Date());
                         nuevaTran.setMotivo(motivo);
                         nuevaTran.setSaldoRestante(nuevo);
                         nuevaTran.setActualizado(0);
                         em.getTransaction().begin();
                               em.persist(nuevaTran);
                        em.getTransaction().commit();
                           
                        //DEBERIA REGRESAR AL MISMO LUGAR ENVIANDOLE LOS NUMEROS DE CUENTA
                            int id=Integer.parseInt(request.getSession().getAttribute("id").toString());
                                 Usuario user=em.find(Usuario.class,id);
                                 
                                 //NOTAR QUE PARA ASOCIACIONES Y RELACIONES POR ID SE MANDA EL OBJETO e_e
                                 Query query=em.createQuery("SELECT c FROM Cuenta c where c.usuarioId = :user", Cuenta.class);
                                 query.setParameter("user", user);
                                                              
                                 List<Cuenta> lista=query.getResultList();   
                                 em.close();

                                 request.setAttribute("listaCuentas",lista);
                                 
                            switch(operacionCuenta)
                        {
                            case "ingresar" :  request.setAttribute("mensajeConfirmacion", "Monto ingresado correctamente");    request.getRequestDispatcher("ingresarMonto.jsp").forward(request, response);    break;
                            case "retirar" :      request.setAttribute("mensajeConfirmacion", "Monto retirado correctamente");    request.getRequestDispatcher("retirarMonto.jsp").forward(request, response);  break;
                        }
                                    

                         }catch(Exception ex)
                        {
                            System.out.println("Error de conexión en el Ingresar/Retirar Monto POST");
                            ex.printStackTrace();
                        }
              
              
             
         }
           //</editor-fold>
         
          // <editor-fold defaultstate="collapsed" desc="Estado de Cuenta">
         String estado=(String)request.getParameter("estado");
         if(estado!=null)
         {
             if(estado.equals("estado"))
             {
                   try{
                         EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                       EntityManager em=emf.createEntityManager();
                       
                       int cuentaid=Integer.parseInt((String)request.getParameter("cuentaid"));
                       double tasa=Double.parseDouble(request.getSession().getAttribute("tdcto").toString());
                        //ENCUENTRO MI CUENTA Y BLA BLA
                       Cuenta objCuenta=em.find(Cuenta.class,cuentaid);
                        //NOTAR QUE PARA ASOCIACIONES Y RELACIONES POR ID SE MANDA EL OBJETO e_e
                                 Query queryT=em.createQuery("SELECT t FROM Transaccion t where t.cuentaId = :cuenta", Transaccion.class);
                                 queryT.setParameter("cuenta", objCuenta);
                                 
                                 List<Transaccion> listaTran=queryT.getResultList();
                       if(listaTran.size()>0)
                       {
                           //ultima fecha
                           Date fechaUltimaTran=listaTran.get(listaTran.size()-1).getFechaTransaccion();
                          //fecha actual
                           Date hoy=new Date();
                           
                           int days = Days.daysBetween(new DateTime(fechaUltimaTran), new DateTime(hoy)).getDays();
                           if(days>0) //si es que son más dias aplico la actualización pe
                           {
                               //HACEMOS AL UPDATE DE INTERESES GANADOS
                               em.getTransaction().begin();
                               double actualizado=objCuenta.getMontoNeto().doubleValue()*Math.pow((1+tasa),days);
                               objCuenta.setMontoNeto(new BigDecimal(actualizado));
                                em.getTransaction().commit();
                                
                                   Transaccion nuevaTran=new Transaccion();
                                   Transaccion interesGanado=new Transaccion();
                                   interesGanado.setMonto(new BigDecimal(objCuenta.getMontoNeto().doubleValue()-listaTran.get(listaTran.size()-1).getSaldoRestante()));
                                   interesGanado.setCuentaId(objCuenta);
                                   interesGanado.setFechaTransaccion(new Date());
                                    interesGanado.setMotivo("Interes Ganado");
                                    interesGanado.setSaldoRestante(objCuenta.getMontoNeto().doubleValue());
                                    interesGanado.setCostoBanco(BigDecimal.ZERO);
                                     interesGanado.setActualizado(0);

                        //SI ES RETIRO (-) + COSTO, SI ES INGRESO (+)+0 (EL COLCHON)
                         
                         nuevaTran.setMonto(BigDecimal.ZERO);
                         nuevaTran.setCuentaId(objCuenta);
                         nuevaTran.setFechaTransaccion(new Date());
                         nuevaTran.setMotivo("Actualizado desde estado de cuenta");
                         nuevaTran.setSaldoRestante(objCuenta.getMontoNeto().doubleValue());
                         nuevaTran.setCostoBanco(BigDecimal.ZERO);
                         nuevaTran.setActualizado(1);
                         em.getTransaction().begin();
                                em.persist(interesGanado);
                               em.persist(nuevaTran);
                        em.getTransaction().commit();              
                        
                        
                           }    
                       }
                       
                     
                       
                       request.setAttribute("listaTran", listaTran);
                       request.setAttribute("cuenta", objCuenta);
                           
                        //DEBERIA REGRESAR AL MISMO LUGAR ENVIANDOLE LOS NUMEROS DE CUENTA
                            int id=Integer.parseInt(request.getSession().getAttribute("id").toString());
                                 Usuario user=em.find(Usuario.class,id);
                                 
                                 //NOTAR QUE PARA ASOCIACIONES Y RELACIONES POR ID SE MANDA EL OBJETO e_e
                                 Query query=em.createQuery("SELECT c FROM Cuenta c where c.usuarioId = :user", Cuenta.class);
                                 query.setParameter("user", user);
                                                                 
                                 List<Cuenta> lista=query.getResultList();   
                                 em.close();

                                 request.setAttribute("listaCuentas",lista);
                                    request.setAttribute("accion","estado");

                         }catch(Exception ex)
                        {
                            System.out.println("Error de conexión en el Estado de Cta POST");
                        }
                   
                   request.getRequestDispatcher("estadoCuenta.jsp").forward(request, response);
             }
         }
           //</editor-fold>
         
          // <editor-fold defaultstate="collapsed" desc="Estado de Cuenta">
         String van=(String)request.getParameter("van");
         if(van!=null)
         {
             if(van.equals("van"))
             {
                 int dias=Integer.parseInt((String)request.getParameter("dias"));
                 int cuentaid=Integer.parseInt((String)request.getParameter("cuentaid"));
                double tasa=Double.parseDouble(request.getSession().getAttribute("tdcto").toString());
                 
                  try{
                         EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                       EntityManager em=emf.createEntityManager();
                       
                       //ENCUENTRO MI CUENTA Y BLA BLA
                       Cuenta objCuenta=em.find(Cuenta.class,cuentaid);
                       
                       double inv=objCuenta.getMontoNeto().doubleValue();
                       double antes=inv;
                       double despues=0;
                       List listaFlujos = new ArrayList();
                                              
                       for(int i=0;i<dias;i++)
                       {
                           despues=antes*(1+tasa);
                           listaFlujos.add(despues-antes);
                           antes=despues;
                       }
                       //TENIENDO LA LISTA LLENA
                       double vanRes=inv*(-1);
                       for(int i=0;i<listaFlujos.size();i++)
                       {
                           vanRes+=((double)listaFlujos.get(i)/Math.pow(1+tasa, i+1));
                       }
                       
                       request.setAttribute("vanRes", vanRes);
                       
                       //CONSEGUIR DE NUEVO LOS NUMEROS DE CUENTA
                          int id=Integer.parseInt(request.getSession().getAttribute("id").toString());
                                 Usuario objUser=em.find(Usuario.class,id);         
                        Query query3=em.createQuery("SELECT c FROM Cuenta c where c.usuarioId = :user", Cuenta.class);
                                 query3.setParameter("user", objUser);
                                                                 
                                 List<Cuenta> listaCuentas=query3.getResultList();   
                                 em.close();

                                 request.setAttribute("listaCuentas",listaCuentas);
                       
                        }catch(Exception ex)
                        {
                            System.out.println("Error de conexión en el Calcular VAN  POST");
                        }
                 request.getRequestDispatcher("main.jsp").forward(request, response);
             }
         }
         //</editor-fold>
         
        
    }    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
