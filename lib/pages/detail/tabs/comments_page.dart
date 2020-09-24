import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hacker_news/model/comment_model.dart';
import 'package:hacker_news/pages/detail/bloc/detail_bloc_provider.dart';
import 'package:hacker_news/pages/detail/tabs/article_page.dart';
import 'package:hacker_news/pages/detail/widget/comment_shimmer.dart';
import 'package:hacker_news/utils/screen_aware_size.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentsPage extends StatefulWidget {
  var commentsId;
  CommentsPage({this.commentsId});
  @override
  _CommentsPageState createState() =>
      _CommentsPageState(commentsId: commentsId);
}

class _CommentsPageState extends State<CommentsPage>
    with AutomaticKeepAliveClientMixin {
  DetailsBloc detailsBloc;
  var commentsId;
  _CommentsPageState({this.commentsId});

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (detailsBloc == null) {
      detailsBloc = DetailsBlocProvider.of(context);
      detailsBloc.getAllComments(commentsId: commentsId);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: StreamBuilder<List<CommentsModel>>(
          stream: detailsBloc.getNewsDeatilsStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CommentShimmer();
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, ind) {
                  return Container(
                    color: Colors.white,
                    child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              authorName(context, snapshot.data[ind]),
                              comment(context, snapshot.data[ind]),
                            ],
                          ),
                        ),
                        subtitle: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data[ind].children.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(2),
                                child: ListTile(
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        authorName(context,
                                            snapshot.data[ind].children[index]),
                                        comment(context,
                                            snapshot.data[ind].children[index]),
                                      ],
                                    ),
                                    subtitle: Padding(
                                      padding: EdgeInsets.only(
                                          left: screenAwareSize(20, context)),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data[ind]
                                              .children[index].children.length,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index2) {
                                            return Container(
                                              margin: EdgeInsets.all(2),
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    authorName(
                                                        context,
                                                        snapshot
                                                            .data[ind]
                                                            .children[index]
                                                            .children[index2]),
                                                    comment(
                                                        context,
                                                        snapshot
                                                            .data[ind]
                                                            .children[index]
                                                            .children[index2]),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    )),
                              );
                            })),
                  );
                });
          },
        ),
      ),
    );
  }

  comment(BuildContext context, snapshot) {
    return snapshot.author != null
        ? Padding(
            padding: EdgeInsets.only(left: screenAwareSize(8, context)),
            child: Column(
              children: <Widget>[
                Html(
                  data: snapshot.text,
                  onLinkTap: (url) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ArticlePage(
                              fromComment: true,
                              url: url,
                            )));
                    print("Opening $url...");
                  },
                  onImageTap: (src) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ArticlePage(
                              fromComment: true,
                              url: src,
                            )));
                    print(src);
                  },
                ),
                Divider(
                  height: 2,
                )
              ],
            ),
          )
        : Container();
  }

  authorName(BuildContext context, snapshot) {
    return snapshot.author != null
        ? Padding(
            padding: EdgeInsets.only(top: screenAwareSize(8, context)),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: screenAwareSize(5, context),
                ),
                CircleAvatar(
                  radius: screenAwareSize(15, context),
                  child: Text(
                    snapshot.author.substring(0, 1).toUpperCase(),
                    style: TextStyle(
                        fontSize: screenAwareSize(10, context),
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: screenAwareSize(5, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      snapshot.author,
                      style: TextStyle(
                          fontSize: screenAwareSize(11, context),
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                        '${timeago.format(DateTime.fromMillisecondsSinceEpoch(snapshot.createdAtI * 1000))}',
                        style: TextStyle(
                            fontSize: screenAwareSize(10, context),
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                  ],
                )
              ],
            ),
          )
        : Container();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
