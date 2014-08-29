import 'package:polymer/polymer.dart';
import 'dart:html';

import '../models.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('dgs-app')
class DgsApp extends PolymerElement {
  @observable String selected = 'splash';
  @observable final String responsiveWidth = '900px';
  @observable bool wide;
  @observable Project project;
  @observable Repository repository;
  
  static const Duration MIN_DURATION = const Duration(seconds: 1);
  DateTime readyTime;
  
  DgsApp.created() : super.created() {
  }
  
  @override ready() {
    readyTime = new DateTime.now();
    if (window.history.state == null)
      window.history.pushState({'app':'dgs'}, '');
    window.onPopState.listen(popState);
    if (project == null) {
      var now = new DateTime.now();
      asyncTimer(finishStartup,MIN_DURATION);
    }
  }
  
  void popState(PopStateEvent e) {
    if (window.history.state == null)
      window.history.pushState({'app':'dgs'}, '');
  }
  finishStartup() {
    if (project == null) {
      this.selected = 'pick-project';
    } else {
      this.selected = 'categories';
    }
  }
}
