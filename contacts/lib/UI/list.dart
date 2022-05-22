

import 'package:flutter/material.dart';

import 'contactTile.dart';

class contactsList extends StatefulWidget {
  const contactsList({Key? key}) : super(key: key);

  @override
  _contactsListState createState() => _contactsListState();
}

class _contactsListState extends State<contactsList> {
  List<contact> list =[contact(name: "bill gates", number: "5757", description: "really rich dude", )];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
          itemBuilder: (context, index){
            return list[index];
          }),
    );
  }
}

