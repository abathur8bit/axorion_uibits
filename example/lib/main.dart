import 'package:axorion/axorion.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                ]),
          )
      )
    );
  }
}
