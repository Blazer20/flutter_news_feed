import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_feed/blocs/NewsBloc.dart';
import 'package:flutter_news_feed/blocs/NewsEvent.dart';
import 'package:flutter_news_feed/blocs/NewsState.dart';
import 'package:flutter_news_feed/blocs/ThemeCubit.dart';
import 'package:flutter_news_feed/screens/widgets/MyCard.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsBloc _newsBloc = NewsBloc();

  @override
  void initState() {
    _newsBloc.add(GetNewsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
              icon: const Icon(
                Icons.brightness_6,
              ),
            ),
          ),
        ],
        title: Center(
          child: Text(
            widget.title,
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<NewsBloc, NewsState>(
          listener: (context, state) {
            if (state is NewsError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.massage!),
              ));
            }
          },
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsInitial) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (state is NewsLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (state is NewsLoaded) {
                return MyCard(model: state.news);
              } else if (state is NewsError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
