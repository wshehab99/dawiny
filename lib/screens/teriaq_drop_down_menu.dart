import 'package:flutter/material.dart';

class AppDropDownMenu extends StatefulWidget {
  const AppDropDownMenu({Key? key}) : super(key: key);

  @override
  State<AppDropDownMenu> createState() => _AppDropDownMenuState();
}

class _AppDropDownMenuState extends State<AppDropDownMenu> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
          SizedBox(
            width: 30,
          ),
          Text(
            "Gender ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          Text(
            '*',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: Colors.blue.shade100.withOpacity(0.15),
                  offset: const Offset(0, 30),
                  spreadRadius: 0)
            ],
          ),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              hintText: 'Gender',
              hintStyle: const TextStyle(color: Colors.black26),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(
                    color: Colors.grey.shade100,
                  )),
            ),
            value: dropdownValue,
            elevation: 3,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
