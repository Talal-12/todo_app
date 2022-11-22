import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/task_provider.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        actions: [
          IconButton(
              onPressed: () {
                context.push("/add");
              },
              icon: Icon(Icons.add_box_outlined))
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<TaskProvider>().tasks.length,
        itemBuilder: (context, index) => Card(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Checkbox(
                  //only check box
                  value: context
                      .watch<TaskProvider>()
                      .tasks[index]
                      .isComplete, //unchecked
                  onChanged: (value) {
                    //value returned when checkbox is clicked
                    setState(() {
                      context.read<TaskProvider>().changeTaskStatus(index);
                    });
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(context.watch<TaskProvider>().tasks[index].text),
              ),
              Spacer(),
              if (!context.read<TaskProvider>().tasks[index].isComplete)
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.delete_forever),
                )
              else
                (IconButton(
                  onPressed: () {
                    var taskProvider = context.read<TaskProvider>();
                    taskProvider.deleteTask(index);
                  },
                  icon: Icon(Icons.delete),
                ))
            ],
          ),
        )),
      ),
    );
  }
}
