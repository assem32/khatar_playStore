import 'package:flutter/material.dart';
import 'package:khatar_finaal/modules/offers/apply_offer.dart';
import 'package:khatar_finaal/shared/components/components.dart';



class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Text('1.Individual offer :', style: TextStyle(
              color: Colors.amber,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text('Khatar Zone offers you that if you are more than 5 people, you will pay a minimum of 25 LE. fee for the whole day instead of 30 LE',style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                    textAlign : TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            Text('2.Photosession offers :', style: TextStyle(
              color: Colors.amber,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text('Khatar Zone offers you that If you want professional photosession taken by professional photographers, and the number of shooting hours you want is 3 hours or more, you will pay 150 pounds. per hour instead of 200',style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                    textAlign : TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            Text('1.Birthday parties offer :', style: TextStyle(
              color: Colors.amber,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text('Khatar Zone offers you that if you want to make a birthday party and the number of attendees is 10 or more, you will pay 30 LE. for each person instead of 45 , and we will give you a soft drink for free ',style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                    textAlign : TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            Text('4.Course booking offer :', style: TextStyle(
              color: Colors.amber,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text('Khatar Zone offers you that if you are an instructor or a teacher and you want to reserve a room for your session, you will pay 150 LE. instead of 200 per hour if your session is more than 3 hours',style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                    textAlign : TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35.0,
            ),

            defaultButton(
              width: 150,
              functionOnPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder : (context)=> ApplyingOffer(),
                  ),
                );
              },
              buttonText: 'Apply offer now!',
              backgroundColor: Colors.amber,
              borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}