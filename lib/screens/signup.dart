import 'package:flite/screens/admin.dart';
import 'package:flite/screens/controller.dart';
import 'package:flite/screens/home.dart';
import 'package:flite/screens/models/student.dart';
import 'package:flite/screens/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/student_controller.dart';
import 'components.dart';

class SiugnUp extends GetView<StudentController> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _rollno = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _pswd = TextEditingController();

  SiugnUp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(StudentController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
      ),
      body: Column(
        children: [
          GetBuilder<MyController>(builder: (xyz) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    field(
                        hintText: "Enter your Roll no ",
                        controller: _rollno,
                        pressedInput: () {
                          xyz.updateTap(1);
                        },
                        pressed: () {},
                        color: xyz.res == "rollno" && xyz.tapped
                            ? Colors.blue
                            : Colors.grey),
                    const SizedBox(
                      height: 8,
                    ),
                    field(
                        iconData: (Icons.lock_outline),
                        hintText: "name",
                        controller: _name,
                        pressed: () {},
                        color: xyz.res == "name" && xyz.tapped
                            ? Colors.blue
                            : Colors.grey,
                        pressedInput: () {
                          xyz.updateTap(3);
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    field(
                        iconData: (Icons.lock_outline),
                        hintText: "Password",
                        validator: passwordValidator,
                        controller: _pswd,
                        pressed: () {},
                        color: xyz.res == "pswd" && xyz.tapped
                            ? Colors.blue
                            : Colors.grey,
                        pressedInput: () {
                          xyz.updateTap(2);
                        }),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 24),
                      child: InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.addToTask(StudentModel(
                                _rollno.text, _name.text, _pswd.text, null));

                            await controller.gettask();
                            print(controller.studentsList[0].name);
                            print("data inserted!");
                            Get.to(const Home());
                          }
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
                              "SigUp",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
