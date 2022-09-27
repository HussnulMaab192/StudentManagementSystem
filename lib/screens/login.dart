import 'package:flite/screens/controller.dart';
import 'package:flite/screens/home.dart';
import 'package:flite/screens/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pswd = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
      ),
      body: Column(
        children: [
          GetBuilder<MyController>(builder: (controller) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    field(
                        hintText: "Email",
                        validator: emailValidator,
                        controller: _email,
                        pressedInput: () {
                          controller.updateTap(1);
                        },
                        pressed: () {},
                        color: controller.res == "email" && controller.tapped
                            ? Colors.blue
                            : Colors.grey),
                    const SizedBox(
                      height: 8,
                    ),
                    field(
                        iconData: (Icons.lock_outline),
                        hintText: "Password",
                        validator: passwordValidator,
                        controller: _pswd,
                        pressed: () {},
                        color: controller.res == "paswd" && controller.tapped
                            ? Colors.blue
                            : Colors.grey,
                        pressedInput: () {
                          controller.updateTap(2);
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
                        onTap: (() {
                          if (_formKey.currentState!.validate()) {
                            Get.to(const Home());
                          }
                        }),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.blue,
                          ),
                          width: double.maxFinite,
                          child: const Center(
                            child: Text(
                              "login",
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
