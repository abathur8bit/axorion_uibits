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

class AButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const AButton({Key? key, required this.label, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(3), child: ElevatedButton(onPressed: onPressed,child: Padding(padding:const EdgeInsets.only(bottom:3),child:Text(label))));
  }
}