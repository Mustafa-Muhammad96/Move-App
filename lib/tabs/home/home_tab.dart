import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/tabs/home/action_items.dart';
import 'package:movie_app/tabs/home/available_now_items.dart';

class HomeTab extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  TextTheme textTheme=Theme.of(context).textTheme;
    List<String> availableItems=[
    "home_list1",
    "home_list2",
    "home_list3"
    ];

    List<String> actionMovies=[
      "home_list3",
      "home_list4",
      "home_list5",
      "home_list2"
    ];
    return Scaffold(
      body: Stack(
       children: [
        Image.asset("assets/images/onboarding6.png" ,width: double.infinity,height: double.infinity,fit: BoxFit.fill),

        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.8)
          ),
          child: Column(
                  children: [
          Image.asset("assets/images/available_now.png",height: MediaQuery.sizeOf(context).height*0.13),
          
          CarouselSlider.builder(
            itemCount: availableItems.length,
            itemBuilder: (_,index,_) =>AvailableNowItems(imageName: availableItems[index]),
            options:CarouselOptions(
              enlargeCenterPage:true,
              viewportFraction:0.5,
              height: MediaQuery.sizeOf(context).height*0.35,
            )
            ),
            const SizedBox(height: 10),
            Image.asset("assets/images/watch_now.png",height: MediaQuery.sizeOf(context).height*0.17),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text("Action " ,style:textTheme.labelLarge!.copyWith(color: AppColors.white) ,),
                  Spacer(),
                  InkWell(
                    onTap: () {} ,
                    child: Row(
                      children: [
                        Text("See More" ,style: textTheme.titleMedium!.copyWith(color: AppColors.primary),),
                         SizedBox(width: 8),
                    Icon(Icons.arrow_forward ,size: 12, color: AppColors.primary,)
                      ],
                    ),
                  ),
                ],
              ), 
            ),
          
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index) =>ActionItems(imageName:actionMovies[index] ),
                itemCount:actionMovies.length ,
                separatorBuilder: (_,_) =>SizedBox(width: 16),
                ),
            )
              ],
          ),
        )
       ],
      ),
    );
  }
}