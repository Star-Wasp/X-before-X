import 'package:flutter/material.dart';
import 'package:x_before_x/customWidgets.dart';
import 'package:x_before_x/storage.dart';

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
  late List<bool> isChecked;
  late Map allData;

  @override
  void initState() {
    super.initState();
    Map? data = DataStorage.getChallangeData();

    if (data != null && data[widget.title] != null) {
      allData = data;
      var taskMap = data[widget.title][widget.title] as Map;
      tasks = [];
      isChecked = [];

      for (int i = 0; i <= widget.age; i++) {
        var task = taskMap['task$i'];
        if (task != null) {
          tasks.add(task['task'].toString());
          isChecked.add(task['isChecked'] as bool);
        }
      }
    } else {
      tasks =
          List.generate(widget.age + 1, (index) => 'challange ${index + 1}');
      isChecked = List.generate(widget.age + 1, (index) => false);
    }
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Center(
              child: Text(widget.title ?? 'General'),
            ),
          ),
          for (int i = 0; i < tasks.length; i++)
            CheckBoxItem(
              key: ValueKey('task_$i'),
              text: tasks[i],
              isChecked: isChecked[i],
              onIsChecked: (newState) {
                setState(() {
                  isChecked[i] = newState;
                  Map newTasks = {};
                  for (int j = 0; j < tasks.length; j++) {
                    newTasks['task$j'] = {
                      'task': tasks[j],
                      'isChecked': isChecked[j]
                    };
                  }
                  allData[widget.title][widget.title] = newTasks;
                  DataStorage.saveChallangeData(allData);
                });
              },
              onTaskUpdated: (newValue) {
                setState(
                  () {
                    tasks[i] = newValue;
                    Map newTasks = {};
                    for (int i = 0; i < tasks.length; i++) {
                      newTasks['task$i'] = {
                        'task': tasks[i],
                        'isChecked': isChecked[i]
                      };
                    }
                    allData[widget.title][widget.title] = newTasks;
                    DataStorage.saveChallangeData(allData);
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}
