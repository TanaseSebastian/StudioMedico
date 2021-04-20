package it.meucci;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GestioneUtentiServlet
 */
@WebServlet("/gestutenti")
public class GestioneUtentiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestioneUtentiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comando = request.getParameter("cmd");
		DBManager db;
		
		if(comando.equals("viewall")) {
			ArrayList<Utente> elenco= new ArrayList<Utente>();
			try 
			{
				db= new DBManager();
				elenco=db.getClienti();
				db.close();
				
				//ELENCO CLIENTI
				request.setAttribute("ELENCO_CLIENTI", elenco);
				RequestDispatcher rd = request.getRequestDispatcher("visualizzaClienti.jsp");
				rd.forward(request, response);
				
				
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("404.jsp");
				// TODO: handle exception
			}
		}
		//è un viewall per gli amministratori
		else if(comando.equals("view")) {
			ArrayList<Utente> elenco= new ArrayList<Utente>();
			try 
			{
				db= new DBManager();
				elenco=db.getAmministratori();
				db.close();
				
				//ELENCO AMMINISTRATORI
				request.setAttribute("ELENCO_AMMINISTRATORI", elenco);
				RequestDispatcher rd = request.getRequestDispatcher("VisualizzaAmministratori.jsp");
				rd.forward(request, response);
				
				
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("404.jsp");
				// TODO: handle exception
			}
		}
		
		else if(comando.equals("visualizza"))
		{
			
			String id= request.getParameter("id");
			Utente c=new Utente();
			try {
				db= new DBManager();
				c = db.getCliente(id);
				db.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//System.out.println(p.toString());
			request.setAttribute("CLIENTE", c);
			RequestDispatcher rd = request.getRequestDispatcher("dettaglioCliente.jsp");
			rd.forward(request, response);

		}
		
		// visualizza Amministratore
		else if(comando.equals("visualizza2"))
		{
			
			String id= request.getParameter("id");
			Utente a=new Utente();
			try {
				db= new DBManager();
				a = db.getAmministratore(id);
				db.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//System.out.println(p.toString());
			request.setAttribute("AMMINISTRATORE", a);
			RequestDispatcher rd = request.getRequestDispatcher("dettaglioAmministratore.jsp");
			rd.forward(request, response);

		}
		
		//funzione che aggiorna i dati di un cliente
		else if(comando.equals("aggiorna"))
			{
					
					String id= request.getParameter("id");
					String utente= request.getParameter("utente");
					Utente u=new Utente();
					try {
						db= new DBManager();
						u = db.getUtente(id);
						db.close();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					//System.out.println(p.toString());
					request.setAttribute("UTENTE", u);
					request.setAttribute("tipoutente", utente);
					RequestDispatcher rd = request.getRequestDispatcher("aggiornaUtente.jsp?");
					rd.forward(request, response);

			}
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
String comando = request.getParameter("cmd");;
		
		if(comando.equals("clientregister")) {
		String cf = request.getParameter("codiceFiscale");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		System.out.println(cf+ " "+nome+" "+cognome+" "+username+" "+email+" "+phone+" "+password+" "+confirm_password);
		try {
			DBManager db = new DBManager();
			if (db.checkUsername(username) == false) {
				db.insertRegistration(cf,nome, cognome, username, email, phone, password);
				response.sendRedirect("gestutenti?cmd=viewall");
			} else
				response.sendRedirect("nuovoCliente.jsp");
			db.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		else if(comando.equals("adminregister")) {
			String cf = request.getParameter("codiceFiscale");
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String confirm_password = request.getParameter("confirm_password");
			System.out.println(cf+ " "+nome+" "+cognome+" "+username+" "+email+" "+phone+" "+password+" "+confirm_password);
			try {
				DBManager db = new DBManager();
				if (db.checkUsername(username) == false) {
					db.insertAmministrator(cf,nome, cognome, username, email, phone, password);
					response.sendRedirect("gestutenti?cmd=view");
				} else
					response.sendRedirect("nuovoAmministratore.jsp");
				db.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(comando.equals("resetPassword"))
		{
			String cf = request.getParameter("codiceFiscale");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			try
			{
				DBManager db = new DBManager();
				db.resetPassword(email, password);
				
				//div che contiene il messaggio di ringraziamento,ovvero l'operazione il codice è stato eseguito correttamente
				String passCorretta="<div class=\"jumbotron text-center\">\r\n"
						+ "  <p class=\"lead\" style=\"color: green; font-weight: bold;\">La password è stata modificata con successo!<i class=\"fa fa-check-circle\" aria-hidden=\"true\"></i></p>\r\n"
						+ "  <hr>\r\n"
						+ "</div>";
				
				
				request.getSession().setAttribute("MESSAGGIO", passCorretta);
				
				response.sendRedirect("gestutenti?cmd=aggiorna&id="+cf);
				
			} 
			catch (Exception e) {
				e.printStackTrace();
				
				String errorpage="<div class=\"jumbotron text-center\">\r\n"
						+ "  <h5 class=\"lead\" style=\"color: red; font-weight: bold;\">Spiacenti<i class=\"fa fa-times\" aria-hidden=\"true\"></i> la password non è stata modificata</h5>\r\n"		
						+ "  <hr>\r\n"
						+ "</div>";
				request.getSession().setAttribute("MESSAGGIO", errorpage);
				
				response.sendRedirect("gestutenti?cmd=aggiorna&id="+cf);
			}
		}
		
		
		else if(comando.equals("modifica")) {
			String cf = request.getParameter("codiceFiscale");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String username = request.getParameter("username");
			String tipoutente = request.getParameter("tipoutente");
			
		try {
			DBManager db=new DBManager();
			db.modificaCliente(cf,email,phone,username);	
			db.close();
			//div che contiene il messaggio di ringraziamento,ovvero l'operazione il codice è stato eseguito correttamente
			String modCorretto="<div class=\"jumbotron text-center\">\r\n"
					+ "  <p class=\"lead\" style=\"color: green; font-weight: bold;\">Il cliente è stato modificato con successo!<i class=\"fa fa-check-circle\" aria-hidden=\"true\"></i></p>\r\n"
					+ "  <hr>\r\n"
					+ "</div>";
			
			
			request.getSession().setAttribute("MESSAGGIO", modCorretto);
			if (tipoutente.equals("amministratore")) {
				response.sendRedirect("gestutenti?cmd=view");
			}
			else
			response.sendRedirect("gestutenti?cmd=viewall");
			}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Operazione non andata a buon fine");
			System.out.println("Causa errore: Record della prenotazione è già esistente");
			String errorpage="<div class=\"jumbotron text-center\">\r\n"
					+ "  <h1 class=\"display-3\" style=\"color: red; font-weight: bold;\">Spiacenti<i class=\"fa fa-times\" aria-hidden=\"true\"></i> non è possibile modificare il cliente.</h1>\r\n"
					+ "  <hr>\r\n"
					+ "</div>";
			request.getSession().setAttribute("MESSAGGIO", errorpage);
			response.sendRedirect("gestutenti?cmd=viewall");
		}
	}
		
			else if(comando.equals("elimina")) {
			if(request.getParameterValues("check")==null) {
				System.out.println("nessun elemento selezionato");
			}
			else {
				String idCliente[]=request.getParameterValues("check");
				System.out.println("CLIENTI DA ELIMINARE :");
				for(int i=0;i<idCliente.length;i++) {
				System.out.println("ID CLIENTE = "+idCliente[i]);
					}
				DBManager db;
				try {
					db = new DBManager();
					db.deleteClienti(idCliente);
					db.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}
			response.sendRedirect("gestutenti?cmd=viewall");
		}
		
			else if(comando.equals("eliminaAmm")) {
				if(request.getParameterValues("check")==null) {
					System.out.println("nessun elemento selezionato");
				}
				else {
					String idAmm[]=request.getParameterValues("check");
					System.out.println("AMMINISTRATORI DA ELIMINARE :");
					for(int i=0;i<idAmm.length;i++) {
					System.out.println("ID AMMINISTRATORE = "+idAmm[i]);
						}
					DBManager db;
					try {
						db = new DBManager();
						db.deleteClienti(idAmm);
						db.close();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					}
				response.sendRedirect("gestutenti?cmd=view");
			}
		
			else if(comando.equals("entries")) {
				String requestPage=request.getParameter("page");
				System.out.println("La request page è "+requestPage);
				String righe=request.getParameter("select-entries");
				request.setAttribute("numeroRighe", righe);
				RequestDispatcher rd = request.getRequestDispatcher(requestPage);
				rd.forward(request, response);
			}

	}
}
