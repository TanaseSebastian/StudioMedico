package it.meucci;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GestioneForgotPSW
 */
@WebServlet("/gestforgot")
public class GestioneForgotPSW extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String email;
	public int code;
	
	
	
	//funzione che invia l'email
	private static void sendFromGMail(String from, String pass, String[] to, String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        
        Session session = Session.getDefaultInstance(props);
        

        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }

	//dati account
	 private static String USER_NAME = "prglogin@gmail.com";  // Inserire lo username GMail (la parte prima di "@gmail.com")
	    private static String PASSWORD = "ApplicationTest"; //  password dell'account Gmail
	    private static String RECIPIENT; //email destinatari TO
	

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestioneForgotPSW() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String comando = request.getParameter("cmd");;
				
		if(comando.equals("codecontrol")) {
		
		//control code
		int code_validation=Integer.parseInt(request.getParameter("code"));
		System.out.println("sto controllando il codice");
		System.out.println("codice giusto : " +code);
		System.out.println("codice inserito dall'utente "+code_validation);
		if(code==code_validation) {
			System.out.println("i codici corrispondono");
			System.out.println("reindirizzo il client verso resetPSW.html");
			response.sendRedirect("ForgotPSW\\resetPSW.html");
		}
		else {
			System.out.println("l'utente ha sbagliato il codice lo inoltro su verifyCodeError.html");
			response.sendRedirect("ForgotPSW\\verifyCodeError.html");
		}
		
		}
		
		//sendcode
		else if(comando.equals("sendcode")) {
		try {
			  //creazione del codice di verifica
	        int new_code;
	         new_code = 10000 + new Random().nextInt(90000); // 10000 - 99999
	         code=new_code;
	         System.out.println("il codice è :"+code);
	         
	         
	         String from = USER_NAME;
		        String pass = PASSWORD;
		        RECIPIENT=email;
		        String[] to = { RECIPIENT }; // list of recipient email addresses
		        String subject = "Codice di verifica per il recupero della password";
		        String body = "Gentile utente il suo codice di verifica è il seguente : "+code+ " la preghiamo di inserirlo nel sito per autenticare l'account";

		        sendFromGMail(from, pass, to, subject, body);
		        
		        response.sendRedirect("ForgotPSW\\verifyCode.html");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		
		//verifyemail
		else if(comando.equals("verifyemail")) {
		try {

		    email=request.getParameter("email");
			System.out.println("email inserita dall'utente : " +email);
			System.out.println("sto cercando di connettermi al db");
			DBManager db=new DBManager();
			if(db.controlEmail(email)==true) {
				System.out.println("lo rimando su sendCode.html");
				response.sendRedirect("ForgotPSW\\sendCode.html");
			}
			else {
				response.sendRedirect("forgot.jsp");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		
		//resetpsw
		else if(comando.equals("resetpsw")) {
		String password = request.getParameter("password");
		System.out.println("il cliente ha inserito una nuova password : "+password);
		
	
		try {
			DBManager db=new  DBManager();
			db.resetPassword(email, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("ora lo reindirizzo su successResetPSW.html");
		response.sendRedirect("ForgotPSW\\successResetPSW.html");
		}
		
		
		
		
		
	}

}
