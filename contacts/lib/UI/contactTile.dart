import 'dart:async';

import 'package:contacts/UI/infoPage.dart';
import 'package:contacts/isar/contact.dart';
import 'package:contacts/isar/methods.dart';
import 'package:flutter/material.dart';

class contactTile extends StatelessWidget {
  final Contact contact;
  const contactTile({required this.contact});

  @override
  Widget build(BuildContext context) {
    String name = contact.name;
    String number = contact.number;
    int id = contact.id;
    String initials = getInitials(name);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        info(initials: initials, contact: contact,)));
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey,
            child: Row(
              children: [
                CircleAvatar(
                  child: Text(
                    getInitials(name),
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text(number, style: TextStyle(fontSize: 17),),

                  ],
                ),
                Expanded(child: const SizedBox()),
                IconButton(onPressed: (){deleteContact(id);}, icon: Icon(Icons.delete, color: Colors.red,)),
                //ElevatedButton(onPressed: ()=> generateMany(), child: Text("new contact"))

              ],
            ),
          ),
        ),
      ),
    );
  }

  String getInitials(String name) => name.isNotEmpty
      ? name
          .trim()
          .split(RegExp(' +'))
          .map((s) => s[0])
          .take(2)
          .join()
          .toUpperCase()
      : '';
}
