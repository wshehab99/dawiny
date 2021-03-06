import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/app_cubit.dart';
import '../../bloc/app_states.dart';

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
      create: (context) => AppCubit(InitialAppState()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Checkbox(
                    value: AppCubit.nursingTsks[index!]['value'],
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
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            description!,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
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
