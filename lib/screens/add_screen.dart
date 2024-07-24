import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/bloc/featchdata_bloc.dart';
import 'package:todo_app/data/data.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _titleController = TextEditingController();

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Title",
                filled: true,
                fillColor: Colors.grey.shade400,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('EEE, M/d/y').format(date),
                  ),
                  IconButton(
                    onPressed: () async {
                      date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                            // currentDate: DateTime.now(),
                            initialDate: DateTime.now(),
                          ) ??
                          DateTime.now();
                      setState(() {
                        date = date;
                      });
                    },
                    icon: const Icon(
                      Icons.calendar_today,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton.icon(
                onPressed: () {
                  final String formatedDate =
                      DateFormat('EEE, M/d/y').format(date);
                  if (_titleController.text.isNotEmpty) {
                    addData(title: _titleController.text, date: formatedDate);
                    _titleController.clear();
                    context.read<FeatchdataBloc>().add(FeatchdataEvent());
                    Navigator.pop(context);
                  }
                },
                label: const Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
