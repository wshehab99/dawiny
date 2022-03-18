import 'package:flutter/material.dart';

class AppDropDownMenu extends StatefulWidget {
  AppDropDownMenu({Key? key, this.dropdownValue, this.choices})
      : super(key: key);
  String? dropdownValue;
  List<String>? choices;

  @override
  State<AppDropDownMenu> createState() => _AppDropDownMenuState();
}

class _AppDropDownMenuState extends State<AppDropDownMenu> {
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
            validator: (value) {
              if (value == null) return 'choose your gender';
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              hintText: 'Gender',
              hintStyle: const TextStyle(color: Colors.black26),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(
                    color: Colors.grey.shade100,
                  )),
            ),
            value: widget.dropdownValue,
            elevation: 3,
            onChanged: (String? newValue) {
              setState(() {
                widget.dropdownValue = newValue!;
              });
            },
            items:
                widget.choices!.map<DropdownMenuItem<String>>((String value) {
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
