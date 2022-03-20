import 'package:flutter/material.dart';

class SearchTextFeild extends StatelessWidget {
  SearchTextFeild({Key? key, this.hint, this.onSearch}) : super(key: key);
  String? hint;
  Function(String?)? onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 45,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(35)),
      child: TextField(
        onChanged: onSearch,
        decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
