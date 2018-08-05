package dao;

import JavaBeans.Marca;
import java.sql.CallableStatement;
import java.sql.Connection;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Juan Luis Goldaracena
 */
public class MarcaDao {
    public static ArrayList<Marca> listarTodoDeMarcas(){
        try {
            String sql="{call sp_listartododeMarca()}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=  (CallableStatement) c.prepareCall(sql);
            ResultSet resultado=sentencia.executeQuery();
            ArrayList<Marca> lista=new ArrayList<>();
            while (resultado.next()) {                
                Marca m=new Marca();
                m.setCodigo(resultado.getInt("codigo"));
                m.setNombre(resultado.getString("nombre"));
                lista.add(m);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        } 
    }
    
    public static int contarMarcas(int co){
        try {
            String sql="{call sp_contarProductosMarca(?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia= (CallableStatement) c.prepareCall(sql);
            sentencia.setInt(1, co);
            ResultSet resultado=sentencia.executeQuery();
            resultado.next();
           return resultado.getInt(1);
        } catch (SQLException ex) {
            return 0;
        } 
    }
    
    public static boolean registrarMarca(Marca m){
        try {
//            String SQL="INSERT INTO tbl_marca(nombre, visible) values(?,?)";
            String sql="{call sp_registrarMarca(?,?)}";
            Connection con = Conexion.conectar();
//            PreparedStatement st = con.prepareStatement (SQL);
            CallableStatement st= (CallableStatement) con.prepareCall(sql);
            st.setString(1, m.getNombre());
            st.setBoolean(2, m.isVisible());
            if(st.executeUpdate()>0) {
                return true;
        }else{
                return false;
                }
                
        } catch (SQLException ex) {
            return false;
        }
        
    }
    public static boolean eliminarMarca (Marca mar){
        try {
//            String SQL = "DELETE FROM tbl_marca WHERE nombre=?";
                String SQL = "{call sp_eliminarMarca(?)}";
            Connection con = Conexion.conectar();
//            PreparedStatement st = con.prepareStatement (SQL); 
            CallableStatement st= (CallableStatement) con.prepareCall(SQL);
            st.setString(1, mar.getNombre());
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
