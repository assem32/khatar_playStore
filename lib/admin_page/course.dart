import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatar_finaal/shared/components/components.dart';
import 'package:khatar_finaal/shared/cubit/cubit.dart';
import 'package:khatar_finaal/shared/cubit/states.dart';

class AdminCourse extends StatelessWidget {
  const AdminCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,KhatarStates>(
      listener:(context,state){},
      builder:(context,state){
        AppCubit.get(context).getCourse();


        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Course Page',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),

            backgroundColor: Colors.black,
          ),
          body: Column(children: [
            Expanded(child: ListView.separated(itemBuilder: (context,index)=>buildCourseItem(AppCubit.get(context).courseList[index]), separatorBuilder: (context,index)=>SizedBox(height: 10,), itemCount: AppCubit.get(context).courseList.length)),
          ],),
        );
      },
    );
  }
}