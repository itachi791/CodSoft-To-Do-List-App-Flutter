import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

const Color lightPurpleColor = Color(0xFF994ECC);
const Color deepBlueColor = Color(0xFF3E187A);
const Color goldColor = Color(0xFFFFD700);

class IntroPage2 extends StatelessWidget {
  final List<String> images = [
    'assets/Home.jpg',
    'assets/DeleteEdit.jpg',
    'assets/Mark.jpg',
  ];

  IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [lightPurpleColor, deepBlueColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            CarouselSlider(
              options: CarouselOptions(
                height: 450.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 9 / 16,
                autoPlayCurve: Curves.bounceOut,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.55, // Image width
              ),
              items: images.map((img) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      //margin: const EdgeInsets.only(top: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 50),
            //const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "・Effortless Task Management・",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500,
                    color: goldColor),
              ),
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Streamline task management effortlessly through seamless additions, edits, and removals"
                    ", ensuring an efficient and polished task management experience.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 1,
                  color: Colors.white, // Color of text on the gradient BG
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
