import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:khatar_finaal/shared/components/components.dart';

class PhotoSessionExamples extends StatelessWidget {
  const PhotoSessionExamples ({Key? key}) : super(key: key);

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
          //mainAxisAlignment: MainAxisAlignment.center ,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CarouselSlider(items: photosessionImagesList.map((item) => Container(
                child: Image.asset(
                  item,fit: BoxFit.cover,
                  width: double.infinity,
                ),
              )).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1.0,
                  height: double.infinity,
                  initialPage: 0,
                  aspectRatio: 2.0,
                  //enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}