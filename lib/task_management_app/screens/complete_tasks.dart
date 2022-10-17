import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/task_widget.dart';

class CompleteTasksScreen extends StatelessWidget {
  Function function;
  CompleteTasksScreen(this.function);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: tasks.where((element) => element.isComplete).length,
        itemBuilder: (context, index) {
          return TaskWidget(
              tasks.where((element) => element.isComplete).toList()[index],
              function);
        });
  }
}
