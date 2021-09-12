//import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:timehub/functions.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:timehub/globals/device.dart';
import 'package:timehub/globals/styles.dart' as styles;
//import 'package:timehub/screens.dart';
//import 'package:ionicons/ionicons.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
//import 'package:webfeed/webfeed.dart';
//import 'dart:async';
//import 'package:material_clock/material_clock.dart' as materialClock;

final DateFormat formatterTime = DateFormat('HH:mm');

class UniCard extends StatelessWidget {
  const UniCard({
    Key? key,
    this.content,
    required this.title,
    this.color = Colors.white,
    required this.style,
  }) : super(key: key);

  final content;
  final String title;
  final Color color;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: globals.borderRadius,
        color: this.color,
        boxShadow: styles.boxShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text(this.title, style: this.style),
          ),
          Container(
            height: deviceSize.height / 1.6,
            child: this.content,
            margin: EdgeInsets.only(right: 5),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: styles.darkGrey),
            height: 5,
            width: 150,
          )
        ],
      ),
    );
  }
}
