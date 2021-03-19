package it.meucci;

public class Prenotazione {

	private int codPrenotazione;
	private String dateTime;
	private String commento;
	private String 	tipo;
	private String 	codFisc;
	private int codDottore;
	
	
	public Prenotazione() {
		super();
	}


	public Prenotazione(int codPrenotazione, String dateTime, String commento, String tipo, String codFisc,
			int codDottore) {
		super();
		this.codPrenotazione = codPrenotazione;
		this.dateTime = dateTime;
		this.commento = commento;
		this.tipo = tipo;
		this.codFisc = codFisc;
		this.codDottore = codDottore;
	}


	public int getCodPrenotazione() {
		return codPrenotazione;
	}


	public void setCodPrenotazione(int codPrenotazione) {
		this.codPrenotazione = codPrenotazione;
	}


	public String getDateTime() {
		return dateTime;
	}


	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}


	public String getCommento() {
		return commento;
	}


	public void setCommento(String commento) {
		this.commento = commento;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public String getCodFisc() {
		return codFisc;
	}


	public void setCodFisc(String codFisc) {
		this.codFisc = codFisc;
	}


	public int getCodDottore() {
		return codDottore;
	}


	public void setCodDottore(int codDottore) {
		this.codDottore = codDottore;
	}


	@Override
	public String toString() {
		return "Prenotazione [codPrenotazione=" + codPrenotazione + ", dateTime=" + dateTime + ", commento=" + commento
				+ ", tipo=" + tipo + ", codFisc=" + codFisc + ", codDottore=" + codDottore + "]";
	}

	
	
	
	
	
}
