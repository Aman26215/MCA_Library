package com.library;


import java.io.IOException;

import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.property.TextAlignment;

public class Demo{
    public static void main(String[] args) {
        try {
            // Load existing PDF
        	PdfReader reader = new PdfReader("/cc.pdf");
        	PdfWriter writer = new PdfWriter("output.pdf");

            // Create PdfDocument objects
            PdfDocument pdfDoc = new PdfDocument(reader, writer);

            // Create Document object
            Document document = new Document(pdfDoc);

            // Modify existing content
            Paragraph modifiedParagraph = new Paragraph("Modified content")
                    .setTextAlignment(TextAlignment.CENTER)
                    .setFontColor(new DeviceRgb(255, 0, 0)); // Setting text color to red

            document.add(modifiedParagraph);

            // Close the document
            document.close();

            System.out.println("PDF modified successfully.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}