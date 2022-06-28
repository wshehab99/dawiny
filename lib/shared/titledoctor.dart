import 'package:flutter/material.dart';

class TitleDoctor extends StatelessWidget {
  TitleDoctor({Key? key, required this.name}) : super(key: key);
  String? name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
        child: Row(
          children: [
            Text(
              name!,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'see all',
                  style: TextStyle(color: Colors.blue),
                )),
          ],
        ),
      ),
    );
  }
}

class BodyDoctor extends StatelessWidget {
  BodyDoctor({
    Key? key,
    required this.name,
    required this.numberName,
    required this.color,
  }) : super(key: key);
  String? name;
  String? numberName;
  int? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Color(color!), borderRadius: BorderRadius.circular(15)),
        height: 190,
        width: 120,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              name!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
              maxLines: 2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              numberName!,
              style: const TextStyle(fontSize: 15.0, color: Colors.white),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class BodyImage extends StatelessWidget {
  const BodyImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffDEE2E6),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Image.asset(
            'assets/images/22.jpg',
            width: 120,
            height: 100,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'DR:Jerome Bell',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Specialist Doctor',
            style: TextStyle(
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
