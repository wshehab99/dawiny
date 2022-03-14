import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBoxRow extends StatefulWidget {
  CheckBoxRow({Key? key}) : super(key: key);
  bool isCheked = false;

  @override
  State<CheckBoxRow> createState() => _CheckBoxRowState();
}

class _CheckBoxRowState extends State<CheckBoxRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 25,
        ),
        Checkbox(
          fillColor: widget.isCheked
              ? MaterialStateProperty.all(Colors.blue[600])
              : MaterialStateProperty.all(Colors.blue[600]!.withOpacity(0.5)),
          value: widget.isCheked,
          onChanged: (value) {
            setState(() {
              widget.isCheked = value!;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const Text(
          'Remember me',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
        )
      ],
    );
  }
}
