<%@ page language="java" import="it.meucci.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Prenotazione p = (Prenotazione)request.getAttribute("PRENOTAZIONE");
	String orario;
	DBManager db=new DBManager();
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

	<form class="form-horizontal" method="post"
		action="gestprenotazioni?cmd=modifica">
		<fieldset>
			<!-- Form Name -->
			<legend>Modifica dati della prenotazione</legend>
			<div class="row">

				<!-- Text input-->
				<div class="form-group col-md-6">
					<div>
						<input type="text" class="form-control" name="codPrenotazione" id="codPrenotazione"
							value="<%=p.getCodPrenotazione() %>" readonly="readonly">
						<span class="help-block">Codice Prenotazione</span>
					</div>
				</div>
				
				<!-- Text input-->
			<div class="form-group col-md-6">
				<div>
					<input type="text" class="form-control" name="cf" id="cf"
						value=<%=p.getCodFisc() %> readonly="readonly"> <span
						class="help-block">Codice Fiscale</span>
				</div>
			</div>
			</div>

<div class="row">
	<!-- Text input-->
	<div class="form-group col-md-6">
		<div class="">
			<input type="text" class="form-control" 
				<%-- value="<%=p.getCodPrenotazione()%>" --%>
				value="<%=db.getPrestazioneName(String.valueOf(p.getCodPrenotazione())) %>"
				readonly="readonly"><input hidden readonly="readonly" name="codPrestazione" id="codPrestazione" class="help-block" value="<%=p.getCodPrenotazione()%>">Codice Prestazione:
				<%=p.getCodPrenotazione()%></p>
		</div>
	</div>
	<!-- Text input-->
	<div class="form-group col-md-6">
		<div class="">
			<input type="text" class="form-control" 
				value="<%=db.getDoctorName(String.valueOf(p.getCodDottore()))%>"
				readonly="readonly"> <input hidden readonly="readonly" name="codDottore" id="codDottore" value="<%=p.getCodDottore()%>" class="help-block">Codice Dottore: <%=p.getCodDottore()%></p>
		</div>
	</div>
	</div>



	<div class="row">
		<!-- Text input-->
		<div class="form-group col-md-6">
		<%String string = p.getDateTime();
				String[] parts = string.split(" ");
				String data = parts[0];
				String ora = parts[1]; %>
			<input id="date" name="date" data-input class="form-select col-md-12"
				value="<%=data%>"> <span class="help-block">Data
				Prenotazione</span>
		</div>

		<!-- Text input-->
		<div class="form-group col-md-6">
			<div class="">
				<select name="orario" id="orario" class="form-select col-md-12">
					<option value="<%=ora%>" selected><%=ora%></option>
					<option value="" disabled>--MATTINA--</option>
					<% for(int i=8;i<21;i++){
            	   if(i==13 || i==14 || i==15){}
            	   else{
            		   if(i<10){orario="0"+String.valueOf(i)+":";}
            		   else{orario=String.valueOf(i)+":";}
            		   if(i==16){
            			   %>
					<option value="" disabled>--POMERIGGIO--</option>
					<% }%>
					<option value="" disabled>--Orario delle
						<%=i%>--
					</option>
					<option value=<%=orario+"00"%>><%=orario+"00"%></option>
					<option value=<%=orario+"15"%>><%=orario+"15"%></option>
					<option value=<%=orario+"30"%>><%=orario+"30"%></option>
					<option value=<%=orario+"45"%>><%=orario+"45"%></option>
					<%}}%>
				</select> <span class="help-block">Orario</span>
			</div>
		</div>
	</div>
	<div class="form-group mt-3">
		<textarea class="form-control" name="message" rows="5" maxlength="250" placeholder="Nessun messaggio opzionale lasciato dall'utente"><%=p.getCommento()%></textarea>
	</div>
	<div class="text-center" style="margin-top: 30px;">
	<button type="reset" class="btn btn-danger" id="elimina" name="elimina">Annulla</button>
		<button type="submit" class="btn btn-primary">Modifica
			appuntamento</button>
	</div>
	</fieldset>
	</form>
</div>
<!-- /.container-fluid -->

<%@include file="footer.jsp"%>
