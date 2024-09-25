import 'package:axorion/axorion.dart';
import 'package:flutter/material.dart';
import 'about_page.dart';

void main() {
  runApp(MyApp());
}
class Track {
  String name;
  String? country;
  Track({required this.name,this.country});
  @override
  String toString() => name+(country != null ? ", $country":"");
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
  List<Track> tracks = [
    Track(name:"Circuit De Barcelona-Catalunya Rallycross",country:"USA"),
    Track(name:"Comienzo en Bellriu"),
    Track(name:"El Rodeo"),
    Track(name:"Elsthorpe Sprint Forward"),
    Track(name:"Elsthorpe Sprint Reverse"),
    Track(name:"Hell Rallycross"),
    Track(name:"Lohéac Bretagne Rallycross"),
    Track(name:"Marynka"),
    Track(name:"Te Awanga Forward"),
    Track(name:"Te Awanga Sprint Reverse"),
    Track(name:"Waimarama Sprint Forward"),
    Track(name:"Circuit De Barcelona-Catalunya Rallycross"),
    Track(name:"Comienzo en Bellriu"),
    Track(name:"El Rodeo"),
    Track(name:"Elsthorpe Sprint Forward"),
    Track(name:"Elsthorpe Sprint Reverse"),
    Track(name:"Hell Rallycross"),
    Track(name:"Lohéac Bretagne Rallycross"),
    Track(name:"Marynka"),
    Track(name:"Te Awanga Forward"),
    Track(name:"Te Awanga Sprint Reverse"),
    Track(name:"Waimarama Sprint Forward"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "",
        debugShowCheckedModeBanner: false,
        home: Builder(builder:(context) => Scaffold(
            appBar: AppBar(title:const Text("")),
            body: ListView(children:[
              ElevatedButton(onPressed: () => onSelector(context),child: Padding(padding:const EdgeInsets.only(bottom:3),child:Text("Selector"))),
              ASelectField(padding:EdgeInsets.all(8),label:"Track",items:tracks,onTap:(value) => print("Selected track ${tracks[value].toString()}")),
              ASelectField(padding:EdgeInsets.all(8),label:"Car",items:tracks,onTap:(value) => print("Selected car ${tracks[value].toString()}")),
            ])
        )
    ));
  }
  void onSelector(BuildContext context) async {
    final int? result = await
    Navigator.push(context,MaterialPageRoute(
        // builder: (context) => AboutPage()));
        builder: (context) => SelectList(selected:selected,title:"Select something",items: tracks )));
    if(result != null) {
      print("selected $result which is ${tracks[result]}");
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

