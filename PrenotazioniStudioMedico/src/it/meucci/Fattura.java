package it.meucci;

public class Fattura {

	String codiceFattura,codicePrenotazione,dataEmissione;
	int prezzo;
	public String getCodiceFattura() {
		return codiceFattura;
	}
	public void setCodiceFattura(String codiceFattura) {
		this.codiceFattura = codiceFattura;
	}
	public String getCodicePrenotazione() {
		return codicePrenotazione;
	}
	public void setCodicePrenotazione(String codicePrenotazione) {
		this.codicePrenotazione = codicePrenotazione;
	}
	public String getDataEmissione() {
		return dataEmissione;
	}
	public void setDataEmissione(String dataEmissione) {
		this.dataEmissione = dataEmissione;
	}
	public int getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(int prezzo) {
		this.prezzo = prezzo;
	}
	public Fattura(String codiceFattura, String codicePrenotazione, String dataEmissione, int prezzo) {
		super();
		this.codiceFattura = codiceFattura;
		this.codicePrenotazione = codicePrenotazione;
		this.dataEmissione = dataEmissione;
		this.prezzo = prezzo;
	}
	public Fattura() {
		super();
	}
	@Override
	public String toString() {
		return "Fattura [codiceFattura=" + codiceFattura + ", codicePrenotazione=" + codicePrenotazione
				+ ", dataEmissione=" + dataEmissione + ", prezzo=" + prezzo + "]";
	}
	
	
}
