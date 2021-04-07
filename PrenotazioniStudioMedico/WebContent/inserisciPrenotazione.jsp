<%@ page language="java" import="java.util.*,it.meucci.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String orario;
ArrayList<Dottore> elencoDottori = (ArrayList<Dottore>)request.getAttribute("ELENCO_DOTTORI");
ArrayList<Prestazione> elencoPrestazioni = (ArrayList<Prestazione>)request.getAttribute("ELENCO_PRESTAZIONI");
ArrayList<Utente> elencoClienti = (ArrayList<Utente>)request.getAttribute("ELENCO_CLIENTI");
Dottore d;
Prestazione p;
Utente c;
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
		action="gestprenotazioni?cmd=inserisci2">
		<fieldset>
			<!-- Form Name -->
			<legend>Inserisci nuova prenotazione</legend>
			<div class="row">
				<!-- Text input-->
				<div class="col-md-4 form-group mt-3">
						<select name="cliente" id="cliente" class="form-select col-md-12">
							<option value="" disabled selected hidden>Seleziona il
								cliente</option>
							  <% for(int y=0;y<elencoClienti.size();y++) 
						    {
							 c=(Utente)elencoClienti.get(y);
						    
						 %>
							<option value=<%=c.getCF()%>><%=c.getCOGNOME()+" "+c.getNOME() %></option>
							<%
						    }
						 %> 

						</select>
					</div>
				<!-- Text input-->
				<div class="col-md-4 form-group mt-3">
						<select name="dottore" id="dottore" class="form-select col-md-12">
							<option value="" disabled selected hidden>Seleziona il
								dottore</option>
							 <% for(int j=0;j<elencoDottori.size();j++) 
						    {
							 d=(Dottore)elencoDottori.get(j);
						    
						 %>
							<option value=<%=d.getCodDottore()%>><%=d.getCognome()+" "+d.getNome() %></option>
							<%
						    }
						 %>

						</select>
					</div>
				<!-- Text input-->
					<div class="col-md-4 form-group mt-3">
						<select name="visita" id="visita" class="form-select col-md-12">
							<option value="" disabled selected hidden>Seleziona il tipo di visita</option>
							<% for(int i=0;i<elencoPrestazioni.size();i++) 
						    {
							 p=(Prestazione)elencoPrestazioni.get(i);
						 %>
							<option value=<%=p.getCodPrestazione()%>><%=p.getNome()%></option>
							<%
						    }
						 %>
						</select>
					</div>
			</div>



			<div class="row">
				<div class="col-md-6 form-group mt-3">
					<input id="date" name="date" placeholder="YYYY/MM/DD" data-input
						class="form-select col-md-12">
				</div>
				<div class="col-md-6 form-group mt-3">
					<select name="orario" id="orario" class="form-select col-md-12">
						<option value="" disabled selected hidden>Seleziona
							orario</option>
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
					</select>
				</div>
			</div>
			<div class="form-group mt-3">
				<textarea class="form-control" name="message" rows="5"
					placeholder="Messaggio (Opzionale)" maxlength="250"></textarea>
			</div>
			<div class="text-center" style="margin-top: 30px;">
				<a href="prodotti.jsp" class="btn btn-danger" id="elimina"
					name="elimina">Annulla</a>
				<button type="submit" class="btn btn-primary">Inserisci
					appuntamento</button>
			</div>
		</fieldset>
	</form>
</div>
<!-- /.container-fluid -->

<%@include file="footer.jsp"%>
