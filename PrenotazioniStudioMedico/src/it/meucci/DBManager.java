package it.meucci;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;


public class DBManager{

	private static Properties prop;
	private Connection connessione;
	private Statement query;
	private ResultSet rs;
	private ResultSet rs2;
	private String urlDB;
	private String userDB;
	private String pwDB;

	public DBManager() throws Exception{

		// Leggo le proprietà da file properties
				ReadPropertyFileFromClassPath obj = new ReadPropertyFileFromClassPath();
				prop = obj.loadProperties("DB.properties");
		
		urlDB = prop.getProperty("Url");
		userDB = prop.getProperty("Username");
		pwDB = prop.getProperty("Pasword");
		
		

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
  		
  		
  		
  		
  		
  	//funzione che mi resituisce le prestazioni di un particolare dipartimento
  		public ArrayList<Prestazione> getPrestazioni(String dipartimento) throws Exception 
  		{
  			ArrayList<Prestazione> elenco = new ArrayList<Prestazione>();
  			
  			String sql="SELECT * FROM PRESTAZIONI WHERE codDipartimento ="+dipartimento+";";
  			rs=query.executeQuery(sql);
  			Prestazione p;
  			
  			while(rs.next())
  			{
  				p=new Prestazione(rs.getInt(1),rs.getString(2),rs.getInt(3)); 
  				elenco.add(p);
  			}
  			
  			System.out.println("PRESTAZIONI CARICATE: " + elenco.size());
  			
  			return elenco;
  		}
  		
  		
  		
  		
  		
  		//funzione che permette l'inserimento di una prenotazione
  		public int insertPrenotazione(Prenotazione p) throws Exception
  		{
  		int nRighe=0;
  		String sqlInsert = "INSERT INTO PRENOTAZIONI(codFisc,codDottore,codPrestazione,dateTime,commento) VALUES (?,?,?,?,?);";
  		PreparedStatement pstm=connessione.prepareStatement(sqlInsert);
  		pstm.setString(1, p.getCodFisc());
  		pstm.setInt(2, p.getCodDottore());
  		pstm.setInt(3, p.getCodPrestazione());
  		pstm.setString(4, p.getDateTime());
  		pstm.setString (5, p.getCommento());
  		nRighe= pstm.executeUpdate();
  		return nRighe;
  		}
  		
  		
  		

		//funzione che restituisce la email di un utente
		public String getEmail(String cf)throws Exception {
			String sql="SELECT EMAIL FROM UTENTI WHERE CF="+cf+" ;";
			rs = query.executeQuery(sql);
			String s = "";
			if (rs.next()) {
				String EMAIL = rs.getString("EMAIL");
				s = EMAIL;
			}
			System.out.println(s);
			return s;
		}
		
		
		//funzione che restituisce il nome di un dottore dato il codice identificativo
		public String getDoctorName(String codDottore)throws Exception {
			String sql="SELECT Cognome,Nome FROM DOTTORI WHERE codDottore="+codDottore+" ;";
			rs = query.executeQuery(sql);
			String s = "";
			if (rs.next()) {
				String Cognome= rs.getString("Cognome");
				String Name=rs.getString("Nome");
				s = Cognome+" "+Name;
			}
			System.out.println(s);
			return s;
		}
		
		
		//funzione che restituisce il nome della prestazione dato il codice identificativo
		public String getPrestazioneName(String codPrestazione)throws Exception {
			String sql="SELECT Nome FROM PRESTAZIONI WHERE codPrestazione="+codPrestazione+" ;";
			rs = query.executeQuery(sql);
			String s = "";
			if (rs.next()) {
				String Name = rs.getString("Nome");
				s =Name;
			}
			System.out.println(s);
			return s;
		}

		
		//funzione che restituisce la data in formato italiano
		public String getItalianDate(String date)throws Exception {
			String sql1="  SET lc_time_names = 'it_IT';";
			System.out.println("Stringa arrivata = "+date);
			String sql="select date_format("+"'"+date+"'"+",'%W %d %M %Y') as DATA;";
			System.out.println(sql);
			rs2 = query.executeQuery(sql1);
			rs = query.executeQuery(sql);
			System.out.println("Query scritta");
			String s="";
			if (rs.next()) {
				System.out.println("entrato nell'if");
				String data = rs.getString(1);
				s =data; 
				System.out.println("ho preso la data dal db,data in italiano: "+ s);
			}
			return s;
		}

  		
	
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
