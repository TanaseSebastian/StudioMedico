package it.meucci;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String dipartimento=request.getParameter("select-dipartimenti");
		System.out.println("dipartimento slezionato dall'utente :"+dipartimento);
		DBManager db;
		ArrayList<Dottore> elenco= new ArrayList<Dottore>();
		try 
		{
			db= new DBManager();
			elenco=db.getDottori(dipartimento);
			db.close();
			
			//ELENCO DOTTORI IN SESSIONE
			request.getSession().setAttribute("ELENCO_DOTTORI", elenco);
			//DIPARTIMENTO SELEZIONATO IN SESSIONE
			request.getSession().setAttribute("DIPARTIMENTO", dipartimento);
			response.sendRedirect("inviaprenotazione.jsp");
			System.out.println(elenco);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String comando = request.getParameter("cmd");
		ArrayList<Prenotazione> elenco= new ArrayList<Prenotazione>();
		
		if(comando.equals("inserisci")) {
		Prenotazione p=new Prenotazione();
		p.setCodDottore(Integer.parseInt(request.getParameter("dottore")));
		p.setCodFisc(request.getParameter("cf"));
		p.setDateTime(request.getParameter("date")+" "+request.getParameter("orario"));
		p.setTipo(request.getParameter("visita"));
		p.setCommento(request.getParameter("message"));
		
		//System.out.println(p.toString());
		
		
	try {
		DBManager db=new DBManager();
		db.insertPrenotazione(p);
		
		//elenco=db.getCustomers();
		//elenco clienti in sessione
		//request.getSession().setAttribute("ELENCO_CLIENTI", elenco);
		//response.sendRedirect("clienti.jsp");
		String thankyoupage="<div class=\"jumbotron text-center\">\r\n"
				+ "  <h1 class=\"display-3\" style=\"color: green; font-weight: bold;\">Grazie!Il tuo appuntamento è stato registrato correttamente<i class=\"fa fa-check-circle\" aria-hidden=\"true\"></i></h1>\r\n"
				+ "  <p class=\"lead\"><strong>Verifica la tua email! </strong>Ti abbiamo mandato un promemoria contenente i dettagli della prenotazione.</p>\r\n"
				+ "  <hr>\r\n"
				+ "</div>";
		request.getSession().setAttribute("MESSAGGIO", thankyoupage);
		response.sendRedirect("inviaprenotazione.jsp");
	}
	catch(Exception e){
		e.printStackTrace();
		System.out.println("Operazione non andata a buon fine");
		String errorpage="<div class=\"jumbotron text-center\">\r\n"
				+ "  <h1 class=\"display-3\" style=\"color: red; font-weight: bold;\">Spiacenti<i class=\"fa fa-times\" aria-hidden=\"true\"></i> non è possibile prenotare l'appuntamento per l'orario scelto.</h1>\r\n"
				+ "  <p class=\"lead\"><strong>La preghiamo di cambiare orario da lei scelto :</strong> Orario già occupato da un altro cliente.</p>\r\n"
				+ "  <hr>\r\n"
				+ "</div>";
		request.getSession().setAttribute("MESSAGGIO", errorpage);
		response.sendRedirect("inviaprenotazione.jsp");
	}
	

	
	
	}
		
		
		
		
		
	}

}
