import 'package:flutter/material.dart';

/// A screen to allow a user to select a single item from a list of string values.
/// You can have a previously selected item highlighted, although it may not be
/// visible until the user scrolls it into view.
/// You might consider putting that item as the first item in the list.
/// The select list will return null if the user pressed the back button, or the index
/// number of the selected item.
class SelectList extends StatefulWidget {
  List<Object> items;
  String title;
  int? selected;
  SelectList({Key? key,this.selected=null,required this.items,required this.title}) : super(key: key);

  @override
  _SelectListState createState() => _SelectListState();
}

class _SelectListState extends State<SelectList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title:Text(widget.title)),
        body:
        ListView.separated(
          itemCount: widget.items.length,
          // prototypeItem: ListTile(title: Text(widget.items.first)),
          separatorBuilder: (BuildContext context, int index) => const Divider(indent: 20,endIndent: 20,),

          itemBuilder: (context,index) {
            TextStyle style =  TextStyle(fontWeight: FontWeight.normal);
            Color? tileColor;

            if(widget.selected != null && widget.selected == index) {
              style =  TextStyle(fontWeight: FontWeight.bold);
              // tileColor = Colors.red;
            }
            return ListTile(tileColor: tileColor,title:Text(style:style,widget.items[index].toString()),onTap: () => Navigator.pop(context,index));
          },
        ));
  }
}