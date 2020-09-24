import 'package:flutter/material.dart';
import 'package:hacker_news/model/story_model.dart';
import 'package:hacker_news/pages/main/bloc/main_bloc.dart';
import 'package:hacker_news/pages/main/bloc/main_bloc_provider.dart';
import 'package:hacker_news/pages/main/widget/listItem.dart';
import 'package:hacker_news/pages/main/widget/search_story.dart';
import 'package:hacker_news/pages/main/widget/shimmer.dart';
import 'package:hacker_news/utils/constant.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainBloc mainBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (mainBloc == null) {
      mainBloc = MainBlocProvider.of(context);
      mainBloc.getTopHackerNewsIds();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    mainBloc?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: appBar(),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 4));
            mainBloc.getTopHackerNewsIds();
            return;
          },
          child: StreamBuilder<List<Story>>(
              stream: mainBloc.getTopNewsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return storyShimmer();
                }
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          return listItem(snapshot.data, index, context);
                        },
                      )
                    : Container();
              }),
        ));
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Hacker News',
        style: TextStyle(color: red),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: red,
          ),
          onPressed: () async {
            await showSearch(
                context: context,
                delegate: SearchStoryDelegate(
                  storyList: mainBloc.storyList,
                ));
          },
        )
      ],
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
