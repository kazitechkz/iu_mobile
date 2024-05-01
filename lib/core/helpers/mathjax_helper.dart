class MathJaxHelper{
  static String toMathJax(String textToTransform){
    String outputString = textToTransform.replaceAll("<pre>", "\$\$");
    outputString = outputString.replaceAll("</pre>", "\$\$");
    return outputString;
  }
}