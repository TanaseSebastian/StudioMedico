package it.meucci;
import java.sql.*;
import java.util.ArrayList;


public class DBManager {

	private Connection connessione;
	private Statement query;
	private ResultSet rs;
	private String urlDB;
	private String userDB;
	private String pwDB;

	public DBManager() throws Exception {

		urlDB = "jdbc:mysql://localhost:3306/STUDIOMEDICO?serverTimezone=UTC";
		userDB = "root";
		pwDB = "";

		// creazione della connessione
		// registrazione dei driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// instauro connessione al db
		connessione = DriverManager.getConnection(urlDB, userDB, pwDB);

		// creo la query
		query = connessione.createStatement();
	}

	
	public int verificaCredenziali(String username, String password) throws Exception {
		String sql = "SELECT * FROM UTENTI WHERE USERNAME=? AND PSW=md5(?);";
		PreparedStatement pstm=connessione.prepareStatement(sql);
		pstm.setString(1,username);
		pstm.setString(2,password);
		rs= pstm.executeQuery();
		int count = 0;

		while (rs.next()) {
		    ++count;
		    // Conto il numero di righe
		}
		return count;
	}
	
	//FUNZIONE CHE RESTITUISCE GLI UTENTI
		public Utente getUser(String username) throws Exception 
		{
			String sql="SELECT * FROM UTENTI WHERE USERNAME=?";
			PreparedStatement pstm=connessione.prepareStatement(sql);
			pstm.setString(1,username);
			rs= pstm.executeQuery();
			Utente user=new Utente();
			while(rs.next())
			{
				user=new Utente(rs.getString(1),rs.getString(2),rs.getString(3),
	                    rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)); 
			}
			return user;
		}

	public boolean checkUsername(String username) throws Exception {
		String q = "SELECT * FROM UTENTI WHERE USERNAME='" + username + "';";
		rs = query.executeQuery(q);
		return rs.next();
	}

	public int insertRegistration(String cf, String nome, String cognome, String username, String email,String phone, String password)
			throws Exception {
		String sql = "INSERT INTO utenti(CF,NOME,COGNOME,USERNAME,EMAIL,PHONE,PSW) VALUES (?,?,?,?,?,?,md5(?));";
		PreparedStatement pstm=connessione.prepareStatement(sql);
		pstm.setString(1,cf);
		pstm.setString(2,nome);
		pstm.setString(3,cognome);
		pstm.setString(4,username);
		pstm.setString(5,email);
		pstm.setString(6,phone);
		pstm.setString(7,password);
		int nRighe= pstm.executeUpdate();
		return nRighe;
	}

    //metodo che mi verifica se l'email esiste nel database-----------------
    public boolean controlEmail(String email) throws SQLException {
		 String email_validation="";
		 
       	 String sql = "Select * from UTENTI Where Email='" + email +"';";
            rs = query.executeQuery(sql);

        	while(rs.next())
   		{
              email_validation = rs.getString("Email");
   		}
        	if(email.equals(email_validation)){
        		System.out.println("email true");
        		return true;
        		
        	}
        	
        	else
        		System.out.println("email false");
        		return false;
    }
    //----------------------------------------------------------------------------
	
  //metodo che resetta la password------------------------------------------
  		public void resetPassword(String email,String password) throws SQLException {
  			
  			try {
  	  			Statement update = connessione.createStatement();
  	  			 String sql = "UPDATE Utenti "+ "SET" + " PSW = "+"md5('"+password+"') " + "WHERE"+ " Email = "+"'"+email+"'; ";
  	  			 System.out.println(sql);
  	  			 update.executeUpdate(sql);
  	  		        
  	  		  System.out.println("password modificata ");
			} catch (Exception e) {
				e.printStackTrace();
			}

  		  
  			
  		}
  		//----------------------------------------------------------------------------------
	
	
  		//funzione che mi resituisce i dottori di un particolare dipartimento
  		public ArrayList<Dottore> getDottori(String dipartimento) throws Exception 
  		{
  			ArrayList<Dottore> elenco = new ArrayList<Dottore>();
  			
  			String sql="SELECT * FROM DOTTORI WHERE codDipartimento ="+dipartimento+";";
  			rs=query.executeQuery(sql);
  			Dottore d;
  			
  			while(rs.next())
  			{
  				d=new Dottore(rs.getInt(1),rs.getString(2),rs.getString(3),
  	                    rs.getString(4),rs.getString(5),rs.getInt(6)); 
  				elenco.add(d);
  			}
  			
  			System.out.println("DOTTORI CARICATI: " + elenco.size());
  			
  			return elenco;
  		}
  		
  		
  		
  		//funzione che permette l'inserimento di una prenotazione
  		public int insertPrenotazione(Prenotazione p) throws Exception
  		{
  		int nRighe=0;
  		String sqlInsert = "INSERT INTO PRENOTAZIONI(codFisc,codDottore,tipo,dateTime,commento) VALUES (?,?,?,?,?);";
  		PreparedStatement pstm=connessione.prepareStatement(sqlInsert);
  		pstm.setString(1, p.getCodFisc());
  		pstm.setInt(2, p.getCodDottore());
  		pstm.setString(3, p.getTipo());
  		pstm.setString(4, p.getDateTime());
  		pstm.setString (5, p.getCommento());
  		nRighe= pstm.executeUpdate();
  		return nRighe;
  		}
  		
  		
  		
  		/*FUNZIONE CHE RESTITUISCE L'EMAIL DI UN UTENTE
		public String getEmail(String cf) throws Exception 
		{
			String sql="SELECT EMAIL FROM UTENTI WHERE CF=?";
			PreparedStatement pstm=connessione.prepareStatement(sql);
			pstm.setString(1,cf);
			rs= pstm.executeQuery();
			String email;
			while(rs.next())
			{
				email=rs.getString(1); 
			}
			return email;
		}*/
  		
  		
	
	//--------------------------INIZIO PARTE DEL DB MANAGER CHE GESTISCE LE RICHIESTE SUI CLIENTI---------------------------
	
	/*public ArrayList<Cliente> getCustomers() throws Exception 
	{
		ArrayList<Cliente> elenco = new ArrayList<Cliente>();
		
		String sql="SELECT * FROM CLIENTI;";
		rs=query.executeQuery(sql);
		Cliente c;
		
		while(rs.next())
		{
			c=new Cliente(rs.getString(1),rs.getString(2),rs.getString(3),
                    rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),
                    rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11)); 
			elenco.add(c);
		}
		
		System.out.println("CLIENTI CARICATI: " + elenco.size());
		
		return elenco;
	}
	
	public int deleteCustomer(String id) throws Exception 
	{
		String deleteSql="DELETE FROM CLIENTI WHERE CUSTOMERID = '"+id+"';";
		
		int nRighe=query.executeUpdate(deleteSql);
		
		return nRighe;
	}
	
	public int insertCustomer(Cliente c) throws Exception
	{
	int nRighe=0;
	String sqlInsert = "INSERT INTO CLIENTI VALUES (?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement pstm=connessione.prepareStatement(sqlInsert);
	pstm.setString(1, c.getId());
	pstm.setString(2, c.getCompanyName());
	pstm.setString(3, c.getContactName ());
	pstm.setString(4, c.getContactTitle());
	pstm.setString (5, c.getAddress());
	pstm.setString(6, c.getCity());
	pstm.setString(7, c.getRegion());
	pstm.setString(8, c.getPostalCode());
	pstm.setString (9, c.getCountry());
	pstm.setString(10, c.getPhone());
	pstm.setString(11, c.getFax());
	nRighe= pstm.executeUpdate();
	return nRighe;
	}
	
	
	public int modifyCustomer(Cliente c) throws Exception
	{
	int nRighe=0;
	String sqlInsert = "UPDATE CLIENTI\r\n"
			+ "SET CustomerID = ?, CompanyName= ?, ContactName= ?, ContactTitle= ?, Address= ?, City= ?, Region= ?, PostalCode= ?, Country= ?, Phone= ?, Fax= ? \r\n"
			+ "WHERE CustomerID = ?;";
	PreparedStatement pstm=connessione.prepareStatement(sqlInsert);
	pstm.setString(1, c.getId());
	pstm.setString(2, c.getCompanyName());
	pstm.setString(3, c.getContactName ());
	pstm.setString(4, c.getContactTitle());
	pstm.setString (5, c.getAddress());
	pstm.setString(6, c.getCity());
	pstm.setString(7, c.getRegion());
	pstm.setString(8, c.getPostalCode());
	pstm.setString (9, c.getCountry());
	pstm.setString(10, c.getPhone());
	pstm.setString(11, c.getFax());
	pstm.setString(12, c.getId());
	nRighe= pstm.executeUpdate();
	return nRighe;
	}
	//--------------------------FINE PARTE DEL DB MANAGER CHE GESTISCE LE RICHIESTE SUI CLIENTI---------------------------
	
	
	
	
	
	
	//--------------------------INZIO PARTE DEL DB MANAGER CHE GESTISCE LE RICHIESTE SUI PRODOTTI---------------------------
	
	//FUNZIONE CHE RESTITUISCE ELENCO PRODOTTI
	public ArrayList<Prodotto> getProducts() throws Exception 
	{
		ArrayList<Prodotto> elenco = new ArrayList<Prodotto>();
		
		String sql="SELECT * FROM Prodotti;";
		rs=query.executeQuery(sql);
		Prodotto p;
		
		while(rs.next())
		{
			p=new Prodotto(rs.getInt(1),rs.getString(2),rs.getInt(3),
                    rs.getInt(4),rs.getString(5),rs.getFloat(6),rs.getInt(7),
                    rs.getInt(8),rs.getInt(9),rs.getInt(10)); 
			elenco.add(p);
		}
		
		System.out.println("PRODOTTI CARICATI: " + elenco.size());
		
		return elenco;
	}
	
	
	//funzione che elimina un  prodotto
	public int deleteProduct(String id) throws Exception 
	{
		String deleteSql="DELETE FROM PRODOTTI WHERE ProductID = '"+id+"';";
		
		int nRighe=query.executeUpdate(deleteSql);
		
		return nRighe;
	}
	
	
	//FUNZIONE CHE INSERISCE UN NUOVO PRODOTTO
	public int insertProduct(Prodotto p) throws Exception
	{
	int nRighe=0;
	//essendo product id in autoincrement per evitare problemi non lo faccio inserire all'utente
	String sqlInsert = "INSERT INTO PRODOTTI(\r\n"
			+ "ProductName,\r\n"
			+ "SupplierID,\r\n"
			+ "CategoryID,\r\n"
			+ "QuantityPerUnit,\r\n"
			+ "UnitPrice,\r\n"
			+ "UnitsInStock,\r\n"
			+ "UnitsOnOrder,\r\n"
			+ "ReorderLevel,\r\n"
			+ "Discontinued) VALUES (?,?,?,?,?,?,?,?,?)";
	PreparedStatement pstm=connessione.prepareStatement(sqlInsert);
	pstm.setString(1,  p.getProductName());
	pstm.setInt(2, p.getSupplierID());
	pstm.setInt(3, p.getCategoryID());
	pstm.setString(4, p.getQuantityPerUnit());
	pstm.setFloat(5,p.getUnitPrice());
	pstm.setInt(6,p.getUnitsInStock());
	pstm.setInt(7,p.getUnitsOnOrder());
	pstm.setInt (8,p.getReorderLevel());
	pstm.setInt(9,p.getDiscontinued());
	nRighe= pstm.executeUpdate();
	return nRighe;
	}
	
	//FUNZIONE CHE MODIFICA UN PRODOTTO
	public int modifyProduct(Prodotto p) throws Exception
	{
	int nRighe=0;
	String sqlInsert = "UPDATE PRODOTTI\r\n"
			+ "SET ProductID= ?, ProductName= ?, SupplierID= ?, CategoryID= ?, QuantityPerUnit= ?, UnitPrice= ?, UnitsInStock= ?, UnitsOnOrder= ?, ReorderLevel= ?, Discontinued= ? \r\n"
			+ "WHERE ProductID= ?;";
	PreparedStatement pstm=connessione.prepareStatement(sqlInsert);
	pstm.setInt(1, p.getProductID());
	pstm.setString(2,  p.getProductName());
	pstm.setInt(3, p.getSupplierID());
	pstm.setInt(4, p.getCategoryID());
	pstm.setString (5, p.getQuantityPerUnit());
	pstm.setFloat(6,p.getUnitPrice());
	pstm.setInt(7,p.getUnitsInStock());
	pstm.setInt(8,p.getUnitsOnOrder());
	pstm.setInt (9,p.getReorderLevel());
	pstm.setInt(10,p.getDiscontinued());
	pstm.setInt(11, p.getProductID());
	nRighe= pstm.executeUpdate();
	return nRighe;
	}
	
	
	
	
	
	//--------------------------FINE PARTE DEL DB MANAGER CHE GESTISCE LE RICHIESTE SUI PRODOTTI---------------------------
	
	
	
	
	
	//--------------------------INIZIO PARTE DEL DB MANAGER CHE GESTISCE LE RICHIESTE SUI ORDINI---------------------------
	
	//RESTITUISCE TUTTI GLI ORDINI
	public ArrayList<Ordini> getOrders() throws Exception 
	{
		ArrayList<Ordini> elenco = new ArrayList<Ordini>();
		
		String sql="SELECT * FROM Ordini;";
		rs=query.executeQuery(sql);
		Ordini o;
		
		while(rs.next())
		{
			o=new Ordini(rs.getInt(1),rs.getString(2),rs.getInt(3),
                    rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),
                    rs.getFloat(8),rs.getString(9),rs.getString(10),rs.getString(11),
                    rs.getString(12),rs.getString(13),rs.getString(14)); 
			elenco.add(o);
		}
		
		System.out.println("ORDINI CARICATI: " + elenco.size());
		
		return elenco;
	}
	
	//restituisce i prodotti in base a due date passate come argomenti di tipo string alla funzione
	public ArrayList<Ordini> searchOrdersBD(String d1,String d2) throws Exception 
	{
		ArrayList<Ordini> elenco = new ArrayList<Ordini>();
		
		String sql="SELECT * FROM Ordini WHERE OrderDate BETWEEN ? AND ? ;";
		//rs=query.executeQuery(sql);
		Ordini o;
		PreparedStatement pstm=connessione.prepareStatement(sql);
		pstm.setString(1,d1);
		pstm.setString(2,d2);
		rs= pstm.executeQuery();
		while(rs.next())
		{
			o=new Ordini(rs.getInt(1),rs.getString(2),rs.getInt(3),
                    rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),
                    rs.getFloat(8),rs.getString(9),rs.getString(10),rs.getString(11),
                    rs.getString(12),rs.getString(13),rs.getString(14)); 
			elenco.add(o);
		}
		
		System.out.println("ORDINI CARICATI: " + elenco.size());
		
		return elenco;
	}
	
	//restituisce gli ordini in base al prodotto selezionato
	public ArrayList<Ordini> searchOrdersFP(String product) throws Exception 
	{
		ArrayList<Ordini> elenco = new ArrayList<Ordini>();
		
		String sql="SELECT * from ordini,dettagliordini,prodotti\r\n"
				+ "WHERE ordini.OrderID=dettagliordini.OrderID\r\n"
				+ "AND dettagliordini.ProductID=prodotti.ProductID\r\n"
				+ "AND prodotti.ProductName= ? ;";
		//rs=query.executeQuery(sql);
		Ordini o;
		PreparedStatement pstm=connessione.prepareStatement(sql);
		pstm.setString(1,product);
		rs= pstm.executeQuery();
		while(rs.next())
		{
			o=new Ordini(rs.getInt(1),rs.getString(2),rs.getInt(3),
                    rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),
                    rs.getFloat(8),rs.getString(9),rs.getString(10),rs.getString(11),
                    rs.getString(12),rs.getString(13),rs.getString(14)); 
			elenco.add(o);
		}
		
		System.out.println("ORDINI CARICATI: " + elenco.size());
		
		return elenco;
	}
	
	
	
	//restituisce gli ordini in base a data e prodotto
	public ArrayList<Ordini> searchOrdersBDAFP(String d1,String d2,String product) throws Exception 
	{
		ArrayList<Ordini> elenco = new ArrayList<Ordini>();
		
		String sql="SELECT * from ordini,dettagliordini,prodotti\r\n"
				+ "WHERE ordini.OrderID=dettagliordini.OrderID\r\n"
				+ "AND dettagliordini.ProductID=prodotti.ProductID\r\n"
				+ "AND prodotti.ProductName=? \r\n"
				+ "AND ordini.OrderDate BETWEEN ? AND ? ;";
		//rs=query.executeQuery(sql);
		Ordini o;
		PreparedStatement pstm=connessione.prepareStatement(sql);
		pstm.setString(1,product);
		pstm.setString(2,d1);
		pstm.setString(3,d2);
		rs= pstm.executeQuery();
		while(rs.next())
		{
			o=new Ordini(rs.getInt(1),rs.getString(2),rs.getInt(3),
                    rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),
                    rs.getFloat(8),rs.getString(9),rs.getString(10),rs.getString(11),
                    rs.getString(12),rs.getString(13),rs.getString(14)); 
			elenco.add(o);
		}
		
		System.out.println("ORDINI CARICATI: " + elenco.size());
		
		return elenco;
	}
	
	
	//restituisce hli ordini in base al prodotto selezionato
		public ArrayList<Ordini> searchOrdersFC(String country) throws Exception 
		{
			ArrayList<Ordini> elenco = new ArrayList<Ordini>();
			
			String sql="SELECT * from ordini,clienti\r\n"
					+ "WHERE ordini.CustomerID=clienti.CustomerID\r\n"
					+ "AND clienti.Country= ? ;";
			//rs=query.executeQuery(sql);
			Ordini o;
			PreparedStatement pstm=connessione.prepareStatement(sql);
			pstm.setString(1,country);
			rs= pstm.executeQuery();
			while(rs.next())
			{
				o=new Ordini(rs.getInt(1),rs.getString(2),rs.getInt(3),
	                    rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),
	                    rs.getFloat(8),rs.getString(9),rs.getString(10),rs.getString(11),
	                    rs.getString(12),rs.getString(13),rs.getString(14)); 
				elenco.add(o);
			}
			
			System.out.println("ORDINI CARICATI: " + elenco.size());
			
			return elenco;
		}
		
	
	
	
	
	
	
	
	//--------------------------FINE PARTE DEL DB MANAGER CHE GESTISCE LE RICHIESTE SUI ORDINI---------------------------
	*/
	
	public void close() throws Exception {
		query.close();
		connessione.close();
	}
}
