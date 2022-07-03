import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NurseDetails extends StatelessWidget {
  NurseDetails({Key? key, this.id}) : super(key: key);
  String? id;
  final number = "01144287526";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BlocProvider(
            create: ((context) => AppCubit(InitialAppState())),
            child: BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {},
              builder: (context, states) {
                AppCubit cubit = AppCubit.get(context);
                cubit.getNurseById(id: id!);

                return (states is LoadingState)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SafeArea(
                        child: SizedBox(
                          height: 600,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: cubit.nurse != null
                                          ? Image.network(
                                              cubit.nurse!['imageUrl'] ??
                                                  "https://cdn3.iconfinder.com/data/icons/black-easy/512/538642-user_512x512.png",
                                              width: 300,
                                              height: 300,
                                              fit: BoxFit.cover,
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Text(
                                    cubit.nurse != null
                                        ? "${cubit.nurse!['firstName']} ${cubit.nurse!['lastName']}"
                                        : " ",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 4.5,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          size: 10,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "4.8 (by 1500 Reviews)",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      ElevatedButton(
                                        child: SvgPicture.asset(
                                          "assets/icons/call.svg",
                                          height: 20,
                                          color: Colors.white,
                                        ),
                                        onPressed: () async {
                                          await FlutterPhoneDirectCaller
                                              .callNumber(number);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        number,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Drscription Of Nurse:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Nurses plan and provide medical and nursing care to patients in hospitals, at home, or in other settings who are suffering from chronic or acute physical or mental ill-health.",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey[600]),
                                  ),
                                ),
                              ]),
                        ),
                      );
              },
            ),
          )),
    );
  }
}
