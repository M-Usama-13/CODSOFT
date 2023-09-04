import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  VoidCallback? onPressed;

  MyButton(
      {Key? key,
        required this.name,
        this.onPressed
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: Colors.white70,
      color: Theme.of(context).primaryColor,
        onPressed: onPressed,
      child: Text(name),

    );
  }
}
