import 'package:flutter/material.dart';
import 'package:news/constant/constant.dart';
import 'package:news/search/presentation/search.dart';
import 'package:news/top_headlines/presentation/widgets/general_news.dart';
import 'constant/pagerouter.dart';

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
      body: CustomScrollView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        slivers: [
          SliverAppBar(
            backgroundColor: theme.colorScheme.secondaryContainer,

            expandedHeight: 10,
            collapsedHeight: context.deviceHeight() * .1,
            //      excludeHeaderSemantics: true,
            // title: const Text(
            // ),
            titleTextStyle: textTheme.displaySmall,
            toolbarHeight: context.deviceHeight() * .1,

            stretch: false,
            forceMaterialTransparency: true,
            scrolledUnderElevation: 50,
            //      collapsedHeight: 45,
            //  pinned: true,
            //    snap: true,
            floating: true,
            //  expandedHeight:
            flexibleSpace: FlexibleSpaceBar(
              title: Text("  Get the Latest\n  News Updates",
                  style: textTheme.headlineLarge),
              collapseMode: CollapseMode.parallax,
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              expandedTitleScale: 1.2,
              centerTitle: false,
              background: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(top: 50, right: 20),
                child: IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      CustomPageRoute(
                          transitionDuration: const Duration(milliseconds: 700),
                          child: const SeachScreen(),
                          begin: const Offset(-1, 0))),
                  icon: const Icon(
                    Icons.search,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),

          const VerticalNews()
          //GeneralNews(),
        ],
      ),
    );
  }
}
