import 'package:polymer/polymer.dart';
import 'dart:html';
import '../models.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('dgs-new-project')
class DgsNewProject extends PolymerElement {
  @published bool wide;
  @published Project project;
  
  static const String LAST_ELEMENT = 'name';
  static List<String> fields = ['name'];
  
  DgsNewProject.created() : super.created();
  void handleLogin() {
    
  }
  void keypressAction(KeyboardEvent ev) {
    var keyStroke = (ev.which is int)?ev.which:ev.keyCode;
    if (keyStroke == 13) {
      if (ev.target == $[LAST_ELEMENT] )
        ;
    }
  }
  
}