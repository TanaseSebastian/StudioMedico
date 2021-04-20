<%@ page language="java" import="java.util.*,it.meucci.*"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%

	Utente c = (Utente)request.getAttribute("CLIENTE");
	DBManager db=new DBManager();

%>

<%@include file="header.jsp" %>
 <!-- Custom styles for this page -->
    <link href="app/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tabella Clienti</h1>
                    <p class="mb-4">Dettaglio del Cliente selezionato.</p>

                    <!-- DataTales Example -->
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Tabella</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="" method="post" id="formPrenotazioni">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <a class="btn btn-primary" href="gestutenti?cmd=viewall"><i class="fas fa-arrow-alt-circle-left"></i> Torna indietro</a>
                                <h2></h2>
                                    <thead>
                                        <tr>
                                        	<th>Codice Fiscale</th>
                                            <th>Nome</th>
                                            <th>Cognome</th>
                                            <th>Username</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                        </tr>
                                    </thead>
										<tbody>
										    <tr>
										 	<td><%=c.getCF()%></td>
										 	<td><%=c.getNOME()%></td>
										 	<td><%=c.getCOGNOME()%></td>
											<td><%=c.getUSERNAME()%></td>
											<td><%=c.getEMAIL()%></td>
										 	<td><%=c.getPHONE()%></td>
										 </tr>
										  </tbody>
                                </table>
                                <br>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
 <%@include file="footer.jsp" %>    
