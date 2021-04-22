package it.meucci;

import java.awt.Color;
import java.io.IOException;
import java.util.ArrayList;

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
		String outputFileName = "/home/sebastian/git/StudioMedico/PrenotazioniStudioMedico/WebContent/stampe/fattura.pdf";
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
            PDImageXObject ximage = PDImageXObject.createFromFile("/home/sebastian/git/StudioMedico/PrenotazioniStudioMedico/WebContent/assets/img/simple2.png", document);
            float scale = 1.27f; // alter this value to set the image size
            cos.drawImage(ximage, 0, 0, ximage.getWidth()*scale, ximage.getHeight()*scale);
        } catch (IOException ioex) {
            System.out.println("No image for you");
        }

		
		  // Define a text content stream using the selected font, move the cursor and draw some text
		  cos.beginText(); cos.setFont(fontBold, 40);
		  cos.setNonStrokingColor(Color.black); cos.newLineAtOffset(190,
		  rect.getHeight() - 50*(++line)); cos.showText("FATTURA n.1"); cos.endText();
		 
        
		
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
		  rect.getHeight() - 50*(++line)); cos.showText("NOME PRESTAZIONE");
		  cos.endText();
		  //prezzo
		  cos.beginText(); cos.setFont(fontMono, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(410,
		  rect.getHeight() - 50*(line)); cos.showText("$120,00");
		  cos.endText();
		  
		  //totale
		  cos.beginText(); cos.setFont(fontBold, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(490,
		  rect.getHeight() - 50*(line)); cos.showText("$120,00");
		  cos.endText();
		  
		  
		  
		  //area sub totale,iva,totale
		  cos.beginText(); cos.setFont(fontMono, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(480,
		  rect.getHeight() - 73*(line)); cos.showText("$120,00");
		  cos.endText();
		  
		  cos.beginText(); cos.setFont(fontMono, 12);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(480,
		  rect.getHeight() - 75*(line)); cos.showText("$120,00");
		  cos.endText();
		  
		  cos.beginText(); cos.setFont(fontBold, 15);
		  cos.setNonStrokingColor(Color.BLACK); cos.newLineAtOffset(480,
		  rect.getHeight() - 78*(line)); cos.showText("$120,00");
		  cos.endText();
		  
		  
		  
		  /*
		 * cos.beginText(); cos.setFont(fontItalic, 12); cos.newLineAtOffset(100,
		 * rect.getHeight() - 50*(++line)); cos.showText("Italic"); cos.endText();
		 * 
		 * cos.beginText(); cos.setFont(fontBold, 12); cos.newLineAtOffset(100,
		 * rect.getHeight() - 50*(++line)); cos.showText("Bold"); cos.endText();
		 * 
		 * cos.beginText(); cos.setFont(fontMono, 12);
		 * cos.setNonStrokingColor(Color.BLUE); cos.newLineAtOffset(100,
		 * rect.getHeight() - 50*(++line)); cos.showText("Monospaced blue");
		 * cos.endText();
		 * 
		 * 
		 * 
		 * 
		 * // draw a red box in the lower left hand corner
		 * cos.setNonStrokingColor(Color.RED); cos.addRect(10, 10, 100, 100);
		 * cos.fill();
		 * 
		 * // add two lines of different widths cos.setLineWidth(1); cos.moveTo(300,
		 * 650); cos.lineTo(500, 650); cos.closeAndStroke(); cos.setLineWidth(5);
		 * cos.moveTo(200, 300); cos.lineTo(400, 300); cos.closeAndStroke();
		 * 
		 * 
		 * // Make sure that the content stream is closed: cos.close();
		 * 
		 * PDPage page2 = new PDPage(PDRectangle.A4); document.addPage(page2); cos = new
		 * PDPageContentStream(document, page2);
		 * 
		 * // draw a red box in the lower left hand corner
		 * cos.setNonStrokingColor(Color.RED); cos.addRect(10, 10, 100, 100);
		 * cos.fill();
		 * 
		 * // add two lines of different widths cos.setLineWidth(1); cos.moveTo(200,
		 * 250); cos.lineTo(400, 250); cos.closeAndStroke(); cos.setLineWidth(5);
		 * cos.moveTo(200, 300); cos.lineTo(400, 300); cos.closeAndStroke();
		 */

       

        // close the content stream for page 2
        cos.close();

        // Save the results and ensure that the document is properly closed:
        document.save(outputFileName);
        document.close();																						document.close();
}



}
