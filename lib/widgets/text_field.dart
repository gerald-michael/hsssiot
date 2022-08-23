import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardtype;
  final TextEditingController controller;
  const CustomTextFeild({
    Key? key,
    this.obscureText = false,
    required this.controller,
    required this.keyboardtype,
    required this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!))),
          keyboardType: keyboardtype,
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
