<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<!-- Begin Page Content -->
 <div class="container-fluid">
						<form action="gestutenti?cmd=doctorregister" method="POST"  class="signin-form">
			      		<div class="form-group mb-3">
			      			<label class="label" for="name">Nome</label>
			      			<input type="text" name="nome" class="form-control" placeholder=" " required>
			      		</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="cognome">Cognome</label>
			      			<input type="text" name="cognome" class="form-control" placeholder=" " required>
			      		</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="phon">Numero Cellulare</label>
			      			<input type="tel" class="form-control" name="phone" id="phone" placeholder="  " minlength="10" maxlength="10" title="Please enter at least 10" required>
			      		</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="email">Email</label>
			      			<input type="email" name="email" class="form-control" placeholder=" " required>
			      		</div>
		            <div class="form-group mb-3">
		            <label class="label" for="select-dipartimenti">Dipartimento</label> <br>
		            	<select id="select-dipartimenti" name="select-dipartimenti" class="col-md-12 form-select" required>
				 		<option value="" disabled selected hidden>Seleziona dipartimento</option>
						<option value="1">Cardiologia</option>
						<option value="2">Neurologia</option>
						<option value="3">Gastroenterologia</option>
						<option value="4">Pediatria</option>
						<option value="5">Oculistica</option>
						</select>
		            </div> <br>
		            <div class="form-group">
		            	<button type="submit" class="form-control btn btn-primary submit px-3">Inserisci Dottore</button>
		            </div>
		          </form>
			</div>
 <!-- /.container-fluid -->
 
<%@include file="footer.jsp" %>
