/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.servlet.http.HttpSession;
import upc.edu.entitys.Cuenta;
import upc.edu.entitys.Usuario;

/**
 *
 * @author Alex
 */
@WebServlet(name = "ServletUsuario", urlPatterns = {"/ServletUsuario"})
public class ServletUsuario extends HttpServlet {

        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
               
        String accion=(String)request.getParameter("accion");
        String crud=(String)request.getParameter("crud");
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
            
                       
            //ACCIONES DE SIDEBAR
            request.setAttribute("accion", accion);
            
            if(accion.equals("principal"))
                request.getRequestDispatcher("main.jsp").forward(request, response);
            else if(accion.equals("estado"))
                request.getRequestDispatcher("estadoCuenta.jsp").forward(request, response);
            else if(accion.equals("ingresar"))
                request.getRequestDispatcher("ingresarMonto.jsp").forward(request, response);
            else if(accion.equals("retirar"))
                request.getRequestDispatcher("retirarMonto.jsp").forward(request, response);
            // <editor-fold defaultstate="collapsed" desc="Administracion de Usuarios">
            else if(accion.equals("adminu"))
            {
               
                if(crud.equals("disable"))
                {
                        try{
                         EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                       EntityManager em=emf.createEntityManager();
                       int id=Integer.parseInt((String)request.getParameter("id"));

                       Usuario user=em.find(Usuario.class,id);
                        em.getTransaction().begin();
                        user.setEstado("INA");
                        em.getTransaction().commit();

                         Query query=em.createQuery("SELECT u FROM Usuario u where u.estado= :estado ", Usuario.class);
                                query.setParameter("estado", "ACT");
                                List<Usuario> lista=query.getResultList();   
                                em.close();

                                request.setAttribute("listaUsuarios",lista);

                         }catch(Exception ex)
                        {
                            System.out.println("Error de conexión en el Admin Usu DELETE GET");
                        }
                    
                        request.setAttribute("mensajeConfirmacion", "Usuario inhabilitado correctamente");
                }
                else if(crud.equals("update"))
                {
                    try{
                         EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                       EntityManager em=emf.createEntityManager();
                       int id=Integer.parseInt((String)request.getParameter("id"));

                       Usuario user=em.find(Usuario.class,id);
                       request.setAttribute("user", user);

                         }catch(Exception ex)
                        {
                            System.out.println("Error de conexión en el Admin Usu UPDATE GET");
                        }
                          request.getRequestDispatcher("actualizarUsuario.jsp").forward(request, response);
                          return;
                        
                }
                else if(crud.equals("read"))
                {                
                      
                        try{
                                 EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                                 EntityManager em=emf.createEntityManager();



                                 Query query=em.createQuery("SELECT u FROM Usuario u where u.estado= :estado ", Usuario.class);
                                 query.setParameter("estado", "ACT");
                                 List<Usuario> lista=query.getResultList();   
                                 em.close();


                                 request.setAttribute("listaUsuarios",lista);

                         }catch(Exception ex)
                         {
                             System.out.println("Error de conexión en el Admin Usu READ GET");
                         }
                }
                else if(crud.equals("insert"))
                {
                            try{
                                   EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                                   EntityManager em=emf.createEntityManager();
                                 //kriptonitooooooo
                                  Query query=em.createQuery("SELECT u FROM Usuario u", Usuario.class);

                                  List<Usuario> lista=query.getResultList();   
                                 String ultimoCode=lista.get(lista.size()-1).getCodigo();

                                 //cantidad de cifras despues de "u012"
                                 int cantCifras=3;
                                 //012 => 12
                                 int ultimoCodeN=Integer.parseInt(ultimoCode.substring(1,4))+1;
                                 int nCifras=obtenerCantCifras(ultimoCodeN);
                                 String codeResultante="u";
                                 if(nCifras<cantCifras)
                                 {
                                     //si le faltan 0's
                                     for(int i=0;i<(cantCifras-nCifras);i++)
                                         codeResultante+="0";
                                 }

                                 codeResultante+=(""+ultimoCodeN);

                                   em.close();

                                   request.setAttribute("codigo", codeResultante);


                           }catch(Exception ex)
                           {
                               System.out.println("Error de conexión en el Admin Usu INSERT GET");
                           }

                            request.getRequestDispatcher("registrarUsuario.jsp").forward(request, response);
                            return;
                }
                
                request.getRequestDispatcher("adminUsuarios.jsp").forward(request, response);
            }
             // </editor-fold>
            // <editor-fold defaultstate="collapsed" desc="Administracion de Cuentas">
            else if(accion.equals("adminc"))
            {
                if(crud.equals("disable"))
                {
                        try{
                         EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                       EntityManager em=emf.createEntityManager();
                       int id=Integer.parseInt((String)request.getParameter("id"));

                       Cuenta cuenta=em.find(Cuenta.class,id);
                        em.getTransaction().begin();
                        cuenta.setEstado("INA");
                        em.getTransaction().commit();

                         Query query=em.createQuery("SELECT c FROM Cuenta c where c.estado= :estado ", Cuenta.class);
                                query.setParameter("estado", "ACT");
                                List<Cuenta> lista=query.getResultList();   
                                em.close();

                                request.setAttribute("listaCuentas",lista);

                         }catch(Exception ex)
                        {
                            System.out.println("Error de conexión en el Admin Usu DELETE GET");
                        }
                    
                        request.setAttribute("mensajeConfirmacion", "Cuenta inhabilitada correctamente");
                }
                else if(crud.equals("update"))
                {
                    try{
                         EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                       EntityManager em=emf.createEntityManager();
                       int id=Integer.parseInt((String)request.getParameter("id"));

                       Usuario user=em.find(Usuario.class,id);
                       request.setAttribute("user", user);

                         }catch(Exception ex)
                        {
                            System.out.println("Error de conexión en el Admin Usu UPDATE GET");
                        }
                          request.getRequestDispatcher("actualizarUsuario.jsp").forward(request, response);
                          return;
                        
                }
                else if(crud.equals("read"))
                {                
                      
                        try{
                                 EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                                 EntityManager em=emf.createEntityManager();



                                 Query query=em.createQuery("SELECT c FROM Cuenta c where c.estado= :estado ", Cuenta.class);
                                 query.setParameter("estado", "ACT");
                                 List<Cuenta> lista=query.getResultList();   
                                 em.close();


                                 request.setAttribute("listaCuentas",lista);

                         }catch(Exception ex)
                         {
                             System.out.println("Error de conexión en el Admin Usu READ GET");
                         }
                }
                else if(crud.equals("insert"))
                {
                            try{
                                   EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                                   EntityManager em=emf.createEntityManager();
                                 //kriptonitooooooo
                                  int nOfi=190;
                                int nCod=30;
                                Random r=new Random();
                                int randomOfi=(int)(Math.random()*5+0);
                                int randomCod=(int)(Math.random()*5+0);
                                
                                String sOfi=(nOfi+randomOfi)+"";
                                 String sCod=(nCod+randomCod)+"";
                                String sNum="";
                                String nroCuenta="";
                                
                                 Query query=em.createQuery("SELECT c FROM Cuenta c", Cuenta.class);

                                  List<Cuenta> lista=query.getResultList();   
                                  if(lista.size()>0)
                                  {
                                    nroCuenta=lista.get(lista.size()-1).getNroCuenta();
                                    sNum=(Integer.parseInt(nroCuenta.substring(3,11))+1)+"";            
                                   }
                                  else
                                      sNum="10000000";
                                  
                                  //ACTUALIZANDO EL NROCUENTA
                                  nroCuenta=sOfi+sNum+"0"+sCod; 
                                  
                                  //PASANDO LA LISTA DE USUARIOS
                                   Query query2=em.createQuery("SELECT u FROM Usuario u where u.estado= :estado and u.rol='CLI' ", Usuario.class);
                                    query2.setParameter("estado", "ACT");
                                    List<Usuario> lista2=query2.getResultList();   
                                   

                                    request.setAttribute("listaUsuarios",lista2);

                                   em.close();

                                   request.setAttribute("ncuenta", nroCuenta);


                           }catch(Exception ex)
                           {
                               System.out.println("Error de conexión en el Admin Usu INSERT GET");
                           }

                            request.getRequestDispatcher("registrarCuenta.jsp").forward(request, response);
                            return;
                }
                
                request.getRequestDispatcher("adminCuentas.jsp").forward(request, response);
            }
            //</editor-fold>
             else if(accion.equals("nosotros"))
                request.getRequestDispatcher("acercaNosotros.jsp").forward(request, response);
                     
        }
              
        System.out.println("AQUI LLEGÓ BIEN :D");
        //request.getRequestDispatcher("main.jsp").forward(request, response);
        
        
    }

    private int obtenerCantCifras(int n)
    {
        int cont=0;
        while(n>0)
        {
            n/=10;
            cont++;
        }
        
        return cont;
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String accion=(String)request.getParameter("accion");
        if(accion!=null) //ha entrado por post significa que ha entrado por formulario por lo tanto o es un insert o es un update :D
        {
            String nombres=(String)request.getParameter("nombres");
            String apellidos=(String)request.getParameter("apellidos");
            String rol="CLI";
            String dni=(String)request.getParameter("dni");           
            String fechanacimiento=(String)request.getParameter("fechanacimiento");
            //FORMATEO DE LA FECHA
            SimpleDateFormat formatter=new SimpleDateFormat("dd/MM/yyyy");
            Date usuarioDate=null;
            try{
            usuarioDate=formatter.parse(fechanacimiento); }catch(ParseException e){e.printStackTrace();}
            
            String telefono=(String)request.getParameter("telefono");
            String email=(String)request.getParameter("email");
            String estado="ACT";
            String usuario=(String)request.getParameter("usuario");
            String clave=(String)request.getParameter("clave");
            
            //habiendo obtenido todos los datos pregunto n.n
           try{
                   EntityManagerFactory emf=Persistence.createEntityManagerFactory("IEF_Project_1PU");
                   EntityManager em=emf.createEntityManager();   
   
                     Usuario user=null;
                     
                    switch(accion)
                    {
                        case "insert": 
                             BigDecimal monto=new BigDecimal((String)request.getParameter("monto"));
                            user=new Usuario();
                                user.setCodigo(usuario);
                                user.setClave(clave);
                                user.setNombre(nombres);
                                user.setApellido(apellidos);
                                user.setDni(dni);
                                user.setRol(rol);
                                user.setEstado(estado);
                                user.setFechaNacimiento(usuarioDate);
                                user.setTelefono(telefono);
                                user.setEmail(email);
                                user.setImagenUrl("assets/img/user2.jpg"); 
                                em.getTransaction().begin();
                                em.persist(user);
                                em.getTransaction().commit();
                                //FALTA CREAR LA CUENTA
                                int nOfi=190;
                                int nCod=30;
                                Random r=new Random();
                                int randomOfi=(int)(Math.random()*5+0);
                                int randomCod=(int)(Math.random()*5+0);
                                
                                String sOfi=(nOfi+randomOfi)+"";
                                 String sCod=(nCod+randomCod)+"";
                                String sNum="";
                                String nroCuenta="";
                                
                                 Query query=em.createQuery("SELECT c FROM Cuenta c", Cuenta.class);

                                  List<Cuenta> lista=query.getResultList();   
                                  if(lista.size()>0)
                                  {
                                    nroCuenta=lista.get(lista.size()-1).getNroCuenta();
                                    sNum=(Integer.parseInt(nroCuenta.substring(3,11))+1)+"";            
                                   }
                                  else
                                      sNum="10000000";
                                  
                                  //ACTUALIZANDO EL NROCUENTA
                                  nroCuenta=sOfi+sNum+"0"+sCod;
                                   Cuenta nuevaCuenta=new Cuenta();
                                   nuevaCuenta.setUsuarioId(user);
                                   nuevaCuenta.setMontoNeto(monto);
                                   nuevaCuenta.setNroCuenta(nroCuenta);      
                                   nuevaCuenta.setEstado(estado);
                                 //DE 
                                   em.getTransaction().begin();
                                em.persist(nuevaCuenta);
                                em.getTransaction().commit();
                                
                                
                                
                                  request.setAttribute("mensajeConfirmacion", "Usuario registrado correctamente\nSe generó la cuenta: "+textoNumCuenta(nuevaCuenta.getNroCuenta()));
                         break;
                        case "update": 

                            int id=Integer.parseInt((String)request.getParameter("id"));

                            user=em.find(Usuario.class,id);
                            em.getTransaction().begin();
                            //empiezo a actualizar
                                user.setCodigo(usuario);
                                user.setClave(clave);
                                user.setNombre(nombres);
                                user.setApellido(apellidos);
                                user.setDni(dni);
                                user.setRol(rol);
                                user.setEstado(estado);
                                user.setFechaNacimiento(usuarioDate);
                                user.setTelefono(telefono);
                                user.setEmail(email);
                                user.setImagenUrl("assets/img/user2.jpg");                      
                            em.getTransaction().commit();
                            request.setAttribute("mensajeConfirmacion", "Usuario actualizado correctamente");
                          break;
                    }           
                            Query query=em.createQuery("SELECT u FROM Usuario u where u.estado= :estado ", Usuario.class);
                            query.setParameter("estado", "ACT");
                            List<Usuario> lista=query.getResultList();   
                            em.close();
                            
                            request.setAttribute("listaUsuarios",lista);
                             request.setAttribute("accion", "adminu");
                            
           }catch(Exception ex)
           {
               System.out.println("Error de conexión en el doPost INSERT O UPDATE USUARIO");
           }
                     request.getRequestDispatcher("adminUsuarios.jsp").forward(request, response);
                     return;
        }
        else
        {           
                //CASO DE LOGIN u.u
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
                    sesion.setAttribute("imagen_url", lista.get(0).getImagenUrl());
                    sesion.setAttribute("id", lista.get(0).getUsuarioId());

                    request.getRequestDispatcher("main.jsp").forward(request, response);

                }
                else
                {
                    request.setAttribute("mensaje", "LOGIN ERROR");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

                }catch(Exception ex)
                {
                    System.out.println("Error de conexión en el doPost LOGIN");

                }
         
        }
        
        
    }
    
    private String textoNumCuenta(String nro)
    {
        return nro.substring(0,3)+"-"+nro.substring(3,11)+"-0-"+nro.substring(12,14);
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
