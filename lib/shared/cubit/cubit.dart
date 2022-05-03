import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:khatar_finaal/models/reservation.dart';
import 'package:khatar_finaal/models/user_moder.dart';
import 'package:khatar_finaal/modules/Login/login_screen.dart';
import 'package:khatar_finaal/shared/cubit/states.dart';
import 'package:khatar_finaal/shared/network/local/cache_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class AppCubit extends Cubit<KhatarStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  UserModel ?model;

  void getUserData() {
    emit(AppLoadingState());
    FirebaseFirestore.instance.collection('user')
        .doc(uId)
        .get()
        .then((value) {
      print(value.data());
      model = UserModel.fromJson(value.data());
      emit(AppSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorState(error));
    });
  }

  void createReservation({
    required String ?date,
    required String ?time,
    required String ?title,
  }) {
    reservationModel rmodel = reservationModel(
        phone: model?.phone,
        uId: model?.uId,
        mail: model?.mail,
        title: title,
        time: time,
        date: date


    );

    FirebaseFirestore.instance.collection('reservation')
        .add(rmodel.toMap())
        .then((value) {
      print('success');
      emit(AppCreatePhotoSession());
    }).catchError((error) {
      print('error');
      emit(AppCreatePhotoErrorSession(error));
    });
  }

  void createPhotoSession({
    required String ?date,
    required String ?time,
    required String ?title,
  }) {
    reservationModel rmodel = reservationModel(
        phone: model?.phone,
        uId: model?.uId,
        mail: model?.mail,
        title: title,
        time: time,
        date: date


    );

    FirebaseFirestore.instance.collection('photo').add(rmodel.toMap()).then((
        value) {
      print('success');
      emit(AppCreatePhotoSession());
    }).catchError((error) {
      print('error');
      emit(AppCreatePhotoErrorSession(error));
    });
  }

  void createCourse({
    required String ?date,
    required String ?time,
    required String ?title,
  }) {
    reservationModel rmodel = reservationModel(
        name: model?.name,
        phone: model?.phone,
        uId: model?.uId,
        mail: model?.mail,
        title: title,
        time: time,
        date: date


    );

    FirebaseFirestore.instance.collection('coures').add(rmodel.toMap()).then((
        value) {
      print('success');
      emit(AppCreatePhotoSession());
    }).catchError((error) {
      print('error');
      emit(AppCreatePhotoErrorSession(error));
    });
  }

  void createBirthday({
    required String ?date,
    required String ?time,
    required String ?title,
  }) {
    reservationModel rmodel = reservationModel(
        name: model?.name,
        phone: model?.phone,
        uId: model?.uId,
        mail: model?.mail,
        title: title,
        time: time,
        date: date


    );

    FirebaseFirestore.instance.collection('birthday').add(rmodel.toMap()).then((
        value) {
      print('success');
      emit(AppCreatePhotoSession());
    }).catchError((error) {
      print('error');
      emit(AppCreatePhotoErrorSession(error));
    });
  }

  void createOffers({
    required String ?date,
    required String ?time,
    required String ?title,
  }) {
    reservationModel rmodel = reservationModel(
        name: model?.name,
        phone: model?.phone,
        uId: model?.uId,
        mail: model?.mail,
        title: title,
        time: time,
        date: date


    );

    FirebaseFirestore.instance.collection('offers').add(rmodel.toMap()).then((
        value) {
      print('success');
      emit(AppCreatePhotoSession());
    }).catchError((error) {
      print('error');
      emit(AppCreatePhotoErrorSession(error));
    });
  }

  List<reservationModel> reservationList = [];


  void getReservation() {
    FirebaseFirestore.instance
        .collection('reservation')
        .snapshots()
        .listen((event) {
       reservationList = [];

      event.docs.forEach((element) {
        reservationList.add(reservationModel.fromJson(element.data()));
      });
       emit(GetPhotoSession());
    });
  }

  List<reservationModel> courseList = [];

  void getCourse() {
    FirebaseFirestore.instance
        .collection('coures')
        .snapshots()
        .listen((event) {
      courseList = [];

      event.docs.forEach((element) {
        courseList.add(reservationModel.fromJson(element.data()));
      });
      emit(GetPhotoSession());
    });
  }

  List<reservationModel> birthday = [];

  void getBirthday() {
    FirebaseFirestore.instance
        .collection('birthday')
        .snapshots()
        .listen((event) {
      birthday = [];

      event.docs.forEach((element) {
        birthday.add(reservationModel.fromJson(element.data()));


      });
      emit(GetPhotoSession());
    });
  }

  List<reservationModel> photoSessionList = [];

  void getPhotoSession() {
    FirebaseFirestore.instance
        .collection('photo')
        .snapshots()
        .listen((event) {
      photoSessionList = [];

      event.docs.forEach((element) {
        photoSessionList.add(reservationModel.fromJson(element.data()));
      });
      emit(GetPhotoSession());
    }

    );

  }
  List<reservationModel> offersList=[];
  void getOffers() {
    FirebaseFirestore.instance
        .collection('offers')
        .snapshots()
        .listen((event) {
      offersList = [];

      event.docs.forEach((element) {
        offersList.add(reservationModel.fromJson(element.data()));
      });
      emit(GetPhotoSession());
    });
  }
    Future <void> signOut(context) async {
      FirebaseAuth.instance.signOut().then((value) async {
        CacheHelper.removeData('uId');
        await FirebaseFirestore.instance.collection('users').get().then((value) {
          value.docs.forEach((element) async {
            if (element.id == model!.uId)
              element.reference.update({'token': null});
          });
        });
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context)=>LoginScreen())
            ,(route){
              return false;
            }
        );
        emit(SignOutSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(SignOutErrorState());
      });
    }

  Future<void> launchInWebViewOrVC() async {
    final Uri url =
    Uri(scheme: 'https', host: 'www.facebook.com', path: 'Khatar-Zone-106283858045559');    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  Set<Marker> marker={};
  void MapCreate(GoogleMapController controller){
    marker.add(
      Marker(
        markerId: MarkerId('id -1'),
        position: LatLng(30.043657, 31.237234),
        infoWindow: InfoWindow(
          title: 'Khatar Zone'
        )
      )
    );
    emit(GetMap());
  }

}