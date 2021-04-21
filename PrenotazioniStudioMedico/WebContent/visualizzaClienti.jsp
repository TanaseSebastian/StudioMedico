<%@ page language="java" import="java.util.*,it.meucci.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
  ArrayList<Utente> elenco;
  int i;
  Utente c;
%>
<%
String righe=(String)session.getAttribute("numeroRighe");
if(righe==null){
	righe="10";
}
%>
<%
	DBManager db=new DBManager();
	elenco = (ArrayList<Utente>)request.getAttribute("ELENCO_CLIENTI");
	String messaggio =(String)session.getAttribute("MESSAGGIO");
	if(messaggio==null) messaggio="";
%>
    
    
<%@include file="header.jsp" %>

 <!-- Custom styles for this page -->
    <link href="app/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    
                <!-- Begin Page Content -->
                <div class="container-fluid">
                
					<%=messaggio%>
					<%request.getSession().setAttribute("MESSAGGIO", ""); %>
		
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tabella Clienti</h1>
                    <p class="mb-4">In questa Tabella vi è una paronamica di tutti i clienti registati nel sistema,puoi visualizzare
                    dettagli,aggiornare i dati del cliente,eliminare un cliente.</p>

                    <!-- DataTales Example -->
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Tabella Clienti</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="" method="post" id="form">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" data-page-length=<%=righe%>>
                                 <%request.getSession().setAttribute("numeroRighe", "10"); %>
                                <h3>Una volta selezionati i clienti interessati è possibile eliminarli tramite l'apposita funzione:</h3>
                                 <button type="submit" class="col-md-3 btn btn-danger" onclick="if(confirm('Sei sicuro di voler eliminare definitivamente queste operazioni dal database?')){submitForm('gestutenti?cmd=elimina')}else{return false}">Elimina i clienti selezionati <i class="fas fa-trash-alt"></i></button>
                                    <thead>
                                    <div style="margin-bottom: 10px; margin-top: 20px;"">
                                     <button type="button" class="col-md-3 btn btn-outline-primary ml-10 " data-target="#chooseEntries" data-toggle="modal" data-id="visualizzaClienti.jsp" id="changeEntriesButton">Cambia numero righe</button>
                                  </div>
                                        <tr>
                                        	<th><input type="checkbox" id="checkboxAll"> Seleziona tutto</th>
                                         	<th>Dettagli</th>
                                            <th>Codice Fiscale</th>
                                            <th>Full Name</th>
                                            <th>Username</th>
                                            <th>Aggiorna</th>
                                           <!--  <th>Fattura</th> -->
                                        </tr>
                                    </thead>
										<tbody>
										  <% 										  
										  for(i=0;i<elenco.size();i++) 
										    {
											 c=(Utente)elenco.get(i);
										    
										 %>
										    <tr>
										    <td><input type="checkbox" class="check" name="check" value="<%=c.getCF()%>"></td>
										    <td><a href="gestutenti?cmd=visualizza&id=<%=c.getCF()%>"><i class="fas fa-info-circle"></i></a> </td>
										 	<td><%=c.getCF()%></td>
										 	<td><%=db.getFullName(c.getCF())%></td>
											<td><%= c.getUSERNAME()%></td>
										 	<td><a href="gestutenti?cmd=aggiorna&id=<%=c.getCF()%>"><i class="fas fa-user-edit"></i></a></td>
										 	<!-- <td><a class="btn btn-outline-success" href="#">Crea fattura per questa prenotazione <i class="fas fa-file-invoice"></i></a></td> -->
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
                
                
                
                
                
                
                