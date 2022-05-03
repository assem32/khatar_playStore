import 'package:flutter/material.dart';
import 'package:khatar_finaal/shared/components/components.dart';


import '../modules/Login/login_screen.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 200.0,
              backgroundImage: AssetImage('assets/images/khatarYaHabebe.jpeg'),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                defaultButton(
                  width: 120,
                  functionOnPressed: ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder : (context)=>LoginScreen(),
                      ),
                    );
                  },
                  buttonText: 'Start',
                  backgroundColor: Colors.amber,
                  borderRadius: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
