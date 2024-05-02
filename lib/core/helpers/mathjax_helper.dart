class MathJaxHelper{
  static String toMathJax(String textToTransform){
    String outputString = textToTransform.replaceAll("<tex>", "\$\$");
    outputString = outputString.replaceAll("</tex>", "\$\$");
    return outputString;
  }


  static String clearText(String textToTransform){
    String outputString = textToTransform.replaceAll("/<[^>]*(>|)|&nbsp;|&zwnj;|&raquo;|&laquo;/g, ","");
    outputString = outputString.replaceAll("&ordm;", "");
    outputString = outputString.replaceAll("&nbsp;", "");
    outputString = outputString.replaceAll("&lt;", "<");
    outputString = outputString.replaceAll("&gt;", ">");
    outputString = outputString.replaceAll("&le;", "\le");
    outputString = outputString.replaceAll("&ge;", "\ge");
    outputString = outputString.replaceAll("&ne;", " \neq");
    return outputString;
  }
}