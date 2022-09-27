import 'package:flite/controllers/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateStudent extends StatefulWidget {
  const UpdateStudent({super.key});

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  @override
  final TextEditingController UpdateStudentname = TextEditingController();
  final TextEditingController UpdateStudentRollNo = TextEditingController();
  Widget build(BuildContext context) {
    Get.put(StudentController());
    return Scaffold(
      appBar: AppBar(
        title: Text("update students"),
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16,
              ),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: UpdateStudentname,
                    decoration: const InputDecoration(
                      hintText: "Enter the student name here...",
                      enabledBorder: null,
                      focusedBorder: null,
                      border: null,
                    ),
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: Get.width,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16,
              ),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: UpdateStudentRollNo,
                    decoration: const InputDecoration(
                      hintText: "Enter the roll no here..",
                      enabledBorder: null,
                      focusedBorder: null,
                      border: null,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<StudentController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: InkWell(
                onTap: () async {
                  await controller.updateForStudent(
                      UpdateStudentname.text, UpdateStudentRollNo.text);
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.blue,
                  ),
                  width: double.maxFinite,
                  child: const Center(
                    child: Text(
                      "Update",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
