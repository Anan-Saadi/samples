import 'package:contacts/UI/dialogs/addContactDialog.dart';
import 'package:contacts/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class appBar extends StatefulWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  _appBarState createState() => _appBarState();
}

class _appBarState extends State<appBar> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var instance = Provider.of<provider>(context);
    return Container(
      child: Row(
        children: [
      Expanded(
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        child: TextFormField(
          controller: searchController,
          onChanged: (value){
            instance.updateSearchTerm(value);
          },
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
    ),
          IconButton(onPressed: (){
            showNewContactDialog(context);
          }, icon: Icon(Icons.add))
        ],
      ),
    );
  }
}