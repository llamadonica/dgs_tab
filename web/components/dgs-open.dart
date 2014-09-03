import 'package:polymer/polymer.dart';
import 'package:core_elements/core_animated_pages.dart';
import 'package:uuid/uuid.dart';
import '../models.dart';

import 'dgs-new-project.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('dgs-open')
class DgsOpen extends PolymerElement {
  @published bool wide;
  @published Map<String,Project> repository;
  @published Project project;
  
  DgsOpen.created() : super.created();
  void handleSelect(ev) {
    
  }
  void createNew() {
    ((parentNode as CoreAnimatedPages)
       .querySelector('#new-project') as DgsNewProject)
       .createNewProject();
    (parentNode as CoreAnimatedPages).selected = 'new-project';
  }
}