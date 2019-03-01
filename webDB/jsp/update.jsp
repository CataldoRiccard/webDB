%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.,java.text."%>
<%@ page import= "java.text.SimpleDateFormat"%>  
<%@ page import= "java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Elenco giudici XFactor</title>
    </head>
    <body>
    
     
        <% 
            try{
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=zuliani.nicolo;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
            
            String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            String DataDiNascita = request.getParameter("DataDiNascita");
           
			
			
		
                   
                
                   
                   
                    
                    
                    // inserimento del nuovo giudice
                    String sql4 = "UPDATE giudice SET DataDiNascita = ? WHERE nome =? AND cognome = ?";
                    PreparedStatement prepStmt = connection.prepareStatement(sql4);
                    
                
                    prepStmt.setDate(1, java.sql.Date.valueOf(DataDiNascita));    
                    prepStmt.setString(2, nome);
                    prepStmt.setString(3, cognome);
                    
                    prepStmt.executeUpdate();
                    out.println("data cambiata");
			
			
			
			
    		
	        
	        
	        
	        connection.close();
      }catch(Exception e){
          out.println(e);
      }

        %>
    </body>
</html>