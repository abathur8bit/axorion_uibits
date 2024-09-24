import 'package:axorion/axorion.dart';
import 'package:flutter/material.dart';
import 'about_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  bool toggledOn;
  MyApp({Key? key,this.toggledOn=true}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String onMsg = "Toggled on currently";
  final String offMsg = "Toggled off currently";
  int? selected;
  List<String> values = [
    "Circuit De Barcelona-Catalunya Rallycross",
    "Comienzo en Bellriu",
    "El Rodeo",
    "Elsthorpe Sprint Forward",
    "Elsthorpe Sprint Reverse",
    "Hell Rallycross",
    "Lohéac Bretagne Rallycross",
    "Marynka",
    "Te Awanga Forward",
    "Te Awanga Sprint Reverse",
    "Waimarama Sprint Forward",
    "Circuit De Barcelona-Catalunya Rallycross",
    "Comienzo en Bellriu",
    "El Rodeo",
    "Elsthorpe Sprint Forward",
    "Elsthorpe Sprint Reverse",
    "Hell Rallycross",
    "Lohéac Bretagne Rallycross",
    "Marynka",
    "Te Awanga Forward",
    "Te Awanga Sprint Reverse",
    "Waimarama Sprint Forward",
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "",
        debugShowCheckedModeBanner: false,
        home: Builder(builder:(context) => Scaffold(
            appBar: AppBar(title:const Text("")),
            body: ElevatedButton(onPressed: () => onSelector(context),child: Padding(padding:const EdgeInsets.only(bottom:3),child:Text("Open Selector")))
        )
    ));
  }
  void onSelector(BuildContext context) async {
    final int? result = await
    Navigator.push(context,MaterialPageRoute(
        // builder: (context) => AboutPage()));
        builder: (context) => SelectList(selected:selected,title:"Select something",items: values )));
    if(result != null) {
      print("selected $result which is ${values[result]}");
      setState(() {
        selected = result;
      });
    } else {
      print("selected back instead of an item");
    }
  }
}

// class _MyAppState extends State<MyApp> {
//   final String onMsg = "Toggled on currently";
//   final String offMsg = "Toggled off currently";
//   List<String> values = ["One","Two"];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: "",
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             appBar: AppBar(title:const Text("")),
//             body: Padding(
//                 padding: EdgeInsets.all(50.0),
//                 child: ListView(
//                   // padding: EdgeInsets.all(20),
//                     children:[
//                       ElevatedButton(onPressed: () => onSelector(context),child: Padding(padding:const EdgeInsets.only(bottom:3),child:Text("Open Selector"))),
//                       Padding(padding:EdgeInsets.all(20),child:Center(child:ATextField(label: "Username"))),
//                       Padding(padding:EdgeInsets.all(20),child:Center(child:APasswordField(label: "Password"))),
//                       Padding(padding:EdgeInsets.all(20),child:Center(child:APasswordField(label: "Password",number: true))),
//                       Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: ASwitch(leftAligned:false,label:widget.toggledOn?onMsg:offMsg,value: widget.toggledOn,onChange: (value) {
//                           setState(() {
//                             widget.toggledOn=value;
//                           });
//                         },),
//                       ),
//                     ]))
//         )
//     );
//   }
//   void onSelector(BuildContext context) {
//
//     Navigator.push(context,MaterialPageRoute(
//         builder: (context) => AboutPage()));
//     // builder: (context) => SelectList(title:"select something",values: values )));
//   }
// }

