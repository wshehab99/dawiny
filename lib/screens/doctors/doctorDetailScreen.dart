import 'package:find_doctor/bloc/api_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/constant.dart';
import "package:date_picker_timeline/date_picker_timeline.dart";

class DetailScreen extends StatelessWidget {
  final String? _name;
  final String? _description;
  String? id;
  bool? videoCall;
  DetailScreen(this.id, this._name, this._description, this.videoCall);
  TextStyle saved = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: kTitleTextColor,
  );
  var scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: BlocProvider(
        create: (context) => ApiCubit(InitialAppState()),
        child: BlocConsumer<ApiCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, stste) {
            ApiCubit cubit = ApiCubit.get(context);
            cubit.getDoctorById(id: id!).then((value) {
              cubit.changeDate(dateTime);
            });
            if (stste is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/detail_illustration.png'),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: ListView(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              cubit.doctor != null
                                  ? CircleAvatar(
                                      backgroundImage: cubit
                                                  .doctor!['imageUrl'] !=
                                              null
                                          ? NetworkImage(
                                              cubit.doctor!['imageUrl'])
                                          : const NetworkImage(
                                              "https://cdn3.iconfinder.com/data/icons/black-easy/512/538642-user_512x512.png"),
                                    )
                                  : const SizedBox(),
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
                            initialSelectedDate: dateTime,
                            selectionColor: Colors.blue,
                            selectedTextColor: Colors.white,
                            onDateChange: (date) {
                              dateTime = date;
                              cubit.changeDate(dateTime);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            children:
                                List.generate(cubit.shownSlots.length, (index) {
                              return (stste is LoadingDateState)
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        showBottomSheet(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            45))),
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            context: context,
                                            builder: (context) => Container(
                                                  height: 280,
                                                  width: double.infinity,
                                                  color: Colors.white,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20,
                                                      horizontal: 35),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Image(
                                                              image: AssetImage(
                                                                  "assets/images/doctor2.png"),
                                                              height: 35,
                                                              width: 35,
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            Text(
                                                              '${cubit.doctor!["firstName"]} ${cubit.doctor!["lastName"]}',
                                                              style: saved,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                                Icons
                                                                    .timer_outlined,
                                                                size: 35),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            Text(
                                                              "${cubit.shownSlots[index]['start']} - ${cubit.shownSlots[index]['end']}",
                                                              style: saved,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                                Icons
                                                                    .calendar_month,
                                                                size: 35),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            Text(
                                                              dateTime
                                                                  .toString()
                                                                  .substring(
                                                                      0, 10),
                                                              style: saved,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                                Icons
                                                                    .attach_money,
                                                                size: 35),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            Text(
                                                              "${cubit.doctor!["price"]}",
                                                              style: saved,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        cubit.availbeDate
                                                            ? const Text(
                                                                "This Time is availablr right now")
                                                            : const Text(""),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        AppButton(
                                                          text:
                                                              "Check if available",
                                                          bottenColor:
                                                              Colors.blue,
                                                          textColor:
                                                              Colors.white,
                                                          borderradius:
                                                              BorderRadius
                                                                  .circular(35),
                                                          onPressed: () async {
                                                            cubit.checkDate(
                                                                id: cubit
                                                                        .doctor![
                                                                    '_id'],
                                                                data: {
                                                                  "doctorId":
                                                                      cubit.doctor![
                                                                          '_id'],
                                                                  "date": dateTime
                                                                      .toString()
                                                                      .substring(
                                                                          0,
                                                                          10),
                                                                  "appointmentId":
                                                                      cubit.shownSlots[
                                                                              index]
                                                                          [
                                                                          "_id"],
                                                                  "type": (videoCall ==
                                                                              null ||
                                                                          videoCall ==
                                                                              false)
                                                                      ? "offline"
                                                                      : "online"
                                                                },
                                                                context:
                                                                    context);
                                                          },
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        AppButton(
                                                          text:
                                                              "Book apointment",
                                                          bottenColor:
                                                              Colors.blue,
                                                          textColor:
                                                              Colors.white,
                                                          borderradius:
                                                              BorderRadius
                                                                  .circular(35),
                                                          onPressed: () async {
                                                            cubit
                                                                .bookAppointment(
                                                                    id: cubit
                                                                            .doctor![
                                                                        '_id'],
                                                                    data: {
                                                                      "doctorId":
                                                                          cubit.doctor![
                                                                              '_id'],
                                                                      "date": dateTime
                                                                          .toString()
                                                                          .substring(
                                                                              0,
                                                                              10),
                                                                      "appointmentId":
                                                                          cubit.shownSlots[index]
                                                                              [
                                                                              "_id"],
                                                                      "type": (videoCall == null ||
                                                                              videoCall == false)
                                                                          ? "offline"
                                                                          : "online",
                                                                    },
                                                                    context:
                                                                        context)
                                                                .then((value) {
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(2.0),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 4.0),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF1171C8),
                                            borderRadius:
                                                BorderRadius.circular(16.0)),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              cubit.shownSlots[index]['start'],
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                            }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
