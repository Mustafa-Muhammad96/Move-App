import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/default_text_form_field.dart';


class SearchTab extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              DefaultTextFormField(
                iconName: "search",
                hintText: "Search"
                ),
              
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(child: Image.asset("assets/images/search_empty.png"),)),
                ),
               
            ],
          ),
        ),
      ),
    );
  }
}