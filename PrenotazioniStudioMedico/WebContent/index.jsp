<%@ page language="java" import="it.meucci.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    String autente_loggato=(String)session.getAttribute("utente_loggato");
    if(autente_loggato==null)autente_loggato="false";
    System.out.print("Utente loggato: "+autente_loggato+"\n");
    Utente user;
    user=(Utente)session.getAttribute("SESSION_USER");
    String orario;
	%>  
<!DOCTYPE html>
<html lang="it">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Medilab</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
        <a href="#" ><img alt="" src="assets/img/italy.png" style="height:23px;"></a>
        <a href="#" ><img alt="" src="assets/img/united-kingdom.png" style="height:23px;"></a>
        <a href="#" ><img alt="" src="assets/img/china.png" style="height:23px;"></a>
      </div>
    </div>
  </div>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.jsp">Medilab</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">Chi siamo</a></li>
          <li><a class="nav-link scrollto" href="#services">Servizi</a></li>
          <li><a class="nav-link scrollto" href="#doctors">Dottori</a></li>
                    <li><a class="nav-link scrollto" href="#departments">Dipartimenti</a></li>
          <li><a class="nav-link scrollto" href="#contact">Contattaci</a></li>
          <li><a class="nav-link scrollto" href="#appointment"><span class="d-none d-md-inline">Prenota un appuntamento</span></a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      
      <%if(autente_loggato!="true"){%>  <a href="login.jsp"  class="login-btn scrollto"><span class="d-none d-md-inline">Esegui Login</span></a><%}else if(autente_loggato.equals("true")){ %>
   	  <a><span class="d-none d-md-inline logo me-auto" style="margin-left: 15px; font-size: 16px;">Benvenuto <%=user.getNOME() %> </span></a> 
      <a href="logout"><span class="d-none d-md-inline logo me-auto" style="margin-left: 15px; font-size: 16px;">Logout </span></a> <%} %>
    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container">
      <h1>BENVENUTO IN MEDILAB</h1>
      <h2>Siamo un team di medici specialisti</h2>
      <a href="#about" class="btn-get-started scrollto">Scopri di pi&ugrave;</a>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">

        <div class="row">
          <div class="col-lg-4 d-flex align-items-stretch">
            <div class="content">
               <h3>Perch&egrave; scegliere Medilab?</h3>
              <p>Siamo un team di medici appassionati del proprio lavoro con il focus sul benessere del cliente, lavoriamo per rendere ogni nostro cliente felice di collaborare con noi e&nbsp; dargli un sorriso per il resto della propria vita.</p>
              <div class="text-center">
                <a href="#about" class="more-btn">Scopri di pi&ugrave; <i class="bx bx-chevron-right"></i></a>
              </div>
            </div>
          </div>
          <div class="col-lg-8 d-flex align-items-stretch">
            <div class="icon-boxes d-flex flex-column justify-content-center">
              <div class="row">
                <div class="col-xl-4 d-flex align-items-stretch">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class="bx bx-receipt"></i>
                    <h4>Certificazione Anti-Covid19</h4>
                    <p>Il nostro studio &eacute; perfettamente a norma e utilizza le migliori precauzioni anti-covid</p>
                  </div>
                </div>
                <div class="col-xl-4 d-flex align-items-stretch">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class="bx bx-cube-alt"></i>
                    <h4>Tempi di attesa minimi</h4>
                    <p>Il nostro personale &eacute; consapevole che il tempo dei nostri clienti &eacute; prezioso quindi ci impegnavo a eseguire appuntamenti puntuali</p>
                  </div>
                </div>
                <div class="col-xl-4 d-flex align-items-stretch">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class="bx bx-images"></i>
                    <h4>Qualit&agrave;/prezzo</h4>
                    <p>Il nostro rapporto qualit&agrave;/prezzo &eacute; ottimo,offriamo un servizio di alta qualit&agrave; con prezzi moderati</p>
                  </div>
                </div>
              </div>
            </div><!-- End .content-->
          </div>
        </div>

      </div>
    </section><!-- End Why Us Section -->

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container-fluid">

        <div class="row">
          <div class="col-xl-5 col-lg-6 video-box d-flex justify-content-center align-items-stretch position-relative">
            <a href="https://youtu.be/HiHeplEale4" class="glightbox play-btn mb-4"></a>
          </div>

          <div class="col-xl-7 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5">
            <h3>Scopri il nostro studio</h3>
            <p>Un video che illustra la nostra struttura e il modo in cui lavoriamo e collaboriamo con i nostri clienti</p>

            <div class="icon-box">
              <div class="icon"><i class="bx bx-fingerprint"></i></div>
              <h4 class="title"><a href="">Specialisti</a></h4>
              <p class="description">Altamente specilizzati nelle tecniche di cura dentale</p>
            </div>

            <div class="icon-box">
              <div class="icon"><i class="bx bx-gift"></i></div>
              <h4 class="title"><a href="">Passione</a></h4>
              <p class="description">la nostra passione in quello che facciamo ci permette di rendere felici i nostri clienti del lavoro effettuato</p>
            </div>

            <div class="icon-box">
              <div class="icon"><i class="bx bx-atom"></i></div>
              <h4 class="title"><a href="">Oltre 20 anni di esperienza</a></h4>
              <p class="description">La nostra esperianzia con migliaia di clienti soddisfatti ci rende sicuri di fare al caso tuo </p>
            </div>

          </div>
        </div>

      </div>
    </section><!-- End About Section -->



    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <h2>Servizi</h2>
          <p>Elenco dei nostri servizi</p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="icon-box">
              <div class="icon"><i class="fas fa-heartbeat"></i></div>
              <h4><a href="">Cardio</a></h4>
              <p>É la nostra maggiore specializzazione. Abbiamo una cultura esperienziale in questo settore da oltre 50 anni.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
            <div class="icon-box">
              <div class="icon"><i class="fas fa-pills"></i></div>
              <h4><a href="">Bambini al primo posto</a></h4>
              <p>Il nostro personale ha sempre un occhio di riguardo verso i bambini, con Noi una visita diventa un gioco€.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon"><i class="fas fa-hospital-user"></i></div>
              <h4><a href="">Struttura</a></h4>
              <p>Una struttura di ultima generazione, accogliente e affidabile per i nostri clienti.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
            <div class="icon-box">
              <div class="icon"><i class="fas fa-dna"></i></div>
              <h4><a href="">Utilizzo del microscopio</a></h4>
              <p>Tecniche innovative per notare particolari patologie all'interno del corpo umano. Il microscopio è uno tra gli strumenti più all'avanguardia per sopperire a queste difficoltà.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
            <div class="icon-box">
              <div class="icon"><i class="fas fa-wheelchair"></i></div>
              <h4><a href="">Trattamento persone anziane</a></h4>
              <p>Nella nostra clinica, il nostro personale è altamente qualificato per muoversi in caso di necessità nei confronti di una persona anziana.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
            <div class="icon-box">
              <div class="icon"><i class="fas fa-notes-medical"></i></div>
              <h4><a href="">Sicurezza</a></h4>
              <p>I nostri macchinari sono all'avanguardia in quest'ambito, sono certificati e di ultima generazione. Sentitevi sicuri in tutti i nostri dipartimenti.</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Services Section -->

    <!-- ======= Appointment Section ======= -->
    <section id="appointment" class="appointment section-bg">
      <div class="container" id="userLogged">

        <div class="section-title">
          <h2>Prenota un appuntamento</h2>
          <p>Seleziona il dipartimento interessato e  prenota subito il tuo appuntamento,ti aspettiamo!</p>
        </div>

        <form action="gestprenotazioni?cmd=getoptions" method="post"  role="form" >
          <div class="row">
            <div class="col-md-12 form-group">
				<center>
				<select id="select-dipartimenti" name="select-dipartimenti" class="col-md-6 " required>
				 <option value="" disabled selected hidden>Seleziona dipartimento</option>
					<option value="1">Cardiologia</option>
					<option value="2">Neurologia</option>
					<option value="3">Gastroenterologia</option>
					<option value="4">Pediatria</option>
					<option value="5">Oculistica</option>
				</select>
				</center>
            </div>
          </div>
          <div class="text-center" style="margin-top: 30px;"><button type="submit" class="btn btn-primary">Prosegui <i class="fa fa-arrow-right" aria-hidden="true"></i></button></div>
        </form>

      </div>
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
    
        <!-- ======= Departments Section ======= -->
    <section id="departments" class="departments">
      <div class="container">

        <div class="section-title">
          <h2>Dipartimenti</h2>
          <p>Ecco i nostri dipartimenti.A seconda dei tuoi problemi scegli uno dei nostri dipartimenti, sono il top nell'ambito medico.</p>
        </div>

        <div class="row">
          <div class="col-lg-3">
            <ul class="nav nav-tabs flex-column">
              <li class="nav-item">
                <a class="nav-link active show" data-bs-toggle="tab" href="#tab-1">Cardiologia</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-2">Neurologia</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-3">Gastroenterologia</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-4">Pediatria</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-5">Oculistica</a>
              </li>
            </ul>
          </div>
          <div class="col-lg-9 mt-4 mt-lg-0">
            <div class="tab-content">
              <div class="tab-pane active show" id="tab-1">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Cardiologia</h3>
                    <p class="font-italic">La cardiologia è quella branca della medicina interna che si occupa dello studio, della diagnosi e della cura delle malattie cardiovascolari acquisite o congenite.</p>
                    <p>Oltre che della cura delle malattie cardiovascolari, scompenso cardiaco, anomalie del ritmo, il cardiologo si occupa della prevenzione cardiovascolare e della riabilitazione del paziente sottoposto ad intervento di rivascolarizzazione sia esso cardiochirurgico, che di angioplastica percutanea.</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="assets/img/departments-1.jpg" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-2">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Neurologia</h3>
                    <p class="font-italic">La neurologia è la branca specialistica della medicina che studia le patologie del sistema nervoso centrale (cervello, cervelletto, tronco encefalico e midollo spinale), del sistema periferico somatico (radici e gangli spinali, plessi e tronchi nervosi) e del sistema nervoso periferico autonomo (gangli simpatici e parasimpatici, plessi extraviscerali e intraviscerali).</p>
                    <p>Le malattie del sistema nervoso vengono distinte sia in base all'anatomia sia in base all'etiopatogenesi.</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="assets/img/departments-2.jpg" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-3">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Gastroenterologia</h3>
                    <p class="font-italic">La gastroenterologia è quella branca della medicina interna che si occupa dello studio e della terapia delle malattie del tratto gastrointestinale. Si tratta di una branca medica, il cui medico specialista si chiama gastroenterologo.</p>
                    <p>Studia gli organi interessati grazie soprattutto a procedure endoscopiche con le quali procede alla diagnosi e successivamente al trattamento di queste patologie.</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="assets/img/gastroenterologia.png" style="height:250px;" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-4">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Pediatria</h3>
                    <p class="font-italic">La pediatria è una branca della medicina che si occupa dello sviluppo psicofisico dei bambini e della diagnosi e terapia delle malattie infantili.</p>
                    <p>La neonatologia è la branca della pediatria che si occupa dei neonati entro il primo mese di vita. La cooperazione tra pediatria e ostetricia permette di prevenire le malformazioni del feto e di curare le malattie dalla nascita.</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="assets/img/departments-4.jpg" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-5">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Oculistica</h3>
                    <p class="font-italic">L'oftalmologia, anche detta oculistica o oftalmoiatria è la branca della medicina che si occupa di prevenzione, diagnosi, riabilitazione e terapia sia medica che chirurgica delle malattie dell'apparato visivo, ossia dell'occhio e dei suoi annessi, della correzione dei vizi refrattivi e delle patologie visive correlate</p>
                    <p>Si tratta di una delle discipline mediche e chirurgiche più antiche e viene praticata dal medico detto oculista, chiamato anche oftalmologo.
                    </p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="assets/img/departments-5.jpg" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Departments Section -->



    <!-- ======= Doctors Section ======= -->
    <section id="doctors" class="doctors">
      <div class="container">

        <div class="section-title">
          <h2>Dottori</h2>
          <p>La nostra super squadra di professionisti:</p>
        </div>

        <div class="row">

          <div class="col-lg-6">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="assets/img/doctors/doctors-1.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>Walter De Masi</h4>
                <span>Chief Medical Officer</span>
<!--                <p>Sono felice di lavorare in questo team fantastico!</p>-->
                <div class="social">
                  <a href=""><i class="ri-twitter-fill"></i></a>
                  <a href=""><i class="ri-facebook-fill"></i></a>
                  <a href=""><i class="ri-instagram-fill"></i></a>
                  <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                </div>
              </div>
            </div>
          </div>

           <div class="col-lg-6 mt-4 mt-lg-0">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="assets/img/doctors/doctors-2.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>Sara De Giovanni</h4>
                <span>Oculista</span>
<!--                <p>Lavorare in Dentilab mi permette di migliorare ogni giorno.</p>-->
                <div class="social">
                  <a href=""><i class="ri-twitter-fill"></i></a>
                  <a href=""><i class="ri-facebook-fill"></i></a>
                  <a href=""><i class="ri-instagram-fill"></i></a>
                  <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                </div>
              </div>
            </div>
          </div>

         <div class="col-lg-6 mt-4">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="assets/img/doctors/doctors-3.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>William Milone</h4>
                 <span>Cardiologo</span>
<!--                <p>Clienti felici sempre,Dentilab</p>-->
                <div class="social">
                  <a href=""><i class="ri-twitter-fill"></i></a>
                  <a href=""><i class="ri-facebook-fill"></i></a>
                  <a href=""><i class="ri-instagram-fill"></i></a>
                  <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                </div>
              </div>
            </div>
          </div>

         <div class="col-lg-6 mt-4">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="assets/img/doctors/doctors-4.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>Amanda Giaffreda</h4>
               <span>Neurologa</span>
<!--                <p>Facciamo il possibile per avere sempre il sorriso sia nostro che dei clienti.</p>-->
                <div class="social">
                  <a href=""><i class="ri-twitter-fill"></i></a>
                  <a href=""><i class="ri-facebook-fill"></i></a>
                  <a href=""><i class="ri-instagram-fill"></i></a>
                  <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Doctors Section -->



    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials">
      <div class="container">

        <div class="testimonials-slider swiper-container" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-wrap">
                <div class="testimonial-item">
                  <img src="assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                  <h3>Sergio Garzia</h3>
                  <h4>Ceo &amp; Founder</h4>
                  <p>
                    <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                    Consigliatissimo, veramente ottimo lavoro. Medici molto preparati!
                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                  </p>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-wrap">
                <div class="testimonial-item">
                  <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                  <h3>Sara Ferrari</h3>
                  <h4>Designer</h4>
                  <p>
                    <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                    Ho preso un appuntamento sul sito e sono stati gentilissimi e professionali,durante la visita mi hanno trattata in maniera impeccabile,personale molto qualificato!
                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                  </p>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-wrap">
                <div class="testimonial-item">
                  <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                  <h3>Jennifer Leopizzi</h3>
                  <h4>Ristoratore</h4>
                  <p>
                    <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                    la mia bambina aveva alcuni problemi di vista, personale molto simpatico e professionale,consiglio a tutti!
                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                  </p>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-wrap">
                <div class="testimonial-item">
                  <img src="assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                  <h3>Matteo Valenza</h3>
                  <h4>Freelancer</h4>
                  <p>
                    <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                    Ho eseguito una visita cardiologica,rapporto qualita/prezzo non trovabile da nessuna altra parte,consigliatissimo!
                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                  </p>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-wrap">
                <div class="testimonial-item">
                  <img src="assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                  <h3>John De Pascalis</h3>
                  <h4>Imprenditore</h4>
                  <p>
                    <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                    Ho dovuto fare una visita neurologica,veramente ottimo personale super qualificato,esperienza molto positiva,ho consigliato a tutti i miei conoscenti Medilab!
                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                  </p>
                </div>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Testimonials Section -->

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
   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script>
$(document).ready(function(){
    
	  var loggato="<%=autente_loggato%>";
	  if(loggato=="true"){
		  $("#userLogged").show();
		  $("#usernotLogged").hide();
	}
	  else{
		  $("#userLogged").hide();
		  $("#usernotLogged").show();

	}
  
});
</script>

</body>

</html>