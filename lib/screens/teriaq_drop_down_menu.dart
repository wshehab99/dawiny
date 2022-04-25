import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDropDownMenu extends StatelessWidget {
  AppDropDownMenu({Key? key, this.dropdownValue, this.choices})
      : super(key: key);
  String? dropdownValue;
  List<String>? choices;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialAppState()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
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
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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
                  value: dropdownValue,
                  elevation: 3,
                  onChanged: (String? newValue) {
                    cubit.changeDropdownValue(newValue!);
                    dropdownValue = cubit.dropdownValue;
                  },
                  items: choices!.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
