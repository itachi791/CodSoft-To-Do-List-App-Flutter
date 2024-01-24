import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

const Color lightPurpleColor = Color(0xFF994ECC);
const Color deepBlueColor = Color(0xFF3E187A);
const Color goldColor = Color(0xFFFFD700);

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

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
            Lottie.asset(
              'assets/Animation_1st.json',
              height: 250,
              width: 250,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "・Welcome to Taskade・",
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
                "Your personal task manager. Stay organized and boost productivity with our intuitive"
                    " to-do list app.",
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
