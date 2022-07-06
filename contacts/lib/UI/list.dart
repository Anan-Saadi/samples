

import 'package:contacts/isar/methods.dart';
import 'package:contacts/provider.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import '../isar/contact.dart';
import 'contactTile.dart';
class contactsList extends StatefulWidget {
  const contactsList({Key? key}) : super(key: key);

  @override
  _contactsListState createState() => _contactsListState();
}

class _contactsListState extends State<contactsList> {
  Stream stream = contactsStream();
  @override
  Widget build(BuildContext context) {
    String? searchTerm = context.watch<provider>().searchTerm;
    var contactList =[];

    return Expanded(
      child: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if(searchTerm != null && searchTerm.isNotEmpty){
            contactList = filterContacts(searchTerm)!;
          }else{
            contactList = (snapshot.data ?? []) as List;
          }
              return ListView.builder(
                itemCount: contactList.length,
                  itemBuilder: (context, index){
                  Contact contact = contactList[index];
                    return contactTile(name: contact.name, number: contact.number, description: contact.description, id: contact.id!,);
                  });
            }
      ),
    );
  }
}

