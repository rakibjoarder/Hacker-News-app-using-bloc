import 'package:flutter/material.dart';
import 'package:hacker_news/model/story_model.dart';
import 'package:hacker_news/pages/detail/tabs/article_page.dart';
import 'package:hacker_news/pages/detail/tabs/comments_page.dart';
import 'package:hacker_news/utils/screen_aware_size.dart';

class DetailsPage extends StatefulWidget {
  StoryModel storyItem;
  DetailsPage({this.storyItem});
  @override
  _DetailsPageState createState() => _DetailsPageState(storyItem: storyItem);
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  StoryModel storyItem;
  _DetailsPageState({this.storyItem});

  TabController tabController;
  @override
  void initState() {
    tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(storyItem.title),
          centerTitle: true,
          bottom: TabBar(
            controller: tabController,
            tabs: <Widget>[
              Padding(
                padding: EdgeInsets.all(screenAwareSize(8, context)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Comments'),
                    SizedBox(
                      width: screenAwareSize(5, context),
                    ),
                    Container(
                      width: screenAwareSize(25, context),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(
                        child: Text(
                          storyItem.descendants.toString(),
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenAwareSize(8, context)),
                child: Center(child: Text('Articles')),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            CommentsPage(commentsId: storyItem.kids),
            ArticlePage(
              url: storyItem.url,
            )
          ],
        ));
  }
}
