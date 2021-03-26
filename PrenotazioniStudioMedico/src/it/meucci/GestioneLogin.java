package it.meucci;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;



/**
 * Servlet implementation class gestioneLogin
 */
@WebServlet("/gestlogin")
public class GestioneLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestioneLogin() {
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
		
		if(comando.equals("register")) {
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
				response.sendRedirect("login.jsp");
			} else
				response.sendRedirect("registration.jsp");
			db.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	else if(comando.equals("login")) {
	Utente user;
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	try {
		DBManager db = new DBManager();
		int trovati=db.verificaCredenziali(username, password);
		if (trovati==1)
		{
			//UTENTE IN SESSIONE
			user = db.getUser(username);
			request.getSession().setAttribute("SESSION_USER", user);
			if(user.getAMMINISTRATORE().equals("N")) {
				request.getSession().setAttribute("utente_loggato", "true");
				response.sendRedirect("index.jsp");
			}
			else if(user.getAMMINISTRATORE().equals("Y")) {
				response.sendRedirect("app.jsp");
			}
		}
		else
			response.sendRedirect("login.jsp");
		db.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
	
	}
}
