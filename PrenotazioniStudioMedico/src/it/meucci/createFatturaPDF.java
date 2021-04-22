package it.meucci;

import java.awt.Color;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;

public class createFatturaPDF {

	public createFatturaPDF() throws Exception {
		// TODO Auto-generated constructor stub
	}

	public void stampa(Fattura f) throws Exception
	{
		
		DBManager db = new DBManager();
		double prezzo=f.getPrezzo();
		double iva=round((f.getPrezzo()*15)/100, 2);
		double totale=prezzo+iva;
		String nome=db.getPrestazioneName(f.getCodicePrenotazione());
		
		// Leggo le proprietà da file properties
		Properties prop;
		ReadPropertyFileFromClassPath obj = new ReadPropertyFileFromClassPath();
		prop = obj.loadProperties("DB.properties");
		String pathStampe = prop.getProperty("pathStampe");
		String pathStileFattura = prop.getProperty("pathStileFattura");
		
		
		
		String outputFileName = pathStampe+"fattura.pdf";
        // Create a document and add a page to it
        PDDocument document = new PDDocument();
        PDPage page1 = new PDPage(PDRectangle.A4);
            // PDRectangle.LETTER and others are also possible
        PDRectangle rect = page1.getMediaBox();
            // rect can be used to get the page width and height
        document.addPage(page1);

        // Create a new font object selecting one of the PDF base fonts
        PDFont fontPlain = PDType1Font.HELVETICA;
        PDFont fontBold = PDType1Font.HELVETICA_BOLD;
        PDFont fontItalic = PDType1Font.HELVETICA_OBLIQUE;
        PDFont fontMono = PDType1Font.COURIER;

        // Start a new content stream which will hold the content that's about to be created
        PDPageContentStream cos = new PDPageContentStream(document, page1);

        int line = 0;
        // add an image
        try {
            PDImageXObject ximage = PDImageXObject.createFromFile(pathStileFattura, document);
            float scale = 1.27f; // alter this value to set the image size
            cos.drawImage(ximage, 0, 0, ximage.getWidth()*scale, ximage.getHeight()*scale);
        } catch (IOException ioex) {
            System.out.println("No image for you");
        }

		
		  // Define a text content stream using the selected font, move the cursor and draw some text
		  cos.beginText(); cos.setFont(fontBold, 40);
		  cos.setNonStrokingColor(Color.black); cos.newLineAtOffset(200,
		  rect.getHeight() - 50*(++line)); cos.showText("FATTURA"); cos.endText();
		  cos.beginText(); cos.setFont(fontPlain, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(60,
		  rect.getHeight() - 320*(++line)); cos.showText("Medilab S.R.L");
		  cos.endText(); cos.beginText(); cos.setFont(fontPlain, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(60,
		  rect.getHeight() - 220*(++line)); cos.showText("Piazza San.Domenico 13 ");
		  cos.endText(); cos.beginText(); cos.setFont(fontPlain, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(60,
		  rect.getHeight() - 170*(++line)); cos.showText("73042,Casarano(LE)");
		  cos.endText(); cos.beginText(); cos.setFont(fontPlain, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(60,
		  rect.getHeight() - 140*(++line)); cos.showText("Italia"); cos.endText();
		  cos.beginText(); cos.setFont(fontPlain, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(60,
		  rect.getHeight() - 120*(++line)); cos.showText("P.iva:0123422873239");
		  cos.endText();
		  
		  
		  
		  //prestazione
		  cos.beginText(); cos.setFont(fontBold, 15);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(60,
		  rect.getHeight() - 50*(++line)); cos.showText(nome);
		  cos.endText();
		  //prezzo
		  cos.beginText(); cos.setFont(fontMono, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(410,
		  rect.getHeight() - 50*(line)); cos.showText("€"+ prezzo);
		  cos.endText();
		  
		  //totale
		  cos.beginText(); cos.setFont(fontBold, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(490,
		  rect.getHeight() - 50*(line)); cos.showText("€"+prezzo);
		  cos.endText();
		  
		  
		  
		  //area sub totale,iva,totale
		  cos.beginText(); cos.setFont(fontMono, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(480,
		  rect.getHeight() - 73*(line)); cos.showText("€"+prezzo);
		  cos.endText();
		  
		  cos.beginText(); cos.setFont(fontMono, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(480,
		  rect.getHeight() - 75*(line)); cos.showText("€"+iva);
		  cos.endText();
		  
		  cos.beginText(); cos.setFont(fontBold, 15);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(480,
		  rect.getHeight() - 78*(line)); cos.showText("€ "+totale);
		  cos.endText();
		  

        // close the content stream for page 2
        cos.close();

        // Save the results and ensure that the document is properly closed:
        document.save(outputFileName);
        document.close();
}

	public static double round(double value, int places) {
    if (places < 0) throw new IllegalArgumentException();

    long factor = (long) Math.pow(10, places);
    value = value * factor;
    long tmp = Math.round(value);
    return (double) tmp / factor;
}



}
