import 'package:flutter/material.dart';

import '../../main/utils/AppWidget.dart';
import '../portfolio1/components/SocialWidget.dart';
import 'components/AboutMeWidget.dart';
import 'components/ClientHappyWidget.dart';
import 'components/DropMessageWidget.dart';
import 'components/FunFactsWidget.dart';
import 'components/IndeedWidget.dart';
import 'components/IntroductionWidget.dart';
import 'components/LatestBlogWidget.dart';
import 'components/LatestWorkWidget.dart';
import 'components/ServicesWidget.dart';
import 'components/SkillWidget.dart';
import 'components/knowledgeWidget.dart';

class Portfolio3Screen extends StatefulWidget {
  @override
  Portfolio3ScreenState createState() => Portfolio3ScreenState();
}

class Portfolio3ScreenState extends State<Portfolio3Screen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Portfolio 3'),
      body: Container(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                IntroductionWidget(),
                AboutMeWidget(),
                ServicesWidget(),
                SkillWidget(),
                LatestWorkWidget(),
                knowledgeWidget(),
                FunFactsWidget(),
                LatestBlogWidget(),
                ClientHappyWidget(),
                DropMessageWidget(),
                const Divider(
                  height: 0,
                ),
                IndeedWidget(),
                SocialWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
