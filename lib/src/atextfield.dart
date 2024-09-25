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

/// A text field with a label in the middle, that moves to the top boarder when there is data. Use as you would a Widget
/// and pass in a string for the label, and a controller that you can use to view what the user entered.
/// Example: ATextField(label: "Username",controller:_usernameController))
class ATextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final double radius;
  final bool number;
  const ATextField({Key? key, required this.label, this.controller,this.radius=4,this.number=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: TextField(
            keyboardType: number ? TextInputType.number:TextInputType.text,
            controller: controller,
            decoration: InputDecoration(
                labelText: label,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400),borderRadius: BorderRadius.circular(radius)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(radius)),
            )));
  }
}

