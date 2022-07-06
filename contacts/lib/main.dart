import 'package:contacts/UI/list.dart';
import 'package:contacts/isar/contact.dart';
import 'package:contacts/isar/workPlace.dart';
import 'package:contacts/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'global.dart' as global;
import 'package:path_provider/path_provider.dart';
import 'UI/appBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationSupportDirectory();

  final isar = await Isar.open(
    [ContactSchema, WorkPlaceSchema],
    directory: dir.path,
  );
  global.isar = isar;
  runApp(ChangeNotifierProvider(
    create: (_)=>provider(),
    child: list(
    ),
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,

  ]);
}

class list extends StatefulWidget {
  const list({Key? key}) : super(key: key);

  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
