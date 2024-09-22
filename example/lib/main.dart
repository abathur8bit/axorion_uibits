import 'package:axorion/axorion.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title:const Text("")),
            body: Padding(
              padding: EdgeInsets.all(50.0),
              child: ListView(
                  padding: EdgeInsets.all(20),
                  children:[
                    Padding(padding:EdgeInsets.all(20),child:Center(child:ATextField(label: "Username"))),
                    Padding(padding:EdgeInsets.all(20),child:Center(child:APasswordField(label: "Password"))),
                    Padding(padding:EdgeInsets.all(20),child:Center(child:APasswordField(label: "Password",number: true))),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ASwitch(leftAligned:false,label:widget.toggledOn?onMsg:offMsg,value: widget.toggledOn,onChange: (value) {
                        setState(() {
                          widget.toggledOn=value;
                        });
                      },),
                    ),
          ]))
        )
    );
  }
}

