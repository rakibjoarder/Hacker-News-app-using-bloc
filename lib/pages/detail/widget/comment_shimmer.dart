import 'package:flutter/material.dart';
import 'package:hacker_news/utils/constant.dart';
import 'package:hacker_news/utils/screen_aware_size.dart';
import 'package:shimmer/shimmer.dart';

class CommentShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 2),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              leading: Shimmer.fromColors(
                highlightColor: Colors.grey[200],
                baseColor: Colors.grey[300],
                child: Container(
                  height: screenAwareSize(40, context),
                  width: screenAwareSize(40, context),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(color: redAccent, width: 2)),
                  child: Container(),
                ),
                period: Duration(milliseconds: 500),
              ),
              title: Shimmer.fromColors(
                highlightColor: Colors.grey[100],
                baseColor: Colors.grey[200],
                child: Container(
                  color: Colors.grey[200],
                  width: screenAwareSize(100, context),
                  height: screenAwareSize(10, context),
                  margin: EdgeInsets.only(
                      top: screenAwareSize(6, context),
                      bottom: screenAwareSize(3, context),
                      left: screenAwareSize(6, context)),
                ),
                period: Duration(milliseconds: 500),
              ),
              subtitle: Shimmer.fromColors(
                highlightColor: Colors.grey[100],
                baseColor: Colors.grey[200],
                child: Container(
                  color: Colors.grey[200],
                  width: screenAwareSize(200, context),
                  height: screenAwareSize(10, context),
                  margin: EdgeInsets.only(
                      top: screenAwareSize(6, context),
                      bottom: screenAwareSize(3, context),
                      left: screenAwareSize(6, context)),
                ),
                period: Duration(milliseconds: 500),
              ),
            ));
      },
    );
  }
}
