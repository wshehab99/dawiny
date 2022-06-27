import 'dart:ui';

import 'package:find_doctor/screens/profile_data.dart';
import 'package:find_doctor/screens/welcome/user_profile.dart';
import 'package:find_doctor/shared/constant.dart';
import 'package:find_doctor/shared/glass.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: GlassMorphism(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/photo.jpg")),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Morsy HashisH",
                          style: TextStyle(
                              color: kAppWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          "morsyhashish123@gmail.com",
                          style: TextStyle(
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
                },
              ),
              _DrawerButton(
                title: "Notification",
                icon: Icons.notifications,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Spacer(),
              const Divider(
                endIndent: 8.0,
                thickness: 1,
                color: kAppGreenColor,
              ),
              _DrawerButton(
                title: "Logout",
                icon: Icons.logout,
                onTap: () {},
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
              SizedBox(
                width: 8.0,
              ),
            Text(
              title,
              style: TextStyle(
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
