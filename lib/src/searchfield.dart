import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final String hint;
  final String label;
  final String buttonText;
  final TextEditingController? controller;
  final double radius;
  final void Function(String search)? findHandler;

  SearchField({Key? key, this.hint = "", required this.label, required this.controller,this.radius=4,this.buttonText="Search",this.findHandler}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Container(
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                          controller: widget.controller,
                          readOnly: false,
                          // initialValue: "enter something",
                          decoration: InputDecoration(
                              icon: Icon(Icons.search),
                              border: InputBorder.none,
                              // border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              labelText: widget.label,
                        ))),
            )])));
  }
}