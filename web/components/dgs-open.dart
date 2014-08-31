import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_input.dart';
import 'dart:html';
import '../models.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('dgs-new-project')
class DgsNewProject extends PolymerElement {
  @published bool wide;
  @published Project project;
  @observable bool fabIsShowing = false;
  
  static const String LAST_ELEMENT = 'name';
  static List<String> fields = ['name'];
  
  DgsNewProject.created() : super.created();
  @override
  ready() {
    ($['name'] as PaperInput).onChange.listen((ev) {
      if (($['name'] as PaperInput).inputValue == '')
        fabIsShowing = false;
      else
        fabIsShowing = true;
    });
  }
  void handleLogin() {
  }
  void keypressAction(KeyboardEvent ev) {
    var keyStroke = (ev.which is int)?ev.which:ev.keyCode;
    if (keyStroke == 13) {
      var i = fields.iterator;
      while (i.moveNext()) {
        if ($[i.current] == ev.target)
          break;
      }
      if (i.moveNext())
        ($[i.current] as HtmlElement).focus();
      else {
        (ev.target as HtmlElement).blur();
      }
    }
  }
  
}