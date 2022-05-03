import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircleAvatar(
        radius: double.infinity,
        backgroundImage: AssetImage('assets/images/phone.jpg'),
      ),
    );
  }
}
