import 'package:flutter/material.dart';
import 'package:movie_app/tabs/browse/browse_tab_bar.dart';
import 'package:movie_app/tabs/browse/grid_view_items.dart';


class BrowseTab extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    List<String> gridItems=[
      "browse_list4",
      "browse_list5",
      "browse_list3",
      "browse_list2",
      "browse_list1",
      "browse_list6"
    ];
    return Scaffold(
     body: SafeArea(
       child: Column(
        children: [
          BrowseTabBar(),
          
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 8,
                childAspectRatio: 0.8
                ),
              itemBuilder: (_,index) => GridViewItems(imageName: gridItems[index]),
              itemCount: gridItems.length,
              ),
          )
        ],
       ),
     ),
    );
  }
}