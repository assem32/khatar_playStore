import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatar_finaal/modules/Menu/menu.dart';
import 'package:khatar_finaal/shared/components/components.dart';
import 'package:khatar_finaal/shared/cubit/sign_up/sign_cubit.dart';
import 'package:khatar_finaal/shared/cubit/sign_up/sign_state.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController= TextEditingController();
    var phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (BuildContext context)=>SignInCubit(),
      child: BlocConsumer<SignInCubit,SocialRegisterStates>(
        listener: (context,state){

          if(state is SocialCreateUserSuccessState)
          {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MenuScreen(),
              ),
                  (route) {
                return false;
              },
            );
          }
        },
        builder: (context,state){
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Register now',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.amber),)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                          controller: nameController,
                          type: TextInputType.text,
                          validate: (value){
                            if(value.isEmpty)
                              print('Name must be filled');
                          },
                          prefix: Icons.account_circle,
                          label: 'User Name'),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
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
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
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
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
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
                          labelText: "Password",
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
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value){
                            if(value.isEmpty)
                              print('Phone number must not be empty');
                          },
                          prefix: Icons.local_phone,
                          label: 'Phone number'),
                      SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(condition: state is! SocialRegisterLoadingState,
                          builder:(context)=> defaultButtonSign(function:() {
                            if (formKey.currentState!.validate()) {
                              SignInCubit.get(context).userRegister
                                (
                                name: nameController.text,
                                mail: emailController.text,
                                pass: passwordController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                              text: 'Register'),
                          fallback: (context)=> Center(child: CircularProgressIndicator(),)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
