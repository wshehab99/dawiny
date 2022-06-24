import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/constant.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class DetailScreen extends StatelessWidget {
  final String? _name;
  final String? _description;
  String? id;

  DetailScreen(
    this.id,
    this._name,
    this._description,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialAppState()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, stste) {
          AppCubit cubit = AppCubit.get(context);
          cubit.getDoctorById(id: id!);
          return Scaffold(
            body: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/detail_illustration.png'),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            'assets/icons/back.svg',
                            height: 18,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/3dots.svg',
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: ListView(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              // Image.asset(
                              //   _imageUrl,
                              //   height: 120,
                              // ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _name!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: kTitleTextColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    _description!,
                                    style: TextStyle(
                                      color: kTitleTextColor.withOpacity(0.7),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: kBlueColor.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/icons/phone.svg',
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: kOrangeColor.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/icons/video.svg',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'About Doctor',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: kTitleTextColor,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Dr. $_name is the top most heart surgeon in Flower\nHospital. he has done over 100 successful sugeries\nwithin past 3 years. he has achieved several\nawards for her wonderful contribution in hes own\nfield. he’s available for private consultation for\ngiven schedules.',
                            style: TextStyle(
                              height: 1.6,
                              color: kTitleTextColor.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Upcoming Schedules',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: kTitleTextColor,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DatePicker(
                            DateTime.now(),
                            initialSelectedDate: DateTime.now(),
                            selectionColor: Colors.blue,
                            selectedTextColor: Colors.white,
                            onDateChange: (date) {
                              cubit.changeDate(date);
                            },
                          ),
                          Expanded(
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 20,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(cubit.doctor['slots'][index]),
                                  );
                                }),
                          ),
                          // ScheduleCard(
                          //   'Consultation',
                          //   'Sunday . 9am - 11am',
                          //   '30',
                          //   'March',
                          //   kBlueColor,
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // ScheduleCard(
                          //   'Consultation',
                          //   'Sunday . 9am - 11am',
                          //   '22',
                          //   'March',
                          //   kYellowColor,
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // ScheduleCard(
                          //   'Consultation',
                          //   'Sunday . 9am - 11am',
                          //   '20',
                          //   'March',
                          //   kOrangeColor,
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
