
function loadApplet(applet_URL) {
	var URL = applet_URL + "/applets/jre-1_5_0_18-windows-i586-p.exe";
	document.write("<OBJECT id=\"myApplet\" name=\"myApplet\"");
	document.write("classid=\"clsid:8AD9C840-044E-11D1-B3E9-00805F499D93\" WIDTH=\"0\" HEIGHT=\"0\" MAYSCRIPT name=\"myApplet\"");
	document.write("codebase=" + URL + ">");
	document.write("<PARAM NAME=\"CODE\" VALUE=\"Barcode\" />");
	document.write("<PARAM NAME=\"CODEBASE\" VALUE=\"../applets\" />");
	document.write("<PARAM NAME=\"ARCHIVE\" VALUE=\"jasperreports-3.0.1-applet.jar\" />");
	document.write("<PARAM NAME=\"type\" VALUE=\"application/x-java-applet;version=1.5.0\" />");
	document.write("<PARAM NAME=\"scriptable\" VALUE=\"false\" />");
	document.write("<PARAM NAME=\"REPORT_URL\" VALUE=\"../report.view\">");
	document.write("no support java");
	document.write("<comment>");
	document.write("<embed type=\"application/x-java-applet;version=1.5.0\"");
	document.write("CODE=\"Barcode\"");
	document.write("JAVA_CODEBASE=\"applets\" ARCHIVE=\"jasperreports-3.0.1-applet.jar\"");
	document.write("scriptable=false");
	document.write("pluginspage=" + URL + ">");
	document.write("<noembed></noembed>");
	document.write("</embed>");
	document.write("</comment>");
	document.write("</OBJECT>");
}

