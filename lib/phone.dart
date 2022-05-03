import 'package:flutter/material.dart';

class Phone extends StatelessWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircleAvatar(
        radius: double.infinity,
        backgroundImage: AssetImage('assets/images/location.jpg'),
      ),
    );
  }
}
