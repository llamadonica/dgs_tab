import 'package:polymer/polymer.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('dgs-app')
class DgsApp extends PolymerElement {
  @observable String selected = "splash";
  @observable final String responsiveWidth = '900px';
  @observable bool wide;
  DgsApp.created() : super.created() {
  }
}
