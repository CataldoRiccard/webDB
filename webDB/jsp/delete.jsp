<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete giudici XFactor</title>
    </head>
    <body>
     <% 
     if(request.getParameter("nome")==null || request.getParameter("nome").isEmpty() || request.getParameter("cognome")==null || request.getParameter("cognome").isEmpty()){
      %>
       <h1>Non hai inserito nessun giudice</h1>
       <p><a href=../html/home.html>Torna indietro</a>
      <%
        return;
      } 
      %>

      <h1>Giudice Eliminato</h1>
      <p><a href=../html/home.html>Torna alla Home</a>
        <% 
            try{
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			//Statement stmt = connection.createStatement();
			
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
            
			// ' or 1=1 --
			//String sql = "INSERT INTO Giudice VALUES ( ' " +  nome + " ')" ;
			
			//preparedStatement
			String sql = "DELETE FROM Giudice WHERE Nome = ? AND Cognome = ?";
			// + " AND Cognome= " + "'" + cognome + "'"
			
			PreparedStatement ps1 = connection.prepareStatement(sql);
			ps1.setString(1, nome);
			ps1.setString(2, cognome);

			ps1.executeUpdate();
	        
	        connection.close();
            } catch (Exception e) {
                out.println("Si è verificato un errore: " + e);
                out.println("<p><a href=/html/delete.html>Riprova</a></p>");     
            }

        %>
    </body>
</html>