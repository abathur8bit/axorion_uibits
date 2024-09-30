import 'package:flutter/material.dart';

/// A field that has a label and value, and when clicked it brings up another screen with a list
/// of items you can chose from. onTap is called with the item that was selected when the screen
/// returns with a new selection.
class ASelectField extends StatefulWidget {
  void Function(int)? onTap;          /// called with the item that was selected when the screen returns with a new selection
  final String label;                 /// label describing the field
  int? selected;                      /// index of the selected item to highlight, or null if nothing is selected yet
  double labelWidth;                  /// Optional width of the label area, defaults otherwise
  final List<Object> items;           /// List of items that implements toString()
  final EdgeInsetsGeometry? padding;  /// optional padding around the field
  ASelectField({super.key, required this.label,required this.items,this.padding,this.selected,this.onTap,this.labelWidth=150.0});

  @override
  State<ASelectField> createState() => _ASelectFieldState();
}

class _ASelectFieldState extends State<ASelectField> {
  Color? fieldColor;

  @override
  Widget build(BuildContext context) {
    if(fieldColor == null) {
      fieldColor = Theme.of(context).colorScheme.background;
    }
    Object? item;
    if (widget.selected != null) {
      item = widget.items[widget.selected!];
    }

    Widget row = Row(children: [
      Container(padding: widget.padding, width: widget.labelWidth, child: Text(widget.label)),
      Expanded(child: Text(item?.toString() ?? "",style:TextStyle(fontWeight:FontWeight.bold))),
      const Icon(Icons.arrow_forward_ios)
    ]);
    Widget w = MouseRegion(onEnter:(event) => onEntered(),onExit: (event) => onExit(),
        child:Container(
            padding: EdgeInsets.all(16.0),
            decoration:BoxDecoration(color: fieldColor,borderRadius: BorderRadius.all(Radius.circular(4)),border: Border.all(width: 1, color: Colors.grey.shade400)),
            child: row));
    if (widget.padding != null) {
      return GestureDetector(
          onTap: () => onSelector(context),
          child: Padding(padding: widget.padding!,child: w)
      );
    } else {
      return GestureDetector(onTap: () => onSelector(context), child: w);
    }
  }

  void onEntered() {
    setState(() {
      Color c = Theme.of(context).colorScheme.secondary;
      fieldColor = Color.fromARGB(0x11,c.red,c.green,c.green);
    });
  }

  void onExit() {
    setState(() {
      fieldColor = Theme.of(context).colorScheme.background;
    });
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