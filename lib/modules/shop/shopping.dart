import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:khatar_finaal/shared/components/components.dart';
class Shopping extends StatelessWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center ,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Coming soon',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('Stay tuned wait for the hot offers',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            CarouselSlider(items: shopImagesList.map((item) => Container(
              child: Image.asset(
                item,fit: BoxFit.cover,
                width: double.infinity,
              ),
            )).toList(),
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1.0,
                height: 350.0,
                initialPage: 0,
                aspectRatio: 2.0,
                //enlargeCenterPage: true,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
