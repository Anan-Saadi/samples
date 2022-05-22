import 'package:contacts/UI/dialogs/addContactDialog.dart';
import 'package:flutter/material.dart';

class appBar extends StatefulWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  _appBarState createState() => _appBarState();
}

class _appBarState extends State<appBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Search(),
          IconButton(onPressed: (){
            showNewContactDialog(context);
          }, icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
Widget Search(){
  TextEditingController searchController = TextEditingController();
  return  Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
              labelText: 'Search',
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(
                      color: Colors.blue)),
              prefixIcon: Icon(Icons.search,
                  color: Colors.blue)),
        ),
      ),
    ),
  );
}