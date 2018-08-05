package dao;

import JavaBeans.Producto;
import JavaBeans.ProductoMoneda;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Juan Luis Goldaracena
 */
public class ProductoDao {
    public static boolean registrarProducto(Producto p,ProductoMoneda lib,ProductoMoneda usd){
        try {
            String sql="{call sp_registrarproducto(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
            sentencia.setString(1, p.getNombre());
            sentencia.setFloat(2, p.getPrecio());
            sentencia.setFloat(3, p.getPrecionuevo());
            sentencia.setInt(4, p.getStock());
            sentencia.setBoolean(5, p.isNuevo());
            sentencia.setBoolean(6, p.isRecomendado());
            sentencia.setString(7, p.getDescripcion());
            sentencia.setBoolean(8, p.isVisible());
            sentencia.setInt(9, p.getCodigo_marca());
            sentencia.setInt(10, p.getCodigo_categoriasuperior());
            sentencia.setInt(11, p.getCodigo_subcategoria());
            sentencia.setString(12, p.getImg());
            
            sentencia.setString(13, lib.getMoneda());
            sentencia.setFloat(14, lib.getPrecio());
            sentencia.setFloat(15, lib.getPrecionuevo());
            
            sentencia.setString(16, usd.getMoneda());
            sentencia.setFloat(17, usd.getPrecio());
            sentencia.setFloat(18, usd.getPrecionuevo());
            
            return sentencia.executeUpdate()>0;
        } catch (SQLException ex) {
            return false;
        } 
    }
    
    // esta en desuso de momento, salvo el index jsp de cliente de fuera que 
    // lo usa en data, darle vida en el index de cliente listando recomendados 
    public static ArrayList<Producto> listarProductosRecomendados(String moneda){
        try {
            String sql="{call sp_listarRecomendados(?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
            sentencia.setString(1, moneda);

            ResultSet res= sentencia.executeQuery();
            ArrayList<Producto> lista=new ArrayList<>();
            while(res.next()){
                Producto p=new Producto();
                p.setWebid(res.getInt("webid"));
                p.setNombre(res.getString("nombre"));
                p.setImg(res.getString("img"));
                p.setStock(res.getInt("stock"));
                p.setNuevo(res.getBoolean("nuevo"));
                if(!moneda.equalsIgnoreCase("EUR")){
                    p.setPrecio(res.getFloat("precio2"));
                    p.setPrecionuevo(res.getFloat("precion2"));
                }else{
                    p.setPrecio(res.getFloat("precio"));
                    p.setPrecionuevo(res.getFloat("precionuevo"));
                }
                lista.add(p);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        } 
    }
    
//    SE BIFURCA EL PL Y HAY QUE BIFURCAR LOS DAOS Y METODOS - BUSCAR category 
    
//    public static ArrayList<Producto> listarProductosPorCategoria(String moneda, int cat){
//        try {
//            String sql="{call sp_listarPorCategoria(?,?)}";
//            Connection c=Conexion.conectar();
//            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
//            sentencia.setString(1, moneda);
//            sentencia.setInt(2, cat);
//
//            ResultSet res= sentencia.executeQuery();
//            ArrayList<Producto> lista=new ArrayList<>();
//            while(res.next()){
//                Producto p=new Producto();
//                p.setWebid(res.getInt("webid"));
//                p.setNombre(res.getString("nombre"));
//                p.setImg(res.getString("img"));
//                p.setStock(res.getInt("stock"));
//                p.setNuevo(res.getBoolean("nuevo"));
//                if(!moneda.equalsIgnoreCase("EUR")){
//                    p.setPrecio(res.getFloat("precio2"));
//                    p.setPrecionuevo(res.getFloat("precion2"));
//                }else{
//                    p.setPrecio(res.getFloat("precio"));
//                    p.setPrecionuevo(res.getFloat("precionuevo"));
//                }
//                lista.add(p);
//            }
//            return lista;
//        } catch (SQLException ex) {
//            return null;
//        } 
//    }
    
    public static ArrayList<Producto> listarPorCategoriaSuperior(String moneda, int catsup){
        try {
            String sql="{call sp_listarPorCategoriaSuperior(?,?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
            sentencia.setString(1, moneda);
            sentencia.setInt(2, catsup);

            ResultSet res= sentencia.executeQuery();
            ArrayList<Producto> lista=new ArrayList<>();
            while(res.next()){
                Producto p=new Producto();
                p.setWebid(res.getInt("webid"));
                p.setNombre(res.getString("nombre"));
                p.setImg(res.getString("img"));
                p.setStock(res.getInt("stock"));
                p.setNuevo(res.getBoolean("nuevo"));
                if(!moneda.equalsIgnoreCase("EUR")){
                    p.setPrecio(res.getFloat("precio2"));
                    p.setPrecionuevo(res.getFloat("precion2"));
                }else{
                    p.setPrecio(res.getFloat("precio"));
                    p.setPrecionuevo(res.getFloat("precionuevo"));
                }
                lista.add(p);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        } 
    }
    
    public static ArrayList<Producto> listarPorSubCategoria(String moneda, int subcat){
        try {
            String sql="{call sp_listarPorSubCategoria(?,?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
            sentencia.setString(1, moneda);
            sentencia.setInt(2, subcat);

            ResultSet res= sentencia.executeQuery();
            ArrayList<Producto> lista=new ArrayList<>();
            while(res.next()){
                Producto p=new Producto();
                p.setWebid(res.getInt("webid"));
                p.setNombre(res.getString("nombre"));
                p.setImg(res.getString("img"));
                p.setStock(res.getInt("stock"));
                p.setNuevo(res.getBoolean("nuevo"));
                if(!moneda.equalsIgnoreCase("EUR")){
                    p.setPrecio(res.getFloat("precio2"));
                    p.setPrecionuevo(res.getFloat("precion2"));
                }else{
                    p.setPrecio(res.getFloat("precio"));
                    p.setPrecionuevo(res.getFloat("precionuevo"));
                }
                lista.add(p);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        } 
    }

    public static ArrayList<Producto> listarProductosPorMarca(String moneda, int m){
        try {
            String sql="{call sp_listarPorMarca(?,?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
            sentencia.setString(1, moneda);
            sentencia.setInt(2, m);

            ResultSet res= sentencia.executeQuery();
            ArrayList<Producto> lista=new ArrayList<>();
            while(res.next()){
                Producto p=new Producto();
                p.setWebid(res.getInt("webid"));
                p.setNombre(res.getString("nombre"));
                p.setImg(res.getString("img"));
                p.setStock(res.getInt("stock"));
                p.setNuevo(res.getBoolean("nuevo"));
                if(!moneda.equalsIgnoreCase("EUR")){
                    p.setPrecio(res.getFloat("precio2"));
                    p.setPrecionuevo(res.getFloat("precion2"));
                }else{
                    p.setPrecio(res.getFloat("precio"));
                    p.setPrecionuevo(res.getFloat("precionuevo"));
                }
                lista.add(p);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        } 
    }
    
    public static Producto consultarProducto(String moneda, int webid){
        try {
            String sql="{call sp_consultarProducto(?,?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
            sentencia.setString(1, moneda);
            sentencia.setInt(2, webid);

            ResultSet res= sentencia.executeQuery();
            Producto p=null;
            if(res.next()){
                p=new Producto();
                p.setWebid(res.getInt("webid"));
                p.setNombre(res.getString("nombre"));
                p.setImg(res.getString("img"));
                p.setStock(res.getInt("stock"));
                p.setNuevo(res.getBoolean("nuevo"));
                if(!moneda.equalsIgnoreCase("EUR")){
                    p.setPrecio(res.getFloat("precio2"));
                    p.setPrecionuevo(res.getFloat("precion2"));
                }else{
                    p.setPrecio(res.getFloat("precio"));
                    p.setPrecionuevo(res.getFloat("precionuevo"));
                }
            }
            return p;
        } catch (SQLException ex) {
            return null;
        } 
    }
}
