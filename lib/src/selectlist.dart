import 'package:flutter/material.dart';

class ASelectField extends StatefulWidget {
  void Function(int)? onTap;
  final String label;
  int? selected;
  final List<Object> items;
  final EdgeInsetsGeometry? padding;
  ASelectField({super.key, required this.label,required this.items,this.padding,this.selected,this.onTap});

  @override
  State<ASelectField> createState() => _ASelectFieldState();
}

class _ASelectFieldState extends State<ASelectField> {
  @override
  Widget build(BuildContext context) {
    Object? item;
    if (widget.selected != null) {
      item = widget.items[widget.selected!];
    }
    Row row = Row(children: [
      Container(padding: widget.padding, width: 150, child: Text(widget.label)),
      Expanded(child: Text(item?.toString() ?? "")),
      const Icon(Icons.arrow_forward_ios)
    ]);
    if (widget.padding != null) {
      return GestureDetector(
          onTap: () => onSelector(context),
          child: Padding(padding: widget.padding!,child: row)
      );
    } else {
      return GestureDetector(onTap: () => onSelector(context), child: row);
    }
  }

  void onSelector(BuildContext context) async {
    final int? result = await Navigator.push(context,MaterialPageRoute(builder: (context) => SelectList(selected:widget.selected,title:"Select something",items: widget.items )));
    if(result != null) {
      setState(() {
        widget.selected = result;
        if(widget.onTap != null) {
          widget.onTap!(result);
        }
      });
    }
  }
}

/// A screen to allow a user to select a single item from a list of string values.
/// You can have a previously selected item highlighted, although it may not be
/// visible until the user scrolls it into view.
/// You might consider putting that item as the first item in the list.
/// The select list will return null if the user pressed the back button, or the index
/// number of the selected item.
class SelectList extends StatefulWidget {
  List<Object> items;
  final String title;
  int? selected;
  SelectList({Key? key,this.selected,required this.items,required this.title}) : super(key: key);

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