import 'package:flutter/material.dart';
import 'onboarding_data.dart';
import 'onboarding_items.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
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
              onboardingData: OnboardingData.onboardingList[index],
              index: index,
              controller: controller
              ),
            itemCount:OnboardingData.onboardingList.length ,
           
            ),
         )
        ],
      ),
    );
  
  
  
  
  }
}