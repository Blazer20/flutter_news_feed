
import 'package:equatable/equatable.dart';
import 'package:flutter_news_feed/network/model/News.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final News news;

  const NewsLoaded(this.news);
}

class NewsError extends NewsState {
  final String? massage;

  const NewsError(this.massage);
}
