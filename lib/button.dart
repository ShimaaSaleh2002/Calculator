import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String label;
  Function onClick;
  CustomButton({super.key, required this.label, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            onClick(label);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          /* const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.cyan),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
           side: MaterialStatePropertyAll(BorderSide(style: BorderStyle.solid)),
          ), */
          child: Text(label,style: const TextStyle(
            fontSize: 27,color: Colors.white
          ),)),
    );
  }
}
