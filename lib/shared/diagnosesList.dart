import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/shared/diagnos_item_widget.dart';
import 'package:flutter/material.dart';

import '../screens/doctors/doctor_list_screen.dart';
import '../screens/search/search_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagnosesList extends StatelessWidget {
  const DiagnosesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialAppState()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(140)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            offset: Offset(0, 5),
                            color: Colors.black54)
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 30,
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "Diagnosis",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SearchTextFeild(
                            hint: 'search',
                            onSearch: (value) {
                              cubit.searchOnSpecializations(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.separated(
                    itemBuilder: ((context, index) {
                      var value = cubit.shownList[index];
                      return DiagnosItem(
                        specialization: value,
                        ontap: () {
                          Navigator.pop(context, value);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: ((context) =>
                          //         DoctorListScreen(dignoseName: value.name)),
                          //   ),
                          // );
                        },
                      );
                    }),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: cubit.shownList.length,
                  )),
                ]),
          );
        },
      ),
    );
  }
}
