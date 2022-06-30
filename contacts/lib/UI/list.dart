

import 'package:contacts/isar/methods.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../isar/contact.dart';
import 'contactTile.dart';
import 'package:contacts/global.dart' as global;
class contactsList extends StatefulWidget {
  const contactsList({Key? key}) : super(key: key);

  @override
  _contactsListState createState() => _contactsListState();
}

class _contactsListState extends State<contactsList> {
  Stream stream = contacts.where().build().watch(initialReturn: true);
  @override
  Widget build(BuildContext context) {
   // final contacts = global.isar!.co
    return Expanded(
      child: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          var contactList = snapshot.data ?? [];
          return ListView.builder(
            itemCount: (contactList as List).length,
              itemBuilder: (context, index){
              Contact contact = contactList[index];
                return contactTile(name: contact.name, number: contact.number, description: contact.description, id: contact.id!,);
              });
        }
      ),
    );
  }
}

