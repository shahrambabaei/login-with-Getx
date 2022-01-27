import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_noruzi/assets/colors.dart';
import 'package:login_noruzi/controller/taskconntroller.dart';
import 'package:login_noruzi/model/task.dart';
import 'package:login_noruzi/widgets/buttonwidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TaskController taskConntroller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    taskConntroller.setTask();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Obx(
        () {
          if (taskConntroller.loading.value) {
            return const Center(
              child: Text(
                "loading...",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: taskConntroller.tasks.length,
              itemBuilder: (context, index) {
                Task task = taskConntroller.tasks[index];
                return Container(
                    margin: const EdgeInsets.fromLTRB(4, 7, 4, 1),

                    //^Card
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                              color: Colors.grey.withOpacity(.5), width: 2)),
                      //^ListTile
                      child: ListTile(
                        title: Text(task.description),
                        subtitle: Text(task.createdAt.split("T").first),
                        // contentPadding: EdgeInsets.only(top: 10),
                        trailing: Container(
                            width: Get.width * .25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                Checkbox(
                                  activeColor: Colors.blue,
                                  value: task.completed,
                                  onChanged: (value) {
                                    
                                  },
                                )
                              ],
                            )),
                      ),
                    ));
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(AddTask(),
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);
  late String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      height: Get.height * .4,
      child: Column(
        children: [
          TextField(
            onChanged: (String value) {
              description = value;
            },
            maxLines: 5,
            decoration: InputDecoration(
                labelText: "Description",
                labelStyle: const TextStyle(fontSize: 19),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueColor, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(15)))),
          ),
          const Spacer(),
          InkWell(
              onTap: () {
                Get.find<TaskController>().addTask(description);
              },
              child: const ButtonWidget(clickText: "Save", clickColor: true)),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
