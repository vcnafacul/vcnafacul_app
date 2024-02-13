import 'package:flutter/material.dart';

class MyAction {
  final void Function() onTap;
  final IconData icon;

  MyAction({required this.onTap, required this.icon});
}
