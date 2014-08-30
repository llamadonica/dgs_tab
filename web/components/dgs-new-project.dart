import 'package:polymer/polymer.dart';
import '../models.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('dgs-new-project')
class DgsNewProject extends PolymerElement {
  @published bool wide;
  @published Project project;
  
  DgsNewProject.created() : super.created();
}