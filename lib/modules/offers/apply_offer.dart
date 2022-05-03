import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:khatar_finaal/shared/components/components.dart';
import 'package:khatar_finaal/shared/cubit/cubit.dart';
import 'package:khatar_finaal/shared/cubit/states.dart';

var ReservationNameController = TextEditingController();
var timeController = TextEditingController();
var dateController = TextEditingController();
var offerController = TextEditingController();

class ApplyingOffer extends StatelessWidget {
  const ApplyingOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,KhatarStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center ,
              //mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Take your exclusive offer now',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                defaultFormField(
                  controller: ReservationNameController,
                  type: TextInputType.text,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Sorry, the name must be filled to apply the offer';
                    }
                    return null;
                  },
                  label: 'Reservation Name',
                  prefix: Icons.account_circle,
                ), //defaultFormField
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                  controller: offerController,
                  type: TextInputType.phone,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Sorry, the name must be filled to apply the offer';
                    }
                    return null;
                  },
                  label: 'Offer number',
                  prefix: Icons.local_offer_outlined,
                ), //defaultFormField
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                  controller: timeController,
                  type: TextInputType.datetime,
                  onTap: () {
                    //print('Timing has been tapped');
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      timeController.text = value!.format(context).toString();
                      print(value.format(context));
                    });
                  },
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Time must not be empty';
                    }
                    return null;
                  },
                  label: 'time you want',
                  prefix: Icons.watch_later_outlined,
                ), //defaultFormField
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                  controller: dateController,
                  type: TextInputType.datetime,
                  onTap: () {
                    //print('Timing has been tapped');
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2030-12-31'),
                    ).then((value) {
                      //print(DateFormat.yMMMd().format(value!));
                      dateController.text = DateFormat.yMMMd().format(value!);
                    });
                  },
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Date must not be empty';
                    }
                    return null;
                  },
                  label: 'Date you want',
                  prefix: Icons.calendar_today,
                ), //defaultFormField
                SizedBox(
                  height: 20,
                ),
                defaultButton(
                    width: 240,
                    backgroundColor: Colors.amber,
                    functionOnPressed: () {
                      AppCubit.get(context).createCourse(date: dateController.text, time: timeController.text, title: ReservationNameController.text);

                    },
                    buttonText: 'Apply',
                    borderRadius: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
