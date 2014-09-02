import 'package:polymer/polymer.dart';
import 'package:core_elements/core_animated_pages.dart';
import '../models.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('dgs-open')
class DgsNewProject extends PolymerElement {
  @published bool wide;
  @published Map<String,Project> repository;
  
  DgsNewProject.created() : super.created();
  void handleSelect(ev) {
    
  }
  void createNew() {
    (parentNode as CoreAnimatedPages).selected = 'new-project';
  }
}