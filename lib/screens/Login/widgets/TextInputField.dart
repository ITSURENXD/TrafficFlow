import "package:flutter/material.dart";

class TextInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass; //to obsure it if it is a password
  final String hintText; 
  final TextInputType textInputType; //to select betwen email and pasword keyboard 
  const TextInputField({
    Key? key, 
    required this.textEditingController, 
    required this.hintText, 
    this.isPass = false, 
    required this.textInputType
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder (
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    );

    return TextField(
      controller: textEditingController,
      style: TextStyle(color: Colors.black),
      keyboardType: textInputType,
      obscureText: isPass,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        
        filled: true,
        fillColor: Colors.grey[250],
        hintStyle: TextStyle(fontWeight: FontWeight.bold),

        prefixIcon: Icon(
          Icons.email,
          color:Color.fromARGB(255, 134, 117, 111),
        )
      )
    );
  }
}