package vacante.bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {
    private static Connection con;
    
    private static void conectar(){
        try{
            Class.forName("org.postgresql.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/vacante", "postgres" , "2302");
        }catch(SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException ex){
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static Connection getConexion(){
        if(con == null){
            conectar();
        }
        return con;
    }
    
    public static void cerrarConexion() throws SQLException{
        con.close();
    }
}
