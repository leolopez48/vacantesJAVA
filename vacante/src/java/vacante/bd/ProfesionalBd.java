
package vacante.bd;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import vacante.modelo.Profesional;

/**
 *
 * @author Leonel
 */
public class ProfesionalBd {
    private List<Profesional> profesionales = new ArrayList<Profesional>();
    
    public void obtenerProfesionales(){
        profesionales.clear();
        try{
            String sentenciaSQL = "select * from profesional";
            Statement statement = Conexion.getConexion().createStatement();
            ResultSet resultado = statement.executeQuery(sentenciaSQL);
            while(resultado.next()){
                Profesional profesional = new Profesional();
                profesional.id_profesional = resultado.getInt("id_profesional");
                profesional.catalogo = resultado.getInt("catalogo");
                profesional.usuario=1;
            }
        }catch(SQLException ex){
            
        }
    }
    
    
}
