import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/nurse_map/nurse_map.dart';
import 'package:find_doctor/screens/search/search_widget.dart';
import 'package:find_doctor/shared/app_button.dart';
import 'package:flutter/material.dart';

import 'nursing_task_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NursingTasksScreen extends StatelessWidget {
  const NursingTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => AppCubit(InitialAppState())),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: ((context, state) {}),
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(title: const Text('Nursing Tasks')),
              body: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SearchTextFeild(
                    hint: 'Search',
                    onSearch: (value) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemBuilder: ((context, index) {
                          return NursingTaskCard(
                            title: AppCubit.nursingTsks[index]['title'],
                            description: AppCubit.nursingTsks[index]
                                ['description'],
                            index: index,
                            onChange: () {
                              cubit.changeNurseListBouttonValue();
                            },
                          );
                        }),
                        itemCount: AppCubit.nursingTsks.length),
                  )
                ],
              ),
              bottomNavigationBar: AppButton(
                text: 'Continue',
                borderradius: BorderRadius.circular(35),
                bottenColor: Colors.blue,
                textColor: Colors.white,
                onPressed: cubit.nursingListContinue
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NurseMap()));
                      }
                    : null,
              ),
            );
          }),
    );
  }
}
