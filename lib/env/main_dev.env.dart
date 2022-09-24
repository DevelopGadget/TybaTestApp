import 'package:flutter/material.dart';
import 'package:typatestapp/env/build_enviroment.env.dart';
import 'package:typatestapp/models/values.model.dart';

void main() {
  BuildEnvironment.init(
    flavor: BuildFlavor.development,
    baseUrl: 'https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/',
    maxScroll: 20,
  );
  assert(env != null);
  runApp(Values.runApp());
}
