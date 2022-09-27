import 'package:flite/screens/search_student.dart';
import 'package:flite/screens/show_students.dart';
import 'package:flite/screens/signup.dart';
import 'package:flite/screens/update_students.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin "),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: InkWell(
              onTap: () {
                Get.to(ShowStudents());
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
                    "View Students",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: InkWell(
              onTap: () {
                Get.to(SearchStudent());
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
                    "Search Students",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: InkWell(
              onTap: (() {}),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.blue,
                ),
                width: double.maxFinite,
                child: const Center(
                  child: Text(
                    "Delete Students",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: InkWell(
              onTap: () {
                Get.to(const UpdateStudent());
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
                    "Update Students",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: InkWell(
              onTap: () {
                Get.to(SiugnUp());
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
                    "Sign Up ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
