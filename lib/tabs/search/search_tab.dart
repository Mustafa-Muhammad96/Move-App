import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widgets/default_text_form_field.dart';
import 'package:movie_app/features/home/data/model/movie.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_states.dart';

class SearchTab extends StatefulWidget {
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  List<Movie> filterMovies=[];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>MovieCubit() ..getAllMovies() ,

      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                BlocBuilder<MovieCubit,MovieStates>(
                  builder: (context, state) {
                    if(state is MoviesSuccess){
                      final movies=state.moviesResponse.moviesData.movies;
                      return DefaultTextFormField(iconName: "search", hintText: "Search", onChanged: (query) => 
                        searchMovies(query,movies )
                      );
                    }
                    return const SizedBox();
                  },
                  ),
      
                Expanded(
                  child:filterMovies.isEmpty? 
                  Center(
                    child: Image.asset("assets/images/search_empty.png"),
                  ) 

                   : GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (_, index) {
                    final movie=filterMovies[index];
                
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/MovieDetailsScreen', arguments: movie.id);
                  },

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        Image.network(
                        movie.mediumCoverImage!,
                         fit: BoxFit.cover,
                          width: double.infinity,
                          height: 220,
                        ),
                  
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  movie.rating.toString(),
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(color: Colors.white),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.star,
                                  color: AppColors.yellow,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                    },
                itemCount:filterMovies.length,
              ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void searchMovies(String query,List <Movie> allMovies){
 setState(() {
   if(query.isEmpty){
    filterMovies=[];
   }else{
   filterMovies=allMovies.where((movie) =>movie.title!.toLowerCase().contains(query.toLowerCase())).toList();
   }
 });
  }

}
