import 'package:flutter/material.dart';

Widget field({
  required String hintText,
  String? Function(String?)? validator,
  required TextEditingController controller,
  IconData? iconData = Icons.email_outlined,
  required VoidCallback pressed,
  required Color color,
  required VoidCallback pressedInput,
}) {
  return Container(
    margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
    width: double.maxFinite,
    height: 65,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: color,
        width: 2,
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            onTap: pressedInput,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: output(),
              focusedBorder: output(),
              // border: const OutlineInputBorder(

              //   borderSide: BorderSide(

              //     color: Colors.transparent,
              //   ),
              // ),
            ),
          ),
        ),
        GestureDetector(
          onTap: pressed,
          child: Icon(
            iconData,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
      ],
    ),
  );
}

OutlineInputBorder output() {
  return const OutlineInputBorder(
      borderSide: BorderSide(
    color: Colors.transparent,
  ));
}
