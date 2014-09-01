import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_input.dart';
import 'package:core_elements/core_animated_pages.dart';
import 'package:uuid/uuid.dart';
import 'dart:html';
import '../models.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('dgs-new-project')
class DgsNewProject extends PolymerElement {
  @published bool wide;
  @published Repository repository;
  @published Project project;
  @observable bool fabIsShowing = false;
  
  static List<String> fields = ['name','resdNumber','jobNumber','surveyorName',
                                'initials'];
  
  DgsNewProject.created() : super.created();
  @override
  ready() {
<<<<<<< HEAD
    if (project != null) {
      $['name'].inputValue = project.name;
    }
    ($['name'] as PaperInput).onChange.listen((ev) {
=======
    if (project == null) {
      var uuid = new Uuid();
      project = new Project(uuid.v1());
    }
    ($['name'] as PaperInput).onInput.listen((ev) {
>>>>>>> 4d52bc2945eac3d242d421988d349851060126bf
      if (($['name'] as PaperInput).inputValue == '')
        fabIsShowing = false;
      else
        fabIsShowing = true;
    });
  }
  void handleSave() {
    repository.add(project);
    
    (parentNode as CoreAnimatedPages).selected = 'open';
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