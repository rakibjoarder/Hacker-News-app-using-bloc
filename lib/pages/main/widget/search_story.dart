import 'package:flutter/material.dart';
import 'package:hacker_news/model/story_model.dart';
import 'package:hacker_news/utils/constant.dart';

import 'listItem.dart';

class SearchStoryDelegate extends SearchDelegate<String> {
  List<StoryModel> storyList;
  SearchStoryDelegate({this.storyList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        tooltip: 'Clear',
        icon: const Icon((Icons.clear)),
        onPressed: () {
          query = '';
          showSuggestions(context);
          close(context, null);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        color: redAccent,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'No Search Result',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        )
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<StoryModel> suggestions = query.isEmpty
        ? storyList
        : storyList
            .where((data) =>
                data.title.toString().toLowerCase().contains(query) ||
                data.by.toString().toLowerCase().contains(query) ||
                data.url.toString().toLowerCase().contains(query))
            .toList();

    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (_, index) {
            return listItem(suggestions, index, context);
          },
        )),
      ],
    );
  }
}
