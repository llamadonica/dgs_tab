import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_input.dart';
import 'package:core_elements/core_animated_pages.dart';
import 'package:uuid/uuid.dart';
import 'dart:html';
import '../models.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('dgs-categories')
class DgsCategories extends PolymerElement {
  @published bool wide;
  @published Project project;
  @published Map<String, Map> templates;
  @published String template;
  @observable String navigation;

  DgsCategories.created() : super.created() {
  }
  void menuAction(ev) {
    
  }
}