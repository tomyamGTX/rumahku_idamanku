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
      height: context.height(),
      child: SizedBox(
        height: context.height() - 75,
        width: context.width(),
        child: Stack(
          children: [
            commonCachedNetworkImage(
              p3IntoImg,
              height: context.height() - 75,
              width: context.width(),
              fit: BoxFit.fitHeight,
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
                  Text('Hello, I\'m',
                      style: primaryTextStyle(size: 52, color: white)),
                  Text('Christopher',
                      style: boldTextStyle(size: 65, color: white)),
                  8.height,
                  Text(
                    'UI/UX Designer',
                    style: boldTextStyle(
                      size: 22,
                      color: white,
                      decorationColor: portfolio3PrimaryColor,
                      textDecorationStyle: TextDecorationStyle.solid,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  32.height,
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: portfolio3PrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          padding: const EdgeInsets.only(
                              top: 16, bottom: 16, left: 32, right: 32),
                        ),
                        child: Text('MY WORK',
                            style:
                                boldTextStyle(color: Colors.white, size: 18)),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.only(
                              top: 16, bottom: 16, left: 32, right: 32),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          side: const BorderSide(color: portfolio3PrimaryColor),
                        ),
                        child: Text('HIRE ME',
                            style: boldTextStyle(
                                color: portfolio3PrimaryColor, size: 18)),
                      ),
                    ],
                  ),
                ],
              ),
            ).paddingOnly(left: 32)
          ],
        ),
      ),
    );
  }
}
