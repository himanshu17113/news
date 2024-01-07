import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news/search/presentation/search.dart';
import 'package:news/top_headlines/presentation/widgets/general_news.dart';

import 'constant/pagerouter.dart';
import 'top_headlines/presentation/widgets/headline_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: scaffoldKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                Text("  Get the Latest\n  News Updates",
                    style: textTheme.displaySmall),
                IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        CustomPageRoute(
                            transitionDuration:
                                const Duration(milliseconds: 700),
                            child: const SeachScreen(),
                            begin: const Offset(-1, 0))),
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
          const TopHeadlineCard(),
          const Gap(30),
          const Text(
            "      News", //style: AppTextStyles.headingMediumTextBlack
          ),
          const VerticalNews()
          //GeneralNews(),
        ],
      ),
    );
  }
}
