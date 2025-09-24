import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timelens/core/widgets/custom_button.dart';
import 'package:timelens/features/onboarding/presentation/views/widgets/onboarding_pgview.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  late PageController pageController;
  var currentPg = 0;

  @override
  void initState() {
    super.initState();

    // initialize controller
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {
        currentPg = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      OnboardingPgview(pageController: pageController),
      Positioned(
        bottom: 26.h,
        left: 0,
        right: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              textDirection: TextDirection.ltr, //important to override when ar
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                dotWidth: 12.w,
                dotHeight: 4.w,
                dotColor: Colors.white,
                activeDotColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Visibility(
                visible: currentPg == 2,
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true,
                child: CustomButton(hint: "start", onTap: () {})),
          ],
        ),
      ),
    ]);
  }
}
