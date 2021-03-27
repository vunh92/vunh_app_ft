import 'dart:async';
import 'package:flutter/material.dart';

class HomeMenuBloc {
  StreamController _menuController = new StreamController();

  Stream get menuController => _menuController.stream;

  // void on

  void dispose(){
    _menuController.close();
  }
}