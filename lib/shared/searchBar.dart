import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constant.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
    this.onSearch,
    required this.hint,
  }) : super(key: key);
  void Function(String?)? onSearch;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.06,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: kSearchBackgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: TextField(
              onChanged: onSearch,
              decoration: InputDecoration.collapsed(
                hintText: hint,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
        ),
      ],
    );
  }
}
