import 'package:flutter/material.dart';
import 'package:news/constant/constant.dart';
 import 'package:shimmer/shimmer.dart';

import '../constant/app_colors.dart';

class BoxShimmer extends StatelessWidget {
  const BoxShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor: const Color(0xffF0EAEA),
      highlightColor: const Color(0xffD0CDCD),
      // baseColor: Colors.grey[300]!,
      // highlightColor: Colors.grey[100]!,
      period: const Duration(seconds: 2),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
        child: SizedBox(
          height: context.deviceHeight() / 4,
          width: context.deviceWidth(),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  //    height: context.deviceHeight() / 20,
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.topRight,
                        colors: [primaryColorDark, grey, Colors.transparent],
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(33), topRight: Radius.circular(33))),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  //    height: context.deviceHeight() / 30,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(33), bottomRight: Radius.circular(33))),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 15),
              //   height: 4,
              //   decoration: const BoxDecoration(
              //       gradient: LinearGradient(
              //           begin: Alignment.centerLeft,
              //           end: Alignment.topRight,
              //           colors: [primaryColorDark, grey, Colors.transparent])),
              // )
            ],
          ),
        ),
      ));
}
