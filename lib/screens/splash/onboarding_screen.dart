import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tuko_app/core/app_assets.dart';
import 'package:tuko_app/core/app_color.dart';
import 'package:tuko_app/models/onboarding_model.dart';
import 'package:tuko_app/screens/auth/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "OnboardingScreen";
  OnboardingScreen({super.key});

  final List<OnboardingModel> onboardingData = [
    OnboardingModel(
      topMessage: "Welcome to",
      topImage: AppAssets.logo,
      mainImage: AppAssets.splash1,
      quote: "Are you ready to start the adventure?",
      buttonText: "Next",
    ),
    OnboardingModel(
      topMessage: "Discover the magic of\n Japan step by step",
      topImage: null,
      mainImage: AppAssets.splash2,
      quote: "One step away from your first lesson.",
      buttonText: "Next",
    ),
    OnboardingModel(
      topMessage: "Speak Japanese with confidence and step into a new world",
      topImage: null,
      mainImage: AppAssets.splash3,
      quote: "Let’s start our Japanese journey together!",
      buttonText: "Start",
    ),
  ];

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.red,
      body: SafeArea(
        top: true,
        bottom: false,
        right: false,
        left: false,
        child: Stack(
          children: [

            PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              itemCount: widget.onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: screenHeight * .04,
                      left: 0,
                      right: 0,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: Column(
                          key: ValueKey<int>(currentIndex),
                          children: [
                            Text(
                              widget.onboardingData[index].topMessage,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: screenWidth * .09,
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // SizedBox(height: screenHeight * .01),
                            widget.onboardingData[index].topImage != null
                                ? Image.asset(AppAssets.logo, width: screenWidth * .6)
                                : SizedBox(height: 0),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.47,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenHeight * .09),
                            Text(
                              widget.onboardingData[index].quote,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppColor.red, fontSize: 20),
                            ),

                            SizedBox(height: screenHeight * .08),
                            ElevatedButton(
                              onPressed: () {
                               if(currentIndex<widget.onboardingData.length-1){
                                 _controller.nextPage(
                                     duration: Duration(milliseconds: 500),
                                     curve: Curves.easeInOut
                                 );
                               }else{
                                 Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                               }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.red,
                                foregroundColor: AppColor.white,
                                minimumSize: Size(screenWidth * .8, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                textStyle: TextStyle(fontSize: 20),
                              ),
                              child: Text(widget.onboardingData[index].buttonText),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * .14,
                      bottom: screenHeight*.29,
                      child: Center(
                        child: Image.asset(
                          widget.onboardingData[index].mainImage,
                          width: screenWidth*1,
                          // height: screenHeight*.6,
                        ),
                      ),
                    ),

                  ],
                );
              },
            ),
            Positioned(
              bottom: screenHeight * 0.2,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: JumpingDotEffect(
                    verticalOffset: 15.0,
                    activeDotColor: AppColor.red,
                    dotHeight: 10,
                    dotWidth: 10,
                    jumpScale: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
