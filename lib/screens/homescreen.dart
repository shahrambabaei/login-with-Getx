import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_noruzi/controller/taskconntroller.dart';
import 'package:login_noruzi/model/task.dart';

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
      body: Obx(() {
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
                                value: false,
                                onChanged: (value) {},
                              )
                            ],
                          )),
                    ),
                  ));
            },
          );
        }
      }),
    );
  }
}
