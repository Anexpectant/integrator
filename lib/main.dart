import 'package:flutter/material.dart';
import 'package:integrator/application_entry.dart';
import 'package:integrator/core/utils/services/di/injection.dart';
import 'package:integrator/core/utils/services/local_db/hive_db.dart';

void main() async {
  await startUp();
  runApp(getIt<ApplicationEntry>());
}

startUp() async {
  initHive();
  configureDependencies();
}
