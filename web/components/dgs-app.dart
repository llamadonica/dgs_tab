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
  @observable Map<String,Project> repository;
  
  static const Duration MIN_DURATION = const Duration(seconds: 1);
  DateTime readyTime;
  
  DgsApp.created() : super.created() {
  }
  
  @override ready() {
    readyTime = new DateTime.now();
    repository = toObservable({},deep: true);
    
    try {
      if (window.history.state == null)
        window.history.pushState({'app':'dgs'}, '');
      window.onPopState.listen(popState);
    } catch (err) {
    }
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
    if (repository.isEmpty) {
      this.selected = 'new-project';
    } else if (project == null) {
      this.selected = 'open';
    } else {
      this.selected = 'open';
    }
  }
}
