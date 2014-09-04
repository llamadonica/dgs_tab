import 'package:polymer/polymer.dart';
import 'dart:html';

import '../models.dart';

@CustomTag('dgs-load-template')
class DgsLoadTemplate extends PolymerElement {
  @published String url;
  DgsLoadTemplate.created() : super.created() {
  }
  
  void handleResponse(dynamic ev) {
  }
}