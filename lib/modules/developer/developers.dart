import 'package:flutter/material.dart';

class Developers extends StatelessWidget {
  const Developers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 120.0,
                backgroundImage: AssetImage('assets/images/assem.jpeg'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text('Name: Assem El-Hadidi',style: TextStyle(
                color: Colors.amber,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
                textAlign : TextAlign.start,),
              Text('Email: assemhadidi74@gmail.com',style: TextStyle(
                color: Colors.amber,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
                textAlign : TextAlign.start,),
              Text('Phone: 01123207197',style: TextStyle(
                color: Colors.amber,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
                textAlign : TextAlign.start,),

              SizedBox(
                height: 25.0,
              ),
              CircleAvatar(
                radius: 120.0,
                backgroundImage: AssetImage('assets/images/youssef.jpeg'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text('Name: Youssif Moustafa',style: TextStyle(
                color: Colors.amber,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
                textAlign : TextAlign.start,),
              Text('Email: youssifmoustafa13@gmail.com',style: TextStyle(
                color: Colors.amber,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
                textAlign : TextAlign.start,),
              Text('Phone: 01554124774',style: TextStyle(
                color: Colors.amber,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
                textAlign : TextAlign.start,),

            ],
          ),
        ),
      ),
    );
  }
}