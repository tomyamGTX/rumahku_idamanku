import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/DAWidgets.dart';
import '../../utils/Images.dart';
import '../Colors.dart';

class IntroductionWidget extends StatefulWidget {
  static String tag = '/IntroductionScreen';

  const IntroductionWidget({Key? key}) : super(key: key);

  @override
  IntroductionWidgetState createState() => IntroductionWidgetState();
}

class IntroductionWidgetState extends State<IntroductionWidget> {
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
    return SizedBox(
      width: context.width(),
      height: MediaQuery.of(context).size.height * 0.3,
      child: SizedBox(
        height: context.height() - 75,
        width: context.width(),
        child: Stack(
          children: [
            commonCachedNetworkImage(
              p3IntoImg,
              height: context.height() - 75,
              width: context.width(),
              fit: BoxFit.cover,
            ),
            Container(
              height: context.height() - 75,
              width: context.width(),
              color: Colors.black.withOpacity(0.5),
            ),
            Container(
              width: context.width() * 0.85,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Search here',
                      style: primaryTextStyle(size: 52, color: white)),
                  8.height,
                  Text(
                    'House and Land',
                    style: boldTextStyle(
                      size: 22,
                      color: white,
                      decorationColor: portfolio3PrimaryColor,
                      textDecorationStyle: TextDecorationStyle.solid,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  32.height,
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                          color: portfolio3BackgroundColor,
                          borderRadius: BorderRadius.circular(32)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 32),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search your house here',
                              suffixIcon: Icon(Icons.search)),
                        ),
                      ))),
                  32.height,
                ],
              ),
            ).paddingOnly(left: 32)
          ],
        ),
      ),
    );
  }
}
