import 'package:contacts/UI/list.dart';
import 'package:flutter/material.dart';

import 'UI/appBar.dart';

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
      home: Scaffold(
        body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            appBar(),
            contactsList(),
          ],
        ),
      ),),
    );
  }
}
