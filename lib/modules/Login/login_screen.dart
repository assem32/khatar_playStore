import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatar_finaal/admin_page/admin.dart';
import 'package:khatar_finaal/modules/Menu/menu.dart';
import 'package:khatar_finaal/modules/Signup/signup_screen.dart';
import 'package:khatar_finaal/shared/cubit/login/login_cubit.dart';
import 'package:khatar_finaal/shared/cubit/login/login_states.dart';
import 'package:khatar_finaal/shared/network/local/cache_helper.dart';



import '../../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is LoginSuccessState)
          {
            CacheHelper.saveData(key: 'uId', value: state.uId)
                .then((value){
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context)=>MenuScreen())
                  ,(route){
                    return false;
                  }
              );
            });

          }
        },
        builder: (context,state){
          return Scaffold(
            backgroundColor: Colors.black87,
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.black,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.amber),
                              cursorColor: Colors.white,
                              onFieldSubmitted: (String value)
                              {
                                print (value);
                              },
                              onChanged: (String value)
                              {
                                print (value);
                              },
                              validator: (String? value){
                                if (value!.isEmpty){
                                  return "Email must not be empty";
                                } else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText : 'Email',
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber
                                ),
                                prefixIcon: Icon(
                                  Icons.attach_email,
                                  color: Colors.amber,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.amber),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.amber),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.amber),
                              obscureText: true,
                              validator: (String? value){
                                if (value!.isEmpty){
                                  return "password must not be empty";
                                } else{
                                  return null;
                                }
                              },
                              onFieldSubmitted: (String value)
                              {
                                print (value);
                              },
                              onChanged: (String value)
                              {
                                print (value);
                              },
                              decoration: InputDecoration(
                                labelText : 'Password',
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.amber,
                                ),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.amber,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.amber),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.amber),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          defaultButton(
                            width: 120,
                            functionOnPressed: ()
                            {
                              if(formKey.currentState!.validate())
                              {
                                if(emailController.text=='admin'&&passwordController.text=='admin')
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin()));
                                else {
                                  LoginCubit.get(context).userLogin(
                                      mail: emailController.text,
                                      pass: passwordController.text);
                                  print(emailController.text);
                                }
                              }
                              else
                                return null;

                            },
                            buttonText: 'Login',
                            backgroundColor: Colors.amber,
                            borderRadius: 10,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don\'t have an account?", style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber
                              ),),
                              TextButton(
                                onPressed: ()
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder : (context)=>SignupScreen(),
                                    ),
                                  );
                                },
                                child: Text("Signup", style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color:  Colors.red,
                                ),),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),);
        },
      ),
    );
  }
}

