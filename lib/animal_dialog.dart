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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          style: TextButton.styleFrom(foregroundColor: Color(0xFF0A5879)),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final text = _controller.text.trim();
            if (text.isNotEmpty) {
              widget.onListAdded(text);
              Navigator.of(context).pop();
            }
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF0A5879),
          ),
          child: const Text('Add'),
        ),
      ],
    );
  }
}
