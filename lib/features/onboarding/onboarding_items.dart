import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/utils/save_onboarding_status.dart';
import '../../core/widgets/default_elevated_button.dart';
import 'onboarding_data.dart';

class OnboardingItems extends StatefulWidget {
  final OnboardingData onboardingData;
  final int index;
  final PageController controller;

  const OnboardingItems({super.key,
    required this.onboardingData,
    required this.index,
    required this.controller
    });

  @override
  State<OnboardingItems> createState() => _OnboardingItemsState();
}

class _OnboardingItemsState extends State<OnboardingItems> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;

    return Stack(
      children: [
        Image.asset("assets/images/${widget.onboardingData.imageName}.png" , height: double.infinity,width: double.infinity,fit: BoxFit.fill) ,
         Align(
          alignment: Alignment.bottomCenter,
           child:widget.index==0?
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 Text(widget.onboardingData.title , style:textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w700),textAlign: TextAlign.center ),
                 SizedBox(height: 16),

                 Text("${widget.onboardingData.description}", style: textTheme.labelLarge!.copyWith(color:AppColors.gray ,fontWeight: FontWeight.w400),textAlign: TextAlign.center),
                 SizedBox(height: 16),
                 DefaultElevatedButton(label:"Explore World ", onPressed:(){widget.controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);}),
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
               Text(widget.onboardingData.title , style:textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w700),textAlign: TextAlign.center ),
               SizedBox(height: 16),
               if(widget.onboardingData.description!=null)...[
               Text("${widget.onboardingData.description}", style: textTheme.labelLarge!.copyWith(color:widget.index>0?AppColors.white:AppColors.gray ,fontWeight: FontWeight.w400),textAlign: TextAlign.center),
               SizedBox(height: 16),
               ],

               DefaultElevatedButton(label:widget.index==5?"Finish":"Next",
               onPressed:()async{
                if(widget.index==5){
                  await saveOnboardingStatus();
                  Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
                }else{
                widget.controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                }
               }
               ),

               SizedBox(height: 16),

               if(widget.index>1)...[
               OutlinedButton(
                onPressed: (){
                  widget.controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
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