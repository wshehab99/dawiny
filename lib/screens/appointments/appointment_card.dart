import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard(
      {Key? key,
      required this.doctorName,
      required this.dateTime,
      required this.startAppointment,
      required this.endAppointment,
      required this.type,
      this.onPressed})
      : super(key: key);
  final String doctorName;
  final String type;
  final String dateTime;
  final String startAppointment;
  final String endAppointment;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          colors: [
            Colors.green.withOpacity(0.3),
            Colors.blue.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [BoxShadow(blurRadius: 8.0, color: Colors.blue[50]!)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IconText(name: doctorName, imgPath: 'assets/images/doctorN.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                name: dateTime,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
                icon: Icons.calendar_month,
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red[800],
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Dr.$doctorName',
            style: TextStyle(
                fontSize: 24,
                color: Colors.blue[600],
                fontWeight: FontWeight.bold,
                height: 1.2),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              (type.contains("online"))
                  ? const Icon(
                      Icons.video_call_outlined,
                      size: 40,
                    )
                  : const Icon(
                      Icons.videocam_off_outlined,
                      size: 40,
                    ),
              const SizedBox(width: 10),
              Text(
                type,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold,
                    height: 1.2),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconText(
                name: '$startAppointment to $endAppointment',
                style: TextStyle(
                    color: Colors.blue[800], fontWeight: FontWeight.bold),
                icon: Icons.access_time_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.name,
    required this.icon,
    this.style,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image(
        //   image: AssetImage(imgPath),
        //   // color: Colors.white,
        //   width: 24,
        // ),

        Icon(
          icon,
          color: style?.color,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          name,
          style: style ??
              const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                // color: Colors.white,
              ),
        ),
      ],
    );
  }
}
