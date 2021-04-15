<%@ page language="java" import="it.meucci.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Utente u = (Utente)request.getAttribute("UTENTE");
     String utente = (String)request.getAttribute("tipoutente");
    System.out.println(utente);
	DBManager db=new DBManager();
	String messaggio =(String)session.getAttribute("MESSAGGIO");
	if(messaggio==null) messaggio="";
%>
<%@include file="header.jsp"%>

<!-- Custom styles for this page -->


<!-- Date -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/dark.css">



<!-- Begin Page Content -->
<div class="container-fluid">
	
		<%=messaggio%>
		<%request.getSession().setAttribute("MESSAGGIO", ""); %>
	
	
	
	<legend>Modifica dati dell' Utente</legend>
	<button type="submit" class="btn btn-outline-success" style="margin-left: 0%;" data-target="#resetPassword" data-toggle="modal">Modifica Password</button>
	
	<form class="form-horizontal" style="margin-top: 20px" method="post"
		action="gestutenti?cmd=modifica&tipoutente=<%=utente %>" id="form">
		<fieldset>
			<!-- Form Name -->
			<div class="row">

				<!-- Text input-->
				<div class="form-group col-md-6">
					<div>
						<input type="text" class="form-control" name="codiceFiscale" id="codiceFiscale"
							value="<%=u.getCF() %>" readonly="readonly">
						<span class="help-block">Codice Fiscale</span>
					</div>
				</div>
				
				<!-- Text input-->
			<div class="form-group col-md-6">
				<div>
					<input type="text" class="form-control" name="cognome" id="cognome"
						value=<%=u.getCOGNOME() %> readonly="readonly"> <span
						class="help-block">Cognome</span>
				</div>
			</div>
			</div>

		<div class="row">
		<div class="form-group col-md-6">
				<div>
					<input type="text" class="form-control" name="nome" id="nome"
						value=<%=u.getNOME() %> readonly="readonly"> <span
						class="help-block">Nome</span>
				</div>
			</div>
	<!-- Text input-->
	<div class="form-group col-md-6">
				<div>
					<input type="text" class="form-control" name="username" id="username"
						value=<%=u.getUSERNAME() %>> <span
						class="help-block">Username</span>
				</div>
			</div>
		</div>
		
		<div class="row">
	<div class="form-group col-md-6">
				<div>
					<input type="text" class="form-control" name="email" id="email"
						value=<%=u.getEMAIL() %>> <span
						class="help-block">Email</span>
				</div>
			</div>
			
				<div class="form-group col-md-6">
				<div>
					<input type="text" class="form-control" name="phone" id="phone"
						value=<%=u.getPHONE() %>> <span
						class="help-block">Phone</span>
				</div>
			</div>
			</div>
			


			
			
	<div class="text-center" style="margin-top: 30px;">
	<button type="reset" class="btn btn-danger" id="elimina" name="elimina">Annulla</button>
		<button type="submit" class="btn btn-primary"> <!--onclick="if(confirm('Sei sicuro di voler modificare la password di questo cliente ?')){submitForm('gestutenti?cmd=modifica')}else{ return false }" -->Modifica
			utente</button>
	</div>
	</fieldset>
	</form>
	 <!-- modulo per la modifica della password cliente-->

</div>
<!-- /.container-fluid -->
			 <div class="modal" id="resetPassword" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4>
                Modifica Password dell'utente interessato.
              </h4>
          </div>
          <div class="modal-body">
          <form action="gestutenti?cmd=resetPassword" method="post" id="form2">
            <div class="col-md-12 form-group">
				  <div class="form-group mb-3">
				  <input type="text" class="form-control" name="codiceFiscale" id="codiceFiscale"
							value="<%=u.getCF() %>" hidden="hidden" readonly="readonly">
							<input type="text" class="form-control" hidden="hidden" name="email" id="email"
						value=<%=u.getEMAIL() %>>
		            	<label class="label" for="password">Password</label>
		              <input type="password" name="password" id="password" class="form-control" placeholder="Inserisci Password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Deve contenere almeno un numero,una lettera maiuscola e una lettera minuscola, e deve essere composta da almeno 8 o più caratteri" required>
		            </div>
		            <div class="form-group mb-3">
		            	<label class="label" for="password">Conferma Password</label>
		              <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Conferma Password" required>
		            </div>
            </div>
          <div class="text-center" style="margin-top: 30px;">
           <button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
          <button type="submit" class="btn btn-primary"> <!-- onclick="if(confirm('Sei sicuro di voler modificare la password di questo cliente ?')){submitForm('gestutenti?cmd=resetPassword')}else{ return false }"-->
          Modifica <i class="fa fa-arrow-right" aria-hidden="true"></i></button>
          </div>
        </form>
          </div>
      </div>
  </div>
  </div>
			
			

<%@include file="footer.jsp"%>
