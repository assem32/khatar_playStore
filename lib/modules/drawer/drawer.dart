import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatar_finaal/modules/Login/login_screen.dart';
import 'package:khatar_finaal/modules/developer/developers.dart';
import 'package:khatar_finaal/modules/drawer/google_map.dart';
import 'package:khatar_finaal/shared/cubit/cubit.dart';
import 'package:khatar_finaal/shared/cubit/states.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,KhatarStates>(
    listener: (context,state){},
    builder: (context,state){
      return Drawer(

        backgroundColor: Colors.black,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.amber
              ),
              accountName: Text('${AppCubit.get(context).model?.name}'),
              accountEmail: Text('${AppCubit.get(context).model?.mail}'),
              currentAccountPicture:CircleAvatar(
                backgroundImage:NetworkImage(
                    'https://scontent.fcai20-2.fna.fbcdn.net/v/t1.6435-9/117187230_613985869548295_463990936402864817_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeGmo-MS5Z02Nf8byki3IWiiv5kVDtACS2a_mRUO0AJLZhOrMBnhslqPfFBbzFHSHDRQJkkECmhq8nCuPWwi2jeV&_nc_ohc=AFcU9bEJIL8AX-ym_Ax&_nc_ht=scontent.fcai20-2.fna&oh=00_AT9eZxtbgTIVcGVmv9LH3VFel8d-2wrdqycE3J1x42NUFQ&oe=6258C59E'
                ) ,
                radius: 30,
              ) ,
            ),
            ListTile(
              leading: Icon(Icons.location_on_outlined,color: Colors.amber,),
              title: Text('location',style: TextStyle(color: Colors.amber),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MapCoffe()));
              },
            ),
            ListTile(
              leading: Icon(Icons.facebook_outlined,color: Colors.amber,),
              title: Text('Facebook',style: TextStyle(color: Colors.amber),),
              onTap: (){
                AppCubit.get(context).launchInWebViewOrVC();
              },
            ),
            ListTile(
              leading: Icon(Icons.phone,color: Colors.amber,),
              title: Text('Contact us',style: TextStyle(color: Colors.amber),),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.developer_mode_outlined,color: Colors.amber,),
              title: Text('About developer',style: TextStyle(color: Colors.amber),),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder : (context)=>Developers(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_back_outlined,color: Colors.amber,),
              title: Text('Log out',style: TextStyle(color: Colors.amber),),
              onTap: (){
                AppCubit.get(context).signOut(context);
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context)=>LoginScreen())
                    ,(route){
                      return false;
                    }
                );
              },
            ),
          ],
        ),
      );
    },
    );
  }
}
