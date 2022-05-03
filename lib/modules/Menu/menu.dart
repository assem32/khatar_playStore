import 'package:flutter/material.dart';
import 'package:khatar_finaal/modules/birthday/birthday.dart';
import 'package:khatar_finaal/modules/course/course.dart';
import 'package:khatar_finaal/modules/offers/offers.dart';
import 'package:khatar_finaal/modules/photo_session/photo_session.dart';
import 'package:khatar_finaal/modules/reservation/reservation.dart';
import 'package:khatar_finaal/modules/shop/shopping.dart';
import 'package:khatar_finaal/shared/components/components.dart';

import '../drawer/drawer.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNav(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Menu',
          style: TextStyle(color: Colors.amberAccent),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: [
                  MenuItem(
                      TextMenu: 'Photosession Booking',
                      ImageLink: 'assets/images/khatarAin2.png',
                      context: context,
                      screen: PhotoSession()),
                  SizedBox(
                    width: 10,
                  ),
                  MenuItem(
                      TextMenu: 'Khatar The Shop',
                      ImageLink: 'assets/images/khatarShop.jpg',
                      context: context,
                      screen: Shopping()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: [
                  MenuItem(
                      TextMenu: 'Course Booking',
                      ImageLink: 'assets/images/khatarSC.jpeg',
                      context: context,
                      screen: Course()),
                  MenuItem(
                      TextMenu: 'Personal Resrvation',
                      ImageLink: 'assets/images/khatarKhatar.jpeg',
                      context: context,
                      screen: Reservation()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: [
                  MenuItem(
                      TextMenu: 'Offers',
                      ImageLink: 'assets/images/khatarAin.jpeg',
                      context: context,
                      screen: Offers()),
                  MenuItem(
                      TextMenu: 'Birthday course',
                      ImageLink: 'assets/images/khatarCai.jpeg',
                      context: context,
                      screen: BirthDay())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}