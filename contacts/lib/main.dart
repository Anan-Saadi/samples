import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(list(
  ));
}

class list extends StatefulWidget {
  const list({Key? key}) : super(key: key);

  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Container(
        child: Center(child: Text("Hello world")),
      ),),
    );
  }
}
