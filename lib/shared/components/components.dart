import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khatar_finaal/models/reservation.dart';

/*Widget defaultFormField({

  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  required Function onSubmit,
  required Function onChange,

})
=> TextFormField(
  controller: controller,
  keyboardType: type,
  style: TextStyle(color: Colors.amber),
  cursorColor: Colors.white,
  onFieldSubmitted: onSubmit(),

  onChanged: onChange(),
  validator: validate(),
  decoration: InputDecoration(
    labelText : label,
    labelStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.amber
    ),
    prefixIcon: Icon(
      prefix,
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
);*/

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function(String) validate,
  required IconData prefix,
  required String label,
  bool isPassword = false,
  bool isClickable = true,
  onSubmit,
  onChange,
  onTap,
  IconData? suffix,
  suffixPressed()?,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      style: TextStyle(color: Colors.amber),
      cursorColor: Colors.white,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword,
      enabled: isClickable,
      onChanged: onChange,
      onTap: onTap,
      validator: (s) {
        return validate(s!);
      },
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
        ),
        prefixIcon: Icon(
          prefix,
          color: Colors.amber,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed!,
                icon: Icon(
                  suffix,
                  color: Colors.amber,
                ),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.amber),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.amber),
            borderRadius: BorderRadius.circular(5)),
      ),
    );

Widget defaultButton({
  required double width,
  required Color backgroundColor,
  required Function functionOnPressed,
  required String buttonText,
  bool isUpperCase = true,
  double borderRadius = 0,
  //required TextStyle buttonTextSytyle,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: () {
          functionOnPressed();
        },
        child: Text(
          isUpperCase ? buttonText.toUpperCase() : buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
        color: backgroundColor,
      ),
    );

Widget MenuItem(
        {required String TextMenu,
        required String ImageLink,
        required BuildContext context,
        required Widget screen}) =>
    Expanded(
      child: InkWell(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.amber,
                  ),
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage('${ImageLink}'),
                  ),
                ],
              ),
            ),
            Text(
              '${TextMenu}',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        onTap: () {
          navigateTo(context, screen);
        },
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget defaultButtonSign({
  double width = double.infinity,
  //Color backGround=Colors.blue,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            //color: backGround,
            color: Colors.blue),
        child: MaterialButton(
          onPressed: () {
            function();
          },
          child: Text(text),
        ));

final List<String> shopImagesList = [
  'assets/images/khatarShop1.jpg',
  'assets/images/khatarShop2.jpg',
  'assets/images/khatarShop4.jpg',
  'assets/images/khatarShop5.jpg',
  'assets/images/khatarShop6.jpg',
  'assets/images/khatarShop7.jpg',
  'assets/images/khatarShop8.jpg',
  'assets/images/khatarShop9.jpg',
  'assets/images/khatarShop10.jpg',
];

final List<String> photosessionImagesList = [
  'assets/images/khatarPhoto4.jpg',
  'assets/images/khatarPhoto8.jpg',
  'assets/images/khatarPhoto9.jpg',
  'assets/images/khatarPhoto19.jpg',
  'assets/images/khatarPhoto20.jpg',
  'assets/images/khatarPhoto21.jpg',
  'assets/images/khatarPhoto15.jpg',
  'assets/images/khatarPhoto3.jpg',
  'assets/images/khatarPhoto11.jpg',
  'assets/images/khatarPhoto18.jpg',
  'assets/images/khatarPhoto5.jpg',
  'assets/images/khatarPhoto14.jpg',
];

Widget buildItem(reservationModel model) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 5,
        ),
        Text(
          '${model.name}',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            '${model.date}',
            style: TextStyle(color: Colors.amber),
          ),
        ),
        Expanded(
          child: Text(
            '${model.time}',
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ],
    );

Widget buildCourseItem(reservationModel model) => Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 5,
          ),
          Text(
            '${model.name}',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              '${model.date}',
              style: TextStyle(color: Colors.amber),
            ),
          ),
          Expanded(
            child: Text(
              '${model.time}',
              style: TextStyle(color: Colors.amber),
            ),
          ),
          Expanded(
            child: Text(
              '${model.title}',
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ],
      ),
    );
