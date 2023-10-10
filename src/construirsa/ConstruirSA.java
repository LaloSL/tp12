/*
 Grupo 5 - Laboratorio de Programación 1 - Comisión 1 - TP 12
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

public class ConstruirSA {

    public static void main(String[] args) {

        try {
            //instancio un objeto de tipo driver
            Class.forName("org.mariadb.jdbc.Driver");
            try {

                //me conecto a la base
                //se genera un objeto de tipo connection
                Connection conexion = DriverManager.getConnection("jdbc:mariadb://localhost/TP10-ConstruirSA", "root", "");
                //string1 (de izquierad a derecha: URL de donde se encuentra la BD
                //string2: Nombre de usuario de conexion a la BD (por defecto es root)
                //string3: contraseña (en este caso comillas vacias xq no hay contraseña)

                //Ejercicio 3:
                String sql1 = "INSERT INTO empleado(id_empleado, dni, apellido, nombre, acceso, estado)"
                        + "VALUES (11, 123456, 'Torre', 'Victor', 1, 1)";
                String sql2 = "INSERT INTO empleado(id_empleado, dni, apellido, nombre, acceso, estado)"
                        + "VALUES (12, 654321, 'Gomez', 'Juana', 2, 0)";
                String sql3 = "INSERT INTO empleado(id_empleado, dni, apellido, nombre, acceso, estado)"
                        + "VALUES (13, 7890, 'Sosa', 'Pedro', 1, 1)";

                PreparedStatement ps1 = conexion.prepareStatement(sql1);
                ps1.executeUpdate();

                PreparedStatement ps2 = conexion.prepareStatement(sql2);
                ps2.executeUpdate();

                PreparedStatement ps3 = conexion.prepareStatement(sql3);
                ps3.executeUpdate();

                /*
                    Ejercicio 4 */
                String sql4 = "INSERT INTO herramienta(id_herramienta, nombre, descripcion, stock, estado)"
                        + "VALUES (31, 'Pinza', 'Pinza de tipo punta', 15, 1)";
                String sql5 = "INSERT INTO herramienta(id_herramienta, nombre, descripcion, stock, estado)"
                        + "VALUES (32, 'Serrucho', 'Serrucho de Carpintero', 7, 0)";

                PreparedStatement ps4 = conexion.prepareStatement(sql4);
                ps1.executeUpdate();

                PreparedStatement ps5 = conexion.prepareStatement(sql5);
                ps2.executeUpdate();

                //sentencia SELECT
                String sql = "SELECT * FROM herramienta WHERE stock>10";
                //para enviarla
                PreparedStatement ps = conexion.prepareStatement(sql);
                //ahora ejecuto esa sentencia
                //me devuelve un valor entero
                ResultSet resultado = ps.executeQuery();
                //recorro el resulset
                //pregunto si ahy fila y si hay que me muestre los datos
                while (resultado.next()) {
                    //entro al while si hay una fila y el puntero se para en esa fila
                    //obtengo el entero de idempleado
                    System.out.println("ID " + resultado.getInt("id_herramienta"));
                    System.out.println("Nombre " + resultado.getString("nombre"));
                    System.out.println("Descripcion " + resultado.getString("descripcion"));
                    System.out.println("Stock " + resultado.getInt("stock"));
                    System.out.println("Esatdo " + resultado.getBoolean("estado"));
                }

                // Ejercicio 6:
                String sql6 = "DELETE FROM empleado WHERE id_empleado=11";

                PreparedStatement ps6 = conexion.prepareStatement(sql6);
                ps6.executeUpdate();

            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Error al cargar Driver" + ex.getMessage());
            }
        } catch (ClassNotFoundException ex) {
            JOptionPane.showMessageDialog(null, "Error de conexion" + ex.getMessage());
        }
    }

}
