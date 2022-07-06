import 'package:flutter/material.dart';

class info extends StatefulWidget {
  final String initials;
  final String name;
  final String description;
  final String number;

  const info(
      {Key? key,
      required this.description,
      required this.initials,
      required this.name,
      required this.number})
      : super(key: key);

  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  List<DropdownMenuItem> menuItems = [
    DropdownMenuItem(
      child: Text("hello"),
      value: 'hello',
    ),
    DropdownMenuItem(
      child: Text("ok"),
      value: "ok",
    ),
    //DropdownMenuItem(child: TextButton(onPressed: ()=>print("nice"), child: Text("hello")))
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = widget.name;
    _numberController.text = widget.number;
    _descriptionController.text  = widget.description;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            TextFormField(
              controller: _nameController,
            ),
            TextFormField(
              controller: _numberController,
            ),TextFormField(
              controller: _descriptionController,
            ),
          ],
        ),
      ),
    );
  }
}
