import 'package:contacts/UI/tagSelector.dart';
import 'package:contacts/isar/methods.dart';
import 'package:contacts/isar/workPlace.dart';
import 'package:flutter/material.dart';

import '../global.dart';
import '../isar/contact.dart';
import 'dialogs/addTagDialog.dart';

class info extends StatefulWidget {
  final Contact contact;
  final String initials;
  const info({
    Key? key,
    required this.contact,
    required this.initials,
  }) : super(key: key);

  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  String dropDownValue = "Google";

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.contact.name;
    _numberController.text = widget.contact.number;
    _descriptionController.text = widget.contact.description;
  }

  bool changed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: changed
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () {
                        widget.contact..name = _nameController.text;
                        widget.contact..number = _numberController.text;
                        widget.contact
                          ..description = _descriptionController.text;
                        addContact(widget.contact);
                      },
                      child: Text(
                        "save",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              )
            : SizedBox(),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                child: Text(
                  widget.initials,
                  style: TextStyle(fontSize: 70),
                ),
                radius: 100,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                  ),
                  TextFormField(
                    controller: _numberController,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                  ),
                ],
              ),
              onChanged: () => setState(() {
                changed = true;
              }),
            ),
            DropdownButton(
              focusNode: _focusNode,
              value: dropDownValue,
              items: getAllCompanies()
                  .map(
                    (workPlace e) => e.name != 'create'
                        ? DropdownMenuItem<String>(value: e.name, child: Text(e.name))
                        : DropdownMenuItem(
                            child: Text(e.name),
                            value: e.name,
                            onTap: () {},
                          ),
                  )
                  .toList(),
              onChanged: (dynamic newValue) async {
                if (newValue == 'create') {
                  await showNewTagDialog(context).then((value) {
                    setState(() {
                      dropDownValue = items[items.length - 2];
                    });
                  });
                } else {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
