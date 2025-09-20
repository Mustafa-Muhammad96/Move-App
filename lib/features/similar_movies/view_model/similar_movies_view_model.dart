import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/similar_movies/data/models/similar_movies_response/movie.dart';
import 'package:movie_app/features/similar_movies/data/repositories/similar_movies_repository.dart';
import 'package:movie_app/features/similar_movies/view_model/similar_movies_states.dart';

class SimilarMoviesViewModel extends Cubit<SimilarMoviesStates>{
 late SimilarMoviesRepository repository;

 SimilarMoviesViewModel() :super(similarMoviesInitial()){
 repository=SimilarMoviesRepository();
 }

  Future <void> getSimilarMovies( int movieId) async{
    emit(GetsimilarMoviesLoading());
    try{
    List<Movie> movie=await repository.getSimilarMovies(movieId);
    emit(GetsimilarMoviesSuccess(movie));

    }catch(error){
  emit(GetsimilarMoviesError(error.toString()));
    }
  }
}