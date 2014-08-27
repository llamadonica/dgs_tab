import 'package:polymer/polymer.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('dgs-categories')
class DgsCategories extends PolymerElement {
  @observable Map project = {};
  @observable List categories = [];
  @observable int category = 0;
  @observable bool wide = true;

  DgsCategories.created() : super.created() {
  }
}

