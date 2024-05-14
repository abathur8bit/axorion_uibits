/* *****************************************************************************
	 * Created by Lee Patterson 10/12/2023
	 *
	 * Copyright 2023 Lee Patterson <https://github.com/abathur8bit>
	 *
	 * You may use and modify at will. Please credit me in the source.
	 *
	 * Licensed under the Apache License, Version 2.0 (the "License");
	 * you may not use this file except in compliance with the License.
	 * You may obtain a copy of the License at
	 *
	 *   http://www.apache.org/licenses/LICENSE-2.0
	 *
	 * Unless required by applicable law or agreed to in writing, software
	 * distributed under the License is distributed on an "AS IS" BASIS,
	 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 * See the License for the specific language governing permissions and
	 * limitations under the License.
	 * ******************************************************************************/

import 'package:flutter/material.dart';

/// A text field that by default obscures the text, and has an icon that can be
/// clicked to toggle between showing the text, and hiding it.
/// Example: VPasswordField(label:"Password",controller:_passwordController))
/// Example: VPasswordField(label:"Password",controller:_passwordController,obscure: false))  //defaults to showing the password text
class APasswordField extends StatefulWidget {
  bool obscure;
  final String label;
  final TextEditingController? controller;
  final double radius;
  bool number = false;  //keyboard will be number only when true

  APasswordField({Key? key, this.obscure = true, required this.label, this.controller,this.radius=4,this.number=false}) : super(key: key);

  @override
  _APasswordFieldState createState() => _APasswordFieldState(obscure: this.obscure, label: this.label, controller: this.controller, radius: radius);
}

class _APasswordFieldState extends State<APasswordField> {
  bool obscure;
  final String label;
  final TextEditingController? controller;
  final double radius;

  _APasswordFieldState({required this.obscure, required this.label, this.controller,required this.radius});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: TextField(
            keyboardType: widget.number ? TextInputType.number:TextInputType.text,
            obscureText: obscure,
            controller: controller,
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                        print(obscure);
                      });
                    },
                    child: Icon(obscure ? Icons.visibility_off : Icons.visibility)),
                labelText: label,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400),borderRadius: BorderRadius.circular(radius)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(radius)),
            )));
  }
}