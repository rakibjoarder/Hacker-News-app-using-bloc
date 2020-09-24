import 'package:flutter/material.dart';

import 'detail_bloc.dart';

export 'detail_bloc.dart';

class DetailsBlocProvider extends InheritedWidget {
  final DetailsBloc bloc = new DetailsBloc();
  final child;
  final Key key;

  DetailsBlocProvider({this.child, this.key}) : super(child: child, key: key);

  static DetailsBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(DetailsBlocProvider)
              as DetailsBlocProvider)
          .bloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
