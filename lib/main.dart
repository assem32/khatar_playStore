import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatar_finaal/modules/Login/login_screen.dart';
import 'package:khatar_finaal/modules/Menu/menu.dart';
import 'package:khatar_finaal/shared/cubit/cubit.dart';
import 'package:khatar_finaal/shared/cubit/login/login_cubit.dart';
import 'package:khatar_finaal/shared/cubit/login/login_states.dart';
import 'package:khatar_finaal/shared/cubit/states.dart';
import 'package:khatar_finaal/shared/network/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();
  Widget widget;
  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = MenuScreen();
  } else
    widget = LoginScreen();
  runApp(khatarZone(startWidget: widget));
}
class khatarZone extends StatelessWidget {
  final Widget ?startWidget;
  khatarZone({this.startWidget});


  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>AppCubit()..getUserData()),
      ],
      child: BlocConsumer<AppCubit,KhatarStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        },

      ),
    );
  }
}
