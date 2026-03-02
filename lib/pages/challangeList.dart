import 'package:flutter/material.dart';
import 'package:x_before_x/customWidgets.dart';

class ChallangePage extends StatefulWidget {
  final String name;
  final int age;
  final String? title;
  const ChallangePage({
    super.key,
    required this.name,
    required this.age,
    this.title = 'General',
  });

  @override
  State<ChallangePage> createState() => _ChallangePageState();
}

class _ChallangePageState extends State<ChallangePage> {
  late List<String> tasks;

  @override
  void initState() {
    super.initState();
    tasks = List.generate(widget.age + 1, (index) => 'challange ${index + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: widget.age == 0
              ? Text('X before X')
              : Text('${widget.age + 1} before ${widget.age + 1}'),
        ),
        body: ListView(
          children: [
            Text(widget.title ?? 'General'),
            for (int i = 0; i < tasks.length; i++)
              CheckBoxItem(
                text: tasks[i],
                onTaskUpdated: (newValue) {
                  setState(() {
                    tasks[i] = newValue;
                  });
                },
              ),
          ],
        ));
  }
}
