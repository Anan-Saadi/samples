import 'package:contacts/UI/infoPage.dart';
import 'package:contacts/isar/methods.dart';
import 'package:flutter/material.dart';

class contactTile extends StatelessWidget {
  final String name;
  final String number;
  final String description;
  final int id;
  const contactTile({required this.name, required this.number, required this.description, required this.id});

  @override
  Widget build(BuildContext context) {
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
                        info(initials: initials, name: name, number: number, description: description,)));
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.grey,
            child: Row(
              children: [
                CircleAvatar(
                  child: Text(
                    getInitials(name),
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text(number, style: TextStyle(fontSize: 17),),

                  ],
                ),
                Expanded(child: SizedBox()),
                IconButton(onPressed: (){deleteContact(id);}, icon: Icon(Icons.delete, color: Colors.red,))
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
