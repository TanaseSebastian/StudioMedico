<%@ page language="java" import="java.util.*,it.meucci.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
String righe=(String)session.getAttribute("numeroRighe");
if(righe==null){
	righe="10";
}
%>
<%@include file="header.jsp"%>

<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/STUDIOMEDICO?serverTimezone=UTC"
		user="root" password="" />

	<sql:query var="dottori" dataSource="${myDS}">
        SELECT * FROM DOTTORI;
    </sql:query>

<!-- Custom styles for this page -->
<link href="app/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">


<!-- Begin Page Content -->
<div class="container-fluid">

	<%-- <%=messaggio%>
	<%request.getSession().setAttribute("MESSAGGIO", ""); %> --%>

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Tabella Dottori</h1>
	<p class="mb-4">In questa Tabella vi è una paronamica di tutti i
		Dottori registati nel sistema,puoi aggiornare i
		dati del dottore ed eliminare un dottore.</p>

	<!-- DataTales Example -->

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Tabella Dottori</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<form action="" method="post" id="form">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" data-page-length=<%=righe%>>
					 <%request.getSession().setAttribute("numeroRighe", "10"); %>
						<h3>Una volta selezionati i clienti interessati è possibile
							eliminarli tramite l'apposita funzione:</h3>
							<button type="submit" class="col-md-3 btn btn-danger"
							onclick="if(confirm('Sei sicuro di voler eliminare definitivamente queste operazioni dal database?')){submitForm('gestutenti?cmd=elimina')}else{return false}">
							Elimina i clienti selezionati <i class="fas fa-trash-alt"></i>
						</button>
						<thead>
						<div style="margin-bottom: 10px; margin-top: 20px;"">
                                     <button type="button" class="col-md-1 btn btn-outline-primary ml-10 " data-target="#chooseEntries" data-toggle="modal" data-id="visualizzaDottori.jsp" id="changeEntriesButton">Cambia numero righe</button>
						</div>
							<tr>
								<th><input type="checkbox" id="checkboxAll">Seleziona tutto</th>
									<td>codDottore</td>
									<td>nome</td>
									<td>cognome</td>
									<td>phone</td>
									<td>email</td>
									<td>codDipartimento</td>
							</tr>
						</thead>
						<tbody>
				<c:forEach var="row" items="${dottori.rows}">
					<tr>
						<td><input type="checkbox" class="check" name="check" <%-- value= <c:out value="${row.codDottore}" --%>/></td>
						<td><c:out value="${row.codDottore}" /></td>
						<td><c:out value="${row.nome}" /></td>
						<td><c:out value="${row.cognome}" /></td>
						<td><c:out value="${row.phone}" /></td>
						<td><c:out value="${row.email}" /></td>
						<td><c:out value="${row.codDipartimento}" /></td>
					</tr>
				</c:forEach>
			</tbody>
					</table>
					<br>
				</form>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->


<%@include file="footer.jsp"%>
