package dao;

import JavaBeans.CategoriaSuperior;
import JavaBeans.SubCategoria;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 *
 * @author Juan Luis Goldaracena
 */
public class CategoriaDao {
    
    // LO USA EL ASIDE, EL REGISTRO DE PRODUCTOS Y EL REGISTRO DE SUBCATEGORIAS
    public static ArrayList<CategoriaSuperior> listarCategoriaSuperior(){
        try {
            String sql="{call sp_listarCategoriaSuperior()}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
            ResultSet resultado=sentencia.executeQuery();
            ArrayList<CategoriaSuperior> lista=new ArrayList<>();
            while (resultado.next()) {                
                CategoriaSuperior cat=new CategoriaSuperior();
                cat.setCodigo(resultado.getInt("codigo"));
                cat.setNombre(resultado.getString("nombre"));
                lista.add(cat);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        } 
    }
    
    // SOLO LO USA EL ASIDE PARA EL REGISTRO DE PRODUCTOS QUEDA EN DESUSO HASTA 
    // SOLUCIONAR COMO HACER EL REGISTRO CON LAS SUBCATS QUE RECIBAN EL CODIGO 
    // CATSUP, TENGO LOS JSPS PREPARADOS PERO NO LISTA LAS SUBCATEGORIAS
    public static ArrayList<SubCategoria> listarSubCategorias(int catSuperior){
        try {
            String sql="{call sp_listarSubCategoria(?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
            sentencia.setInt(1, catSuperior);
            ResultSet resultado=sentencia.executeQuery();
            ArrayList<SubCategoria> lista=new ArrayList<>();
            while (resultado.next()) {                
                SubCategoria cat=new SubCategoria();
                cat.setCodigo(resultado.getInt("codigo"));
                cat.setNombre(resultado.getString("nombre"));
                lista.add(cat);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        } 
    }
    
    // HAGO ESTE DE MOMENTO QUE LISTA TODAS SIN CONDICIONES EN EL REGISTRO DE PRODUCTOS
    public static ArrayList<SubCategoria> listarTodasSubCategorias(){
        try {
            String sql="{call sp_listarTodasSubCategorias()}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
            ResultSet resultado=sentencia.executeQuery();
            ArrayList<SubCategoria> lista=new ArrayList<>();
            while (resultado.next()) {                
                SubCategoria cat=new SubCategoria();
                cat.setCodigo(resultado.getInt("codigo"));
                cat.setNombre(resultado.getString("nombre"));
                lista.add(cat);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        } 
    }
    
//    LO COMENTO PORQUE SE USA PARA LISTAR TODAS LAS CATEGORIAS Y SUBCATEGORIAS MEZCLADA 
//    A LA HORA DE REGISTRAR UN PRODUCTO Y PREFIERO SEPARARLO EN CATEGORIAS Y SUBCATEGORIAS
//    public static ArrayList<Categoria> listarTodoDeCategorias(){
//        try {
//            String sql="{call sp_listartododeCategoria()}";
//            Connection c=Conexion.conectar();
//            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
//            ResultSet resultado=sentencia.executeQuery();
//            ArrayList<Categoria> lista=new ArrayList<>();
//            while (resultado.next()) {                
//                SubCategoria cat=new SubCategoria();
//                cat.setCodigo(resultado.getInt("codigo"));
//                cat.setNombre(resultado.getString("nombre"));
//                lista.add(cat);
//            }
//            return lista;
//        } catch (SQLException ex) {
//            return null;
//        } 
//    }
    
    
    // LO USA EL ASIDE PARA PINTAR LAS SUBCATEGORIAS Y EFECTOS FA FA PLUS Y ACORDIAN DEL MENU IZQUIERDO
    public static boolean esSuperior(int cat){
        try {
            String sql="{call sp_contarSubCategorias(?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
            sentencia.setInt(1, cat);
            ResultSet resultado=sentencia.executeQuery();
           
            resultado.next();                
               
            return resultado.getInt("cantidad")>0;
        } catch (SQLException ex) {
            return false;
        } 
    }
    
    /* A CONTINUACION LOS 4 METODOS PARA REGISTRAR Y ELIMINAR CATEGORIAS Y SUBCATEGORIAS */
    
    // REGISTRAR CATEGORIA SUPERIOR
    public static boolean registrarCategoriaSuperior(CategoriaSuperior c){
        try {
            String SQL="{call sp_registrarCategoriaSuperior(?,?)}";
            Connection con = Conexion.conectar();
            CallableStatement st=  (CallableStatement) con.prepareCall(SQL);
            st.setString(1, c.getNombre());
            st.setBoolean(2, c.isVisible());
            if(st.executeUpdate()>0) {
                return true;
        }else{
                return false;
                }
                
        } catch (SQLException ex) {
            return false;
        }
    }
    
    // ELIMINAR CATEGORIA SUPERIOR
    public static boolean eliminarCategoriaSuperior (CategoriaSuperior cat){
        try {
            String SQL = "{call sp_eliminarCategoriaSuperior(?)}";
            Connection con = Conexion.conectar();
            CallableStatement st= (CallableStatement) con.prepareCall(SQL);
            st.setString(1, cat.getNombre());
            if(st.executeUpdate()>0){
                
                return true;
            }else{
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }
        
    // REGISTRAR SUBCATEGORIA
    public static boolean registrarSubCategoria(SubCategoria c){
        try {
//            String SQL="INSERT INTO tbl_categoria (nombre, visible, categoria_superior) VALUES (?,?,?);";
            String SQL="{call sp_registrarSubCategoria(?,?,?)}";
            Connection con = Conexion.conectar();
//            PreparedStatement st = con.prepareStatement(SQL);
            CallableStatement st =  (CallableStatement) con.prepareCall(SQL);
            st.setString(1, c.getNombre());
            st.setBoolean(2, c.isVisible());
            st.setInt(3, c.getCategoria_superior());
            if(st.executeUpdate()>0) {
                return true;
        }else{
                return false;
                }
                
        } catch (SQLException ex) {
            return false;
        }  
    }
    
    // ELIMINAR SUBCATEGORIA
    public static boolean eliminarSubCategoria (SubCategoria cat){
        try {
//            String SQL = "DELETE FROM tbl_marca WHERE nombre=?";
            String SQL = "{call sp_eliminarSubCategoria(?,?,?)}";
            Connection con = Conexion.conectar();
//            PreparedStatement st = con.prepareStatement (SQL);
//            st.setString(1, cat.getNombre());
            CallableStatement st= (CallableStatement) con.prepareCall(SQL);
            st.setString(1, cat.getNombre());
            st.setBoolean(2, cat.isVisible());
            st.setInt(3, cat.getCategoria_superior());
            if(st.executeUpdate()>0){
                
                return true;
            }else{
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }
}