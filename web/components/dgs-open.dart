import 'package:polymer/polymer.dart';
import '../models.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('dgs-open')
class DgsNewProject extends PolymerElement {
  @published bool wide;
  @published Repository repository;
  
  DgsNewProject.created() : super.created();
  
}