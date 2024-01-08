import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news/constant/constant.dart';
import 'package:news/search/service/search_controller_service.dart';
import 'package:news/top_headlines/data/repository/top_headline_service.dart';
import '../constant/pagerouter.dart';
import '../home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _lottieController;

  @override
  void initState() {
    super.initState();
    Get.lazyPut<SearchxController>(() => SearchxController());
    Get.put(NewsService(), permanent: true);
    _lottieController = AnimationController(vsync: this);
    _lottieController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _lottieController.repeat();
      }
    });
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
          context,
          CustomPageRoute(
              transitionDuration: const Duration(milliseconds: 700),
              child: const Home(),
              begin: const Offset(-1, 0)));
    });
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.deviceHeight() / 2,
              child: Lottie.asset(
                'assets/jason/news.json',
                height: context.deviceHeight() / 2,
                fit: BoxFit.cover,
                reverse: true,
                repeat: true,
                animate: true,
                alignment: Alignment.center,
                width: context.deviceWidth(),
                controller: _lottieController,
                onLoaded: (composition) {
                  _lottieController
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),
            const Text(
              "Get News at you Finger Tip",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
