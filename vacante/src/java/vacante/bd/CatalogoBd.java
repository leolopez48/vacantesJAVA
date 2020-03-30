/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vacante.bd;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import vacante.modelo.Catalogo;

/**
 *
 * @author Leonel
 */
public class CatalogoBd {
    private List<Catalogo> catalogo = new ArrayList<Catalogo>();
    public void obtenerCatalogo() {
        getCatalogo().clear();
        try {
            String sentenciaSql = "SELECT * FROM catalogo";
            Statement statement = Conexion.getConexion().createStatement();
            ResultSet resultado = statement.executeQuery(sentenciaSql);
            while (resultado.next()) {Catalogo facultad = new Catalogo();
            facultad.id_catalogo = resultado.getInt("id_catalogo");
            facultad.profesion = resultado.getString("profesion");
            getCatalogo().add(facultad);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    
    public static Catalogo obtenerCatalogo(Integer id_catalogo){
        
            Catalogo catalogo = null;
        try {
            String sentenciaSql = "SELECT * FROM catalogo WHERE id_catalogo = ?";
            PreparedStatement statement = Conexion.getConexion().prepareStatement(sentenciaSql);
            statement.setInt(1, id_catalogo);
            ResultSet resultado = statement.executeQuery();
            while (resultado.next()) {
                catalogo = new Catalogo();
                catalogo.id_catalogo = resultado.getInt("id_catalogo");
                catalogo.profesion = resultado.getString("profesion");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return catalogo;
    }
    
    public List<Catalogo> getCatalogo() {
        return catalogo;
    }
    
    public void setCatalogo(List<Catalogo> catalogo) {
        this.catalogo = catalogo;
    }
}


