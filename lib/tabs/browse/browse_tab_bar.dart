import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/tabs/browse/item_model.dart';
import 'package:movie_app/tabs/browse/tab_item.dart';

class BrowseTabBar extends StatefulWidget {
  

  @override
  State<BrowseTabBar> createState() => _BrowseTabBarState();
}

class _BrowseTabBarState extends State<BrowseTabBar> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: DefaultTabController(
        length: ItemModel.items.length,
        child: TabBar(
          isScrollable: true,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          labelPadding:EdgeInsets.only(right: 8) ,
            
          onTap: (index) {
            if(currentIndex==index) return;
            currentIndex=index;
            setState(() { });
          },
          tabs:[...ItemModel.items.map((item)=> TabItem(
            label: item.name,
            isSelected:currentIndex==ItemModel.items.indexOf(item),
            selectedForegroundcolor: Color(0xFF000000),
            unSelectedForegroundcolor: AppColors.primary,
            selectedBackgroundcolor: AppColors.primary
            )
            )
            ],
          ),
      ),
    );
  }
}