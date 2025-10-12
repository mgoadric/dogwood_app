
import 'package:flutter/material.dart';           


class DetailPage extends StatefulWidget {
  final String title;
  const DetailPage({super.key, required this.title});

  @override
  State<DetailPage> createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage>{
  bool vaccineCheck = false;
  bool dewormCheck = false;
  String? vaccineType;
  String? dewormType;
  DateTime? vaccineTime;
  DateTime? dewormTime;

  final List<String> vaccineTypes = [
    'Vaccine 1',
    'Vaccine 2',
  ];

  final List<String> dewormTypes = [
    'Dewormer 1',
    'Dewormer 2',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: vaccineCheck, 
                  onChanged: (bool? value) {setState(() => vaccineCheck = value ?? false);}
                  ),
                  Text("Vaccine"),
                  if (vaccineCheck) ...[
                    
                  SizedBox(width: 12),
                  OutlinedButton(
                    child: Text(vaccineTime == null
                        ? "Date"
                        : "${vaccineTime!.toLocal()}".split(' ')[0]),
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2024),
                          lastDate: DateTime(2030));
                      if (picked != null) {
                        setState(() => vaccineTime = picked);
                      }
                    },
                  ),
                  SizedBox(width: 12),
                  DropdownButton<String>(
                    hint: Text("Type"),
                    value: vaccineType,
                    items: vaccineTypes
                        .map((type) => DropdownMenuItem(
                            value: type, child: Text(type)))
                        .toList(),
                    onChanged: (value) {
                      setState(() => vaccineType = value);
                    },
                  ),
                  ]
              ],),
              Row(
                children: [
                  Checkbox(value: dewormCheck,
                  onChanged: (bool? value) {
                    setState(() => dewormCheck = value ?? false);
                  },
                  ),
                  Text("Deworm"),
                if (dewormCheck) ...[
                  SizedBox(width: 12),
                  OutlinedButton(
                    child: Text(dewormTime == null
                        ? "Date"
                        : "${dewormTime!.toLocal()}".split(' ')[0]),
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030));
                      if (picked != null) {
                        setState(() => dewormTime = picked);
                      }
                    },
                  ),
                  SizedBox(width: 12),
                  DropdownButton<String>(
                    hint: Text("Type"),
                    value: dewormType,
                    items: dewormTypes
                        .map((type) => DropdownMenuItem(
                            value: type, child: Text(type)))
                        .toList(),
                    onChanged: (value) {
                      setState(() => dewormType = value);
                    },
                  ),
                ],
          ])
          ],
          )
      )
      );
  }
}