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
		
	}

}
