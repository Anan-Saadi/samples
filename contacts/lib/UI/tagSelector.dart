import 'package:contacts/UI/dialogs/addTagDialog.dart';
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
  //List<String> items = ['item1', 'item2', 'create'];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      focusNode: _focusNode,
      value: dropDownValue,
      items: items
          .map(
            (e) => e != 'create'
                ? DropdownMenuItem<String>(value: e, child: Text(e))
                : DropdownMenuItem(
                    child: Text(e),
                    value: e,
                    onTap: () {
                     // showNewTagDialog(context);
                      // setState(() async{
                      //   _focusNode.unfocus();
                      //    await showNewTagDialog(context);
                      // });
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
          // setState(() {
          //
          // });
      },
    );
  }
}
