import 'package:flite/screens/admin.dart';
import 'package:flite/screens/models/courses_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    setRepeat();
    super.initState();
  }

  setRepeat() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    await _prefs.setBool('repeat', true);
  }

  final courses = <CoursesModel>[
    CoursesModel("Math", 20),
    CoursesModel("Physics", 30),
    CoursesModel("chemistry", 30),
    CoursesModel("Bio", 50),
    CoursesModel("Pak studies", 70),
    CoursesModel("Islamiat", 80)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () => Get.to(const Admin()),
            icon: const Icon(Icons.smoke_free),
          )
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: courses.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                courses[index].title.toString(),
              ),
              trailing: Text(courses[index].marks.toString()),
            ),
          )
        ],
      ),
    );
  }
}
