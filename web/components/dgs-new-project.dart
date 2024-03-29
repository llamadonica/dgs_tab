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
  @published Map<String,Project> repository;
  @published Project project;
  
  @observable bool fabIsShowing = false;
  @observable bool isNew = false;
  
  static List<String> fields = ['name','resdNumber','jobNumber','surveyorName',
                                'initials'];
  
  DgsNewProject.created() : super.created();
  @override
  ready() {
    createNewProject();
    ($['name'] as PaperInput).onInput.listen((ev) {
      if (($['name'] as PaperInput).inputValue == '')
        fabIsShowing = false;
      else
        fabIsShowing = true;
    });
  }
  void createNewProject() {
    var uuid = new Uuid();
    project = new Project(uuid.v1());
    isNew = true;
  }
  void handleSave() {
    repository[project.id] = project;
    isNew = false;
    
    (parentNode as CoreAnimatedPages).selected = 'categories';
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
