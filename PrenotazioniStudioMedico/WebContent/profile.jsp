<%@ page language="java" import="java.util.*,it.meucci.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="header.jsp"%> 
   <div class="container-fluid">
   
   		<%=messaggio%>
		<%request.getSession().setAttribute("MESSAGGIO", ""); %>
   			
			<div class="border border-primary rounded" style="padding: 18px;float: left; margin-right: 60px;">
                  <div class="d-flex flex-column align-items-center text-center">
 					
                    <img src="<%=srcImmagineProfilo %>" alt="Admin" class="rounded-circle mb-3" width="150" id="avatarImg" name="avatarImg">
                    <h4><%=user.getCOGNOME()+" "+user.getNOME() %></h4>
                      <p class="text-secondary mb-1">Amministratore presso Medilab</p>
                      <p class="text-muted font-size-sm">Piazza S.Domenico, Casarano, IT</p>
                      </div>
                      <form action="gestutenti?cmd=adminUpdateImage" method="POST"  class="signin-form " enctype="multipart/form-data">
                      <input type="text" class="form-control" name="codiceFiscale" id="codiceFiscale"
							value="<%=user.getCF() %>" readonly="readonly" hidden="hidden">
                    <label for="avatarNewImg" class="btn btn-primary" style="margin-top: 10px;" onclick="if(confirm('Attenzione,per poter salvare le modifiche successivamente cliccare su Aggiorna foto profilo')){}else{ return false }">Cambia foto profilo</label>
   					<input type="file" id="avatarNewImg" name="avatarNewImg"
       				accept="image/png, image/jpeg" multiple="false" hidden="hidden">
       				<button type="submit" class="btn btn-outline-primary">Aggiorna foto profilo</button>
       				</form>
   					</div>
   	<form action="gestutenti?cmd=adminUpdate" method="POST"  class="signin-form ">
		<fieldset>
			<div class="border border-primary rounded" style="padding: 20px;">
			 	<button type="button" class="btn btn-outline-success" style="margin-left: 0%;" data-target="#resetPassword" data-toggle="modal">Modifica Password</button>
			 <h4 class="text-center">Dati personali</h4>
			<!-- Form Name -->
			<div class="row">

				<!-- Text input-->
				<div class="form-group col-md-6">
					<div>
						<input type="text" class="form-control" name="codiceFiscale" id="codiceFiscale"
							value="<%=user.getCF() %>" readonly="readonly">
						<span class="help-block">Codice Fiscale</span>
					</div>
				</div>
				
				<!-- Text input-->
			<div class="form-group col-md-6">
				<div>
					<input type="text" class="form-control" name="cognome" id="cognome"
						value=<%=user.getCOGNOME() %> readonly="readonly"> <span
						class="help-block">Cognome</span>
				</div>
			</div>
			</div>

		<div class="row">
		<div class="form-group col-md-6">
				<div>
					<input type="text" class="form-control" name="nome" id="nome"
						value=<%=user.getNOME() %> readonly="readonly"> <span
						class="help-block">Nome</span>
				</div>
			</div>
	<!-- Text input-->
	<div class="form-group col-md-6">
				<div>
					<input type="text" class="form-control" name="username" id="username"
						value=<%=user.getUSERNAME() %>> <span
						class="help-block">Username</span>
				</div>
			</div>
		</div>
		
		<div class="row">
	<div class="form-group col-md-6">
				<div>
					<input type="text" class="form-control" name="email" id="email"
						value=<%=user.getEMAIL() %>> <span
						class="help-block">Email</span>
				</div>
			</div>
			
				<div class="form-group col-md-6">
				<div>
					<input type="text" class="form-control" name="phone" id="phone"
						value=<%=user.getPHONE() %>> <span
						class="help-block">Phone</span>
				</div>
			</div>
			</div>
	<div class="text-center" style="margin-top: 30px;">
	<button type="reset" class="btn btn-danger" id="elimina" name="elimina">Annulla</button>
		<button type="submit" class="btn btn-primary"onclick="if(confirm('Attenzione,una volta aggiornate le modfiche sarai reindirizzato')){}else{ return false }">Aggiorna</button>
	</div>
	</div>
	</fieldset>
	</form>
</div>
<!-- modulo per cambia password -->
			 <div class="modal" id="resetPassword" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4>
                Modifica Password.
              </h4>
          </div>
          <div class="modal-body">
          <form action="gestutenti?cmd=adminresetPassword" method="post" id="form2">
            <div class="col-md-12 form-group">
				  <div class="form-group mb-3">
				  <input type="text" class="form-control" name="codiceFiscale" id="codiceFiscale"
							value="<%=user.getCF() %>" hidden="hidden" readonly="readonly">
							<input type="text" class="form-control" hidden="hidden" name="email" id="email"
						value=<%=user.getEMAIL() %>>
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
   <%@include file="footer.jsp" %>