
import 'package:flutter/material.dart';

import '../constants.dart';

class ColorButton extends StatelessWidget {

  final void Function(int) changeColor;
  final ColorSelection colorSelected;

  const ColorButton({super.key,
    required this.changeColor,
    required this.colorSelected});

  @override
  Widget build(BuildContext context) {
   return PopupMenuButton(
     icon: Icon(
       Icons.opacity_outlined, // Icon giọt nước
       color: Theme.of(context).colorScheme.onSurface,
     ),
     // 4
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10),
     ),
     itemBuilder: (context){
       return List.generate(ColorSelection.values.length,
           (index){
              final currentColor = ColorSelection.values[index]; // => list
             return PopupMenuItem(
               value: index,
               enabled: currentColor != colorSelected,
               child: Wrap(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Icon(
                       Icons.opacity_outlined,
                       color: currentColor.color,
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 20),
                     child: Text(currentColor.label),
                   )
                 ],
               ),
             );
           }
       );
     },
     // 8
     onSelected: changeColor,
   );
  }
}