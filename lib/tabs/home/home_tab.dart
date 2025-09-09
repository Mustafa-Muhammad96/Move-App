import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/utils/movie_helper.dart';
import 'package:movie_app/features/home/data/model/movie.dart';
import 'package:movie_app/tabs/home/action_items.dart';
import 'package:movie_app/tabs/home/available_now_items.dart';

class HomeTab extends StatefulWidget {
  final List<Movie> movies;
  const HomeTab({super.key, required this.movies});
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  TextTheme textTheme=Theme.of(context).textTheme;
  final List<Movie> latestMovies = List.from(widget.movies)
    ..sort((a, b) => b.dateUploadedUnix!.compareTo(a.dateUploadedUnix as num));

  final genres = getAllGenres(widget.movies).toList();
  final randomGenre = genres[Random().nextInt(genres.length)];
  final sectionMovies = getMoviesByGenre(widget.movies,randomGenre);
  final availableMovies = latestMovies.take(10).toList();

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
            itemCount: availableMovies.length,
            itemBuilder: (_,index,_) => AvailableNowItems(imageUrl: availableMovies[index].mediumCoverImage!),
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
                  Text(randomGenre ,style:textTheme.labelLarge!.copyWith(color: AppColors.white) ,),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      _scrollController.animateTo(
                        _scrollController.offset + MediaQuery.sizeOf(context).width * 0.25,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
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
                controller: _scrollController,
                padding: EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index) => ActionItems(imageUrl: sectionMovies[index].mediumCoverImage.toString(),),
                itemCount:sectionMovies.length ,
                separatorBuilder: (_,_) => SizedBox(width: 16),
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