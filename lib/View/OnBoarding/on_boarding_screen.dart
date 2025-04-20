import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:concentric_transition/concentric_transition.dart';
import '../../core/Services/is_tablet.dart';
import '../Auth/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  int _currentPage = 0;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    checkIntroSeenStatus();
    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900), // Animation duration
    )..repeat(reverse: true); // Repeat the animation in a loop

    // Define the animation (up and down movement)
    _animation = Tween<Offset>(
      begin: Offset.zero, // Start position
      end: const Offset(0, 0.2), // Move down by 20% of the container height
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Smooth easing
    ));
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to avoid memory leaks
    super.dispose();
  }

  Future<void> checkIntroSeenStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool introSeen = prefs.getBool('introSeen') ?? false;

    if (introSeen) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  Future<void> markIntroAsSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('introSeen', true);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final pages = [
      PageData(
        title: "Track Your Exercises with AI",
        body: "FITify uses AI to analyze your exercise form in real-time, "
            "ensuring you perform each movement correctly and safely.",
        bgColor: Color(0xffCEE397),
        textColor: Colors.black,
        pic: 'lib/assets/track2.svg',
        subtitleColor: Colors.black38,
      ),
      PageData(
        title: "Stay Motivated",
        body:
            "Earn achievements, track streaks, and compete with friends on leaderboards to stay motivated on your fitness journey.",
        bgColor: Color(0xff27667B),
        textColor: Colors.white,
        subtitleColor: Colors.white60,
        pic: 'lib/assets/challenge.svg',
      ),
      PageData(
        title: "Nutrition & Fitness Advice",
        body:
            "Our AI-powered chatbot provides personalized fitness and nutrition tips to help you achieve your goals faster.",
        bgColor: Color(0xffCEE397),
        textColor: Colors.black,
        subtitleColor: Colors.black38,
        pic: 'lib/assets/nutrition.svg',
      ),
      PageData(
        title: "Join the Community",
        body:
            "Form groups, participate in challenges, and track progress together with friends and fitness enthusiasts.",
        bgColor: Color(0xff27667B),
        subtitleColor: Colors.white60,
        textColor: Colors.white,
        pic: 'lib/assets/community.svg',
      ),
      /*additional one to make circle button same color as background in last
       page to make it invisible*/
      PageData(
        title: "",
        body: "",
        bgColor: Color(0xff27667B),
        subtitleColor: Colors.white60,
        textColor: Colors.white,
        pic: 'lib/assets/community.svg',
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          ConcentricPageView(
            colors: pages.map((p) => p.bgColor).toList(),
            onChange: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            verticalPosition: _currentPage == pages.length - 2 ? 0.75 : 0.80,
            itemCount: pages.length - 1,
            itemBuilder: (index) {
              final page = pages[index];
              return SafeArea(
                child: _Page(page: page),
              );
            },
          ),
          // Add "Let's Start" button on the last page
          if (_currentPage == pages.length - 2)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    markIntroAsSeen();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    "Let's Start",
                    style: TextStyle(
                      color: pages[_currentPage].bgColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          // Helper text for the first page
          if (_currentPage == 0)
            Positioned(
              bottom: screenHeight * 0.025,
              left: 0,
              right: 0,
              child: Center(
                child: SlideTransition(
                  position: _animation,
                  child: Column(
                    children: [
                      Icon(
                        Icons.arrow_upward_rounded,
                        color: pages[_currentPage].subtitleColor,
                        size: screenWidth * 0.05,
                      ),
                      Text(
                        "Tap deeply to continue",
                        style: AppFonts.textFieldHint.copyWith(
                          fontSize: screenHeight * 0.018,
                          color: pages[_currentPage].subtitleColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Positioned(
              top: screenHeight * 0.05,
              right: 25,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('Skip',
                    style: AppFonts.textFieldHint.copyWith(
                      fontSize: screenHeight * 0.018,
                      color: pages[_currentPage].subtitleColor,
                    )),
              )),
        ],
      ),
    );
  }
}

class PageData {
  final String title;
  final String body;
  final Color bgColor;
  final Color textColor;
  final Color subtitleColor;
  final String pic;

  const PageData({
    required this.pic,
    required this.title,
    required this.body,
    required this.bgColor,
    required this.textColor,
    required this.subtitleColor,
  });
}

class _Page extends StatelessWidget {
  final PageData page;

  const _Page({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.05),
          _Image(
            page: page,
            size: isTablet(context) ? screenHeight * 0.4 : screenHeight * 0.36,
            pic: page.pic,
          ),
          SizedBox(height: screenHeight * 0.03),
          _Text(
            page: page,
            style: AppFonts.setupBlack.copyWith(
              fontSize: screenHeight * 0.035,
              color: page.textColor,
            ),
            height: screenHeight,
          ),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    Key? key,
    required this.page,
    required this.height,
    this.style,
  }) : super(key: key);

  final PageData page;
  final double height;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          page.title,
          style: style,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          page.body,
          style: AppFonts.textFieldHint.copyWith(
            fontSize: height * 0.018,
            color: page.subtitleColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.page,
    required this.size,
    required this.pic,
  }) : super(key: key);

  final PageData page;
  final double size;
  final String pic;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      pic,
      width: size,
      height: size,
    );
  }
}
