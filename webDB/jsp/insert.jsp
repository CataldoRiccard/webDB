%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Elenco giudici XFactor</title>
    </head>
    <body>
     <% 
     String message = null;
     %>
        <h1> inserimento di un nuovo giudice</h1>
        <% 
            try{
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=zuliani.nicolo;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
            
            String Nome = request.getParameter("Nome");
            String Cognome = request.getParameter("Cognome");
            String luogo = request.getParameter("luogo");
            
            Statement stmt1 = connection.createStatement();
            String sqlId = "SELECT Max(Id) as MaxId from Giudice";
            ResultSet rs1 = stmt1.executeQuery(sqlId);
            rs1.next();
            
            int newId = rs1.getInt("MaxId") + 1;
            
            
            String sql = "INSERT INTO Giudice(ID, Nome, Cognome, LuogoDiNascita) values (?,?,?,?)";
            PreparedStatement prepStmt = connection.prepareStatement(sql);
            
            prepStmt.setInt(1, newId);   
            prepStmt.setString(2, Nome);
            prepStmt.setString(3, Cognome);
            prepStmt.setString(4, luogo);
			prepStmt.executeUpdate();
			message = "Giudice inserito<br>";
		     connection.close();
		}catch (Exception e){
		    message = "ERRORE";
		    }
	        
	
    

        %>
        <h1><%= message%>
    </body>
</html>