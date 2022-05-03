import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:khatar_finaal/models/reservation.dart';
import 'package:khatar_finaal/modules/photo_session/photo_session_example.dart';
import 'package:khatar_finaal/shared/components/components.dart';
import 'package:khatar_finaal/shared/cubit/cubit.dart';
import 'package:khatar_finaal/shared/cubit/states.dart';


class PhotoSession extends StatelessWidget {
  var ReservationNameController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, KhatarStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = AppCubit
            .get(context)
            .model;
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,

          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                  SizedBox(
                  height: 40,
                ),
                defaultFormField(
                  controller: ReservationNameController,
                  type: TextInputType.text,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a name to complete the reservation';
                    }
                    return null;
                  },
                  label: 'Client name',
                  prefix: Icons.account_circle_outlined,
                ),
                //defaultFormField
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
                  label: 'Resrvation time',
                  prefix: Icons.watch_later_outlined,
                ),
                //defaultFormField
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
                      lastDate: DateTime.parse('2030-12-30'),
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
                  label: 'Reservation date',
                  prefix: Icons.calendar_today,
                ),
                SizedBox(
                  height: 26,
                ),
                Row(
                  children: [
                  SizedBox(
                  height: 350,
                ),
                defaultButton(width: 170,
                    backgroundColor: Colors.amber,
                    functionOnPressed:
                        () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PhotoSessionExamples()));
                    },
                    buttonText: 'take a look',
                    borderRadius: 10
                ),
                    SizedBox(
                      width: 20,
                    ),
                defaultButton(
                width: 170,
                functionOnPressed: () {
                  if (formKey.currentState!.validate()) {
                    AppCubit.get(context).createPhotoSession(
                        date: dateController.text,
                        time: timeController.text,
                        title: ReservationNameController.text);
                  }
                },
                buttonText: 'Confirm',
                backgroundColor: Colors.amber,
                borderRadius: 10,
              ),


              ],
            )
            ],
          ),
        ),)
        ,
        )
        ,
        );
      },

    );
  }
}
