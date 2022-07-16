

import 'package:contacts/isar/methods.dart';
import 'package:contacts/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:isar/isar.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import '../isar/contact.dart';
import 'contactTile.dart';
class contactsList extends StatefulWidget {
  const contactsList({Key? key}) : super(key: key);

  @override
  _contactsListState createState() => _contactsListState();
}

class _contactsListState extends State<contactsList> {
  int offset = 0;
  late Stream stream;
  List<Contact> contactList = [];
  List<Contact> filteredContactList = [];


  @override
  void initState() {
    stream = contactsStream();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String searchTerm = context.watch<provider>().searchTerm;
    if(searchTerm.isNotEmpty){
      filteredContactList = [];
      filteredContactList.addAll(filterContacts(searchTerm, 0)!);
    }else{
      contactList = [];
      contactList.addAll(getContacts(0)!);
    }
    return Expanded(
      child: StreamBuilder(
        stream: allContacts(),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.data != null) contactList = snapshot.data;
              return StatefulBuilder(
                builder: (context, StateSetter setScopeState) {
                  List<Contact> list;
                  if(searchTerm.isNotEmpty){
                    list = filteredContactList;
                  }else{
                    list = contactList;
                  }
                  return LazyLoadScrollView(
                    onEndOfPage: () {
                      //setScopeState(()=> loadMore(searchTerm));
                      },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("total contacts: ${contactList.length.toString()}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
                        Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: list.length,
                              itemBuilder: (context, index){

                              Contact contact = list[index];
                                return contactTile(contact: contact,);
                              }),
                        ),
                      ],
                    ),
                  );
                }
              );
            }
      ),
    );
  }
  void loadMore(String searchTerm){
    int offset = contactList.length;
      if(searchTerm.isNotEmpty){
        filteredContactList.addAll(filterContacts(searchTerm, offset)!);
      }else{
        contactList.addAll(getContacts(offset)!);
      }
  }

}

