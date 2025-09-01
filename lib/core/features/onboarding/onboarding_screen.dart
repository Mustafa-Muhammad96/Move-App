import 'package:flutter/material.dart';
import 'package:movie_app/core/features/onboarding/onboarding_data.dart';
import 'package:movie_app/core/features/onboarding/onboarding_items.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName="/onboarding";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Expanded(
           child: PageView.builder(
            controller: controller,
            itemBuilder: (_,index) =>OnboardingItems(
              onboardingData: OnboardingData.OnboardingList[index],
              index: index,
              controller: controller
              ),
            itemCount:OnboardingData.OnboardingList.length ,
           
            ),
         )
        ],
      ),
    );
  
  
  
  
  }
}