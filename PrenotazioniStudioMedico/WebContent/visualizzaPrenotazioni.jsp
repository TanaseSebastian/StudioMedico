<%@ page language="java" import="java.util.*,it.meucci.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="header.jsp" %>   
<%!
  ArrayList<Prenotazione> elenco;
  int i;
  Prenotazione p;
%>
<%
String righe=(String)session.getAttribute("numeroRighe");
if(righe==null){
	righe="10";
}
%>
<%  
	DBManager db=new DBManager();
	elenco = (ArrayList<Prenotazione>)request.getAttribute("ELENCO_PRENOTAZIONI");
%>
    
    


 <!-- Custom styles for this page -->
    <link href="app/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    
                <!-- Begin Page Content -->
                <div class="container-fluid">
				<%=messaggio%>
				<%request.getSession().setAttribute("MESSAGGIO", ""); %>
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tabella Prenotazioni</h1>
                    <p class="mb-4">In questa Tabella vi è una paronamica di tutte le prenotazioni registate nel sistema,puoi visualizzare
                    dettagli,modificare l'orario della prenotazione tramite l'apposito pulsante 'Aggiorna',eliminare le prenotazioni e cambiare lo stato.</p>

                    <!-- DataTales Example -->
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Tabella Prenotazioni</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="" method="post" id="form">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" data-page-length=<%=righe%>>
                                <%request.getSession().setAttribute("numeroRighe", "10"); %>
                                <h3>Una volta selezionate le Prenotazioni interessate è possibile utilizzare le seguenti funzioni:</h3>
                              <!--   <div style="margin-bottom: 30px;"> -->
								<button type="submit" class="col-md-3 btn btn-success" onclick="if(confirm('Sei sicuro di voler modificare lo stato di queste operazioni in: Eseguita ?')){submitForm('gestprenotazioni?cmd=eseguita')}else{submitForm('gestprenotazioni?cmd=view')}">Cambia stato delle Prenotazioni selezionate in:<strong>Eseguite </strong>  <i class="far fa-calendar-check"></i></button>
                                 <button type="submit" class="col-md-3 btn btn-warning" onclick="if(confirm('Sei sicuro di voler modificare lo stato di queste operazioni in: Non eseguita ?')){submitForm('gestprenotazioni?cmd=noneseguita')}else{submitForm('gestprenotazioni?cmd=view')}">Cambia stato delle Prenotazioni selezionate in: <strong>Non Eseguite </strong> <i class="fas fa-times-circle"></i></button>
                                 <button type="submit" class="col-md-3 btn btn-primary" onclick="if(confirm('Sei sicuro di voler modificare lo stato di queste operazioni in: In attesa ?')){submitForm('gestprenotazioni?cmd=attesa')}else{submitForm('gestprenotazioni?cmd=view')}">Cambia stato delle Prenotazioni selezionate in: <strong>Attesa </strong> <i class="fas fa-user-clock"></i></button>
                                 <button type="submit" class="col-md-3 btn btn-danger" onclick="if(confirm('Sei sicuro di voler eliminare definitivamente queste operazioni dal database?')){submitForm('gestprenotazioni?cmd=elimina')}else{submitForm('gestprenotazioni?cmd=view')}">Elimina le Prenotazioni selezionate <i class="fas fa-trash-alt"></i></button>
                                    <thead>
                                     <div style="margin-bottom: 10px; margin-top: 20px;"">
                                     <button type="button" class="col-md-3 btn btn-outline-primary ml-10 " data-target="#chooseEntries" data-toggle="modal" data-id="visualizzaPrenotazioni.jsp" id="changeEntriesButton">Cambia numero righe</button>
                                  </div>
                                    
                                        <tr>
                                        	<th><input type="checkbox" id="checkboxAll"> Seleziona tutto</th>
                                        	<th>Stato</th>
                                         	<th>Dettagli</th>
                                            <th>Codice Prenotazione</th>
                                            <th>Cliente</th>
                                            <th>Tipo Prestazione</th>
                                            <th>Data e ora</th>
                                            <th>Dottore</th>
                                            <th>Aggiorna</th>
                                            <th>Fattura</th> 
                                        </tr>
                                    </thead>
										<tbody>
										  <% 										  
										  for(i=0;i<elenco.size();i++) 
										    {
											 p=(Prenotazione)elenco.get(i);
										    
										 %>
										    <tr>
										    <td><input type="checkbox" class="check" name="check" value="<%=p.getCodPrenotazione()%>"></td>
										    <%if(p.getStato().equals("In attesa")){ %>
										    <td class="btn-primary"><%=p.getStato()%> <i class="fas fa-user-clock"></i> </td>
										    <%}else if(p.getStato().equals("Non eseguita")){ %>
										    <td class="btn-warning"><%=p.getStato()%> <i class="fas fa-times-circle"></i> </td>
										    <%}else if(p.getStato().equals("Eseguita")){%>
										    <td class="btn-success"><%=p.getStato()%> <i class="far fa-calendar-check"></i> </td>
										    <%}%>
										    <td><a href="gestprenotazioni?cmd=visualizza&id=<%=p.getCodPrenotazione()%>"><i class="fas fa-info-circle"></i></a> </td>
										 	<td><%=p.getCodPrenotazione()%></td>
										 	<td><%=db.getFullName(p.getCodFisc())%></td>
											<td><%= db.getPrestazioneName(String.valueOf(p.getCodPrestazione()))%></td>
										 	<td><%=p.getDateTime()%></td>
										 	<td><%= db.getDoctorName(String.valueOf(p.getCodDottore())) %></td>
										 	<td><a href="gestprenotazioni?cmd=aggiorna&id=<%=p.getCodPrenotazione()%>"><i class="fas fa-user-edit"></i></a></td>
										 	<%if(p.getStato().equals("Eseguita")){ %>
										 	<td><a class="btn btn-outline-success" href="gestprenotazioni?cmd=fattura&id=<%=p.getCodPrenotazione()%>">Crea fattura per questa prenotazione <i class="fas fa-file-invoice"></i></a></td>
											<%}else{%>
											<td><a class="btn btn-outline-warning">Eseguire prima la prenotazione<i class="fas fa-file-invoice"></i></a></td>
											<%}%>
										 </tr>
										 
										  <%
										     }
										 %>
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
                
                
                
                
                
                
                