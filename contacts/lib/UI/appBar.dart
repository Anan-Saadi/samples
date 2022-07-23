import 'package:contacts/UI/dialogs/addContactDialog.dart';
import 'package:contacts/generrate.dart';
import 'package:contacts/isar/methods.dart';
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
          PopupMenuButton(itemBuilder: (BuildContext context)=> [
            PopupMenuItem(
              value: 'share',
              onTap: ()=> clear(),
              child: Text('Share'),
            ),
            PopupMenuItem(
              value: 'add',
              onTap: ()=> generateMany(),
              child: Text('add'),

            ),
            PopupMenuItem(
              value: 'workPlace',
              onTap: ()=> createWorkPlace(null),
              child: Text('workPlace'),

            ),
            PopupMenuItem(
              value: 'first',
              onTap: ()=> firstWorkPlace(),
              child: Text('first'),

            ),
            PopupMenuItem(
              value: 'work',
              onTap: ()=> getFirstWorkPlace(),
              child: Text('work'),
            ),
          ]),
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