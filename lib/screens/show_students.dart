import 'package:flite/controllers/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowStudents extends StatefulWidget {
  const ShowStudents({super.key});

  @override
  State<ShowStudents> createState() => _ShowStudentsState();
}

class _ShowStudentsState extends State<ShowStudents> {
  @override
  Widget build(BuildContext context) {
    Get.put(StudentController());
    Get.find<StudentController>().gettask();
    return Scaffold(
      appBar: AppBar(title: const Text("Viewing Students")),
      body: Column(
        children: [
          GetBuilder<StudentController>(
            builder: (controller) => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.studentsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.studentsList[index].name.toString()),
                  subtitle:
                      Text(controller.studentsList[index].rollno.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
