import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:khatar_finaal/shared/components/components.dart';
import 'package:khatar_finaal/shared/cubit/cubit.dart';
import 'package:khatar_finaal/shared/cubit/states.dart';

class Reservation extends StatelessWidget {
  var ReservationNameController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
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
              children: [
                SizedBox(
                  height: 40,
                ),
                defaultFormField(
                  controller: ReservationNameController ,
                  type: TextInputType.text,
                  validate: (String value)
                  {
                    if(value.isEmpty)
                    {
                      return 'Please enter a name to complete the reservation';
                    }
                    return null;
                  },
                  label: 'Client name',
                  prefix: Icons.account_circle_outlined,
                ), //defaultFormField
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                  controller: timeController,
                  type: TextInputType.datetime,
                  onTap: ()
                  {
                    //print('Timing has been tapped');
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value)
                    {
                      timeController.text = value!.format(context).toString();
                      print(value.format(context));

                    });
                  },
                  validate: (String value)
                  {
                    if(value.isEmpty)
                    {
                      return 'Time must not be empty';
                    }
                    return null;
                  },
                  label: 'Resrvation time',
                  prefix: Icons.watch_later_outlined,
                ), //defaultFormField
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                  controller: dateController,
                  type: TextInputType.datetime,
                  onTap: ()
                  {
                    //print('Timing has been tapped');
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2030-12-30'),
                    ).then((value)
                    {
                      //print(DateFormat.yMMMd().format(value!));
                      dateController.text = DateFormat.yMMMd().format(value!);

                    });
                  },
                  validate: (String value)
                  {
                    if(value.isEmpty)
                    {
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
                defaultButton(
                  width: 240,
                  functionOnPressed: ()
                  {
                    AppCubit.get(context).createReservation(
                        date: dateController.text,
                        time: timeController.text,
                        title: ReservationNameController.text);
                  },
                  buttonText: 'Confirm',
                  backgroundColor: Colors.amber,
                  borderRadius: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
