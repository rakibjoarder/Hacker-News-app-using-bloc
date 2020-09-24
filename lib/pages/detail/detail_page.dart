import 'package:flutter/material.dart';
import 'package:hacker_news/pages/detail/bloc/detail_bloc_provider.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DetailsBloc detailsBloc;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (detailsBloc == null) {
      detailsBloc = DetailsBlocProvider.of(context);
      detailsBloc.getTopHackerNews();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    detailsBloc?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asd'),
      ),
      body: StreamBuilder(
        stream: detailsBloc.getNewsDeatilsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          }
          return snapshot.hasData
              ? Text(snapshot.data.toJson().toString())
              : Container();
        },
      ),
    );
  }
}
