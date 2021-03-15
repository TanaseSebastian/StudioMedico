<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
  	<title>Login 07</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">

	</head>
	<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
			</div>
			<div class="row justify-content-center">
				<div class="col-md-12 col-lg-10">
					<div class="wrap d-md-flex">
				  <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
							<div class="text w-100">
								<h2>Accedi</h2>
								<p style="color:white;background-color: rgba(8,8,8,0.50);">Hai già un account?</p>
								<a href="login.jsp" class="btn btn-white btn-outline-white">Login</a>
							</div>
			      </div> 	
						<div class="login-wrap p-4 p-lg-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4">Registrazione</h3>
			      		</div>
								
			      	</div>
							<form action="gestlogin?cmd=register" method="POST"  class="signin-form">
						 <div class="form-group mb-3">
			      			<label class="label" for="codiceFiscale">Codice Fiscale</label>
			      			<input type="text" name="codiceFiscale" class="form-control" placeholder="Inserisci il Codice Fiscale" required minlength="16" maxlength="16">
			      		</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="name">Nome</label>
			      			<input type="text" name="nome" class="form-control" placeholder="Inserisci il Nome" required>
			      		</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="cognome">Cognome</label>
			      			<input type="text" name="cognome" class="form-control" placeholder="Inserisci il Cognome" required>
			      		</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="email">Username</label>
			      			<input type="text" name="username" class="form-control" placeholder="Inserisci la tua Username" required>
			      		</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="email">Email</label>
			      			<input type="email" name="email" class="form-control" placeholder="Inserisci la tua Email" required>
			      		</div>
            
		            <div class="form-group mb-3">
		            	<label class="label" for="password">Password</label>
		              <input type="password" name="password" id="password" class="form-control" placeholder="Inserisci Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Deve contenere almeno un numero,una lettera maiuscola e una lettera minuscola, e deve essere composta da almeno 8 o più caratteri" required>
		            </div>
		            <div class="form-group mb-3">
		            	<label class="label" for="password">Conferma Password</label>
		              <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Conferma Password" required>
		            </div>
		            <div class="form-group">
		            	<button type="submit" class="form-control btn btn-primary submit px-3">Registrati</button>
		            </div>
		            
		          </form>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
  <script type="text/javascript">
  var password = document.getElementById("password")
  , confirm_password = document.getElementById("confirm_password");

function validatePassword(){
  if(password.value != confirm_password.value) {
    confirm_password.setCustomValidity("Le Password non corrispondono.");
  } else {
    confirm_password.setCustomValidity('');
  }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
  </script>

	</body>
</html>

