import 'package:flutter/material.dart';
import 'package:movie_app/core/features/login/login_screen.dart';
import 'package:movie_app/core/features/onboarding/onboarding_data.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/utils/save_onboarding_status.dart';
import 'package:movie_app/widgets/default_elevated_button.dart';

class OnboardingItems extends StatelessWidget {
  OnboardingData onboardingData;
  int index;
  PageController controller;

  OnboardingItems({
    required this.onboardingData,
    required this.index,
    required this.controller
    });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;

    return Stack(
      children: [
        Image.asset("assets/images/${onboardingData.imageName}.png" , height: double.infinity,width: double.infinity,fit: BoxFit.fill) ,
         Align(
          alignment: Alignment.bottomCenter,
           child:index==0? 
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 Text("${onboardingData.title}" , style:textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w700),textAlign: TextAlign.center ),
                 SizedBox(height: 16),
                 
                 Text("${onboardingData.description}", style: textTheme.labelLarge!.copyWith(color:AppColors.gray ,fontWeight: FontWeight.w400),textAlign: TextAlign.center),
                 SizedBox(height: 16),
                 DefaultElevatedButton(label:"Explore World ", onPressed:(){controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);}),
                 SizedBox(height: 16),
                ],
              ),
            )
           
           
           :Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                 topRight: Radius.circular(40),
              )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               Text("${onboardingData.title}" , style:textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w700),textAlign: TextAlign.center ),
               SizedBox(height: 16),
               if(onboardingData.description!=null)...[
               Text("${onboardingData.description}", style: textTheme.labelLarge!.copyWith(color:index>0?AppColors.white:AppColors.gray ,fontWeight: FontWeight.w400),textAlign: TextAlign.center),
               SizedBox(height: 16),
               ],

               DefaultElevatedButton(label:index==5?"Finish":"Next",
               onPressed:()async{
                if(index==5){
                  await saveOnboardingStatus();
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                }else{
                controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                }
               }
               ),

               SizedBox(height: 16),

               if(index>1)...[
               OutlinedButton(
                onPressed: (){
                  controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color:AppColors.yellow, width: 2),
                  fixedSize: Size(MediaQuery.sizeOf(context).width , 55),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                ),
                 child: Text("Back" ,style: textTheme.labelLarge!.copyWith( color:  AppColors.yellow,fontWeight: FontWeight.w600),)
                 )
                   
               ]  
              ],
            ),
                   ),
         )

      ],
    );
  }
}