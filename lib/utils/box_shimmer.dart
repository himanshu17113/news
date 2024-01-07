import 'package:flutter/material.dart';
import 'package:news/constant/constant.dart';
  import 'package:shimmer/shimmer.dart';

import '../constant/app_colors.dart';
 

class  CardShimmer extends StatelessWidget {
  const  CardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor:  primaryColor,
      highlightColor: Colors.grey[100]!,
      period: const Duration(seconds: 2),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: context.deviceHeight() / 20,
                      decoration: BoxDecoration(
                          color:  primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: context.deviceHeight() / 30,
                      decoration: BoxDecoration(
                          color:  primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color:  primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ]),
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: 4,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.topRight,
                      colors: [
                    primaryColorDark,
                    grey,
                    Colors.transparent
                  ])),
            )
          ],
        ),
      ));
}
