import 'package:flutter/material.dart';

import 'my_button.dart';

class TileDialogueBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const TileDialogueBox({

    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      content: Container(
        height: 180,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(

                  ),
                  hintText: 'Add you Task',
                ),
              ),
              Row(
                children: [
                  MyButton(
                    name: 'Save',
                    onPressed: onSave,
                  ),
                  const SizedBox(width: 20,),
                  MyButton(
                    name: 'Cancel',
                    onPressed: onCancel,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
