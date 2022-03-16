import 'package:flutter/material.dart';
import 'package:teriaqdoctor/components/app_botton.dart';

import '../homepagescreen/HomePageScreen.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Spacer(),
          Image.asset('assets/images/teriaq.jpg'),
          SizedBox(height: 15,),
          Text('Congrats! ' , style: TextStyle(fontSize: 24 , color: Colors.blue , fontWeight: FontWeight.bold),),
          SizedBox(height: 24,),
          Text('Your Account is ready to use' , style: TextStyle(fontSize: 16),),
          SizedBox(height: 24,),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: AppButton(
              text: 'Go To Homepage',
              borderradius: BorderRadius.circular(90),
              textColor: Colors.white,
              bottenColor: Colors.blue,

              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
