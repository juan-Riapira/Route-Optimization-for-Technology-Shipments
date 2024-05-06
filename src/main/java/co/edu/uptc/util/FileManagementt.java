package co.edu.uptc.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.lang.reflect.Type;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;

public class FileManagementt {
    private String rutaArchivo;

    public void escribirArchivoGson(List<?> datos, String nombreArchivo, String ruta) {
        rutaArchivo = (ruta + "/" + nombreArchivo);
        try (FileWriter writer = new FileWriter(rutaArchivo)) {
            Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Crear un objeto Gson con formato bonito
            gson.toJson(datos, writer); // Intentar serializar los datos a JSON y escribirlos en el archivo
        } catch (IOException e) {
            e.printStackTrace(); // Manejar errores de E/S
        }
    }
    public <T> List<T> leerArchivoGson(Class<T> claseObjeto) {
        // Lista para almacenar los objetos deserializados
        List<T> objetos = new ArrayList<>();
    
        // Bloque try-with-resources para abrir y leer el archivo
        try (BufferedReader br = new BufferedReader(new FileReader(rutaArchivo))) {
            // Objeto Gson para deserializar el JSON
            Gson gson = new Gson();
            
            // StringBuilder para construir el JSON completo a partir de las líneas del archivo
            StringBuilder jsonBuilder = new StringBuilder();
            
            // Variable para almacenar cada línea del archivo
            String linea;
            
            // Leer el archivo línea por línea y construir el JSON completo
            while ((linea = br.readLine()) != null) {
                jsonBuilder.append(linea); // Agregar la línea al StringBuilder
            }
            
            // Convertir el StringBuilder a una cadena y eliminar los espacios en blanco al principio y al final
            String json = jsonBuilder.toString().trim();
    
            // Verificar si el JSON comienza y termina con "{}" para determinar si es un objeto JSON
            if (json.startsWith("{") && json.endsWith("}")) {
                // Si es un objeto JSON, deserializarlo en un objeto de la clase especificada
                T objeto = gson.fromJson(json, claseObjeto);
                // Agregar el objeto a la lista de objetos
                objetos.add(objeto);
            } else if (json.startsWith("[") && json.endsWith("]")) {
                // Si es un array JSON, obtener el tipo de lista correspondiente
                Type tipoLista = TypeToken.getParameterized(List.class, claseObjeto).getType();
                // Deserializar el JSON en una lista de objetos
                objetos = gson.fromJson(json, tipoLista);
            } else {
                // Si el JSON no es ni un objeto ni un array válido, imprimir un mensaje de advertencia
                System.out.println("El archivo no contiene un objeto JSON ni un array JSON válido.");
            }
    
        } catch (IOException e) {
            // Manejar errores de lectura de archivo si es necesario
            e.printStackTrace();
        } catch (JsonSyntaxException e) {
            // Manejar errores de sintaxis JSON si es necesario
            e.printStackTrace();
        }
    
        // Devolver la lista de objetos deserializados
        return objetos;
    }
    
}