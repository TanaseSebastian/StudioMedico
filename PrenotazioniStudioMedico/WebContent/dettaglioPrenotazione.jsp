<%@ page language="java" import="java.util.*,it.meucci.*"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%

	Prenotazione p = (Prenotazione)request.getAttribute("PRENOTAZIONE");
	DBManager db=new DBManager();

%>

<%@include file="header.jsp" %>
 <!-- Custom styles for this page -->
    <link href="app/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tabella Prenotazioni</h1>
                    <p class="mb-4">Tabella che mostra il dettaglio della pronotazione selezionata.</p>

                    <!-- DataTales Example -->
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Tabella</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="" method="post" id="formPrenotazioni">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <a class="btn btn-primary" href="gestprenotazioni?cmd=viewall"><i class="fas fa-arrow-alt-circle-left"></i> Torna indietro</a>
                                <h2></h2>
                                    <thead>
                                        <tr>
                                        	<th>Stato della Prestazione</th>
                                            <th>Codice della Prenotazione</th>
                                            <th>Cognome e Nome Cliente</th>
                                            <th>Codice Fiscale del Cliente</th>
                                            <th>Tipo Prestazione</th>
                                            <th>Codice Identificativo della Prestazione</th>
                                            <th>Data e ora</th>
                                             <th>Data in Formato Italiano</th>
                                            <th>Cognome e Nome del Dottore che effettua la prestazione</th>
                                            <th>Codice identificatico del Dottore</th>
                                            <th>Commento Opzionale inserito dall'utente durante la creazione dell'appuntamento</th>
                                        </tr>
                                    </thead>
										<tbody>
										    <tr>
										    <%if(p.getStato().equals("In attesa")){ %>
										    <td class="btn-primary"><%=p.getStato()%> <i class="fas fa-user-clock"></i> </td>
										    <%}else if(p.getStato().equals("Non eseguita")){ %>
										    <td class="btn-warning"><%=p.getStato()%> <i class="fas fa-times-circle"></i> </td>
										    <%}else if(p.getStato().equals("Eseguita")){%>
										    <td class="btn-success"><%=p.getStato()%> <i class="far fa-calendar-check"></i> </td>
										    <%}%>
										 	<td><%=p.getCodPrenotazione()%></td>
										 	<td><%=db.getFullName(p.getCodFisc())%></td>
										 	<td><%=p.getCodFisc()%></td>
											<td><%= db.getPrestazioneName(String.valueOf(p.getCodPrestazione()))%></td>
											<td><%= p.getCodPrestazione()%></td>
										 	<td><%=p.getDateTime()%></td>
											<td><%=db.getItalianDate(p.getDateTime())%></td>
										 	<td><%= db.getDoctorName(String.valueOf(p.getCodDottore())) %></td>
										 	<td><%= p.getCodDottore() %></td>
										 	<%if(p.getCommento().equals("")){ %>
										    <td>Nessun Commento lasciato dal cliente</td>
										    <%}else{ %>
										 	<td><%="'"+p.getCommento()+"'" %></td>
										  <%}%>
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
