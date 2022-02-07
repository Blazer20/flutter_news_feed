
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_feed/blocs/NewsEvent.dart';
import 'package:flutter_news_feed/blocs/NewsState.dart';
import 'package:flutter_news_feed/network/ApiRepository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()){
    final ApiRepository _apiRepository = ApiRepository();
    on<GetNewsList>((event, emit) async {
      try {
        emit(NewsLoading());
        final newsList = await _apiRepository.fetchAppleNews();
        emit(NewsLoaded(newsList));
        if(newsList.error != null) {
          emit(NewsError(newsList.error));
        }
      } on NetworkError {
        emit(const NewsError('Failed to fetch data. Is your device online?'));
      }
    });
  }
}