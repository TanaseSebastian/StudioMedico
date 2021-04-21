<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<!-- Begin Page Content -->
 <div class="container-fluid">
						<form action="gestutenti?cmd=clientregister" method="POST"  class="signin-form">
						 <div class="form-group mb-3">
			      			<label class="label" for="codiceFiscale">Codice Fiscale</label>
			      			<input type="text" name="codiceFiscale" class="form-control" placeholder=" " required minlength="16" maxlength="16">
			      		</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="name">Nome</label>
			      			<input type="text" name="nome" class="form-control" placeholder=" " required>
			      		</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="cognome">Cognome</label>
			      			<input type="text" name="cognome" class="form-control" placeholder=" " required>
			      		</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="email">Username</label>
			      			<input type="text" name="username" class="form-control" placeholder=" " required>
			      		</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="email">Email</label>
			      			<input type="email" name="email" class="form-control" placeholder=" " required>
			      		</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="phon">Numero Cellulare</label>
			      			<input type="tel" class="form-control" name="phone" id="phone" placeholder=" " minlength="10" maxlength="10" title="Please enter at least 10" required>
			      		</div>
            
		            <div class="form-group mb-3">
		            	<label class="label" for="password">Password</label>
		              <input type="password" name="password" id="password" class="form-control" placeholder=" " pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Deve contenere almeno un numero,una lettera maiuscola e una lettera minuscola, e deve essere composta da almeno 8 o più caratteri" required>
		            </div>
		            <div class="form-group mb-3">
		            	<label class="label" for="password">Conferma Password</label>
		              <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="" required>
		            </div>
		            <div class="form-group">
		            	<button type="submit" class="form-control btn btn-primary submit px-3">Inserisci Cliente</button>
		            </div>
		            
		          </form>
			</div>
 <!-- /.container-fluid -->
 
<%@include file="footer.jsp" %>
