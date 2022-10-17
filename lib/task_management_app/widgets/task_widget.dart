import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;
  Function? function;
  TaskWidget(this.taskModel, [this.function]);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: taskModel.isComplete,
      onChanged: (v) {
        function!(taskModel);
      },
      title: Text(taskModel.name),
    );
  }
}
