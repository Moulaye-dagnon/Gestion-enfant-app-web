package com.denkolochi.configuration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
public class ConnexionDB {
	
		private static  Connection connexionDBInstance  ;
		private ConnexionDB() {}
		

	    public static Connection getConexion() {
	    	if(connexionDBInstance == null ) {
	    		 try {
	 	            Connection connexionDBInstance = DriverManager.getConnection(DbConstConfig.url  ,DbConstConfig.utilisateur ,DbConstConfig.mot_de_passe);
	 	            System.out.println("Connecté à la base de données !");
	 	            return connexionDBInstance;
	 	        } catch (Exception e) {
	 	            System.out.println("Erreur de connexion : " + e.getMessage());
	 	            return null;
	 	        }
	    	}
	    	return connexionDBInstance; 
	       
	    }
	    
	
	    
	    public static void main(String[] args) {
	        try {
	            Connection con = ConnexionDB.getConexion();
	            if (con != null) {
	                Statement pont = con.createStatement();
	                String sql = "INSERT INTO capacites VALUES (NULL, 'Emotionnelle')";
	                int lignesAffectees = pont.executeUpdate(sql);

	                System.out.println("Insertion réussie, lignes modifiées : " + lignesAffectees);
	                pont.close();
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

}
