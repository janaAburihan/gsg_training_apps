import 'package:flutter/material.dart';
import 'package:gsg/task_management_app/screens/all_tasks.dart';
import 'package:gsg/task_management_app/screens/complete_tasks.dart';
import 'package:gsg/task_management_app/screens/incomplete_tasks.dart';

import '../data/dummy_data.dart';
import '../models/task_model.dart';

class MainTaskScreen extends StatefulWidget {
  @override
  State<MainTaskScreen> createState() => _MainTaskScreenState();
}

class _MainTaskScreenState extends State<MainTaskScreen>
    with SingleTickerProviderStateMixin {
  checkTask(TaskModel taskModel) {
    int index = tasks.indexOf(taskModel);
    tasks[index].isComplete = !tasks[index].isComplete;
    setState(() {});
  }

  late TabController tabController;
  initalizeTabController() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initalizeTabController();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Scaffold(
            drawer: Drawer(
              child: Column(
                children: [
                  const UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      child: Text('S'),
                    ),
                    accountName: Text('Jana'),
                    accountEmail: Text('jana@gmail.com'),
                  ),
                  ListTile(
                    title: const Text('ALL TASKS'),
                    subtitle: const Text('go to all tasks page'),
                    leading: const Icon(Icons.list),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      tabController.animateTo(0);
                    },
                  ),
                  ListTile(
                    title: const Text('COMPLETE TASKS'),
                    subtitle: const Text('go to complete tasks page'),
                    leading: const Icon(Icons.done),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      tabController.animateTo(1);
                    },
                  ),
                  ListTile(
                    title: const Text('INCOMPLETE TASKS'),
                    subtitle: const Text('go to incomplete tasks page'),
                    leading: const Icon(Icons.cancel),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      tabController.animateTo(2);
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text('Task Management'),
              bottom: TabBar(controller: tabController, tabs: const [
                Tab(
                  text: 'All Tasks',
                ),
                Tab(
                  text: 'Complete Tasks',
                ),
                Tab(
                  text: 'Incomplete Tasks',
                ),
              ]),
            ),
            body: TabBarView(controller: tabController, children: [
              AllTasksScreen(checkTask),
              CompleteTasksScreen(checkTask),
              InCompleteTasksScreen(checkTask)
            ]),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Task Manager App'),
              elevation: 0,
            ),
            body: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey[300],
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('ALL TASKS'),
                          subtitle: const Text('go to all tasks page'),
                          leading: const Icon(Icons.list),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            tabController.animateTo(0);
                          },
                        ),
                        ListTile(
                          title: const Text('COMPLETE TASKS'),
                          subtitle: const Text('go to complete tasks page'),
                          leading: const Icon(Icons.done),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            tabController.animateTo(1);
                          },
                        ),
                        ListTile(
                          title: const Text('INCOMPLETE TASKS'),
                          subtitle: const Text('go to incomplete tasks page'),
                          leading: const Icon(Icons.cancel),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            tabController.animateTo(2);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TabBarView(controller: tabController, children: [
                    AllTasksScreen(checkTask),
                    CompleteTasksScreen(checkTask),
                    InCompleteTasksScreen(checkTask)
                  ]),
                ),
              ],
            ),
          );
  }
}
