import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:khatar_finaal/shared/cubit/cubit.dart';
import 'package:khatar_finaal/shared/cubit/states.dart';

class MapCoffe extends StatelessWidget {
  const MapCoffe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,KhatarStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(

          ),
          body: GoogleMap(
           onMapCreated: AppCubit.get(context).MapCreate,
            markers: AppCubit.get(context).marker,
            initialCameraPosition:
            CameraPosition(target: LatLng(30.043657, 31.237234), zoom: 18),
          ),
        );
      },

    );
  }
}
