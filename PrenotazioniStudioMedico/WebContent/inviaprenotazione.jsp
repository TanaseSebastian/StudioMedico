<%@ page language="java" import="java.util.*,it.meucci.*"  contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    String autente_loggato=(String)session.getAttribute("utente_loggato");
    System.out.print("Utente loggato :"+autente_loggato+"\n");
    Utente user;
    user=(Utente)session.getAttribute("SESSION_USER");
    String orario;
    ArrayList<Dottore> elenco;
    Dottore d;
  	elenco = (ArrayList<Dottore>)session.getAttribute("ELENCO_DOTTORI");
  	String dipartimento=(String)session.getAttribute("DIPARTIMENTO");
  	System.out.println("dipartimento selezionato :"+dipartimento);
  	String messaggio =(String)session.getAttribute("MESSAGGIO");
  	if(messaggio==null) messaggio="";
  %>

<!DOCTYPE html>
<html lang="it">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Medilab</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

	
  <!-- Date -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/dark.css"> -->
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

</head>

<body>

  <!-- ======= Top Bar ======= -->
  <div id="topbar" class="d-flex align-items-center fixed-top">
    <div class="container d-flex justify-content-between">
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope"></i> <a href="mailto:contact@example.com">contact@medilab.com</a>
        <i class="bi bi-phone"></i> +0833 57652
      </div>
      <div class="d-none d-lg-flex social-links align-items-center">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
      </div>
    </div>
  </div>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="">Medilab</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto" href="index.jsp">Home</a></li>
          <li><a class="nav-link scrollto active" href="#appointment"><span class="d-none d-md-inline">Prenota un appuntamento</span></a></li>
          <li><a class="nav-link scrollto" href="#contact">Contattaci</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      
      <%if(autente_loggato!="true"){%>  <a href="login.jsp"  class="login-btn scrollto"><span class="d-none d-md-inline">Esegui Login</span></a><%}else if(autente_loggato.equals("true")){ %>
      <a><span class="d-none d-md-inline logo me-auto" style="margin-left: 15px; font-size: 20px;">Benvenuto <%=user.getNOME() %> </span></a> <%} %>
    </div>
  </header><!-- End Header -->



  <main id="main">


    <!-- ======= Appointment Section ======= -->
    <section style="margin-top: 100px" id="appointment" class="appointment section-bg">
      <div class="container" id="userLogged">


		 	<div class="col-md-12"></div>
			<%=messaggio%>
			<%request.getSession().setAttribute("MESSAGGIO", ""); %>
      		</div>


        <div class="section-title">
          <% switch(dipartimento)
              
              {
              case "1": %>
              <h2>Prenota un appuntamento <br> Hai selezionato il dipartimento di: Cardiologia</h2>
              <% break;
              case "2":%>
              <h2>Prenota un appuntamento <br> Hai selezionato il dipartimento di: Neurologia</h2>
              <% break;
              case  "3":%>
              <h2>Prenota un appuntamento <br> Hai selezionato il dipartimento di: Gastroenterologia</h2>
              <% break;
              case  "4":%>
              <h2>Prenota un appuntamento <br> Hai selezionato il dipartimento di: Pediatria</h2>
              <% break;
              case  "5":%>
             <h2>Prenota un appuntamento <br> Hai selezionato il dipartimento di: Oculistica</h2>
              <% break;
              }%>
          <p>Inserisci i dati della form e  prenota subito il tuo appuntamento,ti aspettiamo!</p>
        </div>

        <form action="gestprenotazioni?cmd=inserisci" method="post" role="form" >
          <div class="row">
            <div class="col-md-3 form-group">
              <input type="text" name="name" class="form-control" id="name" placeholder="Il tuo Nome" data-rule="minlen:4" data-msg="Perfavore inserisci almeno 4 caratteri"  readonly="readonly">
            </div>
            <div class="col-md-3 form-group mt-3 mt-md-0">
              <input type="email" class="form-control" name="email" id="email" placeholder="La tua Email" data-rule="email" data-msg="Perfavore inserisci una email valida"   readonly="readonly">
            </div>
             <div class="col-md-3 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="cf" id="cf" placeholder="inserire codice fiscale" data-rule="minlen:16" maxlength="16" data-msg="Inserisci 16 caratteri"  readonly="readonly">
            </div>
			 <div class="col-md-3 form-group mt-3 mt-md-0">
				<input type="text" class="form-control" name="phone" id="phone" placeholder="Il Numero Cellulare" data-rule="minlen:10" maxlength="13" data-msg="Please enter at least 10"  readonly="readonly">
			</div>
          </div>
                    <div class="row">
            <div class="col-md-6 form-group mt-3">
              <select name="dottore" id="dottore" class="form-select" >
               <option value="" disabled selected hidden>Seleziona il dottore</option>
					 <% for(int j=0;j<elenco.size();j++) 
						    {
							 d=(Dottore)elenco.get(j);
						    
						 %>
						    <option value=<%=d.getCodDottore()%>><%=d.getCognome()+" "+d.getNome() %></option>
						  <%
						    }
						 %>
 
              </select>
            </div>
            <div class="col-md-6 form-group mt-3">
              
              <% switch(dipartimento)
              
              {
              case "1": %>
              <%@include file="..//dipartimenti//cardiologia.jsp"%>
              <% break;
              case "2":%>
              <%@include file="..//dipartimenti//neurologia.jsp"%>
              <% break;
              case  "3":%>
              <%@include file="..//dipartimenti//gastroenterologia.jsp"%>
              <% break;
              case  "4":%>
              <%@include file="..//dipartimenti//pediatria.jsp"%>
              <% break;
              case  "5":%>
              <%@include file="..//dipartimenti//oculistica.jsp"%>
              <% break;
              }
              
             
              %>
             
              

            </div>
          </div>
          <div class="row">
          <br>
          <div class="col-md-6 form-group mt-3">
                 <input id="date" name="date" placeholder="YYYY/MM/DD" data-input class="form-select">
            </div>
            <div class="col-md-6 form-group mt-3">
              <select name="orario" id="orario" class="form-select" >
               <option value="" disabled selected hidden>Seleziona orario</option>
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
            	<option value="" disabled>--Orario delle <%=i%>--</option>	  
                <option value=<%=orario+"00"%>><%=orario+"00"%></option>
                 <option value=<%=orario+"15"%>><%=orario+"15"%></option>
                  <option value=<%=orario+"30"%>><%=orario+"30"%></option>
                   <option value=<%=orario+"45"%>><%=orario+"45"%></option>
				<%}}%>
              </select>
            </div>
            

          </div>

          <div class="form-group mt-3">
            <textarea class="form-control" name="message" rows="5" placeholder="Messaggio (Opzionale)"  maxlength="250"></textarea>
          </div>
          <div class="text-center" style="margin-top: 30px;"><button type="submit" class="btn btn-primary">Prenota appuntamento</button></div>
        </form>

    </section><!-- End Appointment Section -->
    
        <!-- ======= Appointment Section if user not logged======= -->
    <section id="appointment" class="appointment section-bg">
      <div class="container" id="usernotLogged">

        <div class="section-title">
          <h2>Prenota un appuntamento</h2>
        </div>

          <div class="row">
            <div class="col-md-12 form-group">
             <h1 style="color:#0B5ED7; font-weight: bold; text-align: center;">Per favore utente,per poter prenotare un appuntamento bisogna prima loggarsi.</h1>
            </div>
          <div class="text-center"><a class="btn btn-primary" href="login.jsp">Accedi</a></div>
     

      </div>
    </section><!-- End Appointment Section  if user not logged-->
    
 


    <!-- ======= Gallery Section ======= -->
    <section id="gallery" class="gallery">
      <div class="container">

        <div class="section-title">
          <h2>Galleria</h2>
          <p>Alcune foto della nostra struttura.</p>
        </div>
      </div>

      <div class="container-fluid">
        <div class="row no-gutters">

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-1.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-1.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-2.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-2.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-3.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-3.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-4.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-4.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-5.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-5.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-6.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-6.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-7.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-7.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-8.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-8.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Gallery Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
          <h2>Contattaci</h2>
        </div>
      </div>

<!--
      <div>
        <iframe style="border:0; width: 100%; height: 350px;" src="https://maps.googleapis.com/maps/api/staticmap?center=40.01261901855469,18.160585403442383&zoom=12&size=400x400&maptype=satellite&key=AIzaSyDp7USQT03JibiRR6dcDY5r5_mpPJYTsl0" frameborder="0" allowfullscreen></iframe>
      </div>
-->

     <div class="mapouter"><div class="gmap_canvas"><iframe width="100%" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=piazza%20san%20domenico,Casarano&t=&z=15&ie=UTF8&iwloc=&output=embed" frameborder="0" allowfullscreen></iframe></div>
     
      <div class="container">
        <div class="row mt-5">

          <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>Indirizzo:</h4>
                <p>Piazza San Domenico n34,Casarano LE</p>
              </div>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4>Email:</h4>
                <p>contact@medilab.com</p>
              </div>

              <div class="phone">
                <i class="bi bi-phone"></i>
                <h4>Telefono:</h4>
                <p>+0833 57652</p>
              </div>

            </div>

          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">

            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Il tuo Cognome e Nome" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="email" class="form-control" name="email" id="email" placeholder="La tua Email" required>
                </div>
              </div>
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="oggetto del messaggio" required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="message" rows="5" placeholder="Testo del Messaggio" required></textarea>
              </div>
              <div class="my-3">
                <div class="loading">Caricamento</div>
                <div class="error-message"></div>
                <div class="sent-message">Il tuo messsaggio &eacute; stato inviaato correttamente,grazie!</div>
              </div>
              <div class="text-center"><button type="submit">Invia Messaggio</button></div>
            </form>

          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    

    <div class="container d-md-flex py-4">

      <div class="me-md-auto text-center text-md-start">
        <div class="copyright">
          &copy; Copyright <strong><span>RESTINO,ROSSETTO,GIANGRECO,TANASE</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
          Designed by <a href="#">RestinoSamuele,Rossetto Francesco,Giangreco Davide,Tanase Sebastian</a>
        </div>
      </div>
      <div class="social-links text-center text-md-right pt-3 pt-md-0">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
    <!-- jQuery -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <!--  Flatpickr  -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
  </body>
  <script>
  
  $("#date").flatpickr({
		minDate: "today",
 	    maxDate: new Date().fp_incr(100),
	    dateFormat: "Y-m-d",
	    "disable": [
	        function(date) {
	           return (date.getDay() === 0 || date.getDay() === 6);  // disable weekends
	        }
	    ],
	    "locale": {
	        "firstDayOfWeek": 1 // set start day of week to Monday
	    }
	});
  </script>
  <script>
$(document).ready(function(){
	
	  var loggato="<%=autente_loggato%>";
	  if(loggato=="true"){
		  $("#userLogged").show();
		  $("#usernotLogged").hide();
		  <%if(user==null){}else{%>
		  var nome="<%=user.getCOGNOME()+" "+user.getNOME() %>";
		  var email="<%=user.getEMAIL()%>";
		  var cf="<%=user.getCF() %>";
		  var phone="<%="+39 "+user.getPHONE()%>";
		  //alert(nome+email+cf+phone);
		  $("#name").val(nome);
		  $("#email").val(email);
		  $("#cf").val(cf);
		  $("#phone").val(phone);
			<%}%>
	}
	  else{
		  $("#userLogged").hide();
		  $("#usernotLogged").show();

	}
  
});
</script>

</body>

</html>