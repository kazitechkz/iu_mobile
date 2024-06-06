import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parseFragment;


class HtmlHelper {
  static String fixHtml(String html) {
    var inputHtml = parseFragment(html);

    // Заменяем все <p> внутри <th> и <td> на <span>
    inputHtml.querySelectorAll("th p, td p").forEach((element) {
      element.replaceWith(replaceElementWithTag(element, "span"));
    });

    // Перемещаем все <li> внутри <th> и <td> в <span>
    inputHtml.querySelectorAll("th > ul > li, th > ol > li, td > ul > li, td > ol > li").forEach((element) {
      element.replaceWith(replaceElementWithTag(element, "span"));
    });

    // Перемещаем все <ul> и <ol> внутри <th> и <td> в <span>
    inputHtml.querySelectorAll("th > ul, th > ol, td > ul, td > ol").forEach((element) {
      element.replaceWith(replaceElementWithTag(element, "span"));
    });

    return inputHtml.outerHtml;
  }

  static dom.Element replaceElementWithTag(dom.Element element, String replacement) {
    var newElement = dom.Element.tag(replacement);
    newElement.innerHtml = element.innerHtml;
    return newElement;
  }
}