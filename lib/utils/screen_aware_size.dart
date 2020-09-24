import 'package:flutter/material.dart';

double baseHeight = 640;

double screenAwareSize(double size, BuildContext context){
  if(MediaQuery.of(context).size.height > 750  ){
    baseHeight = 740;
  }
  if(MediaQuery.of(context).orientation == Orientation.portrait){
    return size * MediaQuery.of(context).size.height / baseHeight;
  }else{
    return size * MediaQuery.of(context).size.height / baseHeight;
  }
}