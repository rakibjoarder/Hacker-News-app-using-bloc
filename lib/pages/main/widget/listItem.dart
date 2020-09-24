import 'package:flutter/material.dart';
import 'package:hacker_news/utils/constant.dart';
import 'package:hacker_news/utils/screen_aware_size.dart';
import 'package:timeago/timeago.dart' as timeago;

Container listItem(snapshot, int index, context) {
  return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: screenAwareSize(2, context)),
      padding: EdgeInsets.symmetric(vertical: screenAwareSize(4, context)),
      child: ListTile(
        leading: Container(
          height: double.infinity,
          width: screenAwareSize(35, context),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(screenAwareSize(3, context))),
              border: Border.all(
                  color: redAccent, width: screenAwareSize(2, context))),
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.arrow_drop_up,
                  color: redAccent,
                ),
                Text('${snapshot[index].score}',
                    style: TextStyle(
                        fontSize: screenAwareSize(11, context),
                        fontWeight: FontWeight.bold,
                        color: redAccent)),
              ],
            ),
          ),
        ),
        trailing: Column(
          children: <Widget>[
            Icon(
              Icons.message,
              color: redAccent,
            ),
            Text('${snapshot[index].kids.length}',
                style: TextStyle(
                    fontSize: screenAwareSize(10, context),
                    color: redAccent,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        title: Text(snapshot[index].title,
            style: TextStyle(
                fontSize: screenAwareSize(11, context),
                fontWeight: FontWeight.w700)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: screenAwareSize(3, context),
            ),
            Text(snapshot[index].url,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: screenAwareSize(10, context))),
            SizedBox(
              height: screenAwareSize(8, context),
            ),
            Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: 'by ',
                      style: TextStyle(
                          fontSize: screenAwareSize(10, context),
                          color: Colors.black54,
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text: '${snapshot[index].by}',
                            style: TextStyle(
                                fontSize: screenAwareSize(11, context),
                                color: redAccent,
                                fontWeight: FontWeight.w700),
                            children: []),
                      ]),
                ),
                SizedBox(
                  width: screenAwareSize(5, context),
                ),
                Text(
                    '${timeago.format(DateTime.fromMillisecondsSinceEpoch(snapshot[index].time * 1000))}',
                    style: TextStyle(
                        fontSize: screenAwareSize(10, context),
                        fontWeight: FontWeight.w500)),
              ],
            )
          ],
        ),
      ));
}
