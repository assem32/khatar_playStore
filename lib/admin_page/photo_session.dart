import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatar_finaal/shared/components/components.dart';
import 'package:khatar_finaal/shared/cubit/cubit.dart';
import 'package:khatar_finaal/shared/cubit/states.dart';

class AdminPhotoSession extends StatelessWidget {
  const AdminPhotoSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,KhatarStates>(
      listener:(context,state){},
      builder:(context,state){
        AppCubit.get(context).getPhotoSession();


        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('PhotoSession Page',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),

            backgroundColor: Colors.black,
          ),
          body: Column(children: [
            Expanded(child: ListView.separated(itemBuilder: (context,index)=>buildItem(AppCubit.get(context).photoSessionList[index]), separatorBuilder: (context,index)=>SizedBox(height: 10,), itemCount: AppCubit.get(context).photoSessionList.length)),
          ],),
        );
      },
    );
  }
}