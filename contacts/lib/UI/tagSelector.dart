import 'package:contacts/UI/dialogs/addTagDialog.dart';
import 'package:contacts/isar/methods.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class tagSelector extends StatefulWidget {
  const tagSelector({Key? key}) : super(key: key);

  @override
  _tagSelectorState createState() => _tagSelectorState();
}

class _tagSelectorState extends State<tagSelector> {
  String dropDownValue = "item1";
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      focusNode: _focusNode,
      value: dropDownValue,
      items: getAllCompanies()
          .map(
            (company) => company.name != 'create'
            ? DropdownMenuItem<String>(value: company.name, child: Text(company.name))
            : DropdownMenuItem(
          child: Text(company.name),
          value: company.name,
          onTap: () {

          },
        ),
      )
          .toList(),
      onChanged: (dynamic newValue)async{

        if (newValue == 'create') {
          await showNewTagDialog(context).then((value){
            setState(() {
              print("items are $items");
              dropDownValue = items[items.length - 2];
            });
          });
        }
        else {
          setState(() {
            dropDownValue = newValue!;
          });
        }

      },
    );
  }
}