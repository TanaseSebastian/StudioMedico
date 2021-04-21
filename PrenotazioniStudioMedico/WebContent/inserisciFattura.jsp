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

	<form class="form-horizontal" method="post" action="gestprenotazioni?cmd=inviaprenotazione">
		<fieldset>
			<!-- Form Name -->
			<legend>Inserisci dati della fattura</legend>
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
			<input type="text" readonly="readonly" name="date" class="form-control col-md-12"
				value="<%=p.getDateTime()%>"><span class="help-block">Data
				Prenotazione</span>
		</div>

		<!-- Text input-->
		<div class="form-group col-md-6">
			<div class="">
				      <input type="number" id="Prezzo" class="form-control border border-success" name="Prezzo"  min=0 max=99999.99  step=0.01 required>
				</select> <span class="help-block">Prezzo prestazione</span>
			</div>
		</div>
	</div>
	<div class="text-center" style="margin-top: 30px;">
	<button type="reset" class="btn btn-danger" id="elimina" name="elimina">Annulla</button>
			<button type="submit" class="btn btn-success">Conferma Fattura e invia al cliente</button>
	</div>
	</fieldset>
	</form>
</div>
<!-- /.container-fluid -->

<%@include file="footer.jsp"%>
