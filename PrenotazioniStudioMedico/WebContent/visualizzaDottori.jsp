<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>
<sql:setDataSource 
    var="datasource"
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc\:mysql\://localhost\:3306/STUDIOMEDICO?serverTimezone\=UTC"
     user="root" password=""/>
<html>
<head>
<title>Visualizza dottori</title>
</head>
<body>
<sql:query var="users" dataSource="${dataSource}">
select* from DOTTORI;
</sql:query>
<table border=1>
<c:forEach var="row" items="${users.rows}">
<tr>
<td><c:out value="${row.codDottore}" /></td>
<td><c:out value="${row.nome}" /></td>
<td><c:out value="${row.cognome}" /></td>
<td><c:out value="${row.phone}" /></td>
<td><c:out value="${row.email}" /></td>
<td><c:out value="${row.codDipartimento}" /></td>
</tr>
</c:forEach>
</table>
</body>
</html> 