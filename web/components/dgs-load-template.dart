import 'package:polymer/polymer.dart';
import 'dart:html';

import '../models.dart';

@CustomTag('dgs-load-template')
class DgsLoadTemplate extends PolymerElement {
  @published String url;
  
  DgsLoadTemplate.created() : super.created() {
  }
  
  void handleResponse(CustomEvent ev) {
    this.fire('dgs-response',detail: ev.detail);
  }
  void handleError(CustomEvent ev) {
    this.fire('dgs-error',detail: ev.detail);
  }
}