import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/search/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SymptomsScreen extends StatelessWidget {
  SymptomsScreen({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text("Medical Diagnosis"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => AppCubit(InitialAppState()),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: ((context, state) {}),
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            cubit.loadingSymptom();
            return Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                SearchTextFeild(
                  controller: controller,
                  hint: "Search, e.g. headache",
                  onSearch: (value) {
                    cubit.searchOnSymptoms(value: value);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                cubit.veiwedSymptoms.isEmpty
                    ? Expanded(
                        child: GridView.builder(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: cubit.selectedSymptoms.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                cubit.deleteSymptom(index);
                              },
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(cubit.selectedSymptoms[index]),
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisExtent: 80,
                                  maxCrossAxisExtent: 135,
                                  //  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: 0.66),
                        ),
                      )
                    : Expanded(
                        flex: 4,
                        child: ListView.builder(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: cubit.veiwedSymptoms.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                cubit.selectSymptoms(index);
                                controller.clear();
                                cubit.searchOnSymptoms(value: controller.text);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration:
                                    const BoxDecoration(color: Colors.blue),
                                child: Text(cubit.veiwedSymptoms[index]),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
