import 'package:flutter/material.dart';

import '../../main/utils/AppWidget.dart';
import '../portfolio3/components/IntroductionWidget.dart';
import '../portfolio3/components/SocialWidget.dart';
import 'components/AvailableForHireWidget.dart';
import 'components/GuideLineWidget.dart';
import 'components/InfoWidget.dart';
import 'components/MySiteWidget.dart';
import 'components/ToDoWidget.dart';

class Portfolio1Screen extends StatefulWidget {
  static String tag = '/Portfolio1Screen';

  @override
  Portfolio1ScreenState createState() => Portfolio1ScreenState();
}

class Portfolio1ScreenState extends State<Portfolio1Screen> {
  var scrollController = ScrollController();
  var top = 0.0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    /*scrollController.addListener(() {
      setState(() => top = scrollController.offset * 0.5);
    });*/
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Portfolio 1'),
      body: Container(
        child: Scrollbar(
          child: NotificationListener(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  IntroductionWidget(),
                  MySiteWidget(),
                  AvailableForHireWidget(),
                  ToDoWidget(),
                  InfoWidget(),
                  GuideLineWidget(),
                  SocialWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
