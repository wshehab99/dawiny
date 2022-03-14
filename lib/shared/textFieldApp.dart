import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TeriaqTextField extends StatefulWidget {
  TeriaqTextField(
      {Key? key,
      required this.label,
      required this.hint,
      this.hide = false,
      this.validator,
      this.controller,
      this.onTap,
      this.icon})
      : super(key: key);
  String label;
  String hint;
  bool hide;
  String? Function(String?)? validator;
  TextEditingController? controller;
  void Function()? onTap;
  Widget? icon;

  @override
  State<TeriaqTextField> createState() => _TeriaqTextFieldState();
}

class _TeriaqTextFieldState extends State<TeriaqTextField> {
  bool _isPasswordShown = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              "${widget.label} ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const Text(
              '*',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(45),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: Colors.blue.shade100.withOpacity(0.15),
                  offset: const Offset(0, 30),
                  spreadRadius: 0)
            ],
          ),
          child: TextFormField(
            onTap: widget.onTap,
            controller: widget.controller,
            autofocus: true,
            validator: widget.validator,
            obscureText: widget.hide ? !_isPasswordShown : false,
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.black26),
              hintText: widget.hint,
              suffixIcon: widget.hide
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordShown = !_isPasswordShown;
                        });
                      },
                      icon: _isPasswordShown
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    )
                  : widget.icon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
              ),
              contentPadding: const EdgeInsets.all(15),
              // focusedErrorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(35),
              //   borderSide: const BorderSide(
              //     color: Colors.red,
              //     width: 1,
              //   ),
              // ),
              // contentPadding: EdgeInsets.all(15),

              // errorBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(35))),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
