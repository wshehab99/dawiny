import '../bloc/app_cubit.dart';
import '../bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class TeriaqTextField extends StatelessWidget {
  TeriaqTextField(
      {Key? key,
      // this.format,
      this.type,
      required this.label,
      required this.hint,
      this.hide = false,
      this.validator,
      this.controller,
      this.onTap,
      this.height = 45,
      this.icon,
      this.expands = false,
      this.maxLines = 1})
      : super(key: key);
  String? label;
  String hint;
  TextInputType? type;
  bool hide;
  String? Function(String?)? validator;
  TextEditingController? controller;
  void Function()? onTap;
  Widget? icon;
  // MaskTextInputFormatter? format;
  final double height;
  final bool expands;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialAppState()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    "$label ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const Text(
                    '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: height,
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
                  // inputFormatters: <TextInputFormatter>[format!],
                  keyboardType: type,
                  onTap: onTap,
                  controller: controller,
                  validator: validator,
                  expands: expands,
                  minLines: null,
                  maxLines: maxLines,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  obscureText: hide ? !cubit.isPasswordShown : false,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.black26),
                    hintText: hint,
                    suffixIcon: hide
                        ? IconButton(
                            onPressed: () {
                              cubit.showUnShowPassword();
                            },
                            icon: cubit.isPasswordShown
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          )
                        : icon,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 1),
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
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
