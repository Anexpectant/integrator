import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainPage extends StatefulWidget {
  static const String id = 'MainPage';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text("Main Page"),
      ),
    );
  }
}
