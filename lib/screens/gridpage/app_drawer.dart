import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/signin/signin.dart';
import 'package:find_doctor/screens/welcome/user_profile.dart';
import 'package:find_doctor/shared/constant.dart';
import 'package:find_doctor/shared/glass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../notifications/notifications.dart';
import '../appointments/listOfAppointment.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(InitialAppState()),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              AppCubit cubit = AppCubit.get(context);
              cubit.getCurrentUser();
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: GlassMorphism(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 48.0, horizontal: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Image(
                                image: NetworkImage(cubit.currentUser == null
                                    ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXaova-4IVX3jj2DvzkGfkSzhrWWMyzxDwxw&usqp=CAU"
                                    : cubit.currentUser!['imageUrl']),
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    cubit.currentUser!['firstName'] != null
                                        ? cubit.currentUser!['firstName'] +
                                            " " +
                                            cubit.currentUser!['lastName']
                                        : " ",
                                    style: const TextStyle(
                                        color: kAppWhiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    cubit.currentUser!['email'] ?? " ",
                                    style: const TextStyle(
                                      color: kAppWhiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          endIndent: 8.0,
                          thickness: 1,
                          color: kAppGreenColor,
                        ),
                        _DrawerButton(
                          title: "Profile",
                          icon: Icons.account_circle_rounded,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserProfile(),
                              ),
                            );
                          },
                        ),
                        _DrawerButton(
                          title: "Appointments",
                          icon: Icons.bookmark,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListOfAppointments(),
                              ),
                            );
                          },
                        ),
                        _DrawerButton(
                          title: "Notification",
                          icon: Icons.notifications,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Notifications(),
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        const Divider(
                          endIndent: 8.0,
                          thickness: 1,
                          color: kAppGreenColor,
                        ),
                        _DrawerButton(
                          title: "Logout",
                          icon: Icons.logout,
                          onTap: () {
                            cubit.logout().then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
                            });
                          },
                        ),
                        _DrawerButton(
                          title: "Setting",
                          icon: Icons.settings,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    Key? key,
    required this.title,
    this.icon,
    this.onTap,
  }) : super(key: key);
  final String title;
  final IconData? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                color: kAppWhiteColor,
              ),
            if (icon != null)
              const SizedBox(
                width: 8.0,
              ),
            Text(
              title,
              style: const TextStyle(
                color: kAppWhiteColor,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
