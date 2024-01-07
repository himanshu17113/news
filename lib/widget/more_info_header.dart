import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news/constant/constant.dart';
import 'package:news/widget/slide_transition.dart';

import '../constant/app_colors.dart';

class MoreInfoHeader extends StatelessWidget {
  final String? date;
  final String? source;
  const MoreInfoHeader({Key? key, this.date, this.source}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // generates a new Random object
    final random = Random();

    Color color = vol[random.nextInt(vol.length)];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SlideOpacityTransition(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColoredBox(
              color: color,
              child: SizedBox(
                height: context.deviceHeight() / 15,
                width: 3,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date!,
                    style: const TextStyle(
                      fontSize: 14,
                      //   fontFamily: AppFont.interMedium,
                    )),
                const SizedBox(height: 4),
                Text(source!,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      // fontFamily: AppFont.interBold,
                      // color: _Colors.primaryColorDark,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
