import 'package:flutter/material.dart';

class AnimalDialog extends StatefulWidget {
  final ValueChanged<String> onListAdded;

  const AnimalDialog({super.key, required this.onListAdded});

  @override
  AnimalDialogState createState() => AnimalDialogState();
}

class AnimalDialogState extends State<AnimalDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Animal'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Enter name'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue, // sets text color to blue
          ),
          child: const Text('Cancel'),
          
        ),
        ElevatedButton(
          onPressed: () {
            final text = _controller.text.trim();
            if (text.isNotEmpty) {
              widget.onListAdded(text); // call the callback with input
              Navigator.of(context).pop();
            }
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue, // sets text color to blue
          ),
          child: const Text('Add'),
        ),
      ],
    );
  }
}
