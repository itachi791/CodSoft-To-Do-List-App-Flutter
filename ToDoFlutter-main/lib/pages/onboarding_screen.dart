import 'package:flutter/material.dart';
import 'package:todoflutter/pages/home_page.dart';
import 'package:todoflutter/pages/intro_page1.dart';
import 'package:todoflutter/pages/intro_page2.dart';
import 'package:todoflutter/pages/intro_page3.dart';

const Color lightPurpleColor = Color(0xFF994ECC);
const Color deepBlueColor = Color(0xFF3E187A);

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with AutomaticKeepAliveClientMixin {
  final PageController _controller = PageController();
  bool onLastPage = false;
  bool onFirstPage = true;
  final int lastPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == lastPageIndex);
                onFirstPage = (index == 0);
              });
            },
            children: [
              const IntroPage1(),
              IntroPage2(),
              const IntroPage3(),
            ],
          ),
          Positioned(
            top: 25.0,
            right: 16.0,
            child: onLastPage
                ? Container()
                : ElevatedButton(
              onPressed: () {
                if (_controller.page != lastPageIndex) {
                  _controller.animateToPage(
                    lastPageIndex,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: const Text(
                'Skip',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: 50.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              alignment: onFirstPage ? const Alignment(0, 0.75) : const Alignment(0, 0.75),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: onFirstPage
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    if (!onFirstPage) backButton(),
                    if (onLastPage) getStartedButton() else nextButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton backButton() => ElevatedButton(
    onPressed: () {
      _controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    child: const Text('Back', style: TextStyle(fontWeight: FontWeight.bold)),
  );

  ElevatedButton getStartedButton() => ElevatedButton(
    onPressed: () => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
          (route) => false,
    ),
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    ),
    child: Ink(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red.shade400, deepBlueColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 100.0, minHeight: 40.0),
        alignment: Alignment.center,
        child: const Text(
          'Get Started',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );


  ElevatedButton nextButton() => ElevatedButton(
    onPressed: () {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    child: const Text('Next', style: TextStyle(fontWeight: FontWeight.bold)),
  );

  @override
  bool get wantKeepAlive => true;
}
