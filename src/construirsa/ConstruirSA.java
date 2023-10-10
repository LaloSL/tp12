/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package construirsa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Asus
 */
public class ConstruirSA {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        try {
            //instancio un objeto de tipo driver
            Class.forName("org.mariadb.jdbc.Driver");
            try {
                
                //me conecto a la base
                //se genera un objeto de tipo connection
                Connection conexion= DriverManager.getConnection("jdbc:mariadb://localhost/TP10-ConstruirSA", "root","");
                //string1 (de izquierad a derecha: URL de donde se encuentra la BD
                //string2: Nombre de usuario de conexion a la BD (por defecto es root)
                //string3: contraseña (en este caso comillas vacias xq no hay contraseña)
                
                
          
            
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null,"Error al cargar Driver"+ex.getMessage());
            }
        } catch (ClassNotFoundException ex) {
            JOptionPane.showMessageDialog(null,"Error de conexion"+ex.getMessage());
        }
    }
    
}
