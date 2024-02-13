import 'package:flutter/material.dart';
import 'package:vcnafacul/core/inject.dart';
import 'package:vcnafacul/core/vcnafacul_app.dart';
import 'package:vcnafacul/enum/env_num.dart';

void main(List<String> args) {
  var envEnum = EnvEnum.hml;
  confifDependencies(envEnum);
  runApp(const VcNaFaculApp());
}
