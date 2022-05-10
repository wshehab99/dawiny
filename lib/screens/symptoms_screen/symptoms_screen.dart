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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Add Your Sympotoms',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff1171C8),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Add as many symptoms as you can for the most accurate results',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SearchTextFeild(
                  searchTextFeildColor: Colors.grey[300],
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            children: List.generate(
                                cubit.selectedSymptoms.length, (index) {
                              return Container(
                                margin: EdgeInsets.all(2.0),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                    color: Color(0xFF1171C8),
                                    borderRadius: BorderRadius.circular(16.0)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      cubit.selectedSymptoms[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xff0D5496),
                                          borderRadius:
                                              BorderRadius.circular(16.0)),
                                      child: InkWell(
                                          onTap: () {
                                            cubit.deleteSymptom(index);
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        // child: GridView.builder(
                        //   keyboardDismissBehavior:
                        //       ScrollViewKeyboardDismissBehavior.onDrag,
                        //   itemCount: cubit.selectedSymptoms.length,
                        //   itemBuilder: (context, index) {
                        //     return InkWell(
                        //       onTap: () {
                        //         cubit.deleteSymptom(index);
                        //       },
                        //       child: Center(
                        //         child: Container(
                        //           padding: const EdgeInsets.symmetric(
                        //               horizontal: 20, vertical: 10),
                        //           decoration: BoxDecoration(
                        //               color: Colors.blue,
                        //               borderRadius: BorderRadius.circular(25)),
                        //           child: Text(cubit.selectedSymptoms[index]),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   gridDelegate:
                        //       const SliverGridDelegateWithMaxCrossAxisExtent(
                        //           mainAxisExtent: 60,
                        //           maxCrossAxisExtent: 135,
                        //           crossAxisSpacing: 0,
                        //           //  crossAxisSpacing: 5,
                        //           mainAxisSpacing: 5,
                        //           childAspectRatio: 0.40),
                        // ),
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
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 226, 226, 226)),
                                child: Text(
                                  cubit.veiwedSymptoms[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF1171C8))),
                      onPressed:
                          cubit.selectedSymptoms.length >= 3 ? () {} : null,
                      child: const Text("Continue")),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
