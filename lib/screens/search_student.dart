import 'package:flite/controllers/student_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchStudent extends StatefulWidget {
  const SearchStudent({super.key});

  @override
  State<SearchStudent> createState() => _SearchStudentState();
}

class _SearchStudentState extends State<SearchStudent> {
  final TextEditingController _searchStudentName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Get.put(StudentController());
    return Scaffold(
      appBar: AppBar(title: const Text("Search the student here...")),
      body: Column(
        children: [
          SizedBox(height: 24),
          GetBuilder<StudentController>(builder: (controller) {
            return Container(
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
                      controller: _searchStudentName,
                      decoration: const InputDecoration(
                        hintText: "Enter the student name here...",
                        enabledBorder: null,
                        focusedBorder: null,
                        border: null,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await controller
                          .searchForStudent(_searchStudentName.text);
                      print("Searching Fucntion called");
                    },
                    icon: const Icon(Icons.search),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            );
          }),
          // List view if the student name match with db
          GetBuilder<StudentController>(builder: (controller) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.list.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(controller.list[index]['name'].toString()),
              ),
            );
          })
        ],
      ),
    );
  }
}
