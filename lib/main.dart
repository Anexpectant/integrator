import 'package:flutter/material.dart';
import 'package:integrator/application_entry.dart';
import 'package:integrator/core/utils/services/di/injection.dart';

void main() async {
  await startUp();
  runApp(getIt<ApplicationEntry>());
}

startUp() async {
  configureDependencies();
}
