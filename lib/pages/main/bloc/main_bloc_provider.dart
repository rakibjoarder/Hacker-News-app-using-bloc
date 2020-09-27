import 'package:flutter/material.dart';

import 'main_bloc.dart';

export 'main_bloc.dart';

class MainBlocProvider extends InheritedWidget {
  final MainBloc bloc = new MainBloc();
  final child;
  final Key key;

  MainBlocProvider({this.child, this.key}) : super(child: child, key: key);

  static MainBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MainBlocProvider)
              as MainBlocProvider)
          .bloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
