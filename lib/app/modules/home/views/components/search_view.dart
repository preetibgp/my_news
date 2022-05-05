import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  TextEditingController controller;
  Function()? onPressed;

  SearchView({
    Key? key,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          filled: true,
          fillColor: Colors.transparent,
          hintText: "Search for news, topics...",
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
