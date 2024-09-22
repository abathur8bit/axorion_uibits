/* *****************************************************************************
	 * Created by Lee Patterson 12/6/2023
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

/// A switch with a label that you can have the switch on the left side and text on the right (default)
/// or text on left and switch on the right side. When the switch is on the right side, the text will be
/// expanded to fill up the space. Example:
/// ASwitch(leftAligned:false,label:widget.toggledOn?onMsg:offMsg,value: widget.toggledOn,onChange: (value) {
///   setState(() {
///     widget.toggledOn=value;
///   });
/// },)
class ASwitch extends StatefulWidget {
  String label;
  bool value;
  bool leftAligned;
  void Function(bool)? onChange;

  ASwitch({Key? key,required this.label,this.value=true,this.leftAligned=true,this.onChange=null}) : super(key: key);

  @override
  _ASwitchState createState() => _ASwitchState();
}

class _ASwitchState extends State<ASwitch> {
  @override
  Widget build(BuildContext context) {
    Text t = Text(widget.label);
    Switch s = Switch(value: widget.value, onChanged: (newValue) {
      if (widget.onChange != null) {
        widget.value = newValue;
        widget.onChange!(newValue);
      } else {
        setState(() {
          widget.value = newValue;
        });
      }});
    if(widget.leftAligned) {
      return Row(children: [s,t]);
    } else {
      return Row(children: [Expanded(child: t),s]);
    }
  }
}