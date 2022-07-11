import 'package:find_doctor/bloc/api_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/constant.dart';

class NursingTaskCard extends StatelessWidget {
  String? title;
  String? description;
  bool isChecked;
  int? index;
  void Function()? onChange;
  NursingTaskCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.index,
      this.onChange,
      this.isChecked = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiCubit(InitialAppState()),
      child: BlocConsumer<ApiCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ApiCubit cubit = ApiCubit.get(context);
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Checkbox(
                    activeColor: Colors.green.withOpacity(0.9),
                    value: ApiCubit.nursingTsks[index!]['value'],
                    onChanged: (value) {
                      cubit.changeNurseValue(value!, index!);
                      onChange!();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title!,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: kNexaFont,
                                color: Color.fromARGB(255, 135, 197, 64)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            description!,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
