package it.meucci;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

/**
 * Servlet implementation class GestionePrenotazioniServlet
 */
@WebServlet("/gestprenotazioni")
public class GestionePrenotazioniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionePrenotazioniServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String comando = request.getParameter("cmd");
		DBManager db;
		
		
		
		
		//funzione che visualizza e restituisce alla jsp i dettagli di un prodotto
				if(comando.equals("visualizza"))
				{
					
					String id= request.getParameter("id");
					Prenotazione p=new Prenotazione();
					try {
						db= new DBManager();
						p = db.getPrenotazione(id);
						db.close();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					//System.out.println(p.toString());
					request.setAttribute("PRENOTAZIONE", p);
					RequestDispatcher rd = request.getRequestDispatcher("dettaglioPrenotazione.jsp");
					rd.forward(request, response);

				}
				
		
				else if(comando.equals("viewall")) {
					ArrayList<Prenotazione> elenco= new ArrayList<Prenotazione>();
					try 
					{
						db= new DBManager();
						elenco=db.getPrenotazioni();
						db.close();
						
						//ELENCO PRENOTAZIONI
						request.setAttribute("ELENCO_PRENOTAZIONI", elenco);
						RequestDispatcher rd = request.getRequestDispatcher("visualizzaPrenotazioni.jsp");
						rd.forward(request, response);
						
						
					} catch (Exception e) {
						e.printStackTrace();
						response.sendRedirect("404.jsp");
						// TODO: handle exception
					}
				}
		
		//funzione che aggiorna i dati di una prenotazione
				else if(comando.equals("aggiorna"))
				{
					
					String id= request.getParameter("id");
					Prenotazione p=new Prenotazione();
					try {
						db= new DBManager();
						p = db.getPrenotazione(id);
						db.close();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					//System.out.println(p.toString());
					request.setAttribute("PRENOTAZIONE", p);
					RequestDispatcher rd = request.getRequestDispatcher("aggiornaPrenotazione.jsp");
					rd.forward(request, response);

				}	
				
				
				
				//funzione che aggiorna i dati di una prenotazione
				else if(comando.equals("fattura"))
				{
					
					String id= request.getParameter("id");
					Prenotazione p=new Prenotazione();
					try {
						db= new DBManager();
						p = db.getPrenotazione(id);
						db.close();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					//System.out.println(p.toString());
					request.setAttribute("PRENOTAZIONE", p);
					RequestDispatcher rd = request.getRequestDispatcher("inserisciFattura.jsp");
					rd.forward(request, response);

				}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String comando = request.getParameter("cmd");
		//ArrayList<Prenotazione> elenco= new ArrayList<Prenotazione>();
		
		if(comando.equals("inserisci")) {
				Prenotazione p=new Prenotazione();
				p.setCodDottore(Integer.parseInt(request.getParameter("dottore")));
				p.setCodFisc(request.getParameter("cf"));
				p.setDateTime(request.getParameter("date")+" "+request.getParameter("orario"));
				p.setCodPrestazione(Integer.parseInt(request.getParameter("prestazione")));
				p.setCommento(request.getParameter("message"));
				
				System.out.println(p.toString());		
				
			try {
				DBManager db=new DBManager();
				db.insertPrenotazione(p);
				String data=db.getItalianDate(request.getParameter("date"));
				String fullName=request.getParameter("name");
				String email=request.getParameter("email");
				//String messaggio=request.getParameter("message");
				String dottore=db.getDoctorName(request.getParameter("dottore"));
				String prestazione=  db.getPrestazioneName(request.getParameter("prestazione"));
				String orario=request.getParameter("orario");
				System.out.println(fullName+" "+email+" "+data+" "+orario+" "+dottore+" "+prestazione);
				SendMail sender = new SendMail();
				String RECIPIENT=email;
				String[] to = { RECIPIENT }; // list of recipient email addresses
				
				
				String messaggioDaInviare ="<!DOCTYPE html>"
				+ "<html lang='en'>"
				+ " <head>"
				+ "<meta charset='UTF-8'>"
						+ "<meta http-equiv='X-UA-Compatible' content='IE=edge'>"
								+ "<meta name='viewport' content='width=device-width, initial-scale=1.0\'>"
						+ "<title>Messaggio</title>"
						+ "</head>"
						+ "<body style='text-align: center; font-size: larger;'>"
						+ "<p style=\"color: #2C4964; font-size:40px; font-weight: 900; font-family:sans-serif;\">Medilab</p>"
								+ "<p style=\"color: #2C4964; font-size: x-large; font-weight: 900;\">Gentile cliente, Medilab la ringrazia per aver prenotato un appuntamento presso il nostro studio medico.</p>"
										+ "<p>Le riportiamo di seguito i dettagli della prenotazione da lei effettuata:</p>"
										+ "<p>Nome e Cognome :<strong>"+fullName+"</strong></p>"
												+ "<p>In data: <strong>"+data+"</strong> alle ore :<strong>"+orario+"</strong></p>"
												+"<h3>Deve effettuare: <strong>"+prestazione+"</strong> insieme al Dottor: <strong>"+dottore+"</strong></h3>"
				+"<p style=\"color: yellowgreen;\"><strong>Per qualsiasi dubbio o problema non esitare a contattarci tramite telefono o email,siamo a vostra disposizione.</strong></p>"
				+"<p style=\"color: #2C4964; font-size: x-large; font-weight: 900;\">Medilab le augura una buona giornata.</p>"
				+"</body>"
				+"</html>";
				
				
				//invio dell'email con i parametri
				sender.sendFromGMail(to, "Medilab,Prenotazione eseguita",messaggioDaInviare);
				
				//div che contiene il messaggio di ringraziamento,ovvero l'operazione il codice è stato eseguito correttamente
				String thankyoupage="<div class=\"jumbotron text-center\">\r\n"
						+ "  <h1 class=\"display-3\" style=\"color: green; font-weight: bold;\">Grazie! Il tuo appuntamento è stato registrato correttamente<i class=\"fa fa-check-circle\" aria-hidden=\"true\"></i></h1>\r\n"
						+ "  <p class=\"lead\"><strong>Verifica la tua email! </strong>Ti manderemo un promemoria contenente i dettagli della prenotazione.</p>\r\n"
						+ "  <hr>\r\n"
						+ "</div>";
				
				
				request.getSession().setAttribute("MESSAGGIO", thankyoupage);
				response.sendRedirect("inviaprenotazione.jsp");
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Operazione non andata a buon fine");
				System.out.println("Causa errore: Record della prenotazione è già esistente");
				String errorpage="<div class=\"jumbotron text-center\">\r\n"
						+ "  <h1 class=\"display-3\" style=\"color: red; font-weight: bold;\">Spiacenti<i class=\"fa fa-times\" aria-hidden=\"true\"></i> non è possibile prenotare l'appuntamento per l'orario scelto.</h1>\r\n"
						+ "  <p class=\"lead\"><strong>La preghiamo di cambiare orario da lei scelto :</strong> Orario già occupato da un altro cliente.</p>\r\n"
						+ "  <hr>\r\n"
						+ "</div>";
				request.getSession().setAttribute("MESSAGGIO", errorpage);
				response.sendRedirect("inviaprenotazione.jsp");
			}
	}
		
		
		//----------------------------------------INSERISCI PRENOTAZIONE PARTE AMMINISTRATORE---------------------------------------------------------------
		
		else if(comando.equals("inserisci2")) {
			Prenotazione p=new Prenotazione();
			p.setCodDottore(Integer.parseInt(request.getParameter("dottore")));
			p.setCodFisc(request.getParameter("cliente"));
			p.setDateTime(request.getParameter("date")+" "+request.getParameter("orario"));
			p.setCodPrestazione(Integer.parseInt(request.getParameter("visita")));
			p.setCommento(request.getParameter("message"));
			
			System.out.println(p.toString());		
			
		try {
			DBManager db=new DBManager();
			db.insertPrenotazione(p);
			String data=db.getItalianDate(request.getParameter("date"));
			String fullName=db.getFullName(request.getParameter("cliente"));
			//String messaggio=request.getParameter("message");
			String dottore=db.getDoctorName(request.getParameter("dottore"));
			String prestazione=  db.getPrestazioneName(request.getParameter("visita"));
			String orario=request.getParameter("orario");
			SendMail sender = new SendMail();
			String RECIPIENT=db.getEmail(request.getParameter("cliente"));
			String[] to = { RECIPIENT }; // list of recipient email addresses
			
			
			String messaggioDaInviare ="<!DOCTYPE html>"
			+ "<html lang='en'>"
			+ " <head>"
			+ "<meta charset='UTF-8'>"
					+ "<meta http-equiv='X-UA-Compatible' content='IE=edge'>"
							+ "<meta name='viewport' content='width=device-width, initial-scale=1.0\'>"
					+ "<title>Messaggio</title>"
					+ "</head>"
					+ "<body style='text-align: center; font-size: larger;'>"
					+ "<p style=\"color: #2C4964; font-size:40px; font-weight: 900; font-family:sans-serif;\">Medilab</p>"
							+ "<p style=\"color: #2C4964; font-size: x-large; font-weight: 900;\">Gentile cliente, Medilab la ringrazia per aver prenotato un appuntamento presso il nostro studio medico.</p>"
									+ "<p>Le riportiamo di seguito i dettagli della prenotazione da lei effettuata:</p>"
									+ "<p>Nome e Cognome :<strong>"+fullName+"</strong></p>"
											+ "<p>In data: <strong>"+data+"</strong> alle ore :<strong>"+orario+"</strong></p>"
											+"<h3>Deve effettuare: <strong>"+prestazione+"</strong> insieme al Dottor: <strong>"+dottore+"</strong></h3>"
			+"<p style=\"color: yellowgreen;\"><strong>Per qualsiasi dubbio o problema non esitare a contattarci tramite telefono o email,siamo a vostra disposizione.</strong></p>"
			+"<p style=\"color: #2C4964; font-size: x-large; font-weight: 900;\">Medilab le augura una buona giornata.</p>"
			+"</body>"
			+"</html>";
			
			
			//invio dell'email con i parametri
			sender.sendFromGMail(to, "Medilab,Prenotazione eseguita",messaggioDaInviare);
			
			//div che contiene il messaggio di ringraziamento,ovvero l'operazione il codice è stato eseguito correttamente
			String thankyoupage="<div class=\"jumbotron text-center\">\r\n"
					+ "  <p class=\"lead\" style=\"color: green; font-weight: bold;\">Il tuo appuntamento è stato registrato correttamente!<i class=\"fa fa-check-circle\" aria-hidden=\"true\"></i></p>\r\n"
					+ "  <hr>\r\n"
					+ "</div>";
			
			
			request.getSession().setAttribute("MESSAGGIO", thankyoupage);
			response.sendRedirect("gestprenotazioni?cmd=viewall");
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Operazione non andata a buon fine");
			System.out.println("Causa errore: Record della prenotazione è già esistente");
			String errorpage="<div class=\"jumbotron text-center\">\r\n"
					+ "  <h5 class=\"lead\" style=\"color: red; font-weight: bold;\">Spiacenti<i class=\"fa fa-times\" aria-hidden=\"true\"></i> non è possibile prenotare l'appuntamento per l'orario scelto.</h5>\r\n"
					+ "  <p class=\"lead\"><strong>La preghiamo di cambiare orario da lei scelto :</strong> Orario già occupato da un altro cliente.</p>\r\n"
					+ "  <hr>\r\n"
					+ "</div>";
			request.getSession().setAttribute("MESSAGGIO", errorpage);
			response.sendRedirect("gestprenotazioni?cmd=viewall");
		}
}
		
		else if(comando.equals("getoptions")) {
			String dipartimento=request.getParameter("select-dipartimenti");
			System.out.println("dipartimento slezionato dall'utente :"+dipartimento);
			ArrayList<Dottore> elencoDottori= new ArrayList<Dottore>();
			ArrayList<Prestazione> elencoPrestazioni= new ArrayList<Prestazione>();
			try 
			{
				DBManager db=new DBManager();
				elencoDottori=db.getDottori(dipartimento);
				elencoPrestazioni=db.getPrestazioni(dipartimento);
				db.close();
				
				//ELENCO DOTTORI
				request.getSession().setAttribute("ELENCO_DOTTORI", elencoDottori);
				//ELENCO PRESTAZIONI 
				request.getSession().setAttribute("ELENCO_PRESTAZIONI", elencoPrestazioni);
				//DIPARTIMENTO SELEZIONATO 
				request.getSession().setAttribute("DIPARTIMENTO", dipartimento);
				RequestDispatcher rd = request.getRequestDispatcher("inviaprenotazione.jsp");
				rd.forward(request, response);
				//System.out.println("Lista dei dottori \n"+elencoDottori);
				//System.out.println("Lista delle prestazioni \n"+elencoPrestazioni);
				
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			}
		
		
		
		//-----------------------GET OPTION PARTE AMMINISTRATORE---------------------------------------
		else if(comando.equals("getoptions2")) {
			String dipartimento=request.getParameter("select-dipartimenti");
			System.out.println("dipartimento slezionato dall'utente :"+dipartimento);
			ArrayList<Dottore> elencoDottori= new ArrayList<Dottore>();
			ArrayList<Prestazione> elencoPrestazioni= new ArrayList<Prestazione>();
			ArrayList<Utente> elencoClienti= new ArrayList<Utente>();
			try 
			{
				DBManager db=new DBManager();
				elencoDottori=db.getDottori(dipartimento);
				elencoPrestazioni=db.getPrestazioni(dipartimento);
				elencoClienti=db.getClienti();
				db.close();
				
				//ELENCO DOTTORI IN SESSIONE
				request.setAttribute("ELENCO_DOTTORI", elencoDottori);
				//ELENCO PRESTAZIONI IN SESSIONE
				request.setAttribute("ELENCO_PRESTAZIONI", elencoPrestazioni);
				//DIPARTIMENTO SELEZIONATO IN SESSIONE
				request.setAttribute("DIPARTIMENTO", dipartimento);
				//ELENCO CLIENTI
				request.setAttribute("ELENCO_CLIENTI", elencoClienti);
				RequestDispatcher rd = request.getRequestDispatcher("inserisciPrenotazione.jsp");
				rd.forward(request, response);
				//System.out.println("Lista dei dottori \n"+elencoDottori);
				//System.out.println("Lista delle prestazioni \n"+elencoPrestazioni);
				
				
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("404.jsp");
				// TODO: handle exception
			}
			}
				
		
		else if(comando.equals("elimina")) {

			
			if(request.getParameterValues("check")==null) {
				System.out.println("nessun elemento selezionato");
			}
			else {
				String idPrenotazioni[]=request.getParameterValues("check");
				System.out.println("PRENOTAZIONI DA ELIMINARE :");
				for(int i=0;i<idPrenotazioni.length;i++) {
				System.out.println("ID PRENOTAZIONE = "+idPrenotazioni[i]);
					}
				DBManager db;
				try {
					db = new DBManager();
					db.deletePrenotazioni(idPrenotazioni);
					db.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				}
			
			response.sendRedirect("gestprenotazioni?cmd=viewall");
			
			
		}
		//funzione che cambio lo stato della Prenotazione in:Eseguita
		else if(comando.equals("eseguita")) {

			
			if(request.getParameterValues("check")==null) {
				System.out.println("nessun elemento selezionato");
			}
			else {
				String idPrenotazioni[]=request.getParameterValues("check");
				for(int i=0;i<idPrenotazioni.length;i++) {
					}
				DBManager db;
				try {
					db = new DBManager();
					db.setStatoPrenotazioni(idPrenotazioni, "Eseguita");
					db.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				}

			response.sendRedirect("gestprenotazioni?cmd=viewall");
			
			
		}
		
		else if(comando.equals("view")) {
            response.sendRedirect("gestprenotazioni?cmd=viewall");
        }
		
		//funzione che cambio lo stato della Prenotazione in:Non eseguita
		else if(comando.equals("noneseguita")) {

			
			if(request.getParameterValues("check")==null) {
				System.out.println("nessun elemento selezionato");
			}
			else {
				String idPrenotazioni[]=request.getParameterValues("check");
				for(int i=0;i<idPrenotazioni.length;i++) {
					}
				DBManager db;
				try {
					db = new DBManager();
					db.setStatoPrenotazioni(idPrenotazioni, "Non eseguita");
					db.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				}

			response.sendRedirect("gestprenotazioni?cmd=viewall");
			
			
		}
		
		//funzione che cambio lo stato della Prenotazione in:Attesa
		else if(comando.equals("attesa")) {
			
			if(request.getParameterValues("check")==null) {
				System.out.println("nessun elemento selezionato");
			}
			else {
				String idPrenotazioni[]=request.getParameterValues("check");
				for(int i=0;i<idPrenotazioni.length;i++) {
					}
				DBManager db;
				try {
					db = new DBManager();
					db.setStatoPrenotazioni(idPrenotazioni, "In attesa");
					db.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				}
			
			response.sendRedirect("gestprenotazioni?cmd=viewall");
			
		}
		
		else if(comando.equals("modifica")) {
			Prenotazione p=new Prenotazione();
			p.setCodPrenotazione(Integer.parseInt(request.getParameter("codPrenotazione")));	
			p.setCodDottore(Integer.parseInt(request.getParameter("codDottore")));	
			p.setCodFisc(request.getParameter("cf"));		
			p.setDateTime(request.getParameter("date")+" "+request.getParameter("orario"));	
			p.setCodPrestazione(Integer.parseInt(request.getParameter("codPrestazione")));	
			p.setCommento(request.getParameter("message"));
			//System.out.println(p.toString());		
			
		try {
			DBManager db=new DBManager();
			db.modificaPrenotazione(p);	
			db.close();
			response.sendRedirect("gestprenotazioni?cmd=viewall");
			}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Operazione non andata a buon fine");
			System.out.println("Causa errore: Record della prenotazione è già esistente");
			String errorpage="<div class=\"jumbotron text-center\">\r\n"
					+ "  <h1 class=\"display-3\" style=\"color: red; font-weight: bold;\">Spiacenti<i class=\"fa fa-times\" aria-hidden=\"true\"></i> non è possibile prenotare l'appuntamento per l'orario scelto.</h1>\r\n"
					+ "  <p class=\"lead\"><strong>La preghiamo di cambiare orario da lei scelto :</strong> Orario già occupato da un altro cliente.</p>\r\n"
					+ "  <hr>\r\n"
					+ "</div>";
			request.getSession().setAttribute("MESSAGGIO", errorpage);
			response.sendRedirect("404.jsp");
		}
}
		
		else if(comando.equals("stampaFattura"))
		{
			
			createFatturaPDF pdf;
			Fattura f = new Fattura();
			f.setCodicePrenotazione(request.getParameter("codPrenotazione"));
			f.setPrezzo(Integer.parseInt(request.getParameter("Prezzo")));
			String file="/home/sebastian/git/StudioMedico/PrenotazioniStudioMedico/WebContent/stampe/fattura.pdf";
		try {
			pdf=new createFatturaPDF();
			pdf.stampa(f);
			System.out.println("funzione stampa fattura eseguita");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		

		try {
			DBManager db=new DBManager();
			db.insertFattura(f,file);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		/*
		 * //pdf convertito in flusso di byte e inviato all'interno del browser
		 * 
		 * OutputStream out =null; String filePath=
		 * "/home/sebastian/git/StudioMedico/PrenotazioniStudioMedico/WebContent/stampe/fattura.pdf";
		 * File file=new File(filePath); if(file.exists()) { out =
		 * response.getOutputStream();
		 * response.setContentType("application/pdf;charset=UTF-8");
		 * response.setHeader("Content-Disposition","inline;filename=fattura.pdf");
		 * FileInputStream fis = new FileInputStream(file); ByteArrayOutputStream bos =
		 * new ByteArrayOutputStream(); byte[] buf = new byte [4096];
		 * 
		 * try { for (int readNum; (readNum = fis.read(buf)) != -1;) { bos.write(buf, 0
		 * ,readNum); } } catch (Exception e) { e.printStackTrace(); }
		 * 
		 * byte[] bytes =bos.toByteArray(); int lengthRead = 0; InputStream is = new
		 * ByteArrayInputStream(bytes);
		 * 
		 * while ((lengthRead = is.read(buf)) > 0) { out.write(buf); }
		 * 
		 * fis.close(); bos.close(); is.close(); out.close();
		 * 
		 * }
		 */
		
		
		response.sendRedirect("visualizzaFatture.jsp");
		
		}

	}

}
