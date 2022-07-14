import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../portfolio1/components/SocialWidget.dart';
import 'Colors.dart';
import 'components/AboutMeWidget.dart';
import 'components/IntroductionWidget.dart';
import 'components/ServicesWidget.dart';

class Portfolio3Screen extends StatefulWidget {
  const Portfolio3Screen({Key? key}) : super(key: key);

  @override
  Portfolio3ScreenState createState() => Portfolio3ScreenState();
}

class Portfolio3ScreenState extends State<Portfolio3Screen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              height: 75,
              width: context.width(),
              decoration: boxDecorationWithShadow(
                  backgroundColor: context.scaffoldBackgroundColor),
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Rumah Idamanku',
                          style: boldTextStyle(
                              size: 42, color: portfolio3PrimaryColor))
                      .expand(),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            index = 0;
                            _scrollController.animateTo(0,
                                curve: Curves.ease,
                                duration: const Duration(seconds: 2));
                          });
                        },
                        child: Text('HOME',
                            style: boldTextStyle(
                                size: 14,
                                color: index == 0
                                    ? portfolio3PrimaryColor
                                    : null)),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              index = 1;
                              _scrollController.animateTo(1000,
                                  curve: Curves.ease,
                                  duration: const Duration(seconds: 2));
                            });
                          },
                          child: Text('ABOUT',
                              style: boldTextStyle(
                                  size: 14,
                                  color: index == 1
                                      ? portfolio3PrimaryColor
                                      : null))),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              index = 2;
                              _scrollController.animateTo(2000,
                                  curve: Curves.ease,
                                  duration: const Duration(seconds: 2));
                            });
                          },
                          child: Text('SERVICE',
                              style: boldTextStyle(
                                  size: 14,
                                  color: index == 2
                                      ? portfolio3PrimaryColor
                                      : null))),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              index = 3;
                              _scrollController.animateTo(2700,
                                  curve: Curves.ease,
                                  duration: const Duration(seconds: 2));
                            });
                          },
                          child: Text('CONTACT',
                              style: boldTextStyle(
                                  size: 14,
                                  color: index == 3
                                      ? portfolio3PrimaryColor
                                      : null))),
                    ],
                  )
                ],
              ).withWidth(context.width() * 0.85),
            ),
            const IntroductionWidget(),
            AboutMeWidget(),
            ServicesWidget(),
            // SkillWidget(),
            // LatestWorkWidget(),
            // knowledgeWidget(),
            // FunFactsWidget(),
            // LatestBlogWidget(),
            // ClientHappyWidget(),
            // DropMessageWidget(),
            // const Divider(
            //   height: 0,
            // ),
            // const IndeedWidget(),
            SocialWidget(),
          ],
        ),
      ),
    );
  }
}
