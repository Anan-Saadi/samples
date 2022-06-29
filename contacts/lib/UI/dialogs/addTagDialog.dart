import 'package:contacts/global.dart';
import 'package:flutter/material.dart';

Future<void> showNewTagDialog(BuildContext context)async {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  await showDialog(
      context: context, builder: (context)  {
    TextEditingController _nameController = TextEditingController();
    return  StatefulBuilder(builder: (context, setState){
      var size = MediaQuery.of(context).size.width/2;
      return Container(
        height: 10,
        width: size,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(
                  Radius.circular(10.0))),
          content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    validator: (value){
                      return value!.isNotEmpty ? null : "Invalid input";
                    },
                    decoration: InputDecoration(hintText: "new tag"),
                  ),
                ],
              )),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("cancel")),
                TextButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    print(_nameController.text);
                    items.insert(items.length-1, _nameController.text);
                    print(items);
                    Navigator.of(context ).pop();
                  }
                }, child: Text("OK")),
              ],
            )
          ],
        ),

      );
    }
    );
  }
  );
}