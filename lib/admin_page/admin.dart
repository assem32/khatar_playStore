import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatar_finaal/admin_page/admin_birthday.dart';
import 'package:khatar_finaal/admin_page/course.dart';
import 'package:khatar_finaal/admin_page/offers_admin.dart';
import 'package:khatar_finaal/admin_page/photo_session.dart';
import 'package:khatar_finaal/admin_page/reservation.dart';
import 'package:khatar_finaal/shared/components/components.dart';
import 'package:khatar_finaal/shared/cubit/cubit.dart';
import 'package:khatar_finaal/shared/cubit/states.dart';




class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,KhatarStates>(
      listener:(context,state){},
      builder:(context,state){

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Admin Page',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
            backgroundColor: Colors.black,
          ),
          body: Column(children: [
            Row(
              children: [
                MenuItem(
                    TextMenu: 'Birthday course',
                    ImageLink: 'assets/images/khatarCai.jpeg',
                    context: context,
                    screen: AdminBirthday()),
                MenuItem(
                    TextMenu: 'Photosession Booking',
                    ImageLink: 'assets/images/khatarAin2.png',
                    context: context,
                    screen: AdminPhotoSession()),
              ],
            ),
            Row(
              children: [
                MenuItem(
                    TextMenu: 'Course Booking',
                    ImageLink: 'assets/images/khatarSC.jpeg',
                    context: context,
                    screen: AdminCourse()),
                MenuItem(
                    TextMenu: 'Personal Resrvation',
                    ImageLink: 'assets/images/khatarKhatar.jpeg',
                    context: context,
                    screen: AdminReservation()),
              ],
            ),
            Row(
              children: [
                MenuItem(
                    TextMenu: 'Offers',
                    ImageLink: 'assets/images/khatarAin.jpeg',
                    context: context,
                    screen: AdminOffers()),
              ],
            )
          ],),
        );
      },
    );
  }


}
